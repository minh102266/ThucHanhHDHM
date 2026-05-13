MSV="102266"

echo "=== BẮT ĐẦU THỰC HÀNH HỆ ĐIỀU HÀNH MẠNG TRÊN CODESPACES ==="

echo "[1/17] Đang tạo cây thư mục..."
mkdir -p ~/$MSV/backup ~/$MSV/data/tc1 ~/$MSV/data/tc2 ~/$MSV/data/tc3 ~/$MSV/examples ~/$MSV/temp

echo "[2/17] Đang tạo liên kết working..."
ln -s ~/$MSV/data/tc1 ~/$MSV/working

echo "[3/17] Đang tạo file yeu-cau.txt..."
echo "1. Tao thu muc MSV. 2. Tao lien ket working. 3. Tao tep tin yeu-cau.txt." > ~/$MSV/working/yeu-cau.txt

echo "[4/17] Đang phân quyền 440 cho yeu-cau.txt..."
chmod 440 ~/$MSV/working/yeu-cau.txt

echo "[5/17] Đang tạo các file ẩn .gitkeep..."
touch ~/$MSV/data/tc1/.gitkeep ~/$MSV/data/tc2/.gitkeep ~/$MSV/data/tc3/.gitkeep

echo "[6/17] Đang xuất danh sách thư mục ra result.log..."
cd ~/$MSV/data/tc1
pwd && ls -laR ../ > result.log

echo "[7/17] Đang nén thư mục data thành data.tar.gz..."
tar -czvf ~/$MSV/backup/data.tar.gz -C ~/$MSV data

echo "[8-9/17] Đang tải và giải nén file kiem-tra-1.tar.gz..."
cd ~/$MSV/temp
wget -q --show-progress https://hoctructuyen.vimaru.edu.vn/upload/hdhm/kiem-tra-1.tar.gz --no-check-certificate
tar -xzf kiem-tra-1.tar.gz

echo "[10-11/17] Đang tìm kiếm, sao chép và phân quyền file Router/SW..."
find . -type f \( -name "*Router*" -o -name "*SW*" \) -exec cp {} ~/$MSV/data/tc1/ \;
chmod u+x ~/$MSV/data/tc1/*Router* 2>/dev/null || true

echo "[12/17] Danh sách file trong working:"
ls -la ~/$MSV/working/

echo "[13/17] Phân quyền của yeu-cau.txt:"
ls -l ~/$MSV/working/yeu-cau.txt

echo "[14-16/17] Đang xử lý file thời gian..."
date > ~/$MSV/data/now
mv ~/$MSV/data/now ~/$MSV/data/thoi-gian
mv ~/$MSV/data/thoi-gian ~/$MSV/data/tc1/

echo "[17/17] Đang tạo file thông tin cá nhân (info.txt)..."
cat <<EOF > ~/$MSV/info.txt
Môn học: Hệ điều hành mạng
Họ và tên: Trần Tuấn Minh
Mã sinh viên: $MSV
Nhóm: N02
EOF

echo "=== HOÀN TẤT CÁC YÊU CẦU BÀI TẬP! ==="

echo "Đang di chuyển toàn bộ kết quả vào không gian làm việc của GitHub để lưu trữ..."
cd /workspaces/*
cp -r ~/$MSV .
echo "Đã đưa thư mục $MSV vào Repository. Sẵn sàng Commit!"