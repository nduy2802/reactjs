# 🚀 Deploy TodoX lên Vercel

## 📋 Tổng Quan
Hướng dẫn deploy ứng dụng TodoX lên Vercel với MongoDB Atlas.

## 🛠️ Chuẩn Bị

### 1. Tài Khoản Cần Thiết
- **Vercel Account**: https://vercel.com
- **MongoDB Atlas Account**: https://cloud.mongodb.com

### 2. Cài Đặt Vercel CLI
```bash
npm install -g vercel
```

## 🗄️ Setup MongoDB Atlas

### Bước 1: Tạo Cluster
1. Đăng nhập vào MongoDB Atlas
2. Tạo cluster mới (chọn FREE tier)
3. Chọn region gần nhất
4. Đặt tên cluster: `todox-cluster`

### Bước 2: Tạo Database User
1. Vào **Database Access**
2. Click **Add New Database User**
3. Chọn **Password** authentication
4. Username: `todox-user`
5. Password: tạo password mạnh
6. Database User Privileges: **Read and write to any database**

### Bước 3: Whitelist IP Addresses
1. Vào **Network Access**
2. Click **Add IP Address**
3. Chọn **Allow access from anywhere** (0.0.0.0/0)
4. Hoặc thêm IP cụ thể của bạn

### Bước 4: Lấy Connection String
1. Vào **Database** → **Connect**
2. Chọn **Connect your application**
3. Driver: **Node.js**
4. Version: **4.1 or later**
5. Copy connection string
6. Thay `<password>` bằng password của user
7. Thay `<dbname>` bằng `todox`

**Ví dụ connection string:**
```
mongodb+srv://todox-user:your-password@todox-cluster.xxxxx.mongodb.net/todox?retryWrites=true&w=majority
```

## 🚀 Deploy lên Vercel

### Phương Pháp 1: Sử Dụng Vercel CLI (Khuyến Nghị)

#### Bước 1: Login Vercel
```bash
vercel login
```

#### Bước 2: Deploy Project
```bash
# Từ thư mục root của project
vercel

# Hoặc deploy với production
vercel --prod
```

#### Bước 3: Cấu Hình Environment Variables
```bash
# Set MongoDB connection string
vercel env add MONGODB_CONNECTIONSTRING

# Khi được hỏi, paste connection string từ MongoDB Atlas
```

### Phương Pháp 2: Deploy qua Vercel Dashboard

#### Bước 1: Import Project
1. Đăng nhập vào https://vercel.com
2. Click **New Project**
3. Import từ GitHub/GitLab/Bitbucket
4. Chọn repository chứa code

#### Bước 2: Cấu Hình Build Settings
- **Framework Preset**: Vite
- **Root Directory**: `frontend`
- **Build Command**: `npm run build`
- **Output Directory**: `dist`

#### Bước 3: Environment Variables
1. Vào **Settings** → **Environment Variables**
2. Thêm biến:
   - **Name**: `MONGODB_CONNECTIONSTRING`
   - **Value**: Connection string từ MongoDB Atlas
   - **Environment**: Production, Preview, Development

#### Bước 4: Deploy
Click **Deploy** và đợi quá trình build hoàn tất.

## 🔧 Cấu Hình Chi Tiết

### Vercel.json Configuration
File `vercel.json` đã được cấu hình sẵn:
```json
{
  "version": 2,
  "builds": [
    {
      "src": "frontend/package.json",
      "use": "@vercel/static-build",
      "config": {
        "distDir": "dist"
      }
    },
    {
      "src": "api/tasks.js",
      "use": "@vercel/node"
    }
  ],
  "routes": [
    {
      "src": "/api/tasks(.*)",
      "dest": "/api/tasks"
    },
    {
      "src": "/(.*)",
      "dest": "/frontend/dist/$1"
    }
  ]
}
```

### API Routes
- **GET** `/api/tasks` - Lấy danh sách tasks
- **POST** `/api/tasks` - Tạo task mới
- **PUT** `/api/tasks/:id` - Cập nhật task
- **DELETE** `/api/tasks/:id` - Xóa task
- **GET** `/api/health` - Health check

## 🌐 Truy Cập Ứng Dụng

Sau khi deploy thành công:
- **Production URL**: `https://your-project-name.vercel.app`
- **Preview URL**: `https://your-project-name-git-branch.vercel.app`

## 📊 Monitoring & Logs

### Xem Logs
```bash
# Xem logs realtime
vercel logs

# Xem logs của function cụ thể
vercel logs --function=api/tasks
```

### Vercel Dashboard
1. Vào project dashboard
2. Tab **Functions** để xem API logs
3. Tab **Analytics** để xem traffic
4. Tab **Settings** để quản lý environment variables

## 🔄 CI/CD với Git

### Auto Deploy
1. Connect GitHub repository
2. Mỗi push vào `main` branch sẽ auto deploy production
3. Mỗi push vào branch khác sẽ tạo preview deployment

### Custom Domain
1. Vào **Settings** → **Domains**
2. Thêm domain của bạn
3. Cấu hình DNS records theo hướng dẫn

## 🐛 Troubleshooting

### Lỗi Thường Gặp

#### 1. Build Failed
```bash
# Kiểm tra logs
vercel logs

# Rebuild
vercel --force
```

#### 2. MongoDB Connection Error
- Kiểm tra connection string
- Đảm bảo IP whitelist đúng
- Kiểm tra user permissions

#### 3. API Routes Not Working
- Kiểm tra `vercel.json` routes
- Đảm bảo file `api/tasks.js` tồn tại
- Kiểm tra function logs

### Debug Commands
```bash
# Test local
vercel dev

# Check environment variables
vercel env ls

# Inspect deployment
vercel inspect
```

## 💰 Pricing

### Vercel Free Tier
- **Bandwidth**: 100GB/month
- **Function executions**: 100GB-hours/month
- **Serverless Functions**: 100GB-hours/month
- **Build minutes**: 6000 minutes/month

### MongoDB Atlas Free Tier
- **Storage**: 512MB
- **Connections**: 100
- **Shared clusters**: 1

## 🔒 Security Best Practices

1. **Environment Variables**: Không commit sensitive data
2. **MongoDB**: Sử dụng strong passwords
3. **IP Whitelist**: Giới hạn IP access
4. **HTTPS**: Vercel tự động cung cấp SSL
5. **CORS**: Đã cấu hình trong API

## 📈 Performance Optimization

1. **CDN**: Vercel tự động sử dụng global CDN
2. **Edge Functions**: API chạy gần user nhất
3. **Static Assets**: Tự động optimize images
4. **Caching**: Browser caching cho static files

## 🎉 Kết Quả

Sau khi deploy thành công, bạn sẽ có:
- ✅ Production-ready TodoX app
- ✅ MongoDB Atlas database
- ✅ Serverless API functions
- ✅ Global CDN
- ✅ Automatic HTTPS
- ✅ Custom domain support

---

**Chúc bạn deploy thành công! 🚀**
