
## 참고 사이트
* https://brunch.co.kr/@khross3701/4
* https://cloud.google.com/speech-to-text/docs/reference/libraries#client-libraries-usage-php
* https://github.com/GoogleCloudPlatform/php-docs-samples/tree/master/speech


## Google speech-to-text API 키 무료 발급 받기

* 모든 Cloud Platform 제품에 액세스: Firebase, Google Maps API 등을 포함해 앱, 웹사이트, 서비스를 구축하고 실행하는 데 필요한 모든 기능을 이용할 수 있습니다.
* $300의 무료 크레딧: 가입하여 Google Cloud Platform에서 12개월간 사용할 수 있는 $300 크레딧을 받아 보세요.
* 무료 체험판 종료 후 자동 청구되지 않음: 신용카드를 요청하는 이유는 자동 가입을 방지하기 위해서입니다. 유료 계정으로 직접 업그레이드하지 않는 한 요금이 청구되지 않습니다.
* Free trial status: $300.00 credit and 365 days remaining - with a full account, you'll get unlimited access to all of Google Cloud Platform.

1. 다음 사이트에 접속하여 프로젝트를 생성 후, Cloud Speech API를 위한 API 키를 발급받아야 합니다. 

   * https://console.cloud.google.com/apis/dashboard 

2. 오른쪽 상단에 보이는 프로젝트 만들기를 선택합니다. 

3. 만들기를 선택합니다. 

4. 프로젝트 이름을 적어주고 만들기를 선택합니다. 프로젝트 생성될 때까지 잠시 기다려야 합니다. 

5. API 및 서비스 사용 설정을 선택합니다. 

6. cloud speech api를 검색하여 선택합니다.

7. 사용 설정을 선택합니다.

8. 이제 Cloud Speech API가 활성화 되었습니다.  왼쪽 항목에서 사용자 인증 정보를 선택합니다.

9. 사용자 인증 정보 만들기를 선택합니다.

10. 서비스 계정 키를 선택합니다.

11. 서비스 계정 항목에 보이는 콤보박스 선택을 선택합니다.

12. 적당한 서비스 계정 이름을 입력하고 역할 선택에서 Project > 소유자를 선택합니다.

13. 전체 리소스에 접근이 가능하기 때문에 이후 배포를 고려할 때에는 바꿔야할지도 모르겠습니다. 키 유형으로는 JSON이 디폴트로 선택됩니다. 이제 생성을 클릭합니다.

14. 비공개 키(확장자 json) 파일이 컴퓨터에 저장됩니다.

   * 서비스계정키이름.json

15. 명령 프롬프트에서 다음처럼 입력하여 서비스 계정 키를 위한 환경 변수를 등록합니다.

   * set GOOGLE_APPLICATION_CREDENTIALS=/var/www/html/ums/서비스계정키이름.json

16. 작업을 완료 하였습니다.


## Google Speech API 개발환경 설치하기: PHP 언어 사용
* 참고사이트
   * https://cloud.google.com/speech-to-text/
   * https://github.com/GoogleCloudPlatform/php-docs-samples/tree/master/speech 
   * https://getcomposer.org/

* 설치 방법 
```bash
ssh ID: ****
ssh PASS:***

pwd
sudo mkdir -p /work/google-speech-api
sudo chown pi:pi /work/google-speech-api
cd /work/google-speech-api
git clone https://github.com/GoogleCloudPlatform/php-docs-samples.git
cd php-docs-samples/ 
git checkout 20180808
git branch
git reset --hard e97b51c050c030c761bf12568b7f03c5433b3960

cd speech

sudo apt install composer
composer install  (또는 composer require google/cloud-speech)
composer update

./php-docs-samples/speech/README.md 파일을 참고하여 
음성파일이 정상적으로 텍스트문자로 번역이 되는지 테스트를 해야 합니다.

apt-get install php-bcmath
export GOOGLE_APPLICATION_CREDENTIALS=/work/google-speech-api/google-speech-auth-key-ums.json
php speech.php 
- 구글회사가 이 프로그램을 계속 업데이트하고 있기때문에 speech.php 파일명이 다른 파일명으로 변경되어 있을수 있다.
- https://github.com/GoogleCloudPlatform/php-docs-samples/tree/e97b51c050c030c761bf12568b7f03c5433b3960/speech (Aug-08-2018)

php speech.php transcribe test/data/audio32KHz.raw --encoding LINEAR16 --sample-rate 32000
php speech.php transcribe-async test/data/audio32KHz.flac --encoding FLAC --sample-rate 32000
php speech.php transcribe-words test/data/audio32KHz.flac --encoding FLAC --sample-rate 32000
```

* Troubleshooting :  proc_open(): fork failed - Cannot allocate memory
   * Q1: PHP Fatal error:  Uncaught ErrorException: proc_open(): fork failed - Cannot allocate memory in /usr/share/php/Symfony/Component/Console/Application.php:943

   * A1: Make swap disk.
```bash
# To enable the swap you can use for example:
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
sudo /sbin/mkswap /var/swap.1
sudo /sbin/swapon /var/swap.1
```

##  내가 녹음한 .m4a  to ( .flac + .raw )으로 변환하기 
* http://doubles.mooo.com/ums/webapp/audio/
```bash
cd ~/google-speech-api/php-docs-samples/speech/
 wget http://doubles.mooo.com/ums/webapp/audio/201807222150_434082af99805667cc9e060ba55fb083.m4a
```

