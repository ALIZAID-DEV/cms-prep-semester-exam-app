#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
REF="assets/videos/FA/fa_cinematic_reference.png"
BASE="assets/videos/FA/financial_accounting_lesson_04_entries_ledger_trial_balance.mp4"
INTRO="/tmp/fa_lesson04_intro.mp4"
OUT="/tmp/fa_lesson04_enhanced.mp4"
ffmpeg -y -hide_banner -loglevel error \
  -loop 1 -i "$REF" -f lavfi -i "anullsrc=r=48000:cl=stereo" -t 8 \
  -vf "scale=1280:720:force_original_aspect_ratio=increase,crop=1280:720,zoompan=z='min(zoom+0.0008,1.08)':d=240:s=1280x720:fps=30,drawbox=x=0:y=0:w=1280:h=720:color=0x06142b@0.35:t=fill,drawbox=x=32:y=32:w=1216:h=656:color=0x00F5D4@0.70:t=3,drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='FINANCIAL ACCOUNTING':fontcolor=white:fontsize=42:x=(w-text_w)/2:y=270:shadowcolor=black@0.7:shadowx=2:shadowy=2,drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf:text='Journal  •  Ledger  •  Trial Balance':fontcolor=0xA9FFF4:fontsize=25:x=(w-text_w)/2:y=335" \
  -r 30 -c:v libx264 -preset medium -crf 22 -g 30 -keyint_min 30 -sc_threshold 0 -c:a aac -b:a 128k -shortest "$INTRO"
ffmpeg -y -hide_banner -loglevel error -i "$INTRO" -i "$BASE" \
  -filter_complex "[0:v]setpts=PTS-STARTPTS[v0];[1:v]setpts=PTS-STARTPTS[v1];[0:a]asetpts=PTS-STARTPTS[a0];[1:a]asetpts=PTS-STARTPTS[a1];[v0][a0][v1][a1]concat=n=2:v=1:a=1[v][a]" \
  -map "[v]" -map "[a]" -c:v libx264 -preset medium -crf 22 -g 30 -keyint_min 30 -sc_threshold 0 -c:a aac -b:a 128k -movflags +faststart "$OUT"
mv "$OUT" "$BASE"
rm -f "$INTRO"
ffprobe -v error -show_entries format=duration -of csv=p=0 "$BASE"
