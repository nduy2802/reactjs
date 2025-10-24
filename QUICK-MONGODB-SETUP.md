# 🚀 Setup MongoDB Atlas Nhanh (5 phút)

## Bước 1: Tạo MongoDB Atlas
1. Truy cập: https://cloud.mongodb.com
2. Click **"Try Free"**
3. Đăng ký với Google/GitHub hoặc email
4. Chọn **"Build a Database"**
5. Chọn **FREE** tier (M0)
6. Chọn **AWS** và region **Singapore**
7. Đặt tên cluster: `todox-cluster`
8. Click **"Create"**

## Bước 2: Tạo User
1. Vào **Database Access**
2. Click **"Add New Database User"**
3. Username: `todox-user`
4. Password: `TodoX2024!` (hoặc password mạnh khác)
5. Privileges: **"Read and write to any database"**
6. Click **"Add User"**

## Bước 3: Whitelist IP
1. Vào **Network Access**
2. Click **"Add IP Address"**
3. Chọn **"Allow access from anywhere"** (0.0.0.0/0)
4. Click **"Confirm"**

## Bước 4: Lấy Connection String
1. Vào **Database** → **"Connect"**
2. Chọn **"Connect your application"**
3. Driver: **Node.js**, Version: **4.1 or later**
4. Copy connection string

## Bước 5: Cấu Hình
Thay thế trong connection string:
- `<password>` → password bạn đã tạo
- `<dbname>` → `todox`

**Ví dụ:**
```
mongodb+srv://todox-user:TodoX2024!@todox-cluster.xxxxx.mongodb.net/todox?retryWrites=true&w=majority
```

## Bước 6: Thêm vào Vercel
```bash
vercel env add MONGODB_CONNECTIONSTRING
```
Paste connection string khi được hỏi.

## Bước 7: Deploy
```bash
vercel --prod
```

## ✅ Kết Quả
Sau khi hoàn thành, bạn sẽ có:
- 🌐 Domain thực: `https://todox-app.vercel.app`
- 🗄️ Database cloud MongoDB Atlas
- ⚡ Serverless API functions
- 🚀 Global CDN

---

**Thời gian setup: ~5 phút**

