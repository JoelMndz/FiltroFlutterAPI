import express from "express";
import cors from "cors";
import morgan from "morgan";
import { PORT } from "./config";
import { conectarMSSQL } from "./database";
import { router } from "./routes";

const app = express();

app.use(morgan('dev'))
app.use(cors())
app.use(express.json({limit:'30mb'}))

app.use('/api', router)

app.listen(PORT, ()=>{
  console.log(`Server corriendo en el puerto ${PORT}`);  
})


