﻿ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER QUANLYPHONGKHAM IDENTIFIED BY Admin123;
GRANT CONNECT, RESOURCE, DBA TO QUANLYPHONGKHAM;
GRANT EXECUTE ON DBMS_LOCK TO QUANLYPHONGKHAM;

ALTER SESSION SET CURRENT_SCHEMA = QUANLYPHONGKHAM

/* ======================== CAC THAO TAC TREN BANG VA SEQUENCE ======================== */\
-- XEM BANG
SELECT * FROM TAIKHOAN
SELECT * FROM VAITRO
SELECT * FROM BENHNHAN
SELECT * FROM BACSI
SELECT * FROM LETAN
SELECT * FROM PHONGKHAM
SELECT * FROM BENH
SELECT * FROM LOAIHD
SELECT * FROM DICHVU
SELECT * FROM LOAIDV
SELECT * FROM PHIEUKHAM
SELECT * FROM KETQUADICHVUCLS
SELECT * FROM CHITIETBENH
SELECT * FROM DONTHUOC
SELECT * FROM CTDT
SELECT * FROM GIODATLICH
SELECT * FROM THUOC
SELECT * FROM DONVITHUOC
SELECT * FROM LOTHUOC
SELECT * FROM HOADON

-- XOA BANG
DROP TABLE TAIKHOAN
DROP TABLE VAITRO
DROP TABLE BENHNHAN
DROP TABLE BACSI
DROP TABLE LETAN
DROP TABLE PHONGKHAM
DROP TABLE BENH
DROP TABLE LOAIHD
DROP TABLE DICHVU
DROP TABLE LOAIDV
DROP TABLE PHIEUKHAM
DROP TABLE KETQUADICHVUCLS
DROP TABLE CHITIETBENH
DROP TABLE DONTHUOC
DROP TABLE CTDT
DROP TABLE GIODATLICH
DROP TABLE THUOC
DROP TABLE DONVITHUOC
DROP TABLE LOTHUOC
DROP TABLE HOADON

-- TAO SEQUENCE
CREATE SEQUENCE SEQ1_MABS START WITH 1;
CREATE SEQUENCE SEQ2_MABN START WITH 1;
CREATE SEQUENCE SEQ3_MATK START WITH 1;
CREATE SEQUENCE SEQ4_MALT START WITH 1;
CREATE SEQUENCE SEQ5_MAPHONG START WITH 1;
CREATE SEQUENCE SEQ6_MAICD START WITH 1;
CREATE SEQUENCE SEQ7_MALHD START WITH 1;
CREATE SEQUENCE SEQ8_MADV START WITH 1;
CREATE SEQUENCE SEQ9_MALDV START WITH 1;
CREATE SEQUENCE SEQ11_MAPK START WITH 1;
CREATE SEQUENCE SEQ12_MADT START WITH 1;
CREATE SEQUENCE SEQ13_MAKQ START WITH 1;
CREATE SEQUENCE SEQ14_MATHUOC START WITH 1;
CREATE SEQUENCE SEQ13_MADVT START WITH 1;
CREATE SEQUENCE SEQ14_MALT START WITH 1;
CREATE SEQUENCE SEQ15_MAHD START WITH 1;

-- XOA SEQUENCE
DROP SEQUENCE SEQ1_MABS;
DROP SEQUENCE SEQ2_MABN;
DROP SEQUENCE SEQ3_MATK;
DROP SEQUENCE SEQ4_MALT;
DROP SEQUENCE SEQ5_MAPHONG;
DROP SEQUENCE SEQ6_MAICD;
DROP SEQUENCE SEQ7_MALHD;
DROP SEQUENCE SEQ8_MADV;
DROP SEQUENCE SEQ9_MALDV;
DROP SEQUENCE SEQ11_MAPK;
DROP SEQUENCE SEQ12_MADT;
DROP SEQUENCE SEQ13_MAKQ;
DROP SEQUENCE SEQ14_MATHUOC;
DROP SEQUENCE SEQ13_MADVT;
DROP SEQUENCE SEQ14_MALT;
DROP SEQUENCE SEQ15_MAHD;

-----------------------------------------------------
-- TAO BANG

CREATE TABLE TAIKHOAN (
  MATK NUMBER NOT NULL, 
  MAVAITRO NUMBER NOT NULL, 
  USERNAME VARCHAR2(100) NOT NULL, 
  PASSWORD VARCHAR2(100),

  CONSTRAINT PK_TK PRIMARY KEY (MATK)
)

CREATE TABLE VAITRO (
  MAVAITRO NUMBER NOT NULL, 
  TENVAITRO VARCHAR2(100) NOT NULL,

  CONSTRAINT PK_VT PRIMARY KEY (MAVAITRO)
)

CREATE TABLE BENHNHAN (
  MABN NUMBER NOT NULL, 
  MATK NUMBER, 
  CCCD VARCHAR2(12) NOT NULL, 
  HOTEN VARCHAR2(255) NOT NULL, 
  NGAYSINH DATE,
  GIOITINH VARCHAR2(5), 
  SDT VARCHAR2(30), 
  DIACHI VARCHAR2(255),
  TIENSUBENH VARCHAR2(255),
  DIUNG VARCHAR(255),

  CONSTRAINT PK_BN PRIMARY KEY (MABN)
)

CREATE TABLE BACSI (
  MABS NUMBER NOT NULL,
  MATK NUMBER NOT NULL,
  CCCD VARCHAR2(12) NOT NULL, 
  HOTEN VARCHAR2(255) NOT NULL, 
  TRINHDO VARCHAR2(100),
  GIOITINH VARCHAR2(5),
  SDT VARCHAR2(30), 
  NGAYSINH DATE,
  DIACHI VARCHAR2(255),
  CHUYENKHOA VARCHAR2(255),

  CONSTRAINT PK_BS PRIMARY KEY (MABS)
)

CREATE TABLE LETAN (
  MALT NUMBER NOT NULL,
  MATK NUMBER NOT NULL,
  CCCD VARCHAR2(12) NOT NULL,
  HOTEN VARCHAR2(255) NOT NULL, 
  SDT VARCHAR2(30), 
  NGAYSINH DATE,
  DIACHI VARCHAR2(255),
  GIOITINH VARCHAR2(5),

  CONSTRAINT PK_LT PRIMARY KEY (MALT)
)

CREATE TABLE PHONGKHAM (
  MAPHONG NUMBER NOT NULL,
  TENPHONG VARCHAR2(100),
  SOPHONG NUMBER,
  TANG NUMBER,

  CONSTRAINT PK_PHONG PRIMARY KEY (MAPHONG)
)

CREATE TABLE BENH (
  MAICD NUMBER NOT NULL , 
  TENBENH VARCHAR2(100),

  CONSTRAINT PK_BENH PRIMARY KEY (MAICD)
)

CREATE TABLE LOAIHD (
  MALOAIHD NUMBER NOT NULL,
  TENLOAIHD VARCHAR2(100),

  CONSTRAINT PK_LOAIHD PRIMARY KEY (MALOAIHD)
)

CREATE TABLE LOAIDV (
  MALOAIDV NUMBER NOT NULL,
  TENLOAIDV VARCHAR2(100),

  CONSTRAINT PK_LOAIDV PRIMARY KEY (MALOAIDV)
)

CREATE TABLE DICHVU (
  MADV NUMBER NOT NULL,
  MALOAIDV NUMBER NOT NULL,
  TENDV VARCHAR2(100),
  GIADV NUMBER,

  CONSTRAINT PK_DV PRIMARY KEY (MADV)
  
)

