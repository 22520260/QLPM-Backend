const db = require("../../config/db"); // Import your database module
const oracledb = require("oracledb");
const {formatDate} = require("../../util/formatDate")

class SiteController {
  // GET /
  async index(req, res, next) {
    const customerId = req.params.customerId;
    
    try {
      const sqlQuery = 'SELECT Tong_Doanhso(:P_MAKH) AS TOTAL_REVENUE FROM DUAL';
      const bindVars = {
        P_MAKH: 201
      };

      const result = await db.executeProcedure(sqlQuery, bindVars);

      if (result) {
        const totalRevenue = result.rows;
        res.json({ totalRevenue });
      } else {
        res.status(404).json({ error: 'Customer not found or no revenue data' });
      }
    } catch (error) {
      console.error('Error calling function:', error);
      res.status(500).json({ error: 'Lỗi ở server' });
    }
  }

  // GET /search
  async search(req, res) {
    try {
      const procedureName = "BEGIN UPDATESALARY(:P_MA); END;";
      const bindVars = {
        P_MA: 6,
      };

      const result = await db.executeProcedure(procedureName, bindVars);
      if (result && result.returnValue === 0) {
      } else {
      }
    } catch (error) {
      console.error("Error calling stored procedure:", error);
    }
  }


  // GET /tiepdon
  async dangky(req, res) {
    try {
      const sqlQuery = "SELECT * FROM BENHNHAN";
      const customers = await db.executeQuery(sqlQuery);
  
      const formattedCustomers = customers.map(customer => {
        const [mabn, matk, cccd, hoTen, ngaySinh, gioiTinh, sdt, diaChi, tienSuBenh, diUng] = customer;
  
        const formattedNgaySinh = new Date(ngaySinh);
  
        return [
          mabn,
          matk,
          cccd,
          hoTen,
          formattedNgaySinh,
          gioiTinh,
          sdt,
          diaChi,
          tienSuBenh,
          diUng
        ];
      });
  
      setTimeout(() => res.send(customers), 1000);
    } catch (error) {
      console.error("Error querying database:", error);
      res.status(500).json({ error: "Lỗi ở server" });
    }
  }

  async lichhen(req, res) {
    try {
      const sqlQuery = "SELECT * FROM BACSI";
      const customers = await db.executeQuery(sqlQuery);
  
      // const formattedCustomers = customers.map(customer => {
      //   const [mabn, matk, cccd, hoTen, ngaySinh, gioiTinh, sdt, diaChi, tienSuBenh, diUng] = customer;
  
      //   const formattedNgaySinh = new Date(ngaySinh);
  
      //   return [
      //     mabn,
      //     matk,
      //     cccd,
      //     hoTen,
      //     formattedNgaySinh,
      //     gioiTinh,
      //     sdt,
      //     diaChi,
      //     tienSuBenh,
      //     diUng
      //   ];
      // });
      setTimeout(() => res.send(customers), 1000);
    } catch (error) {
      console.error("Error querying database:", error);
      res.status(500).json({ error: "Lỗi ở server" });
    }
  }
  
}

module.exports = new SiteController();
