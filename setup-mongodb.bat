@echo off
echo 🗄️ Setup MongoDB Atlas cho TodoX...

echo.
echo 📋 HƯỚNG DẪN NHANH:
echo.
echo 1. Truy cập: https://cloud.mongodb.com
echo 2. Click "Try Free" và đăng ký
echo 3. Tạo cluster FREE (M0)
echo 4. Tạo user: todox-user / TodoX2024!
echo 5. Whitelist IP: 0.0.0.0/0
echo 6. Lấy connection string
echo.
echo 🔗 Connection String mẫu:
echo mongodb+srv://todox-user:TodoX2024!@todox-cluster.xxxxx.mongodb.net/todox?retryWrites=true^&w=majority
echo.
echo 📝 Sau khi có connection string, chạy:
echo vercel env add MONGODB_CONNECTIONSTRING
echo.
echo 🚀 Sau đó deploy:
echo vercel --prod
echo.
echo ✅ Kết quả: https://todox-app.vercel.app
echo.
pause