CREATE TABLE PHIEUKHAM (
  MAPK NUMBER NOT NULL,
  MABN NUMBER NOT NULL,
  MABSC NUMBER NOT NULL,
  MADVK NUMBER NOT NULL,
  MAHD NUMBER NOT NULL,
  MAPHONG NUMBER NOT NULL,
  NGAYKHAM DATE,
  NGAYDATLICH DATE, 
  TRANGTHAITH VARCHAR2(100),
  STT NUMBER, 
  HUYETAP NUMBER,
  LYDOKHAM VARCHAR2(255), 
  CHIEUCAO NUMBER, 
  CANNANG NUMBER,
  TINHTRANGCOTHE VARCHAR2(255), 
  KETLUAN VARCHAR2(255),
  
  CONSTRAINT PK_PK PRIMARY KEY (MAPK)  
)

CREATE TABLE KETQUADICHVUCLS (
  MAKQ NUMBER NOT NULL,
  MAPK NUMBER NOT NULL,
  MABSTH NUMBER NOT NULL, 
  MADVCLS NUMBER NOT NULL,
  MAPHONG NUMBER NOT NULL,
  MAHD NUMBER NOT NULL,
  TRANGTHAITH VARCHAR2(100),
  STT NUMBER,
  KETLUANCLS VARCHAR2(255),
  
  CONSTRAINT PK_KQDV PRIMARY KEY (MAKQ)  
)

CREATE TABLE CHITIETBENH (
  MAPK NUMBER NOT NULL,
  MAICD NUMBER NOT NULL,

  CONSTRAINT PK_CTB PRIMARY KEY (MAPK, MAICD)
)

CREATE TABLE HOADON (
  MAHD NUMBER NOT NULL,
  MALT NUMBER NOT NULL,
  MALOAIHD NUMBER NOT NULL,
  TDTT DATE,
  TTTT VARCHAR2(100),
  THANHTIEN NUMBER,
  PTTT VARCHAR2(100),

  CONSTRAINT PK_HD PRIMARY KEY (MAHD)  
)

CREATE TABLE THUOC (
  MATHUOC NUMBER NOT NULL,
  MADVT NUMBER NOT NULL,
  TENTHUOC VARCHAR2(100),
  THANHPHAN VARCHAR2(100),
  
  CONSTRAINT PK_MATHUOC PRIMARY KEY (MATHUOC)  
)

CREATE TABLE DONVITHUOC (
  MADVT NUMBER NOT NULL,
  TENDONVI VARCHAR2(10),
  
  CONSTRAINT PK_DVT PRIMARY KEY (MADVT)
)

CREATE TABLE LOTHUOC (
  MALOTHUOC NUMBER NOT NULL,
  MATHUOC NUMBER NOT NULL,
  NHACC VARCHAR2(100),
  SOLUONGTON NUMBER,
  HANSD DATE,
  GIANHAP NUMBER,
  NGAYNHAP DATE,
  GIABAN NUMBER,
  
  CONSTRAINT PK_LOTHUOC PRIMARY KEY (MALOTHUOC)  
)

CREATE TABLE DONTHUOC (
  MADT NUMBER NOT NULL,
  MAHD NUMBER NOT NULL, 
  MAPK NUMBER NOT NULL,
  GIADT NUMBER,
  NGAYLAP DATE,
  
  CONSTRAINT PK_DT PRIMARY KEY (MADT)  
)

CREATE TABLE CTDT (
  MACTDT NUMBER NOT NULL,
  MADT NUMBER NOT NULL,
  MATHUOC NUMBER NOT NULL,
  SOLANUONG NUMBER,
  SOLUONGUONG NUMBER,
  TRANGTHAIDATLICH VARCHAR2(100),
  SOLUONGTHUOC NUMBER,
  GHICHU VARCHAR2(255),
  
  CONSTRAINT PK_CTDT PRIMARY KEY (MACTDT)
)

CREATE TABLE GIODATLICH (
  MAGIO NUMBER NOT NULL,
  MACTDT NUMBER NOT NULL,
  THOIGIAN DATE,
  
  CONSTRAINT PK_GIO PRIMARY KEY (MAGIO)
)

-- ADD KHOA NGOAI

ALTER TABLE BENHNHAN ADD CONSTRAINT FK_BENHNHAN_TAIKHOAN_01 FOREIGN KEY(MATK) REFERENCES TAIKHOAN(MATK);
ALTER TABLE BACSI ADD CONSTRAINT FK_BACSI_TAIKHOAN_02 FOREIGN KEY(MATK) REFERENCES TAIKHOAN(MATK);
ALTER TABLE LETAN ADD CONSTRAINT FK_LETAN_TAIKHOAN_03 FOREIGN KEY(MATK) REFERENCES TAIKHOAN(MATK);
ALTER TABLE DICHVU ADD CONSTRAINT FK_DICHVU_LOAIDV_04 FOREIGN KEY(MALOAIDV) REFERENCES LOAIDV(MALOAIDV);
ALTER TABLE PHIEUKHAM ADD CONSTRAINT FK_PHIEUKHAM_BENHNHAN_05 FOREIGN KEY(MABN) REFERENCES BENHNHAN(MABN);
ALTER TABLE PHIEUKHAM ADD CONSTRAINT FK_PHIEUKHAM_BACSI_06 FOREIGN KEY(MABSC) REFERENCES BACSI(MABS);
ALTER TABLE PHIEUKHAM ADD CONSTRAINT FK_PHIEUKHAM_DICHVU_07 FOREIGN KEY(MADVK) REFERENCES DICHVU(MADV);
ALTER TABLE PHIEUKHAM ADD CONSTRAINT FK_PHIEUKHAM_HOADON_08 FOREIGN KEY(MAHD) REFERENCES HOADON(MAHD);
ALTER TABLE PHIEUKHAM ADD CONSTRAINT FK_PHIEUKHAM_PHONG_09 FOREIGN KEY(MAPHONG) REFERENCES PHONGKHAM(MAPHONG);
ALTER TABLE KETQUADICHVUCLS ADD CONSTRAINT FK_DVCLS_PHIEUKHAM_10 FOREIGN KEY(MAPK) REFERENCES PHIEUKHAM(MAPK);
ALTER TABLE KETQUADICHVUCLS ADD CONSTRAINT FK_DVCLS_BACSI_11 FOREIGN KEY(MABSTH) REFERENCES BACSI(MABS);
ALTER TABLE KETQUADICHVUCLS ADD CONSTRAINT FK_DVCLS_DICHVU_12 FOREIGN KEY(MADVCLS) REFERENCES DICHVU(MADV);
ALTER TABLE KETQUADICHVUCLS ADD CONSTRAINT FK_DVCLS_PHONG_13 FOREIGN KEY(MAPHONG) REFERENCES PHONGKHAM(MAPHONG);
ALTER TABLE KETQUADICHVUCLS ADD CONSTRAINT FK_DVCLS_HOADON_14 FOREIGN KEY(MAHD) REFERENCES HOADON(MAHD);
ALTER TABLE CHITIETBENH ADD CONSTRAINT FK_CTBENH_PHIEUKHAM_15 FOREIGN KEY(MAPK) REFERENCES PHIEUKHAM(MAPK);
ALTER TABLE CHITIETBENH ADD CONSTRAINT FK_CTBENH_BENH_16 FOREIGN KEY(MAICD) REFERENCES BENH(MAICD);
ALTER TABLE DONTHUOC ADD CONSTRAINT FK_DONTHUOC_HOADON_17 FOREIGN KEY(MAHD) REFERENCES HOADON(MAHD);
ALTER TABLE DONTHUOC ADD CONSTRAINT FK_DONTHUOC_PHIEUKHAM_18 FOREIGN KEY(MAPK) REFERENCES PHIEUKHAM(MAPK);
ALTER TABLE CTDT ADD CONSTRAINT FK_CTDT_DONTHUOC_19 FOREIGN KEY(MADT) REFERENCES DONTHUOC(MADT);
ALTER TABLE CTDT ADD CONSTRAINT FK_CTDT_THUOC_20 FOREIGN KEY(MATHUOC) REFERENCES THUOC(MATHUOC);
ALTER TABLE THUOC ADD CONSTRAINT FK_THUOC_DONVITHUOC_21 FOREIGN KEY(MADVT) REFERENCES DONVITHUOC(MADVT);
ALTER TABLE LOTHUOC ADD CONSTRAINT FK_LOTHUOC_THUOC_22 FOREIGN KEY(MATHUOC) REFERENCES THUOC(MATHUOC);
ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_LETAN_23 FOREIGN KEY(MALT) REFERENCES LETAN(MALT);
ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_LOAIHOADON_24 FOREIGN KEY(MALOAIHD) REFERENCES LOAIHD(MALOAIHD);
ALTER TABLE TAIKHOAN ADD CONSTRAINT FK_TAIKHOAN_VAITRO_25 FOREIGN KEY(MAVAITRO) REFERENCES VAITRO(MAVAITRO);

