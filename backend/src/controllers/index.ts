import {Request, Response} from "express";
import { conectarMSSQL } from "../database";

export const AeropuertoController = {
  obtenerAeropuertos: async(req:Request, res:Response)=>{
    try {
      const pool = await conectarMSSQL();
      const data = await pool.query('select * from aeropuerto')
      await pool.close()
      return res.json(data.recordset)
    } catch (error) {
      console.log(error);      
    }
  },

  filtrar: async(req:Request, res:Response)=>{
    try {
      const pool = await conectarMSSQL();
      const data = await pool.query(`EXEC ObtenerReporteMontosRecaudados @idAeropuerto = ${req.params.id}`)
      await pool.close()
      return res.json(data.recordset)
    } catch (error) {
      console.log(error);    
    }
  },
}