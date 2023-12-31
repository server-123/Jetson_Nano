# Jetson_Nano
## 젯슨 나노 세팅
### SD카드 설정
1. sd 포맷터를 이용해 sd 카드를 포맷한다. (https://www.sdcard.org/downloads/formatter/sd-memory-card-formatter-for-windows-download/)
2. 엔비디아에서 젯슨 나노 개발 키트를 받고, etcher를 이용해 sd 카드에 젯슨 나노 이미지 파일을 굽는다. (https://developer.nvidia.com/embedded/learn/getting-started-jetson)
3. 젯슨 나노에 sd 카드를 삽입하고, 와이파이 동글, 키보드, 마우스, HDMI선을 연결한다.
![1](https://github.com/server-123/Jetson_Nano/assets/73692229/86ab9bce-f024-4731-86af-0142ad0a97a5)
![2](https://github.com/server-123/Jetson_Nano/assets/73692229/f7edda01-5400-4476-82e7-5eb2022d3261)
4. 젯슨 나노의 기본 설정을 완료해준다.

### 쿨링팬 연결
1. terminal을 열어 python3을 설치해준다.
- sudo apt-get upgrade
- sudo apt-get update
- sudo apt install python3-pip
- sudo -H pip3 install -U jetson-stats
- reboot
- jtop
2. 온도를 확인한다.
3. 쿨링팬을 나사로 연결해준다.
![3](https://github.com/server-123/Jetson_Nano/assets/73692229/93976bbc-f331-46e0-b305-2b6b5b964b9f)
- cd Downloads
- git clone  https://github.com/jetsonworld/jetson-fan-ctl.git
- cd jetson-fan-ctl
- sudo sh install.sh

### CSI 카메라 연결
![4](https://github.com/server-123/Jetson_Nano/assets/73692229/c0f7c487-fff7-4a4a-bd21-99c126d07a57)
- git clone https://github.com/jetsonhacks/CSI-Camera.git
- cd CSI-Camera
- python3 simple_camera.py

## 도커(Docker)란?
출처 : https://code-lab1.tistory.com/236

도커는 컨테이너 기반의 오픈소스 가상화 플랫폼이다. 다양한 프로그램과 실행환경을 컨테이너로 규격화해 프로그램의 배포 및 관리를 단순화할 수 있다. 코드 뿐만 아니라 실행에 필요한 모든 dependency들도 담기 때문에 다른 환경에서도 빠르게 애플리케이션을 실행할 수 있으며, 어떠한 프로그램도 컨테이너로 규격화할 수 있어 편리하다. 도커 이미지는 도커 엔진 위에서 실행되게 떄문에 도커가 설치되어 있는 곳에선 모든 환경에서 동일하게 작동할 수 있다.

### 도커 이미지란?
도커에서 서비스 운영에 필요한 서버 프로그램, 코드 및 라이브러리, 컴파일된 실행 파일 등을 묶은 형태이다. 컨테이너 생성에 필요한 모든 파일과 환경을 가진 것이다. 도커 이미지를 실행하면 도커 컨테이너가 된다.
![5](https://github.com/server-123/Jetson_Nano/assets/73692229/84c0c7c6-21e3-4c6b-9c83-c492ea18fd81)

### 도커 레이어란?
도커 이미지는 레이어라는 개념을 사용해 여러 개의 레이어를 나누어 이미지를 구성한다. 이 방식을 사용하면 기존의 이미지 레이어를 이용해 다양한 이미지를 새로 만들 수 있고, 기존 이미지를 이용하기 떄문에 용량을 절약할 수 있다. 컨테이너를 생성할 때도 기존의 이미지 레이어 위에 읽기/쓰기 레이어를 추가한다. 이미지 레이어를 그대로 사용하면서 컨테이너가 실행 중에 생성하는 파일이나 변경된 내용은 읽기/쓰기 레이어에 저장되므로 여러 개의 컨테이너를 생성해도 최소한의 용량만 사용하게 된다.
![6](https://github.com/server-123/Jetson_Nano/assets/73692229/fdeafccd-f908-47a4-bed2-0d4d7f2c7464)

### 도커 허브란?
github처럼 공개 이미지를 관리해주는 시스템이다. 누구나 쉽게 도커 이미지를 만들고 배포할 수 있다. 또한 도커 허브에서 도커 이미지를 Pull 해와 실행시킬 수 있다. 용량이 매우 큰 이미지도 허브에서 관리해주기 때문에 사용자는 부담 없이 도커 이미지를 사용할 수 있다.
![7](https://github.com/server-123/Jetson_Nano/assets/73692229/692a383a-bea7-494e-8c55-9f3c09bd92ca)

## 주피터 노트북(Jupyter Notebook)이란?
출처 : https://s1mcoding.tistory.com/26

오픈소스 기반의 웹 플랫폼으로, 다양한 프로그래밍 언어로 코드 작성 및 실행하는 개발 환경이다. 시각화를 만드는 데 유용하고, 다양한 프로그래밍 언어를 지원하며, 개발 중 프로그램을 계속 실행해 확인할 수 있기 때문에 머신러닝과 딥러닝에 많이 활용된다.

## Memory swap
```
# Disable ZRAM:
sudo systemctl disable nvzramconfig
 
# Prevent X-Server from starting:
sudo systemctl set-default multi-user.target

 # Create additional 6GB swap file (assume 4GB already for a total of 10GB)
sudo fallocate -l 6G /mnt/6GB.swap
sudo chmod 600 /mnt/6GB.swap
sudo mkswap /mnt/6GB.swap

# Append the following line to /etc/fstab
 sudo su
echo "/mnt/6GB.swap swap swap defaults 0 0" >> /etc/fstab
exit

# REBOOT!
sudo reboot

# Check your memory and swap:
free -h
```

# Classification VS Regression
## Classification
이미지 분류 모델은 입력 이미지를 사전 정의된 클래스 레이블로 분류하는 작업에 사용된다. 예를 들어, 고양이와 개를 구분하는 이미지 분류 모델은 주어진 이미지가 고양이인지 개인지를 판별하는 작업을 수행한다. 이러한 분류 작업에서는 입력 이미지에 대한 클래스 레이블을 예측하는 것이 목표이다. 일반적으로 분류 모델의 출력은 클래스 레이블에 해당하는 범주형 데이터이다.
## Regression
회귀 모델은 입력 데이터와 연속적인 출력 값 사이의 관계를 모델링하는 데 사용된다. 회귀 모델은 입력 데이터를 기반으로 하여 연속적인 수치 값을 예측하는 작업을 수행한다. 예를 들어, 집 크기, 방의 개수, 위치 등의 특성을 사용하여 집의 가격을 예측하는 회귀 모델을 만들 수 있다. 회귀 모델의 출력은 연속적인 수치형 데이터이다.
