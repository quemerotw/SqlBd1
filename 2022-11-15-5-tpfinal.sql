--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-11-15 13:10:48

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 16526)
-- Name: almacenado_en; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.almacenado_en (
    id_inventario integer NOT NULL,
    id_articulo integer NOT NULL,
    cantidad integer NOT NULL
);


ALTER TABLE public.almacenado_en OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16394)
-- Name: articulo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articulo (
    id_articulo integer NOT NULL,
    nombre text NOT NULL,
    precio_venta double precision,
    color text,
    fabricante text,
    medidas text
);


ALTER TABLE public.articulo OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16411)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    descripcion text NOT NULL,
    anio_desde date NOT NULL,
    anio_hasta date NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16435)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    dni integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    numero integer NOT NULL,
    piso text,
    departamento integer,
    telefono integer NOT NULL,
    localidad integer NOT NULL,
    calle text NOT NULL
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16418)
-- Name: comision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comision (
    id_categoria integer NOT NULL,
    id_comision integer NOT NULL,
    fecha date NOT NULL,
    porcentaje integer NOT NULL
);


ALTER TABLE public.comision OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16506)
-- Name: detalle_factura_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_factura_cliente (
    numero_renglon_factura_cliente integer NOT NULL,
    serie_factura_cliente integer NOT NULL,
    numero_factura_cliente integer NOT NULL,
    tipo_factura_cliente "char" NOT NULL,
    venta_factura_cliente integer NOT NULL
);


ALTER TABLE public.detalle_factura_cliente OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16648)
-- Name: detalle_factura_proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_factura_proveedor (
    serie_fac_proveedor integer NOT NULL,
    numero_fac_proveedor integer NOT NULL,
    tipo_fac_proveedor "char" NOT NULL,
    numero_renglon integer NOT NULL,
    cantidad integer NOT NULL,
    precio_por_unidad double precision NOT NULL,
    articulo integer NOT NULL
);


ALTER TABLE public.detalle_factura_proveedor OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16565)
-- Name: detalle_pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_pedido (
    id_pedido integer NOT NULL,
    numero_renglon_pedido integer NOT NULL,
    cantidad integer NOT NULL,
    articulo integer NOT NULL
);


ALTER TABLE public.detalle_pedido OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16474)
-- Name: detalle_venta_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_venta_cliente (
    nro_renglon_venta integer NOT NULL,
    venta integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario double precision NOT NULL,
    articulo integer NOT NULL
);


ALTER TABLE public.detalle_venta_cliente OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16447)
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    dni integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    fecha_ingreso date NOT NULL,
    localidad integer NOT NULL
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16496)
-- Name: factura_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura_cliente (
    serie integer NOT NULL,
    numero integer NOT NULL,
    tipo "char" NOT NULL,
    importe double precision NOT NULL,
    fecha date NOT NULL,
    vencimiento date NOT NULL,
    forma_de_pago_factura integer,
    numero_tarjeta integer
);


ALTER TABLE public.factura_cliente OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16628)
-- Name: factura_proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura_proveedor (
    serie integer NOT NULL,
    numero integer NOT NULL,
    tipo "char" NOT NULL,
    fecha date NOT NULL,
    esta_completo boolean,
    forma_de_pago integer NOT NULL,
    empleado integer,
    proveedor integer NOT NULL,
    numero_tarjeta bigint
);


ALTER TABLE public.factura_proveedor OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16489)
-- Name: forma_de_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forma_de_pago (
    id_forma_de_pago integer NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.forma_de_pago OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16401)
-- Name: historico_articulo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico_articulo (
    id_articulo integer NOT NULL,
    fecha date NOT NULL,
    precio double precision NOT NULL
);


ALTER TABLE public.historico_articulo OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16521)
-- Name: inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventario (
    id_inventario integer NOT NULL,
    fecha_realizacion_inventario date NOT NULL
);


ALTER TABLE public.inventario OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16428)
-- Name: localidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.localidad (
    id_localidad integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.localidad OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16550)
-- Name: pedido_proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido_proveedor (
    id_pedido integer NOT NULL,
    fecha date NOT NULL,
    proveedor integer NOT NULL
);


