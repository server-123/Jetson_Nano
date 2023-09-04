#Jupyter Lab에서 젯슨 나노 돌리기
echo "sudo docker run --runtime nvidia -it --rm --network host \
    --volume ~/nvdli-data:/nvdli-nano/data \
    --volume /tmp/argus_socket:/tmp/argus_socket \
    --device /dev/video0 \
    nvcr.io/nvidia/dli/dli-nano-ai:v2.0.2-r32.7.1kr" >

#chmod +x docker_dli_run.sh
#권한 부여

#./docker_dli_run.sh
#도커 실행 -> ip주소와 패스워드 입력 후 주피터랩 실행
