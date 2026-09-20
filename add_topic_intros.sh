#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
font='/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf'
files=(
'assets/videos/FA/financial_accounting_lesson_01_free_sample.mp4|FINANCIAL ACCOUNTING|Accounting Equation|0xFF9B59B6'
'assets/videos/FA/financial_accounting_lesson_02_debit_credit.mp4|FINANCIAL ACCOUNTING|Debit and Credit|0xFF2BD6'
'assets/videos/FA/financial_accounting_lesson_03_accounting_cycle.mp4|FINANCIAL ACCOUNTING|The Accounting Cycle|0x00F5D4'
'assets/videos/FA/fa_handwritten_notes_guided_lecture.mp4|FINANCIAL ACCOUNTING|Handwritten Notes Guided Lecture|0x00F5D4'
'assets/videos/ICT/ICT_lecture_01_revision.mp4|ICT|Information and Communication Technology|0x00F5D4'
'assets/videos/FE/FE_lecture_01_revision.mp4|FUNCTIONAL ENGLISH|Exam Revision|0xFF7AE5'
'assets/videos/QURAN/QURAN_lecture_01_revision.mp4|FAHM-E-QURAN|Understanding and Practice|0xFFD166'
'assets/videos/HISTORY/HISTORY_lecture_01_revision.mp4|HISTORY|Timeline and Key Events|0xFF9F68'
'assets/videos/PF/pf_lesson_01_problem_solving.mp4|PROGRAMMING FUNDAMENTALS|Problem Solving and Flowcharts|0x5B8CFF'
'assets/videos/PF/pf_lesson_02_programming_basics_control_flow.mp4|PROGRAMMING FUNDAMENTALS|Basics and Control Flow|0x5B8CFF'
'assets/videos/PF/pf_lesson_03_arrays_functions_debugging.mp4|PROGRAMMING FUNDAMENTALS|Arrays, Functions and Debugging|0x5B8CFF'
)
for item in "${files[@]}"; do
  IFS='|' read -r base title subtitle accent <<< "$item"
  intro="/tmp/cms_intro_$(basename "$base").mp4"
  out="/tmp/cms_out_$(basename "$base").mp4"
  ffmpeg -y -hide_banner -loglevel error \
    -f lavfi -i "color=c=0x071426:s=1280x720:r=30" -f lavfi -i "anullsrc=r=48000:cl=stereo" -t 5 \
    -vf "drawbox=x=34:y=34:w=1212:h=652:color=${accent}@0.85:t=3,drawbox=x=48:y=48:w=1184:h=624:color=0x0C2140@0.75:t=fill,drawtext=fontfile=${font}:text='${title}':fontcolor=white:fontsize=40:x=(w-text_w)/2:y=265:shadowcolor=black@0.7:shadowx=2:shadowy=2,drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf:text='${subtitle}':fontcolor=0xB6FFF7:fontsize=25:x=(w-text_w)/2:y=330" \
    -c:v libx264 -preset medium -crf 23 -g 30 -keyint_min 30 -sc_threshold 0 -c:a aac -b:a 128k -shortest "$intro"
  ffmpeg -y -hide_banner -loglevel error -i "$intro" -i "$base" \
    -filter_complex "[0:v]setpts=PTS-STARTPTS[v0];[1:v]setpts=PTS-STARTPTS[v1];[0:a]asetpts=PTS-STARTPTS[a0];[1:a]asetpts=PTS-STARTPTS[a1];[v0][a0][v1][a1]concat=n=2:v=1:a=1[v][a]" \
    -map '[v]' -map '[a]' -c:v libx264 -preset medium -crf 23 -g 30 -keyint_min 30 -sc_threshold 0 -c:a aac -b:a 128k -movflags +faststart "$out"
  mv "$out" "$base"
  rm -f "$intro"
  echo "updated $base"
done