ALTER TABLE public.pedido_proveedor OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16533)
-- Name: proveedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedor (
    id_proveedor integer NOT NULL,
    nombre text NOT NULL,
    forma_de_pago integer NOT NULL,
    calle text NOT NULL,
    numero integer NOT NULL,
    piso text,
    departamento text,
    telefono integer,
    localidad integer
);


ALTER TABLE public.proveedor OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16663)
-- Name: suministra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suministra (
    proveedor integer NOT NULL,
    articulo integer NOT NULL,
    fecha_precio date NOT NULL
);


ALTER TABLE public.suministra OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16459)
-- Name: venta_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venta_cliente (
    id_venta integer NOT NULL,
    fecha date NOT NULL,
    importe_total double precision NOT NULL,
    empleado integer NOT NULL,
    cliente integer NOT NULL
);


ALTER TABLE public.venta_cliente OWNER TO postgres;

--
-- TOC entry 3455 (class 0 OID 16526)
-- Dependencies: 223
-- Data for Name: almacenado_en; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.almacenado_en (id_inventario, id_articulo, cantidad) FROM stdin;
\.


--
-- TOC entry 3442 (class 0 OID 16394)
-- Dependencies: 210
-- Data for Name: articulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articulo (id_articulo, nombre, precio_venta, color, fabricante, medidas) FROM stdin;
5	llave de punto	70	blanco	aplanca	20x5
1	enchufe	25	blanco	electrolux	3x5
2	enchufe	35	negro	luminux	3x5
3	lamparita	200	fria	sica	4x3
4	cable	50	negro	deluxe	20m
\.


--
-- TOC entry 3444 (class 0 OID 16411)
-- Dependencies: 212
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id_categoria, descripcion, anio_desde, anio_hasta) FROM stdin;
\.


--
-- TOC entry 3447 (class 0 OID 16435)
-- Dependencies: 215
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (dni, nombre, apellido, numero, piso, departamento, telefono, localidad, calle) FROM stdin;
16	Agustin	Bowen	168	\N	\N	19	9105	Juan C Evans
\.


--
-- TOC entry 3445 (class 0 OID 16418)
-- Dependencies: 213
-- Data for Name: comision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comision (id_categoria, id_comision, fecha, porcentaje) FROM stdin;
\.


--
-- TOC entry 3453 (class 0 OID 16506)
-- Dependencies: 221
-- Data for Name: detalle_factura_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_factura_cliente (numero_renglon_factura_cliente, serie_factura_cliente, numero_factura_cliente, tipo_factura_cliente, venta_factura_cliente) FROM stdin;
\.


--
-- TOC entry 3460 (class 0 OID 16648)
-- Dependencies: 228
-- Data for Name: detalle_factura_proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_factura_proveedor (serie_fac_proveedor, numero_fac_proveedor, tipo_fac_proveedor, numero_renglon, cantidad, precio_por_unidad, articulo) FROM stdin;
\.


--
-- TOC entry 3458 (class 0 OID 16565)
-- Dependencies: 226
-- Data for Name: detalle_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_pedido (id_pedido, numero_renglon_pedido, cantidad, articulo) FROM stdin;
\.


--
-- TOC entry 3450 (class 0 OID 16474)
-- Dependencies: 218
-- Data for Name: detalle_venta_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_venta_cliente (nro_renglon_venta, venta, cantidad, precio_unitario, articulo) FROM stdin;
\.


--
-- TOC entry 3448 (class 0 OID 16447)
-- Dependencies: 216
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleado (dni, nombre, apellido, fecha_ingreso, localidad) FROM stdin;
\.


--
-- TOC entry 3452 (class 0 OID 16496)
-- Dependencies: 220
-- Data for Name: factura_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura_cliente (serie, numero, tipo, importe, fecha, vencimiento, forma_de_pago_factura, numero_tarjeta) FROM stdin;
\.


--
-- TOC entry 3459 (class 0 OID 16628)
-- Dependencies: 227
-- Data for Name: factura_proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura_proveedor (serie, numero, tipo, fecha, esta_completo, forma_de_pago, empleado, proveedor, numero_tarjeta) FROM stdin;
\.


