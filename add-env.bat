@echo off
echo 🔧 Thêm MongoDB Connection String vào Vercel...

echo.
echo 📋 Connection String của bạn:
echo mongodb+srv://Duynguyeenn:638HQ9Mmz6CEekdK@cluster0.hkiikdq.mongodb.net/?retryWrites=true^&w=majority^&appName=Cluster0
echo.
echo 📝 Hướng dẫn:
echo 1. Chạy lệnh: vercel env add MONGODB_CONNECTIONSTRING
echo 2. Khi được hỏi value, paste connection string trên
echo 3. Chọn environment: production
echo 4. Chạy: vercel --prod
echo.
echo ✅ Sau khi hoàn thành, bạn sẽ có domain thực!
echo.

pause

