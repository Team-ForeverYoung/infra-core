#!/bin/bash

AWS_REGION="ap-northeast-2"
ACCOUNT_ID="911167924085"
REPO_NAME="forever-util"
IMAGE_TAG="debezium-mysql-1.9.8"
ECR_URI="${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${REPO_NAME}:${IMAGE_TAG}"

echo "ecr 로그인"
aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

echo "docker 빌드즁"
docker build -t ${REPO_NAME}:${IMAGE_TAG} . --no-cache
docker tag ${REPO_NAME}:${IMAGE_TAG} ${ECR_URI}

echo "ECR로 이미지 푸시 중..."
docker push ${ECR_URI}

echo "이미지 푸시 완료: ${ECR_URI}"