--
-- TOC entry 3451 (class 0 OID 16489)
-- Dependencies: 219
-- Data for Name: forma_de_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forma_de_pago (id_forma_de_pago, descripcion) FROM stdin;
\.


--
-- TOC entry 3443 (class 0 OID 16401)
-- Dependencies: 211
-- Data for Name: historico_articulo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historico_articulo (id_articulo, fecha, precio) FROM stdin;
\.


--
-- TOC entry 3454 (class 0 OID 16521)
-- Dependencies: 222
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventario (id_inventario, fecha_realizacion_inventario) FROM stdin;
\.


--
-- TOC entry 3446 (class 0 OID 16428)
-- Dependencies: 214
-- Data for Name: localidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.localidad (id_localidad, nombre) FROM stdin;
9100	Trelew
9105	Gaiman
9104	Rawson
9106	Puerto Madryn
10000	Buenos Aires(CABA)
\.


--
-- TOC entry 3457 (class 0 OID 16550)
-- Dependencies: 225
-- Data for Name: pedido_proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido_proveedor (id_pedido, fecha, proveedor) FROM stdin;
\.


--
-- TOC entry 3456 (class 0 OID 16533)
-- Dependencies: 224
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedor (id_proveedor, nombre, forma_de_pago, calle, numero, piso, departamento, telefono, localidad) FROM stdin;
\.


--
-- TOC entry 3461 (class 0 OID 16663)
-- Dependencies: 229
-- Data for Name: suministra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suministra (proveedor, articulo, fecha_precio) FROM stdin;
\.


--
-- TOC entry 3449 (class 0 OID 16459)
-- Dependencies: 217
-- Data for Name: venta_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venta_cliente (id_venta, fecha, importe_total, empleado, cliente) FROM stdin;
\.


--
-- TOC entry 3267 (class 2606 OID 16532)
-- Name: almacenado_en almacenado_en_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenado_en
    ADD CONSTRAINT almacenado_en_pkey PRIMARY KEY (id_inventario, id_articulo);


--
-- TOC entry 3241 (class 2606 OID 16400)
-- Name: articulo articulo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulo
    ADD CONSTRAINT articulo_pkey PRIMARY KEY (id_articulo);


--
-- TOC entry 3245 (class 2606 OID 16417)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 3251 (class 2606 OID 16441)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (dni);


--
-- TOC entry 3247 (class 2606 OID 16422)
-- Name: comision comision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comision
    ADD CONSTRAINT comision_pkey PRIMARY KEY (id_categoria, id_comision);


--
-- TOC entry 3263 (class 2606 OID 16510)
-- Name: detalle_factura_cliente detalle_factura_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura_cliente
    ADD CONSTRAINT detalle_factura_cliente_pkey PRIMARY KEY (numero_renglon_factura_cliente, serie_factura_cliente, numero_factura_cliente, tipo_factura_cliente);


--
-- TOC entry 3277 (class 2606 OID 16652)
-- Name: detalle_factura_proveedor detalle_factura_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura_proveedor
    ADD CONSTRAINT detalle_factura_proveedor_pkey PRIMARY KEY (numero_fac_proveedor, serie_fac_proveedor, tipo_fac_proveedor, numero_renglon);


--
-- TOC entry 3273 (class 2606 OID 16569)
-- Name: detalle_pedido detalle_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_pkey PRIMARY KEY (id_pedido, numero_renglon_pedido);


--
-- TOC entry 3257 (class 2606 OID 16478)
-- Name: detalle_venta_cliente detalle_venta_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta_cliente
    ADD CONSTRAINT detalle_venta_cliente_pkey PRIMARY KEY (nro_renglon_venta, venta);


--
-- TOC entry 3253 (class 2606 OID 16453)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (dni);


--
-- TOC entry 3261 (class 2606 OID 16500)
-- Name: factura_cliente factura_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_cliente
    ADD CONSTRAINT factura_cliente_pkey PRIMARY KEY (serie, numero, tipo);


--
-- TOC entry 3275 (class 2606 OID 16632)
-- Name: factura_proveedor factura_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_proveedor
    ADD CONSTRAINT factura_proveedor_pkey PRIMARY KEY (serie, numero, tipo);


