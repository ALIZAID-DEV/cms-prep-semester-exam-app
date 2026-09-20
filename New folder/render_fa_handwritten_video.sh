#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
AUDIO="assets/videos/FA/fa_handwritten_notes_lecture_narration.wav"
OUT="assets/videos/FA/fa_handwritten_notes_guided_lecture.mp4"
CONCAT="/tmp/fa_handwritten_concat.txt"
DURATION=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$AUDIO")
COUNT=$(find assets/images/accounting -maxdepth 1 -name 'archive_handwritten_fa_*.jpeg' | wc -l)
PAGE_DURATION=$(awk -v d="$DURATION" -v n="$COUNT" 'BEGIN { printf "%.6f", d/n }')
: > "$CONCAT"
for f in assets/images/accounting/archive_handwritten_fa_*.jpeg; do
  abs=$(realpath "$f")
  printf "file '%s'\nduration %s\n" "$abs" "$PAGE_DURATION" >> "$CONCAT"
done
# concat demuxer needs the final frame listed twice to honor its final duration.
last=$(realpath assets/images/accounting/archive_handwritten_fa_36.jpeg)
printf "file '%s'\n" "$last" >> "$CONCAT"
ffmpeg -y -hide_banner -loglevel error \
  -f concat -safe 0 -i "$CONCAT" \
  -i "$AUDIO" \
  -vf "scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2:color=0x090B24,drawbox=x=28:y=28:w=1224:h=664:color=0x00F5D4@0.75:t=3,drawbox=x=40:y=40:w=1200:h=640:color=0xFF2BD6@0.45:t=2" \
  -r 30 -c:v libx264 -preset medium -crf 22 -g 30 -keyint_min 30 -sc_threshold 0 \
  -c:a aac -b:a 128k -movflags +faststart -shortest "$OUT"
rm -f "$AUDIO" "$CONCAT"
printf '%s\n' "$OUT"
