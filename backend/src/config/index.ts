import {config} from "dotenv";

config();

export const PORT = process.env.PORT;
export const USER_MSSQL=process.env.USER_MSSQL
export const PASSWORD_MSSQL=process.env.PASSWORD_MSSQL
export const HOST_MSSQL=process.env.HOST_MSSQL
export const DB_MSSQL=process.env.DB_MSSQL 