# PowerShell로 젯슨에 연결
- 관리자 권한으로 PowerShell 실행
```
cd ..
cd ..
ssh dli@192.168.55.1 #dli 부분엔 userName을 넣음
패스워드 입력
```

```
mkdir -p ~/nvdli-data #dir 추가
echo "sudo docker run --runtime nvidia -it --rm --network host \
    --volume ~/nvdli-data:/nvdli-nano/data \
    --volume /tmp/argus_socket:/tmp/argus_socket \
    --device /dev/video0 \
    nvcr.io/nvidia/dli/dli-nano-ai:v2.0.2-r32.7.1kr" > docker_dli_run.sh #docker_dli_run.sh 생성
chmod +x docker_dli_run.sh #권한 부여
```

- http://192.168.55.1:8888/ 접속
- 패스워드 입력
