@echo off
echo 🚀 Deploy TodoX với MongoDB Connection String...

echo.
echo 📋 Connection String của bạn:
echo mongodb+srv://Duynguyeenn:638HQ9Mmz6CEekdK@cluster0.hkiikdq.mongodb.net/?retryWrites=true^&w=majority^&appName=Cluster0
echo.

echo 🔧 Bước 1: Thêm Environment Variable
echo Chạy lệnh: vercel env add MONGODB_CONNECTIONSTRING
echo Khi được hỏi value, paste connection string trên
echo Chọn environment: production
echo.

echo 🚀 Bước 2: Deploy
echo Chạy lệnh: vercel --prod
echo.

echo ✅ Kết quả: https://todox-app.vercel.app
echo.

pause

