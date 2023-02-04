--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-01-26 12:53:30 IST

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 452 (class 1259 OID 17318)
-- Name: sales_1068; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_1068 (
    sale_id integer,
    product_id integer,
    year integer,
    quantity integer,
    price integer
);


ALTER TABLE public.sales_1068 OWNER TO postgres;

--
-- TOC entry 4554 (class 0 OID 17318)
-- Dependencies: 452
-- Data for Name: sales_1068; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sales_1068 (sale_id, product_id, year, quantity, price) VALUES (1, 100, 2008, 10, 5000);
INSERT INTO public.sales_1068 (sale_id, product_id, year, quantity, price) VALUES (2, 100, 2009, 12, 5000);
INSERT INTO public.sales_1068 (sale_id, product_id, year, quantity, price) VALUES (7, 200, 2011, 15, 9000);


-- Completed on 2023-01-26 12:53:31 IST

--
-- PostgreSQL database dump complete
--

