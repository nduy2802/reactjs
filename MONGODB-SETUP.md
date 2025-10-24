# 🗄️ Setup MongoDB Atlas cho Vercel

## 📋 Hướng Dẫn Tạo MongoDB Atlas

### Bước 1: Tạo Tài Khoản MongoDB Atlas
1. Truy cập: https://cloud.mongodb.com
2. Đăng ký tài khoản miễn phí
3. Xác thực email

### Bước 2: Tạo Cluster
1. Click **"Build a Database"**
2. Chọn **FREE** tier (M0 Sandbox)
3. Chọn **AWS** provider
4. Chọn region gần nhất (Singapore hoặc Tokyo)
5. Đặt tên cluster: `todox-cluster`
6. Click **"Create"**

### Bước 3: Tạo Database User
1. Vào **Database Access** (menu bên trái)
2. Click **"Add New Database User"**
3. Chọn **"Password"** authentication
4. Username: `todox-user`
5. Password: Tạo password mạnh (ví dụ: `TodoX2024!`)
6. Database User Privileges: **"Read and write to any database"**
7. Click **"Add User"**

### Bước 4: Whitelist IP Addresses
1. Vào **Network Access** (menu bên trái)
2. Click **"Add IP Address"**
3. Chọn **"Allow access from anywhere"** (0.0.0.0/0)
4. Click **"Confirm"**

### Bước 5: Lấy Connection String
1. Vào **Database** → **"Connect"**
2. Chọn **"Connect your application"**
3. Driver: **"Node.js"**
4. Version: **"4.1 or later"**
4. Copy connection string

### Bước 6: Cấu Hình Connection String
Thay thế trong connection string:
- `<password>` → password của user bạn tạo
- `<dbname>` → `todox`

**Ví dụ Connection String:**
```
mongodb+srv://todox-user:TodoX2024!@todox-cluster.xxxxx.mongodb.net/todox?retryWrites=true&w=majority
```

## 🔧 Thêm vào Vercel

Sau khi có connection string, chạy lệnh:
```bash
vercel env add MONGODB_CONNECTIONSTRING
```

Khi được hỏi value, paste connection string vào.

## 🚀 Deploy Lại

```bash
vercel --prod
```

## ✅ Kiểm Tra

Sau khi deploy thành công:
1. Truy cập URL được cung cấp
2. Thử tạo task mới
3. Kiểm tra MongoDB Atlas để xem data

---

**Lưu ý:** Giữ connection string an toàn, không chia sẻ công khai!
