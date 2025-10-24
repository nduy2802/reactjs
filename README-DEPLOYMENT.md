# 🚀 TodoX - Hướng Dẫn Deploy

## 📋 Tổng Quan
TodoX là một ứng dụng quản lý công việc full-stack được xây dựng với:
- **Frontend**: React + Vite + Tailwind CSS
- **Backend**: Node.js + Express
- **Database**: MongoDB

## 🛠️ Yêu Cầu Hệ Thống

### Bắt Buộc
- **Docker** (phiên bản 20.10+)
- **Docker Compose** (phiên bản 2.0+)
- **Git** (để clone repository)

### Tùy Chọn
- **Node.js** (phiên bản 18+) - nếu muốn chạy local development
- **MongoDB** (phiên bản 7.0+) - nếu muốn chạy database riêng

## 🚀 Cách Deploy

### Phương Pháp 1: Sử Dụng Script Tự Động (Khuyến Nghị)

#### Trên Windows:
```bash
# Chạy script deployment
deploy.bat
```

#### Trên Linux/macOS:
```bash
# Cấp quyền thực thi
chmod +x deploy.sh

# Chạy script deployment
./deploy.sh
```

### Phương Pháp 2: Deploy Thủ Công

1. **Dừng các container hiện tại:**
   ```bash
   docker-compose down
   ```

2. **Build và khởi động services:**
   ```bash
   docker-compose up --build -d
   ```

3. **Kiểm tra trạng thái:**
   ```bash
   docker-compose ps
   ```

## 🌐 Truy Cập Ứng Dụng

Sau khi deploy thành công:
- **Ứng dụng web**: http://localhost:5001
- **MongoDB**: localhost:27017
  - Username: `admin`
  - Password: `password123`

## 📊 Quản Lý Services

### Xem Logs
```bash
# Xem logs tất cả services
docker-compose logs -f

# Xem logs service cụ thể
docker-compose logs -f todox-app
docker-compose logs -f mongodb
```

### Dừng Ứng Dụng
```bash
# Dừng tất cả services
docker-compose down

# Dừng và xóa volumes (mất dữ liệu)
docker-compose down -v
```

### Khởi Động Lại
```bash
# Khởi động lại services
docker-compose restart

# Khởi động lại service cụ thể
docker-compose restart todox-app
```

## 🔧 Cấu Hình

### Thay Đổi Port
Để thay đổi port của ứng dụng, sửa file `docker-compose.yml`:
```yaml
services:
  todox-app:
    ports:
      - "8080:5001"  # Thay 8080 thành port mong muốn
```

### Thay Đổi Database Credentials
Sửa file `docker-compose.yml`:
```yaml
services:
  mongodb:
    environment:
      MONGO_INITDB_ROOT_USERNAME: your_username
      MONGO_INITDB_ROOT_PASSWORD: your_password
```

## 🐛 Troubleshooting

### Lỗi Thường Gặp

1. **Port đã được sử dụng:**
   ```bash
   # Kiểm tra port đang sử dụng
   netstat -tulpn | grep :5001
   
   # Thay đổi port trong docker-compose.yml
   ```

2. **Docker không khởi động:**
   ```bash
   # Kiểm tra Docker service
   sudo systemctl status docker
   
   # Khởi động Docker
   sudo systemctl start docker
   ```

3. **MongoDB connection failed:**
   ```bash
   # Kiểm tra MongoDB container
   docker-compose logs mongodb
   
   # Khởi động lại MongoDB
   docker-compose restart mongodb
   ```

### Reset Hoàn Toàn
```bash
# Dừng và xóa tất cả
docker-compose down -v --rmi all

# Xóa tất cả images và containers
docker system prune -a

# Deploy lại
docker-compose up --build -d
```

## 📈 Monitoring

### Kiểm Tra Tài Nguyên
```bash
# Xem tài nguyên sử dụng
docker stats

# Xem thông tin containers
docker-compose ps
```

### Backup Database
```bash
# Backup MongoDB
docker-compose exec mongodb mongodump --out /backup

# Copy backup ra host
docker cp todox-mongodb:/backup ./mongodb-backup
```

## 🔒 Bảo Mật

### Production Deployment
Để deploy lên production, cần:

1. **Thay đổi credentials mặc định**
2. **Sử dụng HTTPS**
3. **Cấu hình firewall**
4. **Backup định kỳ**
5. **Monitor logs**

## 📞 Hỗ Trợ

Nếu gặp vấn đề, hãy:
1. Kiểm tra logs: `docker-compose logs -f`
2. Kiểm tra trạng thái: `docker-compose ps`
3. Restart services: `docker-compose restart`

---

**Chúc bạn deploy thành công! 🎉**