--
-- TOC entry 3259 (class 2606 OID 16495)
-- Name: forma_de_pago forma_de_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_de_pago
    ADD CONSTRAINT forma_de_pago_pkey PRIMARY KEY (id_forma_de_pago);


--
-- TOC entry 3243 (class 2606 OID 16405)
-- Name: historico_articulo historico_articulo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_articulo
    ADD CONSTRAINT historico_articulo_pkey PRIMARY KEY (id_articulo, fecha);


--
-- TOC entry 3265 (class 2606 OID 16525)
-- Name: inventario inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id_inventario, fecha_realizacion_inventario);


--
-- TOC entry 3249 (class 2606 OID 16434)
-- Name: localidad localidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localidad
    ADD CONSTRAINT localidad_pkey PRIMARY KEY (id_localidad);


--
-- TOC entry 3271 (class 2606 OID 16554)
-- Name: pedido_proveedor pedido_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_proveedor
    ADD CONSTRAINT pedido_proveedor_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 3269 (class 2606 OID 16539)
-- Name: proveedor proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (id_proveedor);


--
-- TOC entry 3279 (class 2606 OID 16667)
-- Name: suministra suministra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suministra
    ADD CONSTRAINT suministra_pkey PRIMARY KEY (proveedor, articulo, fecha_precio);


--
-- TOC entry 3255 (class 2606 OID 16463)
-- Name: venta_cliente venta_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_cliente
    ADD CONSTRAINT venta_cliente_pkey PRIMARY KEY (id_venta);


--
-- TOC entry 3285 (class 2606 OID 16469)
-- Name: venta_cliente cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_cliente
    ADD CONSTRAINT cliente FOREIGN KEY (cliente) REFERENCES public.cliente(dni) NOT VALID;


--
-- TOC entry 3284 (class 2606 OID 16464)
-- Name: venta_cliente empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_cliente
    ADD CONSTRAINT empleado FOREIGN KEY (empleado) REFERENCES public.empleado(dni) NOT VALID;


--
-- TOC entry 3300 (class 2606 OID 16658)
-- Name: detalle_factura_proveedor fk_articulo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura_proveedor
    ADD CONSTRAINT fk_articulo FOREIGN KEY (articulo) REFERENCES public.articulo(id_articulo) NOT VALID;


--
-- TOC entry 3295 (class 2606 OID 16575)
-- Name: detalle_pedido fk_articulo_pedido; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT fk_articulo_pedido FOREIGN KEY (articulo) REFERENCES public.articulo(id_articulo) NOT VALID;


--
-- TOC entry 3302 (class 2606 OID 16673)
-- Name: suministra fk_articulo_suministra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suministra
    ADD CONSTRAINT fk_articulo_suministra FOREIGN KEY (articulo) REFERENCES public.articulo(id_articulo) NOT VALID;


--
-- TOC entry 3290 (class 2606 OID 16516)
-- Name: detalle_factura_cliente fk_detalle_factura_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura_cliente
    ADD CONSTRAINT fk_detalle_factura_cliente FOREIGN KEY (serie_factura_cliente, numero_factura_cliente, tipo_factura_cliente) REFERENCES public.factura_cliente(serie, numero, tipo) NOT VALID;


--
-- TOC entry 3294 (class 2606 OID 16570)
-- Name: detalle_pedido fk_detalle_pedido_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT fk_detalle_pedido_proveedor FOREIGN KEY (id_pedido) REFERENCES public.pedido_proveedor(id_pedido) NOT VALID;


--
-- TOC entry 3286 (class 2606 OID 16479)
-- Name: detalle_venta_cliente fk_detalle_venta_cliente_articulo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta_cliente
    ADD CONSTRAINT fk_detalle_venta_cliente_articulo FOREIGN KEY (articulo) REFERENCES public.articulo(id_articulo) NOT VALID;


--
-- TOC entry 3287 (class 2606 OID 16484)
-- Name: detalle_venta_cliente fk_detalle_venta_cliente_venta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_venta_cliente
    ADD CONSTRAINT fk_detalle_venta_cliente_venta FOREIGN KEY (venta) REFERENCES public.venta_cliente(id_venta) NOT VALID;


