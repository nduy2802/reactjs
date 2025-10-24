# Script để thêm MongoDB Connection String vào Vercel
$connectionString = "mongodb+srv://Duynguyeenn:638HQ9Mmz6CEekdK@cluster0.hkiikdq.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"

Write-Host "🔧 Đang thêm MongoDB Connection String vào Vercel..." -ForegroundColor Green
Write-Host "📋 Connection String: $connectionString" -ForegroundColor Yellow

# Thêm environment variable
Write-Host "📝 Chạy lệnh: vercel env add MONGODB_CONNECTIONSTRING" -ForegroundColor Cyan
Write-Host "📝 Khi được hỏi value, paste connection string trên" -ForegroundColor Cyan
Write-Host "📝 Chọn environment: production" -ForegroundColor Cyan
Write-Host "📝 Sau đó chạy: vercel --prod" -ForegroundColor Cyan

Write-Host "`n✅ Sau khi hoàn thành, bạn sẽ có domain thực!" -ForegroundColor Green

