/*========================= PROCEDURE INSERT, UPDATE, DELETE ========================*/
/*========================= BANG THAM SO ========================*/

-- CAP NHAT THAM SO
CREATE OR REPLACE PROCEDURE UPDATE_THAMSO (
  PAR_TENTHAMSO THAMSO.TENTHAMSO%TYPE,
  PAR_GIATRI THAMSO.GIATRI%TYPE)
AS
BEGIN
  UPDATE THAMSO
  SET GIATRI = PAR_GIATRI
  WHERE TENTHAMSO = PAR_TENTHAMSO;
  COMMIT;
END;


/*========================= BANG VAI TRO ========================*/

-- THEM VAI TRO
CREATE OR REPLACE PROCEDURE INSERT_VAITRO (
  PAR_URL VAITRO.URL%TYPE, 
  PAR_MOTA VAITRO.MOTA%TYPE, MAVT_OUT OUT NUMBER)
AS
BEGIN
  INSERT INTO VAITRO (MAVAITRO, URL, MOTA)
  VALUES (SEQ10_MAVT.NEXTVAL, PAR_URL, PAR_MOTA)
  RETURNING MAVAITRO INTO MAVT_OUT;
  
  COMMIT;
END;

-- CAP NHAT VAI TRO
CREATE OR REPLACE PROCEDURE UPDATE_VAITRO (
  PAR_MAVAITRO VAITRO.MAVAITRO%TYPE,
  PAR_URL VAITRO.URL%TYPE, 
  PAR_MOTA VAITRO.MOTA%TYPE)
AS
BEGIN
  UPDATE VAITRO
  SET URL = PAR_URL, MOTA = PAR_MOTA
  WHERE MAVAITRO = PAR_MAVAITRO;
  COMMIT;
END;

-- XOA VAI TRO
CREATE OR REPLACE PROCEDURE DELETE_VAITRO (
    P_MAVAITRO VAITRO.MAVAITRO%TYPE) 
AS
BEGIN
    DELETE FROM NHOM_VAITRO
    WHERE MAVAITRO = P_MAVAITRO;

    DELETE FROM VAITRO
    WHERE MAVAITRO = P_MAVAITRO;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;


/*========================= BANG NHOM_VAITRO ========================*/

-- THEM VAITRO VA GAN TRUC TIEP CHO ADMIN
CREATE OR REPLACE PROCEDURE INSERT_VAITRO_NHOM_VAITRO (
  PAR_URL VAITRO.URL%TYPE,
  PAR_MOTA VAITRO.MOTA%TYPE)
AS
    VAR_MAVT VAITRO.MAVAITRO%TYPE;
BEGIN

    INSERT_VAITRO(PAR_URL, PAR_MOTA, MAVT_OUT => VAR_MAVT);

    INSERT INTO NHOM_VAITRO (MANHOM, MAVAITRO)
    VALUES (1, VAR_MAVT);
END;

-- THEM NHOM_VAITRO
CREATE OR REPLACE PROCEDURE INSERT_NHOM_VAITRO (
  PAR_MANHOM NHOM_VAITRO.MANHOM%TYPE,
  PAR_MAVAITRO NHOM_VAITRO.MAVAITRO%TYPE)
AS
BEGIN

    INSERT INTO NHOM_VAITRO (MANHOM, MAVAITRO)
    VALUES (PAR_MANHOM, PAR_MAVAITRO);
END;


/*========================= BANG TAI KHOAN ========================*/

-- THEM TAI KHOAN
CREATE OR REPLACE PROCEDURE INSERT_TAIKHOAN (
  PAR_MANHOM TAIKHOAN.MANHOM%TYPE, 
  PAR_USERNAME TAIKHOAN.USERNAME%TYPE, 
  PAR_PASSWORD TAIKHOAN.PASSWORD%TYPE,
  MATK_OUT OUT TAIKHOAN.MATK%TYPE)
AS
BEGIN
  INSERT INTO TAIKHOAN (MATK, MANHOM, USERNAME, PASSWORD, TRANGTHAI)
  VALUES (SEQ3_MATK.NEXTVAL, PAR_MANHOM, PAR_USERNAME, PAR_PASSWORD, 1)
  RETURNING MATK INTO MATK_OUT;
  COMMIT;
END;

-- CAP NHAT TAI KHOAN
CREATE OR REPLACE PROCEDURE UPDATE_TAIKHOAN (
  PAR_MATK TAIKHOAN.MATK%TYPE,
  PAR_USERNAME TAIKHOAN.USERNAME%TYPE, 
  PAR_PASSWORD TAIKHOAN.PASSWORD%TYPE)
AS
BEGIN
  UPDATE TAIKHOAN
  SET USERNAME = PAR_USERNAME, PASSWORD = PAR_PASSWORD
  WHERE MATK = PAR_MATK;
  COMMIT;
END;

-- XOA TAI KHOAN
CREATE OR REPLACE PROCEDURE DELETE_TAIKHOAN (PAR_MATK TAIKHOAN.MATK%TYPE)
AS
BEGIN
  UPDATE TAIKHOAN
  SET TRANGTHAI = 0
  WHERE MATK = PAR_MATK;
  COMMIT;
END;


/*========================= BANG BAC SI ========================*/

