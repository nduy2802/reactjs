#!/bin/bash

# TodoX Deployment Script
echo "🚀 Bắt đầu deploy TodoX application..."

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker chưa được cài đặt. Vui lòng cài đặt Docker trước."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose chưa được cài đặt. Vui lòng cài đặt Docker Compose trước."
    exit 1
fi

# Stop existing containers
echo "🛑 Dừng các container hiện tại..."
docker-compose down

# Remove old images (optional)
echo "🧹 Dọn dẹp images cũ..."
docker-compose down --rmi all

# Build and start services
echo "🔨 Build và khởi động services..."
docker-compose up --build -d

# Wait for services to be ready
echo "⏳ Đợi services khởi động..."
sleep 10

# Check if services are running
echo "🔍 Kiểm tra trạng thái services..."
docker-compose ps

echo "✅ Deployment hoàn thành!"
echo "🌐 Ứng dụng có thể truy cập tại: http://localhost:5001"
echo "📊 MongoDB có thể truy cập tại: localhost:27017"
echo ""
echo "📝 Để xem logs: docker-compose logs -f"
echo "🛑 Để dừng ứng dụng: docker-compose down"
