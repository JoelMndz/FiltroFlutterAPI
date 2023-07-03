import {Router} from "express";
import { AeropuertoController } from "../controllers";

export const router = Router();

router.get('/', AeropuertoController.obtenerAeropuertos);
router.get('/:id', AeropuertoController.filtrar);
