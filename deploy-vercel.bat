@echo off
echo 🚀 Deploy TodoX lên Vercel...

REM Check if Vercel CLI is installed
vercel --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Vercel CLI chưa được cài đặt.
    echo 📥 Đang cài đặt Vercel CLI...
    npm install -g vercel
    if %errorlevel% neq 0 (
        echo ❌ Không thể cài đặt Vercel CLI. Vui lòng cài đặt thủ công: npm install -g vercel
        pause
        exit /b 1
    )
)

echo ✅ Vercel CLI đã sẵn sàng!

REM Login to Vercel
echo 🔐 Đăng nhập Vercel...
vercel login

REM Deploy to Vercel
echo 🚀 Đang deploy lên Vercel...
vercel --prod

echo ✅ Deploy hoàn thành!
echo.
echo 📝 Bước tiếp theo:
echo 1. Vào Vercel Dashboard để cấu hình Environment Variables
echo 2. Thêm MONGODB_CONNECTIONSTRING từ MongoDB Atlas
echo 3. Kiểm tra ứng dụng tại URL được cung cấp
echo.
echo 📖 Xem hướng dẫn chi tiết trong file VERCEL-DEPLOYMENT.md
pause