-- DROP KHOA NGOAI
ALTER TABLE BENHNHAN DROP CONSTRAINT FK_BENHNHAN_TAIKHOAN_01;
ALTER TABLE BACSI DROP CONSTRAINT FK_BACSI_TAIKHOAN_02;
ALTER TABLE LETAN DROP CONSTRAINT FK_LETAN_TAIKHOAN_03;
ALTER TABLE DICHVU DROP CONSTRAINT FK_DICHVU_LOAIDV_04;
ALTER TABLE PHIEUKHAM DROP CONSTRAINT FK_PHIEUKHAM_BENHNHAN_05;
ALTER TABLE PHIEUKHAM DROP CONSTRAINT FK_PHIEUKHAM_BACSI_06;
ALTER TABLE PHIEUKHAM DROP CONSTRAINT FK_PHIEUKHAM_DICHVU_07;
ALTER TABLE PHIEUKHAM DROP CONSTRAINT FK_PHIEUKHAM_HOADON_08;
ALTER TABLE PHIEUKHAM DROP CONSTRAINT FK_PHIEUKHAM_PHONG_09;
ALTER TABLE KETQUADICHVUCLS DROP CONSTRAINT FK_DVCLS_PHIEUKHAM_10;
ALTER TABLE KETQUADICHVUCLS DROP CONSTRAINT FK_DVCLS_BACSI_11;
ALTER TABLE KETQUADICHVUCLS DROP CONSTRAINT FK_DVCLS_DICHVU_12;
ALTER TABLE KETQUADICHVUCLS DROP CONSTRAINT FK_DVCLS_PHONG_13;
ALTER TABLE KETQUADICHVUCLS DROP CONSTRAINT FK_DVCLS_HOADON_14;
ALTER TABLE CHITIETBENH DROP CONSTRAINT FK_CTBENH_PHIEUKHAM_15;
ALTER TABLE CHITIETBENH DROP CONSTRAINT FK_CTBENH_BENH_16;
ALTER TABLE DONTHUOC DROP CONSTRAINT FK_DONTHUOC_HOADON_17;
ALTER TABLE DONTHUOC DROP CONSTRAINT FK_DONTHUOC_PHIEUKHAM_18;
ALTER TABLE CTDT DROP CONSTRAINT FK_CTDT_DONTHUOC_19;
ALTER TABLE CTDT DROP CONSTRAINT FK_CTDT_THUOC_20;
ALTER TABLE THUOC DROP CONSTRAINT FK_THUOC_DONVITHUOC_21;
ALTER TABLE LOTHUOC DROP CONSTRAINT FK_LOTHUOC_THUOC_22;
ALTER TABLE HOADON DROP CONSTRAINT FK_HOADON_LETAN_23;
ALTER TABLE HOADON DROP CONSTRAINT FK_HOADON_LOAIHOADON_24;
ALTER TABLE TAIKHOAN DROP CONSTRAINT FK_TAIKHOAN_VAITRO_25;


-- INSERT INTO TAIKHOAN
INSERT INTO TAIKHOAN (MATK, MAVAITRO, USERNAME, PASSWORD) VALUES (1, 1, 'user1', 'pass1');
INSERT INTO TAIKHOAN (MATK, MAVAITRO, USERNAME, PASSWORD) VALUES (2, 2, 'user2', 'pass2');
INSERT INTO TAIKHOAN (MATK, MAVAITRO, USERNAME, PASSWORD) VALUES (3, 2, 'user3', 'pass3');

-- INSERT INTO VAITRO
INSERT INTO VAITRO (MAVAITRO, TENVAITRO) VALUES (1, 'Admin');
INSERT INTO VAITRO (MAVAITRO, TENVAITRO) VALUES (2, 'User');

-- INSERT INTO BENHNHAN
INSERT INTO BENHNHAN (MABN, MATK, CCCD, HOTEN, NGAYSINH, GIOITINH, SDT, DIACHI, TIENSUBENH, DIUNG) VALUES (1, 1, 'CCCD1', 'Nguyễn Văn A', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'Nam', '0123456789', '123 Đường ABC', 'Tiền sử bệnh 1', 'Dị ứng thuốc 1');
INSERT INTO BENHNHAN (MABN, MATK, CCCD, HOTEN, NGAYSINH, GIOITINH, SDT, DIACHI, TIENSUBENH, DIUNG) VALUES (2, 2, 'CCCD2', 'Trần Thị B', TO_DATE('1985-05-05', 'YYYY-MM-DD'), 'Nữ', '0987654321', '456 Đường XYZ', 'Tiền sử bệnh 2', 'Dị ứng thuốc 2');
INSERT INTO BENHNHAN (MABN, MATK, CCCD, HOTEN, NGAYSINH, GIOITINH, SDT, DIACHI, TIENSUBENH, DIUNG) VALUES (3, 3, 'CCCD3', 'Lê Văn C', TO_DATE('2000-10-10', 'YYYY-MM-DD'), 'Nam', '0369852147', '789 Đường LMN', 'Tiền sử bệnh 3', 'Dị ứng thuốc 3');
COMMIT;
-- INSERT INTO BACSI
INSERT INTO BACSI (MABS, MATK, CCCD, HOTEN, TRINHDO, GIOITINH, SDT, NGAYSINH, DIACHI, CHUYENKHOA) VALUES (1, 4, 'CCCD4', 'Phạm Thị D', 'Tiến sĩ', 'Nữ', '0369852147', TO_DATE('1980-02-15', 'YYYY-MM-DD'), '789 Đường KLM', 'Chuyên khoa 1');
INSERT INTO BACSI (MABS, MATK, CCCD, HOTEN, TRINHDO, GIOITINH, SDT, NGAYSINH, DIACHI, CHUYENKHOA) VALUES (2, 5, 'CCCD5', 'Hoàng Văn E', 'CK1', 'Nam', '0987654321', TO_DATE('1975-07-20', 'YYYY-MM-DD'), '456 Đường QRS', 'Chuyên khoa 2');
INSERT INTO BACSI (MABS, MATK, CCCD, HOTEN, TRINHDO, GIOITINH, SDT, NGAYSINH, DIACHI, CHUYENKHOA) VALUES (3, 6, 'CCCD6', 'Nguyễn Thị F', 'Thạc sĩ', 'Nữ', '0123456789', TO_DATE('1988-11-10', 'YYYY-MM-DD'), '123 Đường TUV', 'Chuyên khoa 3');
COMMIT;
SELECT * FROM BACSI
-- INSERT INTO LETAN
INSERT INTO LETAN (MALT, MATK, CCCD, HOTEN, SDT, NGAYSINH, DIACHI, GIOITINH) VALUES (1, 7, 'CCCD7', 'Lê Văn G', '0123456789', TO_DATE('1995-03-25', 'YYYY-MM-DD'), '123 Đường XYZ', 'Nam');
INSERT INTO LETAN (MALT, MATK, CCCD, HOTEN, SDT, NGAYSINH, DIACHI, GIOITINH) VALUES (2, 8, 'CCCD8', 'Phạm Thị H', '0987654321', TO_DATE('1998-08-12', 'YYYY-MM-DD'), '456 Đường LMN', 'Nữ');
INSERT INTO LETAN (MALT, MATK, CCCD, HOTEN, SDT, NGAYSINH, DIACHI, GIOITINH) VALUES (3, 9, 'CCCD9', 'Trần Văn I', '0369852147', TO_DATE('1993-12-30', 'YYYY-MM-DD'), '789 Đường ABC', 'Nam');

