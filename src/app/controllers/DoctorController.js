const db = require("../../config/db");
const oracledb = require("oracledb");

class DoctorController {
  // GET /bacsi/
  async index(req, res) {
    try {
      const sqlQuery = "SELECT * FROM BACSI";
      const doctors = await db.executeQuery(sqlQuery);
      
      const formattedDoctors = doctors.map((doctor) => {
        doctor.NGAYSINH = new Date(doctor.NGAYSINH);
        return doctor;
      })
      // const formattedDoctors = doctors.map((doctor) => {
      //   const [
      //     mabs,
      //     matk,
      //     cccd,
      //     hoTen,
      //     trinhDo,
      //     gioiTinh,
      //     sdt,
      //     ngaySinh,
      //     diaChi,
      //     chuyenKhoa,
      //   ] = doctor;

      //   const formattedNgaySinh = new Date(ngaySinh);

      //   return {
      //     mabs,
      //     matk,
      //     cccd,
      //     hoTen,
      //     trinhDo,
      //     gioiTinh,
      //     sdt,
      //     formattedNgaySinh,
      //     diaChi,
      //     chuyenKhoa,
      //   };
      // });

      setTimeout(
        () =>
          res.send({
            errcode: 0,
            message: "Successful",
            data: formattedDoctors,
          }),
        1000
      );
    } catch (error) {
      console.error("Error querying database:", error);
      res.status(500).json({ error: "Internal Server Error" });
    }
  }
}

module.exports = new DoctorController();