-- THEM BAC SI
CREATE OR REPLACE PROCEDURE INSERT_BACSI (
  PAR_USERNAME TAIKHOAN.USERNAME%TYPE, PAR_PASSWORD TAIKHOAN.PASSWORD%TYPE,
  par_HoTen BACSI.HOTEN%TYPE, par_cccd BACSI.CCCD%TYPE, par_TrinhDo BACSI.TRINHDO%TYPE, 
  par_NgaySinh BACSI.NGAYSINH%TYPE, par_GioiTinh BACSI.GIOITINH%TYPE, par_sdt BACSI.SDT%TYPE, 
  par_DiaChi BACSI.DIACHI%TYPE, par_ChuyenKhoa BACSI.CHUYENKHOA%TYPE)

AS
  V_MATKOld TAIKHOAN.MATK%TYPE;
BEGIN
    INSERT_TAIKHOAN (2, PAR_USERNAME, PAR_PASSWORD, MATK_OUT => V_MATKOld);

    INSERT INTO BACSI (MABS, MATK, CCCD, HOTEN, TRINHDO, GIOITINH, SDT, NGAYSINH, DIACHI, CHUYENKHOA) 
    VALUES (SEQ1_MABS.NEXTVAL,V_MATKOld,par_cccd,par_HoTen,par_TrinhDo,par_GioiTinh,par_sdt,par_NgaySinh,par_DiaChi,par_ChuyenKhoa);

    COMMIT;
END;

-- CAP NHAT BAC SI
CREATE OR REPLACE PROCEDURE UPDATE_BACSI (
  par_Mabs BACSI.MABS%TYPE, par_Matk BACSI.MATK%TYPE, par_HoTen BACSI.HOTEN%TYPE, par_cccd BACSI.CCCD%TYPE, par_TrinhDo BACSI.TRINHDO%TYPE, 
  par_NgaySinh BACSI.NGAYSINH%TYPE, par_GioiTinh BACSI.GIOITINH%TYPE, par_sdt BACSI.SDT%TYPE, 
  par_DiaChi BACSI.DIACHI%TYPE, par_ChuyenKhoa BACSI.CHUYENKHOA%TYPE)
AS
BEGIN
  UPDATE BACSI
  SET HOTEN = PAR_HOTEN, CCCD = PAR_CCCD, TRINHDO = PAR_TRINHDO, NGAYSINH = PAR_NGAYSINH, GIOITINH = PAR_GIOITINH, DIACHI = PAR_DIACHI, CHUYENKHOA = PAR_CHUYENKHOA, SDT = PAR_SDT
  WHERE MABS = PAR_MABS;
  COMMIT;
END;


/*========================= BANG LE TAN ========================*/

-- THEM LE TAN
CREATE OR REPLACE PROCEDURE INSERT_LETAN (
  PAR_USERNAME TAIKHOAN.USERNAME%TYPE, PAR_PASSWORD TAIKHOAN.PASSWORD%TYPE,
  par_HoTen LETAN.HOTEN%TYPE, par_cccd LETAN.CCCD%TYPE, par_DiaChi LETAN.DIACHI%TYPE,
  par_NgaySinh LETAN.NGAYSINH%TYPE, par_GioiTinh LETAN.GIOITINH%TYPE, par_sdt LETAN.SDT%TYPE)

AS
  V_MATKOld TAIKHOAN.MATK%TYPE;
BEGIN
    INSERT_TAIKHOAN (3, PAR_USERNAME, PAR_PASSWORD, MATK_OUT => V_MATKOld);

    INSERT INTO LETAN (MALT, MATK, CCCD, HOTEN, SDT, NGAYSINH, DIACHI, GIOITINH) 
    VALUES (SEQ4_MALT.NEXTVAL, V_MATKOld, par_cccd, par_HoTen, par_sdt, par_NgaySinh, par_DiaChi, par_GioiTinh);

    COMMIT;
END;

-- CAP NHAT LE TAN
CREATE OR REPLACE PROCEDURE UPDATE_LETAN (
  par_Malt LETAN.MALT%TYPE, par_Matk LETAN.MATK%TYPE, par_HoTen LETAN.HOTEN%TYPE, par_cccd LETAN.CCCD%TYPE,
  par_DiaChi LETAN.DIACHI%TYPE, par_NgaySinh LETAN.NGAYSINH%TYPE, par_GioiTinh LETAN.GIOITINH%TYPE, par_sdt LETAN.SDT%TYPE)
AS
BEGIN
  UPDATE LETAN
  SET HOTEN = PAR_HOTEN, CCCD = PAR_CCCD, NGAYSINH = PAR_NGAYSINH, GIOITINH = PAR_GIOITINH, DIACHI = PAR_DIACHI, SDT = PAR_SDT
  WHERE MALT = PAR_MALT;
  COMMIT;
END;


/*========================= BANG BENH NHAN ========================*/

-- THEM BENH NHAN
CREATE OR REPLACE PROCEDURE INSERT_BENHNHAN (
  par_cccd BENHNHAN.CCCD%TYPE, par_HoTen BENHNHAN.HOTEN%TYPE, par_NgaySinh BENHNHAN.NGAYSINH%TYPE, par_GioiTinh BENHNHAN.GIOITINH%TYPE,
  par_sdt BENHNHAN.SDT%TYPE, par_DiaChi BENHNHAN.DIACHI%TYPE, par_TienSuBenh BENHNHAN.TIENSUBENH%TYPE, par_DiUng BENHNHAN.DIUNG%TYPE, MABN_OUT OUT BENHNHAN.MABN%TYPE)
AS
BEGIN
  INSERT INTO BENHNHAN (MABN, MATK, CCCD, HOTEN, NGAYSINH, GIOITINH, SDT, DIACHI, TIENSUBENH, DIUNG)
  VALUES (SEQ2_MABN.NEXTVAL, NULL, PAR_CCCD, PAR_HOTEN, PAR_NGAYSINH, PAR_GIOITINH, PAR_SDT, PAR_DIACHI, PAR_TIENSUBENH, PAR_DIUNG)
  RETURNING MABN INTO MABN_OUT;
  COMMIT;

