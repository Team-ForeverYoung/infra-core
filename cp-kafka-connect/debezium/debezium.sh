#!/bin/bash

set -e  # 에러 발생 시 스크립트 즉시 종료

AWS_REGION="ap-northeast-2"
ACCOUNT_ID="911167924085"
REPO_NAME="forever-util"
IMAGE_TAG="debezium-mysql-1.9.8iiii"
ECR_URI="${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${REPO_NAME}:${IMAGE_TAG}"

echo "[1/5] ECR 로그인"
aws ecr get-login-password --region ${AWS_REGION} | \
    docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

echo "[2/5] Docker 빌더 캐시 정리"
docker builder prune -f

echo "[3/5] Docker 이미지 빌드 중..."
docker build -t ${REPO_NAME}:${IMAGE_TAG} . --no-cache

echo "[4/5] Docker 이미지 태그"
docker tag ${REPO_NAME}:${IMAGE_TAG} ${ECR_URI}

echo "[5/5] ECR로 이미지 푸시 중..."
docker push ${ECR_URI}

echo "이미지 푸시 완료: ${ECR_URI}"