-- INSERT INTO PHONGKHAM
INSERT INTO PHONGKHAM (MAPHONG, TENPHONG, SOPHONG, TANG) VALUES (1, 'Phòng khám 1', 10, 1);
INSERT INTO PHONGKHAM (MAPHONG, TENPHONG, SOPHONG, TANG) VALUES (2, 'Phòng khám 2', 8, 2);
INSERT INTO PHONGKHAM (MAPHONG, TENPHONG, SOPHONG, TANG) VALUES (3, 'Phòng khám 3', 12, 3);

-- INSERT INTO BENH
INSERT INTO BENH (MAICD, TENBENH) VALUES (1, 'Bệnh 1');
INSERT INTO BENH (MAICD, TENBENH) VALUES (2, 'Bệnh 2');
INSERT INTO BENH (MAICD, TENBENH) VALUES (3, 'Bệnh 3');

-- INSERT INTO LOAIHD
INSERT INTO LOAIHD (MALOAIHD, TENLOAIHD) VALUES (1, 'Loại hóa đơn 1');
INSERT INTO LOAIHD (MALOAIHD, TENLOAIHD) VALUES (2, 'Loại hóa đơn 2');
INSERT INTO LOAIHD (MALOAIHD, TENLOAIHD) VALUES (3, 'Loại hóa đơn 3');

-- INSERT INTO LOAIDV
INSERT INTO LOAIDV (MALOAIDV, TENLOAIDV) VALUES (1, 'Loại dịch vụ 1');
INSERT INTO LOAIDV (MALOAIDV, TENLOAIDV) VALUES (2, 'Loại dịch vụ 2');
INSERT INTO LOAIDV (MALOAIDV, TENLOAIDV) VALUES (3, 'Loại dịch vụ 3');
COMMIT;
-- INSERT INTO DICHVU
INSERT INTO DICHVU (MADV, MALOAIDV, TENDV, GIADV) VALUES (1, 1, 'Dịch vụ 1', 100000);
INSERT INTO DICHVU (MADV, MALOAIDV, TENDV, GIADV) VALUES (2, 2, 'Dịch vụ 2', 200000);
INSERT INTO DICHVU (MADV, MALOAIDV, TENDV, GIADV) VALUES (3, 3, 'Dịch vụ 3', 300000);

-- INSERT INTO PHIEUKHAM
INSERT INTO PHIEUKHAM (MAPK, MABN, MABSC, MADVK, MAHD, MAPHONG, NGAYKHAM, NGAYDATLICH, TRANGTHAITH, STT, HUYETAP, LYDOKHAM, CHIEUCAO, CANNANG, TINHTRANGCOTHE, KETLUAN) VALUES (1, 1, 1, 1, 1, 1, TO_DATE('2024-04-19', 'YYYY-MM-DD'), TO_DATE('2024-04-18', 'YYYY-MM-DD'), 'Đã khám', 1, 120, 'Đau đầu', 170, 60, 'Bình thường', 'Không ghi chú');
INSERT INTO PHIEUKHAM (MAPK, MABN, MABSC, MADVK, MAHD, MAPHONG, NGAYKHAM, NGAYDATLICH, TRANGTHAITH, STT, HUYETAP, LYDOKHAM, CHIEUCAO, CANNANG, TINHTRANGCOTHE, KETLUAN) VALUES (2, 2, 2, 2, 2, 2, TO_DATE('2024-04-20', 'YYYY-MM-DD'), TO_DATE('2024-04-18', 'YYYY-MM-DD'), 'Đã khám', 2, 130, 'Đau bụng', 160, 50, 'Bình thường', 'Không ghi chú');
INSERT INTO PHIEUKHAM (MAPK, MABN, MABSC, MADVK, MAHD, MAPHONG, NGAYKHAM, NGAYDATLICH, TRANGTHAITH, STT, HUYETAP, LYDOKHAM, CHIEUCAO, CANNANG, TINHTRANGCOTHE, KETLUAN) VALUES (3, 3, 3, 3, 3, 3, TO_DATE('2024-04-21', 'YYYY-MM-DD'), TO_DATE('2024-04-18', 'YYYY-MM-DD'), 'Đã khám', 3, 140, 'Mệt mỏi', 180, 70, 'Bình thường', 'Không ghi chú');

-- INSERT INTO KETQUADICHVUCLS
INSERT INTO KETQUADICHVUCLS (MAKQ, MAPK, MABSTH, MADVCLS, MAPHONG, MAHD, TRANGTHAITH, STT, KETLUANCLS) VALUES (1, 1, 4, 1, 1, 1, 'Đã thực hiện', 1, 'Kết luận 1');
INSERT INTO KETQUADICHVUCLS (MAKQ, MAPK, MABSTH, MADVCLS, MAPHONG, MAHD, TRANGTHAITH, STT, KETLUANCLS) VALUES (2, 2, 5, 2, 2, 2, 'Đã thực hiện', 2, 'Kết luận 2');
INSERT INTO KETQUADICHVUCLS (MAKQ, MAPK, MABSTH, MADVCLS, MAPHONG, MAHD, TRANGTHAITH, STT, KETLUANCLS) VALUES (3, 3, 6, 3, 3, 3, 'Đã thực hiện', 3, 'Kết luận 3');

-- INSERT INTO CHITIETBENH
INSERT INTO CHITIETBENH (MAPK, MAICD) VALUES (1, 1);
INSERT INTO CHITIETBENH (MAPK, MAICD) VALUES (2, 2);
INSERT INTO CHITIETBENH (MAPK, MAICD) VALUES (3, 3);

-- INSERT INTO HOADON
INSERT INTO HOADON (MAHD, MALT, MALOAIHD, TDTT, TTTT, THANHTIEN, PTTT) VALUES (1, 1, 1, TO_DATE('2024-04-19', 'YYYY-MM-DD'), 'Đã thanh toán', 150000, 'Tiền mặt');
INSERT INTO HOADON (MAHD, MALT, MALOAIHD, TDTT, TTTT, THANHTIEN, PTTT) VALUES (2, 2, 2, TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'Đã thanh toán', 200000, 'Thẻ thanh toán');
INSERT INTO HOADON (MAHD, MALT, MALOAIHD, TDTT, TTTT, THANHTIEN, PTTT) VALUES (3, 3, 3, TO_DATE('2024-04-21', 'YYYY-MM-DD'), 'Chưa thanh toán', 300000, 'Chuyển khoản');

-- INSERT INTO THUOC
INSERT INTO THUOC (MATHUOC, MADVT, TENTHUOC, THANHPHAN) VALUES (1, 1, 'Thuốc 1', 'Thành phần 1');
INSERT INTO THUOC (MATHUOC, MADVT, TENTHUOC, THANHPHAN) VALUES (2, 2, 'Thuốc 2', 'Thành phần 2');
INSERT INTO THUOC (MATHUOC, MADVT, TENTHUOC, THANHPHAN) VALUES (3, 3, 'Thuốc 3', 'Thành phần 3');

-- INSERT INTO DONVITHUOC
INSERT INTO DONVITHUOC (MADVT, TENDONVI) VALUES (1, 'Viên');
INSERT INTO DONVITHUOC (MADVT, TENDONVI) VALUES (2, 'Ống');
INSERT INTO DONVITHUOC (MADVT, TENDONVI) VALUES (3, 'Chai');