END;

-- CAP NHAT BENH NHAN
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
  DBMS_LOCK.SLEEP(2);
  COMMIT;
END;


/*========================= BANG PHIEUKHAM ========================*/

-- THEM PHIEU DANG KY KHAM
CREATE OR REPLACE PROCEDURE INSERT_PHIEUKHAM (
  PAR_MABN PHIEUKHAM.MABN%TYPE, PAR_MADV PHIEUKHAM.MADVK%TYPE, PAR_MABS PHIEUKHAM.MABSC%TYPE, PAR_MAPHONG PHIEUKHAM.MAPHONG%TYPE,
  PAR_MAHD PHIEUKHAM.MAHD%TYPE, PAR_NGAY_KHAM PHIEUKHAM.NGAYKHAM%TYPE, PAR_NGAY_DAT_LICH PHIEUKHAM.NGAYDATLICH%TYPE, PAR_TRANGTHAI PHIEUKHAM.TRANGTHAITH%TYPE,
  PAR_STT PHIEUKHAM.STT%TYPE, PAR_HUYETAP PHIEUKHAM.HUYETAP%TYPE, PAR_CHIEUCAO PHIEUKHAM.CHIEUCAO%TYPE, PAR_CANNANG PHIEUKHAM.CANNANG%TYPE, PAR_TRIEUCHUNG PHIEUKHAM.TRIEUCHUNGBENH%TYPE,
  PAR_LYDO PHIEUKHAM.LYDOKHAM%TYPE, PAR_TINHTRANG PHIEUKHAM.TINHTRANGCOTHE%TYPE, PAR_KETLUAN PHIEUKHAM.KETLUAN%TYPE,
  MAPK_OUT OUT PHIEUKHAM.MAPK%TYPE)
AS
  VAR_GIADV DICHVU.GIADV%TYPE;
BEGIN
  INSERT INTO PHIEUKHAM (MAPK, MABN, MADVK, MABSC, MAPHONG, MAHD, NGAYKHAM, NGAYDATLICH, TRANGTHAITH, STT, HUYETAP, LYDOKHAM, CHIEUCAO, CANNANG, TRIEUCHUNGBENH, TINHTRANGCOTHE, KETLUAN)
  VALUES (SEQ11_MAPK.NEXTVAL, PAR_MABN, PAR_MADV, PAR_MABS, PAR_MAPHONG, PAR_MAHD, PAR_NGAY_KHAM, PAR_NGAY_DAT_LICH, PAR_TRANGTHAI, PAR_STT, PAR_HUYETAP, PAR_LYDO, PAR_CHIEUCAO, PAR_CANNANG, PAR_TRIEUCHUNG, PAR_TINHTRANG, PAR_KETLUAN)
  RETURNING MAPK INTO MAPK_OUT;
  COMMIT;

  SELECT GIADV INTO VAR_GIADV
  FROM DICHVU d
  WHERE D.MADV = PAR_MADV;

  UPDATE HOADON
  SET THANHTIEN = THANHTIEN + VAR_GIADV
  WHERE MAHD = PAR_MAHD;
  COMMIT;
END;

-- THEM PHIEU DANG KY KHAM (THEM HOA DON TRUOC)
CREATE OR REPLACE PROCEDURE INSERT_PHIEUKHAM_HOADON (
  PAR_MABN PHIEUKHAM.MABN%TYPE, PAR_MADV PHIEUKHAM.MADVK%TYPE, PAR_MABS PHIEUKHAM.MABSC%TYPE, 
  PAR_MAPHONG PHIEUKHAM.MAPHONG%TYPE, PAR_NGAY_KHAM PHIEUKHAM.NGAYKHAM%TYPE, 
  PAR_NGAY_DAT_LICH PHIEUKHAM.NGAYDATLICH%TYPE, PAR_TRANGTHAI PHIEUKHAM.TRANGTHAITH%TYPE,
  PAR_STT PHIEUKHAM.STT%TYPE, PAR_HUYETAP PHIEUKHAM.HUYETAP%TYPE, PAR_CHIEUCAO PHIEUKHAM.CHIEUCAO%TYPE, 
  PAR_CANNANG PHIEUKHAM.CANNANG%TYPE, PAR_TRIEUCHUNG PHIEUKHAM.TRIEUCHUNGBENH%TYPE, PAR_LYDO PHIEUKHAM.LYDOKHAM%TYPE, 
  PAR_TINHTRANG PHIEUKHAM.TINHTRANGCOTHE%TYPE, PAR_KETLUAN PHIEUKHAM.KETLUAN%TYPE)
AS
  v_MAHDOld HOADON.MAHD%TYPE;
BEGIN

  INSERT_HOADON(1, 1, NULL, NULL, NULL,NULL, MAHD_OUT => v_MAHDOld);
  

  INSERT INTO PHIEUKHAM (MAPK, MABN, MADVK, MABSC, MAPHONG, MAHD, NGAYKHAM, NGAYDATLICH, 
                         TRANGTHAITH, STT, HUYETAP, LYDOKHAM, CHIEUCAO, CANNANG, TRIEUCHUNGBENH,
                         TINHTRANGCOTHE, KETLUAN)
  VALUES (SEQ11_MAPK.NEXTVAL, PAR_MABN, PAR_MADV, PAR_MABS, PAR_MAPHONG, v_MAHDOld, 
          PAR_NGAY_KHAM, PAR_NGAY_DAT_LICH, PAR_TRANGTHAI, PAR_STT, PAR_HUYETAP, 
          PAR_LYDO, PAR_CHIEUCAO, PAR_CANNANG, PAR_TRIEUCHUNG, PAR_TINHTRANG, PAR_KETLUAN);
  
  COMMIT;
