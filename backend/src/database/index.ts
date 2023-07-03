import * as mssql from 'mssql';
import { DB_MSSQL, HOST_MSSQL, PASSWORD_MSSQL, USER_MSSQL } from '../config'

export const conectarMSSQL = async()=>{
  
  const config: mssql.config = {
    server: `${HOST_MSSQL}`,
    database: `${DB_MSSQL}`,
    user: `${USER_MSSQL}`,
    password: `${PASSWORD_MSSQL}`,
      options: {
          enableArithAbort: true,
          encrypt: false
      }
  };

  const pool = await mssql.connect(config);
  
  return pool;
}