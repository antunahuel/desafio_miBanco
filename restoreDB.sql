toc.dat                                                                                             0000600 0004000 0002000 00000014047 14635414406 0014454 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                       |            db_bank_review    16.2    16.2     �           0    0    ENCODING    ENCODING         SET client_encoding = 'LATIN1';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    32345    db_bank_review    DATABASE     �   CREATE DATABASE db_bank_review WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE db_bank_review;
                postgres    false         �            1259    32948    cuentas    TABLE     �   CREATE TABLE public.cuentas (
    id integer NOT NULL,
    n_cuenta integer NOT NULL,
    saldo numeric(11,2),
    CONSTRAINT cuentas_saldo_check CHECK ((saldo >= (0)::numeric))
);
    DROP TABLE public.cuentas;
       public         heap    postgres    false         �            1259    32947    cuentas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cuentas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.cuentas_id_seq;
       public          postgres    false    216         �           0    0    cuentas_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.cuentas_id_seq OWNED BY public.cuentas.id;
          public          postgres    false    215         �            1259    33057    transferencias    TABLE     =  CREATE TABLE public.transferencias (
    id_trans integer NOT NULL,
    fecha date DEFAULT CURRENT_DATE,
    hora time without time zone DEFAULT CURRENT_TIME,
    glosa text DEFAULT 'transaccion realizada'::text,
    monto integer DEFAULT 0,
    n_cta_origen integer DEFAULT 0,
    n_cta_destino integer DEFAULT 0
);
 "   DROP TABLE public.transferencias;
       public         heap    postgres    false         �            1259    33056    transferencias_id_trans_seq    SEQUENCE     �   CREATE SEQUENCE public.transferencias_id_trans_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.transferencias_id_trans_seq;
       public          postgres    false    218                     0    0    transferencias_id_trans_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.transferencias_id_trans_seq OWNED BY public.transferencias.id_trans;
          public          postgres    false    217         U           2604    32951 
   cuentas id    DEFAULT     h   ALTER TABLE ONLY public.cuentas ALTER COLUMN id SET DEFAULT nextval('public.cuentas_id_seq'::regclass);
 9   ALTER TABLE public.cuentas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216         V           2604    33060    transferencias id_trans    DEFAULT     �   ALTER TABLE ONLY public.transferencias ALTER COLUMN id_trans SET DEFAULT nextval('public.transferencias_id_trans_seq'::regclass);
 F   ALTER TABLE public.transferencias ALTER COLUMN id_trans DROP DEFAULT;
       public          postgres    false    217    218    218         �          0    32948    cuentas 
   TABLE DATA           6   COPY public.cuentas (id, n_cuenta, saldo) FROM stdin;
    public          postgres    false    216       4854.dat �          0    33057    transferencias 
   TABLE DATA           j   COPY public.transferencias (id_trans, fecha, hora, glosa, monto, n_cta_origen, n_cta_destino) FROM stdin;
    public          postgres    false    218       4856.dat            0    0    cuentas_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.cuentas_id_seq', 2, true);
          public          postgres    false    215                    0    0    transferencias_id_trans_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.transferencias_id_trans_seq', 14, true);
          public          postgres    false    217         _           2606    32956    cuentas cuentas_n_cuenta_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_n_cuenta_key UNIQUE (n_cuenta);
 F   ALTER TABLE ONLY public.cuentas DROP CONSTRAINT cuentas_n_cuenta_key;
       public            postgres    false    216         a           2606    32954    cuentas cuentas_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cuentas DROP CONSTRAINT cuentas_pkey;
       public            postgres    false    216         c           2606    33070 "   transferencias transferencias_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.transferencias
    ADD CONSTRAINT transferencias_pkey PRIMARY KEY (id_trans);
 L   ALTER TABLE ONLY public.transferencias DROP CONSTRAINT transferencias_pkey;
       public            postgres    false    218         d           2606    33076 0   transferencias transferencias_n_cta_destino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transferencias
    ADD CONSTRAINT transferencias_n_cta_destino_fkey FOREIGN KEY (n_cta_destino) REFERENCES public.cuentas(id);
 Z   ALTER TABLE ONLY public.transferencias DROP CONSTRAINT transferencias_n_cta_destino_fkey;
       public          postgres    false    218    216    4705         e           2606    33071 /   transferencias transferencias_n_cta_origen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transferencias
    ADD CONSTRAINT transferencias_n_cta_origen_fkey FOREIGN KEY (n_cta_origen) REFERENCES public.cuentas(id);
 Y   ALTER TABLE ONLY public.transferencias DROP CONSTRAINT transferencias_n_cta_origen_fkey;
       public          postgres    false    4705    218    216                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 4854.dat                                                                                            0000600 0004000 0002000 00000000045 14635414406 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	333	121300.00
