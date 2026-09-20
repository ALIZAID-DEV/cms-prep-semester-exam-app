
## Video-seeking diagnosis

The deployed Flutter bundle is `https://semesterpreparation.vercel.app/main.dart.js` and contains the current player strings such as `Updating position…`, `Back 10 seconds`, `Forward 10 seconds`, and all ten mapped video paths.

Flutter's actual asset URL convention is `/assets/assets/videos/...`; the direct `/assets/videos/...` path returns 404. The deployed Financial Accounting MP4 at `/assets/assets/videos/FA/financial_accounting_lesson_02_debit_credit.mp4` returns HTTP 200 with byte-range support and has keyframes approximately every second (`0, 1, 2, ...`), so the live media file itself is seekable.

A native HTML video test against the deployed asset successfully sought forward to 20 seconds and backward to 5 seconds (`duration=52.608`, `afterSeek=20`, `afterBackwardSeek=5`). This isolates the recurring user-visible restart behavior to the Flutter web player/controller state or control handling, not the MP4 encoding or Vercel asset delivery.

Permanent changes to the deployed app require access to the web project source or its Vercel-connected repository; the live deployment can be inspected but not edited from this environment.