END;

-- THEM PHIEU DANG KY KHAM VOI BENH NHAN MOI
CREATE OR REPLACE PROCEDURE INSERT_PHIEUKHAM_HOADON_BENHNHAN (
  par_cccd BENHNHAN.CCCD%TYPE, par_HoTen BENHNHAN.HOTEN%TYPE, par_NgaySinh BENHNHAN.NGAYSINH%TYPE, par_GioiTinh BENHNHAN.GIOITINH%TYPE,
  par_sdt BENHNHAN.SDT%TYPE, par_DiaChi BENHNHAN.DIACHI%TYPE, par_TienSuBenh BENHNHAN.TIENSUBENH%TYPE, par_DiUng BENHNHAN.DIUNG%TYPE,

  PAR_MADV PHIEUKHAM.MADVK%TYPE, PAR_MABS PHIEUKHAM.MABSC%TYPE, 
  PAR_MAPHONG PHIEUKHAM.MAPHONG%TYPE, PAR_NGAY_KHAM PHIEUKHAM.NGAYKHAM%TYPE, 
  PAR_NGAY_DAT_LICH PHIEUKHAM.NGAYDATLICH%TYPE, PAR_TRANGTHAI PHIEUKHAM.TRANGTHAITH%TYPE,
  PAR_STT PHIEUKHAM.STT%TYPE, PAR_HUYETAP PHIEUKHAM.HUYETAP%TYPE, PAR_CHIEUCAO PHIEUKHAM.CHIEUCAO%TYPE, 
  PAR_CANNANG PHIEUKHAM.CANNANG%TYPE, PAR_TRIEUCHUNG PHIEUKHAM.TRIEUCHUNGBENH%TYPE, PAR_LYDO PHIEUKHAM.LYDOKHAM%TYPE, 
  PAR_TINHTRANG PHIEUKHAM.TINHTRANGCOTHE%TYPE, PAR_KETLUAN PHIEUKHAM.KETLUAN%TYPE, MABN_OUT OUT BENHNHAN.MABN%TYPE)
AS
  V_MAHDOld HOADON.MAHD%TYPE;
  V_MABNOld BENHNHAN.MABN%TYPE;
BEGIN

  INSERT_BENHNHAN(PAR_CCCD, PAR_HOTEN, PAR_NGAYSINH, PAR_GIOITINH, PAR_SDT, PAR_DIACHI, PAR_TIENSUBENH, PAR_DIUNG, MABN_OUT => V_MABNOld);

  INSERT_HOADON(1, 1, NULL, NULL, NULL,NULL, MAHD_OUT => v_MAHDOld);
  

  INSERT INTO PHIEUKHAM (MAPK, MABN, MADVK, MABSC, MAPHONG, MAHD, NGAYKHAM, NGAYDATLICH, 
                         TRANGTHAITH, STT, HUYETAP, LYDOKHAM, CHIEUCAO, CANNANG, TRIEUCHUNGBENH,
                         TINHTRANGCOTHE, KETLUAN)
  VALUES (SEQ11_MAPK.NEXTVAL, V_MABNOld, PAR_MADV, PAR_MABS, PAR_MAPHONG, v_MAHDOld, 
          PAR_NGAY_KHAM, PAR_NGAY_DAT_LICH, PAR_TRANGTHAI, PAR_STT, PAR_HUYETAP, 
          PAR_LYDO, PAR_CHIEUCAO, PAR_CANNANG, PAR_TRIEUCHUNG, PAR_TINHTRANG, PAR_KETLUAN)
  RETURNING MABN INTO MABN_OUT;
  
  COMMIT;
END;

-- CAP NHAT PHIEU KHAM
CREATE OR REPLACE PROCEDURE UPDATE_PHIEUKHAM (
  PAR_MAPK PHIEUKHAM.MAPK%TYPE, PAR_MABN PHIEUKHAM.MABN%TYPE, PAR_MADV PHIEUKHAM.MADVK%TYPE, PAR_MABS PHIEUKHAM.MABSC%TYPE, PAR_MAPHONG PHIEUKHAM.MAPHONG%TYPE,
  PAR_NGAY_KHAM PHIEUKHAM.NGAYKHAM%TYPE, PAR_NGAY_DAT_LICH PHIEUKHAM.NGAYDATLICH%TYPE, PAR_TRANGTHAI PHIEUKHAM.TRANGTHAITH%TYPE,
  PAR_STT PHIEUKHAM.STT%TYPE, PAR_HUYETAP PHIEUKHAM.HUYETAP%TYPE, PAR_CHIEUCAO PHIEUKHAM.CHIEUCAO%TYPE, PAR_CANNANG PHIEUKHAM.CANNANG%TYPE, PAR_TRIEUCHUNG PHIEUKHAM.TRIEUCHUNGBENH%TYPE, 
  PAR_LYDO PHIEUKHAM.LYDOKHAM%TYPE, PAR_TINHTRANG PHIEUKHAM.TINHTRANGCOTHE%TYPE, PAR_KETLUAN PHIEUKHAM.KETLUAN%TYPE)
