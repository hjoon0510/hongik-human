# Introduction

이 프로젝트는 IoT, Cloud, Deep-Learning 등을 이용하여  개발하기 위한 소스들을 구성하고 있다. 


# 설치 방법

### Raspberry Pi 개발보드에 OS 설치
제일먼저 [doc](doc/) 폴더에 업로드 한 문서를 읽으십시오. 그리고 Raspberry Pi 장치에 Raspbian OS를 설치하십시오.


### 설치하기
우리는 Python (모션 인식 프로그램) 및 PHP (웹 응용 프로그램) 언어를 이용하여 개발하였습니다.

1. 제일먼저 ./mysql/폴더의 sql 파일들을 참고하여 mysql 데이타베이스를 설치해야 한다. 


2. 그 다음 아래와 같이 웹앱을 설치해야 한다. 다음과 같이 설치하십시오.

```bash
# Windows10 PC에서 mobaxterm 을 실행한후 좌측 메뉴상단의  ssh 세션을 실행하십시오

$ sudo chown pi:pi /var/www/html
$ cd /var/www/html
$ sudo apt -y remove nano
$ sudo apt -y install git vim
$ sudo update-alternatives --set editor /usr/bin/vim.tiny
$ git clone https://github.com/hjoon0510/{PRJ_NAME}.git
$ cd ./{PRJ_NAME}
$ sudo chown -R www-data:www-data /var/www/html/{PRJ_NAME}/audio/ <-- 이 작업을 미수행시 음성파일 업로드안되어 클라우드 번역 실행 오류난다.
$ sudo visudo
--------------- /etc/sudoers: start ----------------
#includedir /etc/sudoers.d
www-data        ALL=(ALL) NOPASSWD: ALL <---- 여기에 아파치 웹서버의 아이디  www-data를 추가하도록 한다.!!!!
--------------- /etc/sudoers: ending ---------------
$ vi ./webapp/webapp_config.php  
   $db_host = 'localhost';
   $db_name = 'sbdb';
   $db_user = 'root';
   $db_pass = 'raspberry';
```

# 실행방법
1. 웹앱 및 주변장치 실행 프로그램을 시작하는 방법에 대해 설명합니다.  
소프트웨어는 launcher라는 프로그램을 통해서 RPI Board를 부팅시마다 자동으로 실행됩니다. 
그러므로, 아래처럼 gcc 명령으로 launcher.c를 컴파일하여주세요. 
그 다음으로  컴파일하여 생성된 `launcher` 파일을 실행만 하면 됩니다.
```bash
$ gcc launcher.c -o launcher 
$ ./launcher
$ firefox http://{rpi_ip_address}/{GitHub-Repository}/
```
2. camera 기능 애플리케이션을 사용하는 방법입니다. 

2.1 제일먼저 아래의 파이썬 라이브러리들을 설치해야 한다. 
```
pip3 install face_recoginition
pip3 install dlib
pip3 install opencv-contrib-python
pip3 install imutils
pip3 install scikit-learn
```

2.2 얼굴인식 프로그램을 실행한다.
2.2.1 Hog 알고리즘으로 실행할 경우 (얼굴)인식률이 높지만 정확도가 떨어진다.
* 요구사항: Python 3.5.3
* 이미지 폴더: ./dataset/
```bash
cd opencv-face-recognition-hog
./01-encoding.sh
./02-run.sh
```

2.2.2 SSD 알고리즘으로 실핼할 경우 (얼굴)인식률이 떨어지지만 정확도가 높다.
* 요구사항: Python 3.5.3
* 이미지 폴더: ./dataset/
```bash
cd opencv-face-recognition-ssd
./01-dataset.sh
./02-train.sh
./03-run-camera.sh
```

2.3 사회적 거리두기 프로그램을 실행한다. 
* 요구사항: Python 3.5.3
```bash
cd covid/
./run.sh

```

3. Push 서비스를 설치한다 
* https://github.com/hjoon0510/{PRJ_NAME}/blob/master/gotify/README.md

# 참고자료
* 라즈베리파이로 시작하는 핸드메이드 IoT, https://github.com/bjpublic/raspberrypi
* 라즈베리파이 커뮤니티 사이트, https://www.raspberrypi.org/community/
* C++ deep-learning library containing machine learning algorithm, http://dlib.net/
* Face Recognition, https://pypi.org/project/face-recognition/

