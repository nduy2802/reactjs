@echo off
echo 🚀 Bắt đầu deploy TodoX application...

REM Check if Docker is installed
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker chưa được cài đặt. Vui lòng cài đặt Docker trước.
    pause
    exit /b 1
)

docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker Compose chưa được cài đặt. Vui lòng cài đặt Docker Compose trước.
    pause
    exit /b 1
)

REM Stop existing containers
echo 🛑 Dừng các container hiện tại...
docker-compose down

REM Remove old images (optional)
echo 🧹 Dọn dẹp images cũ...
docker-compose down --rmi all

REM Build and start services
echo 🔨 Build và khởi động services...
docker-compose up --build -d

REM Wait for services to be ready
echo ⏳ Đợi services khởi động...
timeout /t 10 /nobreak >nul

REM Check if services are running
echo 🔍 Kiểm tra trạng thái services...
docker-compose ps

echo ✅ Deployment hoàn thành!
echo 🌐 Ứng dụng có thể truy cập tại: http://localhost:5001
echo 📊 MongoDB có thể truy cập tại: localhost:27017
echo.
echo 📝 Để xem logs: docker-compose logs -f
echo 🛑 Để dừng ứng dụng: docker-compose down
pause