--
-- TOC entry 3297 (class 2606 OID 16638)
-- Name: factura_proveedor fk_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_proveedor
    ADD CONSTRAINT fk_empleado FOREIGN KEY (empleado) REFERENCES public.empleado(dni) NOT VALID;


--
-- TOC entry 3288 (class 2606 OID 16501)
-- Name: factura_cliente fk_factura_cliente_forma_de_pago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_cliente
    ADD CONSTRAINT fk_factura_cliente_forma_de_pago FOREIGN KEY (forma_de_pago_factura) REFERENCES public.forma_de_pago(id_forma_de_pago) NOT VALID;


--
-- TOC entry 3299 (class 2606 OID 16653)
-- Name: detalle_factura_proveedor fk_factura_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura_proveedor
    ADD CONSTRAINT fk_factura_proveedor FOREIGN KEY (serie_fac_proveedor, numero_fac_proveedor, tipo_fac_proveedor) REFERENCES public.factura_proveedor(serie, numero, tipo) NOT VALID;


--
-- TOC entry 3296 (class 2606 OID 16633)
-- Name: factura_proveedor fk_forma_de_pago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_proveedor
    ADD CONSTRAINT fk_forma_de_pago FOREIGN KEY (forma_de_pago) REFERENCES public.forma_de_pago(id_forma_de_pago) NOT VALID;


--
-- TOC entry 3291 (class 2606 OID 16540)
-- Name: proveedor fk_forma_de_pago_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT fk_forma_de_pago_proveedor FOREIGN KEY (forma_de_pago) REFERENCES public.forma_de_pago(id_forma_de_pago) NOT VALID;


--
-- TOC entry 3292 (class 2606 OID 16545)
-- Name: proveedor fk_localidad_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT fk_localidad_proveedor FOREIGN KEY (localidad) REFERENCES public.localidad(id_localidad) NOT VALID;


--
-- TOC entry 3293 (class 2606 OID 16555)
-- Name: pedido_proveedor fk_pedido_proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido_proveedor
    ADD CONSTRAINT fk_pedido_proveedor FOREIGN KEY (proveedor) REFERENCES public.proveedor(id_proveedor) NOT VALID;


--
-- TOC entry 3298 (class 2606 OID 16643)
-- Name: factura_proveedor fk_proveedor_factura-proveedor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura_proveedor
    ADD CONSTRAINT "fk_proveedor_factura-proveedor" FOREIGN KEY (proveedor) REFERENCES public.proveedor(id_proveedor) NOT VALID;


--
-- TOC entry 3301 (class 2606 OID 16668)
-- Name: suministra fk_proveedor_suministra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suministra
    ADD CONSTRAINT fk_proveedor_suministra FOREIGN KEY (proveedor) REFERENCES public.proveedor(id_proveedor) NOT VALID;


--
-- TOC entry 3289 (class 2606 OID 16511)
-- Name: detalle_factura_cliente fk_venta_factura_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_factura_cliente
    ADD CONSTRAINT fk_venta_factura_cliente FOREIGN KEY (venta_factura_cliente) REFERENCES public.venta_cliente(id_venta) NOT VALID;


--
-- TOC entry 3280 (class 2606 OID 16406)
-- Name: historico_articulo id_articulo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_articulo
    ADD CONSTRAINT id_articulo FOREIGN KEY (id_articulo) REFERENCES public.articulo(id_articulo) NOT VALID;


--
-- TOC entry 3281 (class 2606 OID 16423)
-- Name: comision id_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comision
    ADD CONSTRAINT id_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria) NOT VALID;


--
-- TOC entry 3282 (class 2606 OID 16442)
-- Name: cliente localidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT localidad FOREIGN KEY (localidad) REFERENCES public.localidad(id_localidad) NOT VALID;


--
-- TOC entry 3283 (class 2606 OID 16454)
-- Name: empleado localidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT localidad FOREIGN KEY (localidad) REFERENCES public.localidad(id_localidad) NOT VALID;


-- Completed on 2022-11-15 13:10:48

--
-- PostgreSQL database dump complete
--