* from .m4a to PCM raw
```bash
cd ~/google-speech-api/php-docs-samples/speech/
ffmpeg -y -i 201807201630.m4a -acodec pcm_s16le -f s16le -ac 1 -ar 16000 201807201630.raw

* -f s16le 옵션 의미: frequency, signed 16-bit little endian samples
* -ac 1 옵션 의미 : 1 audio channels (stereo)
* -ar 16000 옵션 의미: audio sample rate 16,000Hz
```

* from .m4a to .flac
```bash
cd ~/google-speech-api/php-docs-samples/speech/
ffmpeg -i 201807201630.m4a -f flac 201807201630.flac

ffmpeg -i 201807201630.m4a -ac 1 -af aformat=s16:44100 201807201630.flac  (**RECOMMENDED**)
* 설명: The above command encodes to  44.1 kHz and 16-bit sample.

ffmpeg -i 201807201630.m4a -ac 1 -af aformat=s32:176000 201807201630.flac
* 설명: The above command encodes to a 176 kHz and 24-bit sample, stored as 32-bits. 
```



##  Speech-To-Text 변환 테스트하기 
* Run .raw
```bash
cd /work/google-speech-api/php-docs-samples/speech/ 
file /work/google-speech-api/20180720_195535.raw
/work/google-speech-api/20180720_195535.raw: data

php speech.php transcribe /work/google-speech-api/20180720_195535.raw  --encoding LINEAR16 --language-code ko-KR --sample-rate 16000
Transcript: 녹음 기능을 다시 테스트해 봅니다 지금은 곰 레코드 프로그램을 이용하여 녹음 하고 있고요 녹음 파일의 포맷은 m4a입니다
Confidence: 0.85077333

php speech.php transcribe /work/google-speech-api/20180720_195535.raw --encoding LINEAR16 --language-code ko-KR --sample-rate 32000                 
Transcript: 녹음 기능을 다시 톨스 톨스 근데 지금은 꽃무늬 코드 프로그램을 이용하여 녹음 하고 있고요 녹음 파일 보물섬 m4a입니다                                                                                 
Confidence: 0.8391638

php speech.php transcribe /work/google-speech-api/20180720_195535.raw  --encoding LINEAR16 --language-code ko-KR --sample-rate 42000
( * 실험 결과: sample-rate 수치를 42,000으로 하였을때, 아무런 결과가 출력되지 않았음.)
```

* Run .flac
```bash
php speech.php transcribe /work/google-speech-api/201807222150_434082af99805667cc9e060ba55fb083.flac  --encoding FLAC --language-code ko-KR --sample-rate 44100
Transcript: 지금 상추 가게 오시면은 특별히 오늘만 상추를 60% 할인된 가격으로 여러분 고객님은들을 모십니다 지금 빨리 어서 오십시오
Confidence: 0.8430271
```

## Terminology
* FLAC(Free Lossless Audio Codec)은 오디오 데이터 압축을 위한 파일 형식이다. 무손실 압축 포맷이다. 다시 말해서, MP3, AAC, Vorbis와는 달리 오디오 스트림에 손실이 발생하지 않는다.
* PCM raw: 압축되지 않는 Raw 오디오 포맷이다. 

*  주파수별 소리 정확도
   * 11,025Hz: 일반적인 사람 목소리 수준
   * 22,050Hz:  카세트 테이프 음성 수준
   * 44,100Hz:  CD  음성 수준


## 초간단 테스트 방법(flac사용)
```

cd /var/www/html/[project_name]/webapp/audio/20180804
export GOOGLE_APPLICATION_CREDENTIALS=/work/ums-79c7917331aa.json

sudo rm -f 201808042130_45e234af17ecda8a63889767053b1b89.flac
sudo ffmpeg -i 201808042130_45e234af17ecda8a63889767053b1b89.m4a -af aformat=s16:44100 201808042130_45e234af17ecda8a63889767053b1b89.flac

speech=/work/google-speech-api/php-docs-samples/speech/speech.php 
/usr/bin/php $speech transcribe 201808042130_45e234af17ecda8a63889767053b1b89.flac --encoding FLAC --language-code ko-KR --sample-rate 44100

```

## .flac / .raw 사운드 플레이 테스트하기

### How to play .flac file
```
Rhythmbox (the default player)
Clementine
Amarok
Xnoise
Banshee
Tomahawk
Lollypop
Guayadeque
Cmus (if you like simple music players in the Terminal window)
```

### How to play .raw file
```
sudo apt -y install sox
time play -t raw -r 16k -e signed -b 16 -c 1  ./output_all.raw

sudo apt -y install ffmpeg
time ffplay -f s16le -ar 16k -ac 1 ./output_all.raw 

sudo apt -y  alsa-util
time aplay -t raw -r 16k -c 1 -f S16_LE ./output_all.raw 

```



## 윈도우10 데스크탑 PC를 위한 Console  프로그램 설치하기 

#### 방법1: putty (공짜 프로그램) 설치하기 
* https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
   * 64-bit: putty-64bit-0.70-installer.msi 다운로드 및 설치할것. 

* Hostname: invain.mooo.com
* Saved Sessions: invain.mooo.com

#### 방법2: mobaxterm (공짜 프로그램) 설치하기
* https://mobaxterm.mobatek.net/download-home-edition.html 
* "MobaXterm Home Edition (Installer edition)"을 다운로드후에 설치하세요. 