AS
BEGIN
  SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  UPDATE PHIEUKHAM
  SET MABN = PAR_MABN, MADVK = PAR_MADV, MABSC = PAR_MABS, MAPHONG = PAR_MAPHONG, NGAYKHAM = PAR_NGAY_KHAM, NGAYDATLICH = PAR_NGAY_DAT_LICH, 
      TRANGTHAITH = PAR_TRANGTHAI, STT = PAR_STT, HUYETAP = PAR_HUYETAP, LYDOKHAM = PAR_LYDO, CHIEUCAO = PAR_CHIEUCAO, 
      CANNANG = PAR_CANNANG, TRIEUCHUNGBENH = PAR_TRIEUCHUNG, TINHTRANGCOTHE = PAR_TINHTRANG, KETLUAN = PAR_KETLUAN
  WHERE MAPK = PAR_MAPK;
  DBMS_LOCK.SLEEP(2);
  COMMIT;
END;


/*========================= BANG DICH VU CAN LAM SANG ========================*/
 
-- THEM KET QUA CAN LAM SAN 
CREATE OR REPLACE PROCEDURE INSERT_KETQUADVCLS (
  PAR_MAPK KETQUADICHVUCLS.MAPK%TYPE, PAR_MABS KETQUADICHVUCLS.MABSTH%TYPE, PAR_MADV KETQUADICHVUCLS.MADVCLS%TYPE,
  PAR_MAP KETQUADICHVUCLS.MAPHONG%TYPE, PAR_MAHD KETQUADICHVUCLS.MAHD%TYPE, PAR_TRANGTHAI KETQUADICHVUCLS.TRANGTHAITH%TYPE,
  PAR_STT KETQUADICHVUCLS.STT%TYPE, PAR_KETLUAN KETQUADICHVUCLS.KETLUANCLS%TYPE)

AS
  VAR_GIADV DICHVU.GIADV%TYPE;
BEGIN

  INSERT INTO KETQUADICHVUCLS(MAKQ, MAPK, MABSTH, MADVCLS, MAPHONG, MAHD, TRANGTHAITH, STT, KETLUANCLS)
  VALUES (SEQ13_MAKQ.NEXTVAL, PAR_MAPK, PAR_MABS, PAR_MADV, PAR_MAP, PAR_MAHD, PAR_TRANGTHAI, PAR_STT, PAR_KETLUAN);
  COMMIT;

  SELECT GIADV INTO VAR_GIADV
  FROM DICHVU d
  WHERE D.MADV = PAR_MADV;

  UPDATE HOADON
  SET THANHTIEN = THANHTIEN + VAR_GIADV
  WHERE MAHD = PAR_MAHD;
  COMMIT;
 
END;

-- THEM KET QUA CLS CO HOADON

-- THEM KET QUA CLS LAN 2 LAN 3 LAN N...
CREATE OR REPLACE PROCEDURE INSERT_KETQUADVCLS_HOADON_NHIEULAN (
  PAR_MAPK KETQUADICHVUCLS.MAPK%TYPE, PAR_MABS KETQUADICHVUCLS.MABSTH%TYPE, PAR_MADV KETQUADICHVUCLS.MADVCLS%TYPE,
  PAR_MAP KETQUADICHVUCLS.MAPHONG%TYPE, PAR_TRANGTHAI KETQUADICHVUCLS.TRANGTHAITH%TYPE,
  PAR_STT KETQUADICHVUCLS.STT%TYPE, PAR_KETLUAN KETQUADICHVUCLS.KETLUANCLS%TYPE)

AS
  VAR_GIADV DICHVU.GIADV%TYPE;
  V_MAHDOLD HOADON.MAHD%TYPE;
BEGIN
  
  BEGIN
    SELECT H.MAHD INTO V_MAHDOLD
    FROM HOADON h
    JOIN KETQUADICHVUCLS k ON H.MAHD = K.MAHD
    JOIN PHIEUKHAM p ON K.MAPK = P.MAPK
    WHERE K.MAPK = PAR_MAPK;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN 
      V_MAHDOLD := NULL;
  END;

  IF V_MAHDOLD IS NULL THEN
    INSERT_HOADON(1, 2, NULL, NULL, 0, NULL, MAHD_OUT => V_MAHDOLD);
  END IF;

  INSERT INTO KETQUADICHVUCLS(MAKQ, MAPK, MABSTH, MADVCLS, MAPHONG, MAHD, TRANGTHAITH, STT, KETLUANCLS)
  VALUES (SEQ13_MAKQ.NEXTVAL, PAR_MAPK, PAR_MABS, PAR_MADV, PAR_MAP, V_MAHDOLD, PAR_TRANGTHAI, PAR_STT, PAR_KETLUAN);
  COMMIT;

  SELECT GIADV INTO VAR_GIADV
  FROM DICHVU d
  WHERE D.MADV = PAR_MADV;

  UPDATE HOADON
  SET THANHTIEN = THANHTIEN + VAR_GIADV
  WHERE MAHD = v_MAHDOld;
  COMMIT;
 
END;

-- CAP NHAT THONG TIN KET QUA 
CREATE OR REPLACE PROCEDURE UPDATE_KETQUADVCLS (
  PAR_MAKQ KETQUADICHVUCLS.MAKQ%TYPE, PAR_MAPK KETQUADICHVUCLS.MAPK%TYPE, PAR_MABS KETQUADICHVUCLS.MABSTH%TYPE, PAR_MADV KETQUADICHVUCLS.MADVCLS%TYPE,
  PAR_MAP KETQUADICHVUCLS.MAPHONG%TYPE, PAR_MAHD KETQUADICHVUCLS.MAHD%TYPE, PAR_TRANGTHAI KETQUADICHVUCLS.TRANGTHAITH%TYPE,
  PAR_STT KETQUADICHVUCLS.STT%TYPE, PAR_KETLUAN KETQUADICHVUCLS.KETLUANCLS%TYPE)

