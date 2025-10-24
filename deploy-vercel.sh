#!/bin/bash

echo "🚀 Deploy TodoX lên Vercel..."

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "❌ Vercel CLI chưa được cài đặt."
    echo "📥 Đang cài đặt Vercel CLI..."
    npm install -g vercel
    if [ $? -ne 0 ]; then
        echo "❌ Không thể cài đặt Vercel CLI. Vui lòng cài đặt thủ công: npm install -g vercel"
        exit 1
    fi
fi

echo "✅ Vercel CLI đã sẵn sàng!"

# Login to Vercel
echo "🔐 Đăng nhập Vercel..."
vercel login

# Deploy to Vercel
echo "🚀 Đang deploy lên Vercel..."
vercel --prod

echo "✅ Deploy hoàn thành!"
echo ""
echo "📝 Bước tiếp theo:"
echo "1. Vào Vercel Dashboard để cấu hình Environment Variables"
echo "2. Thêm MONGODB_CONNECTIONSTRING từ MongoDB Atlas"
echo "3. Kiểm tra ứng dụng tại URL được cung cấp"
echo ""
echo "📖 Xem hướng dẫn chi tiết trong file VERCEL-DEPLOYMENT.md"
