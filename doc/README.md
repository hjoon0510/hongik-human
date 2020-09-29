

아래의 문서들을 읽고 가이드 내용대로 설치 작업을 수행한다. 

* Step1: how-to-use-google-speech-api.md
   * Cloud 기반의 Google Speech API 프로그램을 /work/google-speech-api/ 폴더에 설치하도록 한다. 
   
* Step2: how-to-setup-rpi3-board.md
   * Web application (PHP)과 연동되는 스크립트 파일명: ./webapp/google-speech-api.sh
   ```bash
   # "message": The request is missing a valid API key.
   google_speech=/work/google-speech-api/php-docs-samples/speech/speech.php

   # import license key (무료로 발급받은 키를 1년간 공짜로 사용가능합니다. )
   export GOOGLE_APPLICATION_CREDENTIALS=/work/google-speech-api/google-speech-auth-key-ums.json
   ```