AS
  VAR_GIADV DICHVU.GIADV%TYPE;
BEGIN

  SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  UPDATE KETQUADICHVUCLS 
  SET MAPK = PAR_MAPK, MABSTH = PAR_MABS, MADVCLS = PAR_MADV, MAPHONG = PAR_MAP, MAHD = PAR_MAHD, TRANGTHAITH = PAR_TRANGTHAI, STT = PAR_STT, KETLUANCLS = PAR_KETLUAN
  WHERE MAKQ = PAR_MAKQ;
  COMMIT;

END;


/*========================= BANG DON VI THOC ========================*/

-- THEM DON VI THUOC
CREATE OR REPLACE PROCEDURE INSERT_DONVITHUOC (PAR_TENDONVI DONVITHUOC.TENDONVI%TYPE)
AS
BEGIN

  INSERT INTO DONVITHUOC (MADVT, TENDONVI, TRANGTHAI)
  VALUES (SEQ17_MADVT.NEXTVAL, PAR_TENDONVI, 1);
  COMMIT;

END;

-- CAP NHAT DON VI THUOC
CREATE OR REPLACE PROCEDURE UPDATE_DONVITHUOC (PAR_MADVT DONVITHUOC.MADVT%TYPE, PAR_TENDONVI DONVITHUOC.TENDONVI%TYPE)
AS
BEGIN
  
  UPDATE DONVITHUOC
  SET TENDONVI = PAR_TENDONVI
  WHERE MADVT = PAR_MADVT;
  COMMIT;

END;

-- XOA DON VI THUOC
CREATE OR REPLACE PROCEDURE DELETE_DONVITHUOC (PAR_MADVT DONVITHUOC.MADVT%TYPE)
AS
BEGIN
  
  UPDATE DONVITHUOC
  SET TRANGTHAI = 0
  WHERE MADVT = PAR_MADVT;
  COMMIT;

END;


/*========================= BANG DON THUOC ========================*/

-- THEM DON THUOC
CREATE OR REPLACE PROCEDURE INSERT_DONTHUOC (
  PAR_MAHOADON DONTHUOC.MAHD%TYPE, PAR_MAPK DONTHUOC.MAPK%TYPE, PAR_GIADONTHUOC DONTHUOC.GIADT%TYPE, PAR_NGAYLAP DONTHUOC.NGAYLAP%TYPE)

AS
BEGIN

  INSERT INTO DONTHUOC (MADT, MAHD, MAPK, GIADT, NGAYLAP)
  VALUES (SEQ12_MADT.NEXTVAL, PAR_MAHOADON, PAR_MAPK, PAR_GIADONTHUOC, PAR_NGAYLAP);
  COMMIT;

  UPDATE HOADON
  SET THANHTIEN = THANHTIEN + PAR_GIADONTHUOC
  WHERE MAHD = PAR_MAHOADON;
  COMMIT;

END;

-- THEM DON THUOC MOI_UPDATE
CREATE OR REPLACE PROCEDURE INSERT_DONTHUOC_HOADON (
  PAR_MAPK DONTHUOC.MAPK%TYPE, PAR_GIADONTHUOC DONTHUOC.GIADT%TYPE, PAR_NGAYLAP DONTHUOC.NGAYLAP%TYPE)

AS
  v_MAHDOld HOADON.MAHD%TYPE;

BEGIN

  INSERT_HOADON(SEQ16_MAHD.NEXTVAL, 3, NULL, 'Chưa thanh toán', 0, NULL, MAHD_OUT => v_MAHDOld);

  INSERT INTO DONTHUOC (MADT, MAHD, MAPK, GIADT, NGAYLAP)
  VALUES (SEQ12_MADT.NEXTVAL, v_MAHDOld, PAR_MAPK, PAR_GIADONTHUOC, PAR_NGAYLAP);
  COMMIT;

  UPDATE HOADON
  SET THANHTIEN = THANHTIEN + PAR_GIADONTHUOC
  WHERE MAHD = v_MAHDOld;
  COMMIT;

END;

/*========================= BANG CTDT ========================*/

-- THEM CTDT
CREATE OR REPLACE PROCEDURE INSERT_CTDT (PAR_MADT CTDT.MADT%TYPE, PAR_MATHUOC CTDT.MATHUOC%TYPE,
  PAR_SOLANUONG CTDT.SOLANUONG%TYPE, PAR_SOLUONGUONG CTDT.SOLUONGUONG%TYPE, PAR_TRANGTHAI CTDT.TRANGTHAIDATLICH%TYPE,
  PAR_SOLUONGTHUOC CTDT.SOLUONGTHUOC%TYPE, PAR_GIABANLUCKE CTDT.GIABANLUCKE%TYPE, PAR_GHICHU CTDT.GHICHU%TYPE)
AS
  VAR_SOLUONGTHUOC NUMBER;
  VAR_SOTHUOCDALAY NUMBER := 0;
  VAR_MALOTHUOC LOTHUOC.MALOTHUOC%TYPE;