-- INSERT INTO LOTHUOC
INSERT INTO LOTHUOC (MALOTHUOC, MATHUOC, NHACC, SOLUONGTON, HANSD, GIANHAP, NGAYNHAP, GIABAN) VALUES (1, 1, 'Nhà cung cấp 1', 100, TO_DATE('2025-04-19', 'YYYY-MM-DD'), 5000, TO_DATE('2024-04-19', 'YYYY-MM-DD'), 10000);
INSERT INTO LOTHUOC (MALOTHUOC, MATHUOC, NHACC, SOLUONGTON, HANSD, GIANHAP, NGAYNHAP, GIABAN) VALUES (2, 2, 'Nhà cung cấp 2', 150, TO_DATE('2025-04-20', 'YYYY-MM-DD'), 6000, TO_DATE('2024-04-20', 'YYYY-MM-DD'), 12000);
INSERT INTO LOTHUOC (MALOTHUOC, MATHUOC, NHACC, SOLUONGTON, HANSD, GIANHAP, NGAYNHAP, GIABAN) VALUES (3, 3, 'Nhà cung cấp 3', 200, TO_DATE('2025-04-21', 'YYYY-MM-DD'), 7000, TO_DATE('2024-04-21', 'YYYY-MM-DD'), 15000);

-- INSERT INTO DONTHUOC
INSERT INTO DONTHUOC (MADT, MAHD, MAPK, GIADT, NGAYLAP) VALUES (1, 1, 1, 25000, TO_DATE('2024-04-19', 'YYYY-MM-DD'));
INSERT INTO DONTHUOC (MADT, MAHD, MAPK, GIADT, NGAYLAP) VALUES (2, 2, 2, 30000, TO_DATE('2024-04-20', 'YYYY-MM-DD'));
INSERT INTO DONTHUOC (MADT, MAHD, MAPK, GIADT, NGAYLAP) VALUES (3, 3, 3, 35000, TO_DATE('2024-04-21', 'YYYY-MM-DD'));

-- INSERT INTO CTDT
INSERT INTO CTDT (MACTDT, MADT, MATHUOC, SOLANUONG, SOLUONGUONG, TRANGTHAIDATLICH, SOLUONGTHUOC, GHICHU) VALUES (1, 1, 1, 2, 1, 'Đã đặt lịch', 4, 'Ghi chú 1');
INSERT INTO CTDT (MACTDT, MADT, MATHUOC, SOLANUONG, SOLUONGUONG, TRANGTHAIDATLICH, SOLUONGTHUOC, GHICHU) VALUES (2, 2, 2, 3, 2, 'Đã đặt lịch', 6, 'Ghi chú 2');
INSERT INTO CTDT (MACTDT, MADT, MATHUOC, SOLANUONG, SOLUONGUONG, TRANGTHAIDATLICH, SOLUONGTHUOC, GHICHU) VALUES (3, 3, 3, 4, 3, 'Đã đặt lịch', 8, 'Ghi chú 3');

