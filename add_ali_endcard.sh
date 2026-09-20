#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
FONT="/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"
TMP="assets/videos/.ali_tmp"
mkdir -p "$TMP"
mapfile -t VIDEOS < <(python3 - <<'PY'
from pathlib import Path
import re
s=Path('lib/content_repository.dart').read_text()
seen=set()
for p in re.findall(r"'path': '([^']+\.mp4)'", s):
    if p not in seen:
        print(p); seen.add(p)
PY
)
for src in "${VIDEOS[@]}"; do
  [ -f "$src" ] || { echo "Missing $src" >&2; exit 1; }
  out="$TMP/$(basename "$src")"
  ffmpeg -y -hide_banner -loglevel error \
    -i "$src" \
    -f lavfi -i "color=c=0x080B24:s=1280x720:r=30:d=4" \
    -f lavfi -i "anullsrc=r=48000:cl=stereo" \
    -filter_complex "[0:v]scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2,format=yuv420p,fps=30[v0];[0:a]aresample=48000,aformat=sample_fmts=fltp:sample_rates=48000:channel_layouts=stereo[a0];[1:v]drawbox=x=38:y=38:w=1204:h=644:color=0x00F5D4@0.9:t=4,drawbox=x=54:y=54:w=1172:h=612:color=0xFF2BD6@0.6:t=2,drawtext=fontfile=$FONT:fontcolor=0x00F5D4:fontsize=42:x=(w-text_w)/2:y=220:text='SPECIAL THANKS TO',drawtext=fontfile=$FONT:fontcolor=white:fontsize=56:x=(w-text_w)/2:y=300:text='YOUR CLASSMATE ALI',drawtext=fontfile=$FONT:fontcolor=0xFF2BD6:fontsize=26:x=(w-text_w)/2:y=420:text='CMS Prep  |  M I C K E Y',format=yuv420p,fps=30[v1];[2:a]atrim=duration=4,asetpts=N/SR/TB,aresample=48000,aformat=sample_fmts=fltp:sample_rates=48000:channel_layouts=stereo[a1];[v0][a0][v1][a1]concat=n=2:v=1:a=1[v][a]" \
    -map '[v]' -map '[a]' -c:v libx264 -preset medium -crf 23 -g 30 -keyint_min 30 -sc_threshold 0 -c:a aac -b:a 128k -movflags +faststart "$out"
  mv "$out" "$src"
  echo "updated $src"
done
rm -rf "$TMP"