BEGIN

  --SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  INSERT INTO CTDT (MACTDT, MADT, MATHUOC, SOLANUONG, SOLUONGUONG, TRANGTHAIDATLICH, SOLUONGTHUOC, GIABANLUCKE, GHICHU)
  VALUES (SEQ18_MACTDT.NEXTVAL, PAR_MADT, PAR_MATHUOC, PAR_SOLANUONG, PAR_SOLUONGUONG, PAR_TRANGTHAI, PAR_SOLUONGTHUOC, GIABANLUCKE, PAR_GHICHU);
  
  VAR_SOLUONGTHUOC := PAR_SOLUONGTHUOC;
  
  FOR CUR_LOTHUOC IN (SELECT MALOTHUOC, SOLUONGTON 
                      FROM LOTHUOC 
                      WHERE MATHUOC = PAR_MATHUOC AND SOLUONGTON > 0 AND HANSD > TRUNC(SYSDATE)
                      ORDER BY HANSD)
  LOOP
    IF VAR_SOLUONGTHUOC > 0 THEN
      IF VAR_SOLUONGTHUOC >= CUR_LOTHUOC.SOLUONGTON THEN
        VAR_SOTHUOCDALAY := VAR_SOTHUOCDALAY + CUR_LOTHUOC.SOLUONGTON;
        VAR_SOLUONGTHUOC := VAR_SOLUONGTHUOC - CUR_LOTHUOC.SOLUONGTON;

        UPDATE LOTHUOC 
        SET SOLUONGTON = 0 
        WHERE MALOTHUOC = CUR_LOTHUOC.MALOTHUOC;

      ELSE
        VAR_SOTHUOCDALAY := VAR_SOTHUOCDALAY + VAR_SOLUONGTHUOC;

        UPDATE LOTHUOC 
        SET SOLUONGTON = SOLUONGTON - VAR_SOLUONGTHUOC 
        WHERE MALOTHUOC = CUR_LOTHUOC.MALOTHUOC;

        VAR_SOLUONGTHUOC := 0;
      END IF;
    ELSE
      EXIT;
    END IF;
  END LOOP;

  IF VAR_SOLUONGTHUOC > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'S? lu?ng thu?c c?n k� vu?t qu� s? lu?ng t?n c?a t?t c? c�c l� trong kho.');
  END IF;
  
  COMMIT;
END;


/*========================= BANG DON THUOC ========================*/

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

  DBMS_LOCK.SLEEP(2);
  COMMIT;

END;


/*========================= BANG HOA DON ========================*/

-- THEM HOA DON MOI
CREATE OR REPLACE PROCEDURE INSERT_HOADON (
  PAR_MALT HOADON.MALT%TYPE, PAR_MALOAIHD HOADON.MALOAIHD%TYPE, PAR_THOIDIEM HOADON.TDTT%TYPE,
  PAR_TTTT HOADON.TTTT%TYPE, PAR_THANHTIEN HOADON.THANHTIEN%TYPE, PAR_PTTT HOADON.PTTT%TYPE, MAHD_OUT OUT HOADON.MAHD%TYPE)
AS
BEGIN

  INSERT INTO HOADON (MAHD, MALT, MALOAIHD, TDTT, TTTT, THANHTIEN, PTTT)
  VALUES (SEQ16_MAHD.NEXTVAL, PAR_MALT, PAR_MALOAIHD, PAR_THOIDIEM, PAR_TTTT, PAR_THANHTIEN, PAR_PTTT)
  RETURNING MAHD INTO MAHD_OUT;
  COMMIT;

END;

-- CAP NHAT HOA DON
CREATE OR REPLACE PROCEDURE UPDATE_HOADON (
  PAR_MAHD HOADON.MAHD%TYPE, PAR_MALT HOADON.MALT%TYPE, PAR_MALOAIHD HOADON.MALOAIHD%TYPE, PAR_THOIDIEM HOADON.TDTT%TYPE,
  PAR_TTTT HOADON.TTTT%TYPE, PAR_THANHTIEN HOADON.THANHTIEN%TYPE, PAR_PTTT HOADON.PTTT%TYPE)

AS
BEGIN

  SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
  UPDATE HOADON 
  SET MALT = PAR_MALT, MALOAIHD = PAR_MALOAIHD, TDTT = PAR_THOIDIEM, TTTT = PAR_TTTT, THANHTIEN = PAR_THANHTIEN, PTTT = PAR_PTTT
  WHERE MAHD = PAR_MAHD;
  COMMIT;

END;


/*========================= BANG LO THUOC ========================*/

-- THEM LO THUOC 
CREATE OR REPLACE PROCEDURE INSERT_LOTHUOC (
  PAR_MATHUOC LOTHUOC.MATHUOC%TYPE, PAR_NHACC LOTHUOC.NHACC%TYPE, PAR_SOLUONGTON LOTHUOC.SOLUONGTON%TYPE, PAR_HANSD LOTHUOC.HANSD%TYPE,
  PAR_GIANHAP LOTHUOC.GIANHAP%TYPE, PAR_GIABAN LOTHUOC.GIABAN%TYPE, PAR_NGAYNHAP LOTHUOC.NGAYNHAP%TYPE)

AS
BEGIN

  INSERT INTO LOTHUOC (MALOTHUOC, MATHUOC, NHACC, SOLUONGTON, HANSD, GIANHAP, NGAYNHAP, GIABAN)
  VALUES (SEQ15_MALT.NEXTVAL, PAR_MATHUOC, PAR_NHACC, PAR_SOLUONGTON, PAR_HANSD, PAR_GIANHAP, PAR_NGAYNHAP, PAR_GIABAN);

  COMMIT;

END;

--- CAP NHAT LO THUOC
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

  DBMS_LOCK.SLEEP(2);
  COMMIT;

END;


/*========================= BANG DICH VU ========================*/