1	222	178700.00
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4856.dat                                                                                            0000600 0004000 0002000 00000001533 14635414406 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2024-06-21	18:59:03.8637	transaccion realizada	5000	1	2
2	2024-06-21	19:00:06.916611	transaccion realizada	30000	1	2
3	2024-06-21	19:02:26.393993	transaccion realizada	27000	2	1
4	2024-06-21	19:03:08.617428	transaccion realizada	45000	2	1
5	2024-06-21	19:03:36.317269	transaccion realizada	100000	2	1
6	2024-06-21	19:04:22.488416	transaccion realizada	40000	1	2
7	2024-06-21	19:05:05.693045	transaccion realizada	7200	1	2
8	2024-06-21	19:05:44.083148	transaccion realizada	100000	1	2
9	2024-06-21	19:06:13.506237	transaccion realizada	29000	1	2
10	2024-06-21	19:12:27.656902	transaccion realizada	700	1	2
11	2024-06-21	19:13:10.246903	transaccion realizada	88800	2	1
12	2024-06-21	19:13:35.761083	transaccion realizada	37800	2	1
13	2024-06-21	19:14:25.11784	transaccion realizada	26000	2	1
14	2024-06-21	19:26:38.773839	transaccion realizada	26000	2	1
\.


                                                                                                                                                                     restore.sql                                                                                         0000600 0004000 0002000 00000012452 14635414406 0015377 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE db_bank_review;
--
-- Name: db_bank_review; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_bank_review WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE db_bank_review OWNER TO postgres;

\connect db_bank_review

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cuentas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas (
    id integer NOT NULL,
    n_cuenta integer NOT NULL,
    saldo numeric(11,2),
    CONSTRAINT cuentas_saldo_check CHECK ((saldo >= (0)::numeric))
);


ALTER TABLE public.cuentas OWNER TO postgres;

--
-- Name: cuentas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuentas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cuentas_id_seq OWNER TO postgres;

--
-- Name: cuentas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuentas_id_seq OWNED BY public.cuentas.id;


--
-- Name: transferencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transferencias (
    id_trans integer NOT NULL,
    fecha date DEFAULT CURRENT_DATE,
    hora time without time zone DEFAULT CURRENT_TIME,
    glosa text DEFAULT 'transaccion realizada'::text,
    monto integer DEFAULT 0,
    n_cta_origen integer DEFAULT 0,
    n_cta_destino integer DEFAULT 0
);


ALTER TABLE public.transferencias OWNER TO postgres;

--
-- Name: transferencias_id_trans_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transferencias_id_trans_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transferencias_id_trans_seq OWNER TO postgres;

--
-- Name: transferencias_id_trans_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transferencias_id_trans_seq OWNED BY public.transferencias.id_trans;


--
-- Name: cuentas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas ALTER COLUMN id SET DEFAULT nextval('public.cuentas_id_seq'::regclass);


--
-- Name: transferencias id_trans; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias ALTER COLUMN id_trans SET DEFAULT nextval('public.transferencias_id_trans_seq'::regclass);


--
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuentas (id, n_cuenta, saldo) FROM stdin;
\.
COPY public.cuentas (id, n_cuenta, saldo) FROM '$$PATH$$/4854.dat';

--
-- Data for Name: transferencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transferencias (id_trans, fecha, hora, glosa, monto, n_cta_origen, n_cta_destino) FROM stdin;
\.
COPY public.transferencias (id_trans, fecha, hora, glosa, monto, n_cta_origen, n_cta_destino) FROM '$$PATH$$/4856.dat';

--
-- Name: cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuentas_id_seq', 2, true);


--
-- Name: transferencias_id_trans_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transferencias_id_trans_seq', 14, true);


--
-- Name: cuentas cuentas_n_cuenta_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_n_cuenta_key UNIQUE (n_cuenta);


--
-- Name: cuentas cuentas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_pkey PRIMARY KEY (id);


--
-- Name: transferencias transferencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias
    ADD CONSTRAINT transferencias_pkey PRIMARY KEY (id_trans);


--
-- Name: transferencias transferencias_n_cta_destino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias
    ADD CONSTRAINT transferencias_n_cta_destino_fkey FOREIGN KEY (n_cta_destino) REFERENCES public.cuentas(id);


--
-- Name: transferencias transferencias_n_cta_origen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias
    ADD CONSTRAINT transferencias_n_cta_origen_fkey FOREIGN KEY (n_cta_origen) REFERENCES public.cuentas(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      