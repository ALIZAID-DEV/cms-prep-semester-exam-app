#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
AUDIO="assets/videos/FA/financial_accounting_lesson_04_entries_ledger_trial_balance_narration.wav"
OUT="assets/videos/FA/financial_accounting_lesson_04_entries_ledger_trial_balance.mp4"
DURATION=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$AUDIO")
ffmpeg -y -hide_banner -loglevel error \
  -f lavfi -i "color=c=0x090B24:s=1280x720:r=30:d=${DURATION}" \
  -i "$AUDIO" \
  -vf "drawbox=x=35:y=35:w=1210:h=650:color=0x00F5D4@0.9:t=4,drawbox=x=52:y=52:w=1176:h=616:color=0xFF2BD6@0.55:t=2,drawtext=fontcolor=0x00F5D4:fontsize=52:x=(w-text_w)/2:y=150:text='FINANCIAL ACCOUNTING',drawtext=fontcolor=white:fontsize=36:x=(w-text_w)/2:y=245:text='JOURNAL  •  LEDGER  •  TRIAL BALANCE',drawtext=fontcolor=0xFF2BD6:fontsize=30:x=(w-text_w)/2:y=330:text='DOUBLE ENTRY  •  PAYABLE  •  RECEIVABLE',drawtext=fontcolor=white@0.82:fontsize=27:x=(w-text_w)/2:y=420:text='Roman Urdu + English Exam Revision',drawtext=fontcolor=0x00F5D4:fontsize=24:x=(w-text_w)/2:y=555:text='CMS Prep  |  M I C K E Y'" \
  -c:v libx264 -preset medium -crf 23 -g 30 -keyint_min 30 -sc_threshold 0 \
  -c:a aac -b:a 128k -movflags +faststart "$OUT"
rm -f "$AUDIO"
printf '%s\n' "$OUT"
