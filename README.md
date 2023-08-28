# Zetson_Nano
## 젯슨 나노 세팅
1. sd 포맷터를 이용해 sd 카드를 포맷한다. (https://www.sdcard.org/downloads/formatter/sd-memory-card-formatter-for-windows-download/)
2. 엔비디아에서 젯슨 나노 개발 키트를 받고, etcher를 이용해 sd 카드에 젯슨 나노 이미지 파일을 굽는다. (https://developer.nvidia.com/embedded/learn/getting-started-jetson)
3. 젯슨 나노에 sd 카드를 삽입하고, 와이파이 동글, 키보드, 마우스, HDMI선을 연결한다.
![image](https://github.com/server-123/Zetson_Nano/assets/73692229/960b1275-9df1-425c-b149-f210ef662777)
![image](https://github.com/server-123/Zetson_Nano/assets/73692229/2b813228-5a89-412f-a9c2-1eb09b371f78)

5. 젯슨 나노의 기본 설정을 완료해준다.

## 쿨러 연결
1. terminal을 열어 python3을 설치해준다.
- sudo apt-get upgrade
- sudo apt-get update
- sudo apt install python3-pip
- sudo -H pip3 install -U jetson-stats
- reboot
- jtop
2. 온도를 확인한다.
3. 쿨링팬을 나사로 연결해준다.
![image](https://github.com/server-123/Zetson_Nano/assets/73692229/81fbc968-ea32-4221-a77b-009cdcbcf90a)