-- INSERT INTO GIODATLICH
INSERT INTO GIODATLICH (MAGIO, MACTDT, THOIGIAN) VALUES (1, 1, TO_DATE('2024-04-19 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO GIODATLICH (MAGIO, MACTDT, THOIGIAN) VALUES (2, 2, TO_DATE('2024-04-20 09:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO GIODATLICH (MAGIO, MACTDT, THOIGIAN) VALUES (3, 3, TO_DATE('2024-04-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));




/* ======================== CAC RANG BUOC TOAN VEN ======================== */

-- TRINHDO là 'Thạc sĩ', 'Tiến sĩ', 'CK1', 'CK2'
ALTER TABLE BACSI 
ADD CONSTRAINT CHECK_TRINHDO_BACSI CHECK (TRINHDO IN ('Thạc sĩ', 'Tiến sĩ', 'CK1', 'CK2'));

-- GIOITINH Là 'Nam', 'Nu', 'Khac'
ALTER TABLE LETAN 
ADD CONSTRAINT CHECK_GIOITINH_LETAN CHECK (GIOITINH IN ('Nam', 'Nữ', 'Khác'));
ALTER TABLE BACSI 
ADD CONSTRAINT CHECK_GIOITINH_BACSI CHECK (GIOITINH IN ('Nam', 'Nữ', 'Khác'));
ALTER TABLE BENHNHAN 
ADD CONSTRAINT CHECK_GIOITINH_BENHNHAN CHECK (GIOITINH IN ('Nam', 'Nữ', 'Khác'));

-- NGAYDATLICH <= NGAYKHAM
ALTER TABLE PHIEUKHAM 
ADD CONSTRAINT CHECK_PHIEUKHAM_NGAYKHAM_NGAYDATLICH CHECK (NGAYKHAM >= NGAYDATLICH);

-- DANH SACH TRIGGER
Mỗi ngày khám tối đa n bệnh nhân (PHIEUKHAM)
Ngày khám phải lớn hơn hoặc bằng ngày đặt lịch (PHIEUKHAM)
Một loại bệnh ko ghi 2 lần trong một kết quả khám (PHIEUKHAM, CHITIETBENH)
Ko chỉ định lại các dịch vụ đã chỉ định trước đó trong 1 lần chỉ định (KQCLS, PHIEUKHAM)
Một thuốc ko kê 2 lần trong 1 đơn (DONTHUOC, CTDT)
Giá bán thuốc phải cao hơn giá nhập (LOTHUOC)
Khi kê thuốc thì số lượng thuốc được kê phải lớn hơn số lượng thuốc tồn còn HSD trong kho (CTDT, LOTHUOC)
KHi kê thuốc xong thì cập nhập lại số lượng thuốc tồn trong kho (CTDT, LOTHUOC)


/*========================= HE THONG STORE PROCEDURE ========================*/

/*============================ HIEN THI THONG TIN ===========================*/
-- HIEN THI THONG TIN BAC SI
CREATE OR REPLACE PROCEDURE HIENTHITHONGTINBACSI (PAR_CCCD BACSI.CCCD%TYPE)
AS
  par_HoTen BACSI.HOTEN%TYPE;
  par_TrinhDo BACSI.TRINHDO%TYPE;
  par_NgaySinh BACSI.NGAYSINH%TYPE;
  par_GioiTinh BACSI.GIOITINH%TYPE;
  par_sdt BACSI.SDT%TYPE;
  par_DiaChi BACSI.DIACHI%TYPE;
  par_ChuyenKhoa BACSI.CHUYENKHOA%TYPE;

BEGIN
  SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
  SELECT HOTEN, TRINHDO, NGAYSINH, GIOITINH, SDT, DIACHI, CHUYENKHOA 
  INTO PAR_HOTEN, PAR_TRINHDO, PAR_NGAYSINH, PAR_GIOITINH, PAR_SDT, PAR_DIACHI, PAR_CHUYENKHOA
  FROM BACSI
  WHERE CCCD = PAR_CCCD;

  DBMS_OUTPUT.PUT_LINE(N'Thông tin bác sĩ có số căn cước'|| PAR_CCCD ||': ');
  DBMS_OUTPUT.PUT_LINE(N'Họ và tên: '|| PAR_HOTEN);
  DBMS_OUTPUT.PUT_LINE(N'Trình độ: '|| PAR_TRINHDO);
  DBMS_OUTPUT.PUT_LINE(N'Địa chỉ: '|| PAR_DIACHI);
  DBMS_OUTPUT.PUT_LINE(N'Ngày sinh: '|| PAR_NGAYSINH);
  DBMS_OUTPUT.PUT_LINE(N'Số điện thoại: '|| PAR_SDT);
  DBMS_OUTPUT.PUT_LINE(N'Giới tính: '|| PAR_GIOITINH);
  DBMS_OUTPUT.PUT_LINE(N'Chuyên khoa: '|| PAR_CHUYENKHOA);
  DBMS_OUTPUT.PUT_LINE(N'=============================================================');

END;


-- HIEN THI THONG TIN BENH NHAN
CREATE OR REPLACE PROCEDURE HIENTHITHONGTINBENHNHAN (PAR_CCCD BENHNHAN.CCCD%TYPE)
AS
  par_HoTen BACSI.HOTEN%TYPE;
  par_NgaySinh BENHNHAN.NGAYSINH%TYPE;
  par_GioiTinh BENHNHAN.GIOITINH%TYPE;
  par_sdt BENHNHAN.SDT%TYPE;
  par_DiaChi BENHNHAN.DIACHI%TYPE;
  par_TienSuBenh BENHNHAN.TIENSUBENH%TYPE;
  par_DiUng BENHNHAN.DIUNG%TYPE;

BEGIN
  SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
  SELECT HOTEN, NGAYSINH, GIOITINH, SDT, DIACHI, TIENSUBENH, DIUNG 
  INTO PAR_HOTEN, PAR_NGAYSINH, PAR_GIOITINH, PAR_SDT, PAR_DIACHI, PAR_TIENSUBENH, PAR_DIUNG
  FROM BENHNHAN
  WHERE CCCD = PAR_CCCD;

  DBMS_OUTPUT.PUT_LINE(N'Thông tin bệnh nhân có số căn cước'|| PAR_CCCD ||': ');
  DBMS_OUTPUT.PUT_LINE(N'Họ và tên: '|| PAR_HOTEN);
  DBMS_OUTPUT.PUT_LINE(N'Địa chỉ: '|| PAR_DIACHI);
  DBMS_OUTPUT.PUT_LINE(N'Ngày sinh: '|| PAR_NGAYSINH);
  DBMS_OUTPUT.PUT_LINE(N'Số điện thoại: '|| PAR_SDT);
  DBMS_OUTPUT.PUT_LINE(N'Giới tính: '|| PAR_GIOITINH);
  DBMS_OUTPUT.PUT_LINE(N'Tiền sử bệnh: '|| PAR_TIENSUBENH);
  DBMS_OUTPUT.PUT_LINE(N'Dị ứng: '|| PAR_DIUNG);
  DBMS_OUTPUT.PUT_LINE(N'=============================================================');
END;

-- HIEN THI DANH SACH BENH NHAN DANG KY KHAM
CREATE OR REPLACE PROCEDURE HIENTHIDANHSACHDANGKYKHAM ()
AS
  PAR_MAPK PHIEUKHAM.MAPK%TYPE;
  PAR_HOTEN BENHNHAN.HOTEN%TYPE;
  PAR_GIOITINH BENHNHAN.GIOITINH%TYPE;
  PAR_NGAYSINH BENHNHAN.NGAYSINH%TYPE;
  PAR_SDT BENHNHAN.DIACHI%TYPE;
  PAR_STT BENHNHAN.TIENSUBENH%TYPE;
  PAR_HOTENBACSI BENHNHAN.DIUNG%TYPE;
  PAR_TRANGTHAI BENHNHAN.DIUNG%TYPE;
BEGIN

  SELECT P.MAPK, B.HOTEN, B.GIOITINH, B.NGAYSINH, B.SDT, P.STT, B1.HOTEN, P.TRANGTHAITH
  INTO PAR_MAPK, PAR_HOTEN, PAR_GIOITINH, PAR_NGAYSINH, PAR_SDT, PAR_STT, PAR_HOTENBACSI, PAR_TRANGTHAI
  FROM PHIEUKHAM p
  JOIN BENHNHAN b ON P.MABN = B.MABN
  JOIN BACSI b1 ON B.MATK = B1.MATK
  JOIN DICHVU d ON D.MADV = P.MADVK
  WHERE P.TRANGTHAITH = 'Hoàn thành' OR P.TRANGTHAITH = 'Chờ khám' OR P.TRANGTHAITH = 'Đang khám';

  DBMS_OUTPUT.PUT_LINE(N'Thông tin bệnh nhân có số căn cước'|| PAR_CCCD ||': ');
  DBMS_OUTPUT.PUT_LINE(N'Họ và tên: '|| PAR_HOTEN);
  DBMS_OUTPUT.PUT_LINE(N'Địa chỉ: '|| PAR_DIACHI);
  DBMS_OUTPUT.PUT_LINE(N'Ngày sinh: '|| PAR_NGAYSINH);
  DBMS_OUTPUT.PUT_LINE(N'Số điện thoại: '|| PAR_SDT);
  DBMS_OUTPUT.PUT_LINE(N'Giới tính: '|| PAR_GIOITINH);
  DBMS_OUTPUT.PUT_LINE(N'Tiền sử bệnh: '|| PAR_TIENSUBENH);
  DBMS_OUTPUT.PUT_LINE(N'Dị ứng: '|| PAR_DIUNG);
  DBMS_OUTPUT.PUT_LINE(N'=============================================================');

END;


/*====================== GET DU LIEU VA XU LY DONG THOI ==================*/
-- XEM DANH SACH TAT CA BACSI
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE GET_BACSI_ALL(cursor OUT SYS_REFCURSOR)
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    OPEN cursor FOR
    SELECT * FROM BACSI ORDER BY MABS;
    LOCK TABLE BACSI IN EXCLUSIVE MODE;
    DBMS_LOCK.SLEEP(2);
    OPEN cursor FOR
    SELECT * FROM BACSI ORDER BY MABS;
    COMMIT;
END;

-- XEM DANH SACH TAT CA BENH NHAN
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE GET_BENHNHAN_ALL(cursor OUT SYS_REFCURSOR)
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    OPEN cursor FOR
    SELECT * FROM BENHNHAN ORDER BY MABN;
    LOCK TABLE BACSI IN EXCLUSIVE MODE;
    DBMS_LOCK.SLEEP(2);
    OPEN cursor FOR
    SELECT * FROM BENHNHAN ORDER BY MABN;
    COMMIT;
END;

DECLARE
    my_cursor SYS_REFCURSOR;
BEGIN
    GET_BACSI_ALL(my_cursor);
END;
/


/*========================= INSERT, UPDATE, DELETE ========================*/

-- BANG BAC SI
-- THEM BAC SI
CREATE OR REPLACE PROCEDURE INSERT_BACSI (
  par_Matk BACSI.MATK%TYPE, par_HoTen BACSI.HOTEN%TYPE, par_cccd BACSI.CCCD%TYPE, par_TrinhDo BACSI.TRINHDO%TYPE, 
  par_NgaySinh BACSI.NGAYSINH%TYPE, par_GioiTinh BACSI.GIOITINH%TYPE, par_sdt BACSI.SDT%TYPE, 
  par_DiaChi BACSI.DIACHI%TYPE, par_ChuyenKhoa BACSI.CHUYENKHOA%TYPE)

AS
BEGIN
    INSERT INTO BACSI (MABS, MATK, CCCD, HOTEN, TRINHDO, GIOITINH, SDT, NGAYSINH, DIACHI, CHUYENKHOA) 
    VALUES (SEQ1_MABS.NEXTVAL,par_Matk,par_cccd,par_HoTen,par_TrinhDo,par_GioiTinh,par_sdt,par_NgaySinh,par_DiaChi,par_ChuyenKhoa);
    COMMIT;
END;


-- CAP NHAT THONG TIN BAC SI
CREATE OR REPLACE PROCEDURE UPDATE_BACSI (
  par_Mabs BACSI.MABS%TYPE, par_Matk BACSI.MATK%TYPE, par_HoTen BACSI.HOTEN%TYPE, par_cccd BACSI.CCCD%TYPE, par_TrinhDo BACSI.TRINHDO%TYPE, 
  par_NgaySinh BACSI.NGAYSINH%TYPE, par_GioiTinh BACSI.GIOITINH%TYPE, par_sdt BACSI.SDT%TYPE, 
  par_DiaChi BACSI.DIACHI%TYPE, par_ChuyenKhoa BACSI.CHUYENKHOA%TYPE)
AS
BEGIN
  UPDATE BACSI
  SET HOTEN = PAR_HOTEN, CCCD = PAR_CCCD, TRINHDO = PAR_TRINHDO, NGAYSINH = PAR_NGAYSINH, GIOITINH = PAR_NGAYSINH, DIACHI = PAR_NGAYSINH, CHUYENKHOA = PAR_CHUYENKHOA
  WHERE MABS = PAR_MABS;
  COMMIT;
END;

SELECT * FROM BENHNHAN b

-- BANG BENH NHAN
-- THEM BENH NHAN MOI
CREATE OR REPLACE PROCEDURE INSERT_BENHNHAN (
  par_cccd BENHNHAN.CCCD%TYPE, par_HoTen BENHNHAN.HOTEN%TYPE, par_NgaySinh BENHNHAN.NGAYSINH%TYPE, par_GioiTinh BENHNHAN.GIOITINH%TYPE,
  par_sdt BENHNHAN.SDT%TYPE, par_DiaChi BENHNHAN.DIACHI%TYPE, par_TienSuBenh BENHNHAN.TIENSUBENH%TYPE, par_DiUng BENHNHAN.DIUNG%TYPE)
AS
BEGIN
  INSERT INTO BENHNHAN (MABN, MATK, CCCD, HOTEN, NGAYSINH, GIOITINH, SDT, DIACHI, TIENSUBENH, DIUNG)
  VALUES (SEQ2_MABN.NEXTVAL, NULL, PAR_CCCD, PAR_HOTEN, PAR_NGAYSINH, PAR_GIOITINH, PAR_SDT, PAR_DIACHI, PAR_TIENSUBENH, PAR_DIUNG);
  COMMIT;

END;

-- CAP NHAT THONG TIN BENH NHAN
CREATE OR REPLACE PROCEDURE UPDATE_BENHNHAN (
  par_Mabn BENHNHAN.MABN%TYPE, PAR_MATK BENHNHAN.MATK%TYPE, par_cccd BENHNHAN.CCCD%TYPE, par_HoTen BENHNHAN.HOTEN%TYPE, par_NgaySinh BENHNHAN.NGAYSINH%TYPE, 
  par_GioiTinh BENHNHAN.GIOITINH%TYPE, par_sdt BENHNHAN.SDT%TYPE, par_DiaChi BENHNHAN.DIACHI%TYPE, par_TienSuBenh BENHNHAN.TIENSUBENH%TYPE,
  par_DiUng BENHNHAN.DIUNG%TYPE)
AS
BEGIN
  SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  UPDATE BENHNHAN
  SET HOTEN = PAR_HOTEN, CCCD = PAR_CCCD, NGAYSINH = PAR_NGAYSINH, GIOITINH = PAR_GIOITINH, SDT = PAR_SDT, DIACHI = PAR_DIACHI, TIENSUBENH = PAR_TIENSUBENH, DIUNG = PAR_DIUNG
  WHERE MABN = PAR_MABN;
  LOCK TABLE BENHNHAN IN EXCLUSIVE MODE;
  DBMS_LOCK.SLEEP(2);
  COMMIT;
END;

/* NOT RUN */
-- BANG PHIEUKHAM
-- THEM PHIEU DANG KY KHAM
CREATE OR REPLACE PROCEDURE INSERT_PHIEUKHAM (
  par_Mabn PHIEUKHAM.MABN%TYPE, par_Madv PHIEUKHAM.MADVK%TYPE, par_Mabs PHIEUKHAM.MABSC%TYPE, par_MaPhong PHIEUKHAM.MAPHONG%TYPE,
  par_ngay_kham PHIEUKHAM.NGAYKHAM%TYPE, par_ngay_dat_lich PHIEUKHAM.NGAYDATLICH%TYPE, PAR_TRANGTHAI PHIEUKHAM.TRANGTHAITH%TYPE,
  par_stt PHIEUKHAM.STT%TYPE, par_HuyetAp PHIEUKHAM.HUYETAP%TYPE, par_ChieuCao PHIEUKHAM.CHIEUCAO%TYPE, par_CanNang PHIEUKHAM.CANNANG%TYPE, 
  par_LyDo PHIEUKHAM.LYDOKHAM%TYPE, par_TinhTrang PHIEUKHAM.TINHTRANGCOTHE%TYPE, PAR_KETLUAN PHIEUKHAM.KETLUAN%TYPE)
AS
BEGIN
  INSERT INTO PHIEUKHAM (MAPK, MABN, MADVK, MABSC, MAPHONG, NGAYKHAM, NGAYDATLICH, TRANGTHAITH, STT, HUYETAP, LYDOKHAM, CHIEUCAO, CANNANG, TINHTRANGCOTHE, KETLUAN)
  VALUES (SEQ11_MAPK.NEXTVAL, PAR_MABN, PAR_MADV, PAR_MABS, PAR_MAPHONG, PAR_NGAY_KHAM, PAR_NGAY_DAT_LICH, PAR_TRANGTHAI, PAR_STT, PAR_HUYETAP, PAR_LYDO, PAR_CHIEUCAO, PAR_CANNANG, PAR_TINHTRANG, PAR_KETLUAN);
  COMMIT;
END;

-- CAP NHAT PHIEU KHAM
CREATE OR REPLACE PROCEDURE UPDATE_PHIEUKHAM (
  PAR_MAPK PHIEUKHAM.MAPK%TYPE, par_Mabn PHIEUKHAM.MABN%TYPE, par_Madv PHIEUKHAM.MADVK%TYPE, par_Mabs PHIEUKHAM.MABSC%TYPE, par_MaPhong PHIEUKHAM.MAPHONG%TYPE,
  par_ngay_kham PHIEUKHAM.NGAYKHAM%TYPE, par_ngay_dat_lich PHIEUKHAM.NGAYDATLICH%TYPE, PAR_TRANGTHAI PHIEUKHAM.TRANGTHAITH%TYPE,
  par_stt PHIEUKHAM.STT%TYPE, par_HuyetAp PHIEUKHAM.HUYETAP%TYPE, par_ChieuCao PHIEUKHAM.CHIEUCAO%TYPE, par_CanNang PHIEUKHAM.CANNANG%TYPE, 
  par_LyDo PHIEUKHAM.LYDOKHAM%TYPE, par_TinhTrang PHIEUKHAM.TINHTRANGCOTHE%TYPE, PAR_KETLUAN PHIEUKHAM.KETLUAN%TYPE)
AS
BEGIN
  SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  UPDATE PHIEUKHAM
  SET MABN = PAR_MABN, MADVK = PAR_MADV, MABSC = PAR_MABS, MAPHONG = PAR_MAPHONG, NGAYKHAM = PAR_NGAY_KHAM, NGAYDATLICH = PAR_NGAY_DAT_LICH, 
      TRANGTHAITH = PAR_TRANGTHAI, STT = PAR_STT, HUYETAP = PAR_HUYETAP, LYDOKHAM = PAR_LYDO, CHIEUCAO = PAR_CHIEUCAO, 
      CANNANG = PAR_CANNANG, TINHTRANGCOTHE = PAR_TINHTRANG, KETLUAN = PAR_KETLUAN
  WHERE MAPK = PAR_MAPK;
  LOCK TABLE PHIEUKHAM IN EXCLUSIVE MODE;
  DBMS_LOCK.SLEEP(2);
  COMMIT;
END;


-- BANG THUOC
-- THEM THUOC MOI
CREATE OR REPLACE PROCEDURE INSERT_THUOC (
  PAR_TENTHUOC THUOC.TENTHUOC%TYPE, PAR_DVT THUOC.MADVT%TYPE, PAR_THANHPHAN THUOC.THANHPHAN%TYPE)

AS
  VAR_TENTHUOC THUOC.TENTHUOC%TYPE;
  VAR_DVT THUOC.MADVT%TYPE;
  VAR_THANHPHAN THUOC.THANHPHAN%TYPE;
BEGIN
  SELECT TENTHUOC, MADVT, THANHPHAN INTO VAR_TENTHUOC, VAR_DVT, VAR_THANHPHAN
  FROM THUOC
  WHERE TENTHUOC = PAR_TENTHUOC;

  IF VAR_TENTHUOC IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'Loại thuốc đã tồn tại trong hệ thống.');
  END IF;
  INSERT INTO THUOC (MATHUOC, MADVT, TENTHUOC, THANHPHAN) 
  VALUES (SEQ14_MATHUOC.NEXTVAL, PAR_DVT, PAR_TENTHUOC, PAR_THANHPHAN);
  COMMIT;

END;


-- CAP NHAT THONG TIN THUOC
CREATE OR REPLACE PROCEDURE UPDATE_THUOC (
  PAR_MATHUOC THUOC.MATHUOC%TYPE, PAR_TENTHUOC THUOC.TENTHUOC%TYPE, PAR_DVT THUOC.MADVT%TYPE, PAR_THANHPHAN THUOC.THANHPHAN%TYPE)
AS
BEGIN
  UPDATE THUOC
  SET MADVT = PAR_DVT, TENTHUOC = PAR_TENTHUOC, THANHPHAN = PAR_THANHPHAN
  WHERE MATHUOC = PAR_MATHUOC;
  
  COMMIT;
END;


-- BANG LO THUOC
-- THEM LO THUOC MOI
CREATE OR REPLACE PROCEDURE INSERT_LOTHUOC (
  PAR_MATHUOC LOTHUOC.MATHUOC%TYPE, PAR_NHACC LOTHUOC.NHACC%TYPE, PAR_SOLUONGTON LOTHUOC.SOLUONGTON%TYPE, PAR_HANSD LOTHUOC.HANSD%TYPE,
  PAR_GIANHAP LOTHUOC.GIANHAP%TYPE, PAR_GIABAN LOTHUOC.GIABAN%TYPE, PAR_NGAYNHAP LOTHUOC.NGAYNHAP%TYPE)

AS
BEGIN

  INSERT INTO LOTHUOC (MALOTHUOC, MATHUOC, NHACC, SOLUONGTON, HANSD, GIANHAP, NGAYNHAP, GIABAN)
  VALUES (SEQ14_MALT.NEXTVAL, PAR_MATHUOC, PAR_NHACC, PAR_SOLUONGTON, PAR_HANSD, PAR_GIANHAP, PAR_NGAYNHAP, PAR_GIABAN);

  COMMIT;

END;


--- CAP NHAT THONG TIN LO THUOC
CREATE OR REPLACE PROCEDURE UPDATE_LOTHUOC (
  PAR_MALOTHUOC LOTHUOC.MALOTHUOC%TYPE, PAR_MATHUOC LOTHUOC.MATHUOC%TYPE, PAR_NHACC LOTHUOC.NHACC%TYPE, 
  PAR_SOLUONGTON LOTHUOC.SOLUONGTON%TYPE, PAR_HANSD LOTHUOC.HANSD%TYPE, PAR_GIANHAP LOTHUOC.GIANHAP%TYPE,
  PAR_GIABAN LOTHUOC.GIABAN%TYPE, PAR_NGAYNHAP LOTHUOC.NGAYNHAP%TYPE)

AS
BEGIN

  SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  UPDATE LOTHUOC
  SET MATHUOC = PAR_MATHUOC, NHACC = PAR_NHACC, SOLUONGTON = PAR_SOLUONGTON, HANSD = PAR_HANSD, GIANHAP = PAR_GIANHAP, GIABAN = PAR_GIABAN, NGAYNHAP = PAR_NGAYNHAP
  WHERE MALOTHUOC = PAR_MALOTHUOC;
  LOCK TABLE LOTHUOC IN EXCLUSIVE MODE;
  DBMS_LOCK.SLEEP(2);
  COMMIT;

END;


-- BANG DON THUOC
-- THEM DON THUOC MOI
CREATE OR REPLACE PROCEDURE INSERT_DONTHUOC (
  PAR_MAHOADON DONTHUOC.MAHD%TYPE, PAR_MAPK DONTHUOC.MAPK%TYPE, PAR_GIADONTHUOC DONTHUOC.GIADT%TYPE, PAR_NGAYLAP DONTHUOC.NGAYLAP%TYPE)

AS
BEGIN

  INSERT INTO DONTHUOC (MADT, MAHD, MAPK, GIADT, NGAYLAP)
  VALUES (SEQ12_MADT.NEXTVAL, PAR_MAHOADON, PAR_MAPK, PAR_GIADONTHUOC, PAR_NGAYLAP);
  COMMIT;

END;

-- CAP NHAT DON THUOC
CREATE OR REPLACE PROCEDURE UPDATE_DONTHUOC (
  PAR_MADT DONTHUOC.MADT%TYPE, PAR_MAHOADON DONTHUOC.MAHD%TYPE, PAR_MAPK DONTHUOC.MAPK%TYPE,
  PAR_GIADONTHUOC DONTHUOC.GIADT%TYPE, PAR_NGAYLAP DONTHUOC.NGAYLAP%TYPE)

AS
BEGIN

  SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  UPDATE DONTHUOC
  SET MAHD = PAR_MAHOADON, MAPK = PAR_MAPK, GIADT = PAR_GIADONTHUOC, NGAYLAP = PAR_NGAYLAP
  WHERE MADT = PAR_MADT;
  LOCK TABLE DONTHUOC IN EXCLUSIVE MODE;
  DBMS_LOCK.SLEEP(2);
  COMMIT;

END;


-- BANG DICH VU
-- THEM DICH VU MOI
CREATE OR REPLACE PROCEDURE INSERT_DICHVU (
  PAR_MALOAIDV DICHVU.MALOAIDV%TYPE, PAR_TENDV DICHVU.TENDV%TYPE, PAR_GIADV DICHVU.GIADV%TYPE)

AS
BEGIN

  INSERT INTO DICHVU (MADV, MALOAIDV, TENDV, GIADV)
  VALUES (SEQ8_MADV.NEXTVAL, PAR_MALOAIDV, PAR_TENDV, PAR_GIADV);
  COMMIT;

END;

--- CAP NHAT THONG TIN DICH VU
CREATE OR REPLACE PROCEDURE UPDATE_DICHVU (
  PAR_MADV DICHVU.MADV%TYPE, PAR_MALOAIDV DICHVU.MALOAIDV%TYPE, PAR_TENDV DICHVU.TENDV%TYPE, PAR_GIADV DICHVU.GIADV%TYPE)

AS
BEGIN

  UPDATE DICHVU
  SET MALOAIDV = PAR_MALOAIDV, TENDV = PAR_TENDV, GIADV = PAR_GIADV
  WHERE MADV = PAR_MADV;
  COMMIT;

END;


-- BANG BENH
-- THEM BENH MOI
CREATE OR REPLACE PROCEDURE INSERT_BENH (PAR_TENBENH BENH.TENBENH%TYPE)
AS
BEGIN

  INSERT INTO BENH (MAICD, TENBENH)
  VALUES (SEQ6_MAICD.NEXTVAL, PAR_TENBENH);
  COMMIT;

END;


-- CAP NHAT THONG TIN BENH
CREATE OR REPLACE PROCEDURE UPDATE_BENH (par_Mabenh BENH.MAICD%TYPE, par_TenBenh BENH.TENBENH%TYPE)
AS
BEGIN
  
  UPDATE BENH
  SET TENBENH = PAR_TENBENH
  WHERE MAICD = PAR_MABENH;
  COMMIT;

END;