-- THEM DICH VU
CREATE OR REPLACE PROCEDURE INSERT_DICHVU (
  PAR_MALOAIDV DICHVU.MALOAIDV%TYPE, PAR_TENDV DICHVU.TENDV%TYPE, PAR_GIADV DICHVU.GIADV%TYPE)

AS
BEGIN

  INSERT INTO DICHVU (MADV, MALOAIDV, TENDV, GIADV, TRANGTHAI)
  VALUES (SEQ8_MADV.NEXTVAL, PAR_MALOAIDV, PAR_TENDV, PAR_GIADV, 1);
  COMMIT;

END;

--- CAP NHAT DICH VU
CREATE OR REPLACE PROCEDURE UPDATE_DICHVU (
  PAR_MADV DICHVU.MADV%TYPE, PAR_MALOAIDV DICHVU.MALOAIDV%TYPE, PAR_TENDV DICHVU.TENDV%TYPE, PAR_GIADV DICHVU.GIADV%TYPE)

AS
BEGIN

  UPDATE DICHVU
  SET MALOAIDV = PAR_MALOAIDV, TENDV = PAR_TENDV, GIADV = PAR_GIADV
  WHERE MADV = PAR_MADV;
  COMMIT;

END;

--- XOA DICH VU
CREATE OR REPLACE PROCEDURE DELETE_DICHVU (PAR_MADV DICHVU.MADV%TYPE)
AS
BEGIN

  UPDATE DICHVU
  SET TRANGTHAI = 0
  WHERE MADV = PAR_MADV;
  COMMIT;

END;


/*========================= BANG BENH ========================*/

-- THEM BENH
CREATE OR REPLACE PROCEDURE INSERT_BENH (PAR_MAICD BENH.MAICD%TYPE, PAR_TENBENH BENH.TENBENH%TYPE)
AS
BEGIN

  INSERT INTO BENH (MABENH, MAICD, TENBENH, TRANGTHAI)
  VALUES (SEQ6_MABENH.NEXTVAL, PAR_MAICD, PAR_TENBENH, 1);
  COMMIT;

END;

-- CAP NHAT BENH
CREATE OR REPLACE PROCEDURE UPDATE_BENH (PAR_MABENH BENH.MABENH%TYPE, PAR_MAICD BENH.MAICD%TYPE, PAR_TENBENH BENH.TENBENH%TYPE)
AS
BEGIN
  
  UPDATE BENH
  SET MAICD = PAR_MAICD, TENBENH = PAR_TENBENH
  WHERE MABENH = PAR_MABENH;
  COMMIT;

END;

--- XOA BENH
CREATE OR REPLACE PROCEDURE DELETE_BENH (PAR_MABENH BENH.MABENH%TYPE)
AS
BEGIN

  UPDATE BENH
  SET TRANGTHAI = 0
  WHERE MABENH = PAR_MABENH;
  COMMIT;

END;


/*========================= BANG THUOC ========================*/

-- THEM THUOC 
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
    RAISE_APPLICATION_ERROR(-20001, 'Lo?i thu?c d� t?n t?i trong h? th?ng.');
  END IF;
  INSERT INTO THUOC (MATHUOC, MADVT, TENTHUOC, THANHPHAN) 
  VALUES (SEQ14_MATHUOC.NEXTVAL, PAR_DVT, PAR_TENTHUOC, PAR_THANHPHAN);
  COMMIT;

END;

-- CAP NHAT THUOC
CREATE OR REPLACE PROCEDURE UPDATE_THUOC (
  PAR_MATHUOC THUOC.MATHUOC%TYPE, PAR_TENTHUOC THUOC.TENTHUOC%TYPE, PAR_DVT THUOC.MADVT%TYPE, PAR_THANHPHAN THUOC.THANHPHAN%TYPE)
AS
BEGIN
  UPDATE THUOC
  SET MADVT = PAR_DVT, TENTHUOC = PAR_TENTHUOC, THANHPHAN = PAR_THANHPHAN
  WHERE MATHUOC = PAR_MATHUOC;
  
  COMMIT;
END;


/*========================= PROCEDURE THONG KE ========================*/

-- THONG KE DOANH THU MOI THANG
CREATE OR REPLACE PROCEDURE GET_DOANHTHU (PAR_MONTH IN NUMBER, PAR_YEAR IN NUMBER, cursor OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN cursor FOR
      SELECT L.MALOAIHD, L.TENLOAIHD, SUM(H.THANHTIEN)
      FROM HOADON H
      JOIN LOAIHD L ON L.MALOAIHD = H.MALOAIHD
      WHERE EXTRACT(YEAR FROM TDTT) = PAR_YEAR AND EXTRACT(MONTH FROM TDTT) = PAR_MONTH
      GROUP BY L.MALOAIHD, L.TENLOAIHD;
END;


-- THONG KE LUONG THUOC NHAP MOI THANG
CREATE OR REPLACE PROCEDURE GET_LUONGTHUOCNHAP (PAR_MONTH IN NUMBER, PAR_YEAR IN NUMBER, cursor OUT SYS_REFCURSOR)
AS
BEGIN
  OPEN cursor FOR
    SELECT T.MATHUOC, T.TENTHUOC, SUM(SOLUONGTON)
    FROM LOTHUOC l
    JOIN THUOC t ON T.MATHUOC = L.MATHUOC
    WHERE EXTRACT(MONTH FROM L.NGAYNHAP) = PAR_MONTH AND EXTRACT(YEAR FROM L.NGAYNHAP) = PAR_YEAR
    GROUP BY T.MATHUOC, T.TENTHUOC;

  COMMIT;
END;

