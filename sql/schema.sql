--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

-- Started on 2026-10-27 23:11:39 MSK

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
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 17447)
-- Name: cinemas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinemas (
    id bigint NOT NULL,
    "Название" text NOT NULL,
    "Адрес" text,
    "Телефон" character varying(20)
);


ALTER TABLE public.cinemas OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17446)
-- Name: cinemas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cinemas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cinemas_id_seq OWNER TO postgres;

--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 215
-- Name: cinemas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cinemas_id_seq OWNED BY public.cinemas.id;


--
-- TOC entry 218 (class 1259 OID 17465)
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    id bigint NOT NULL,
    "Название" text NOT NULL,
    "Год выхода" date NOT NULL,
    "Жанр" text,
    "Режисер" text,
    "Рейтинг" double precision
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17464)
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO postgres;

--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 217
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- TOC entry 226 (class 1259 OID 17527)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    spectator_id bigint,
    ticket_id bigint
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17526)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 225
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 222 (class 1259 OID 17493)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id bigint NOT NULL,
    "Дата и время" timestamp without time zone,
    "Зал" character varying(40),
    movie_id bigint,
    cinema_id bigint
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17492)
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO postgres;

--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 221
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- TOC entry 220 (class 1259 OID 17478)
-- Name: spectators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spectators (
    id bigint NOT NULL,
    "Имя" text,
    "Фамилия" text,
    "E-mail" text,
    "Телефон" character varying(20)
);


ALTER TABLE public.spectators OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17477)
-- Name: spectators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spectators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spectators_id_seq OWNER TO postgres;

--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 219
-- Name: spectators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spectators_id_seq OWNED BY public.spectators.id;


--
-- TOC entry 224 (class 1259 OID 17511)
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    id bigint NOT NULL,
    "Место" character varying(40),
    "Цена" numeric,
    session_id bigint,
    "Статус" text NOT NULL,
    CONSTRAINT "tickets_Статус_check" CHECK (("Статус" = ANY (ARRAY['продан'::text, 'доступен'::text])))
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17510)
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_seq OWNER TO postgres;

--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 223
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- TOC entry 3465 (class 2604 OID 17450)
-- Name: cinemas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinemas ALTER COLUMN id SET DEFAULT nextval('public.cinemas_id_seq'::regclass);


--
-- TOC entry 3466 (class 2604 OID 17468)
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- TOC entry 3470 (class 2604 OID 17530)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3468 (class 2604 OID 17496)
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- TOC entry 3467 (class 2604 OID 17481)
-- Name: spectators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spectators ALTER COLUMN id SET DEFAULT nextval('public.spectators_id_seq'::regclass);


--
-- TOC entry 3469 (class 2604 OID 17514)
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- TOC entry 3473 (class 2606 OID 17454)
-- Name: cinemas cinemas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinemas
    ADD CONSTRAINT cinemas_pkey PRIMARY KEY (id);


--
-- TOC entry 3475 (class 2606 OID 17458)
-- Name: cinemas cinemas_Адрес_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinemas
    ADD CONSTRAINT "cinemas_Адрес_key" UNIQUE ("Адрес");


--
-- TOC entry 3477 (class 2606 OID 17456)
-- Name: cinemas cinemas_Название_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinemas
    ADD CONSTRAINT "cinemas_Название_key" UNIQUE ("Название");


--
-- TOC entry 3479 (class 2606 OID 17460)
-- Name: cinemas cinemas_Телефон_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cinemas
    ADD CONSTRAINT "cinemas_Телефон_key" UNIQUE ("Телефон");


--
-- TOC entry 3486 (class 2606 OID 17472)
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- TOC entry 3488 (class 2606 OID 17474)
-- Name: movies movies_Название_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT "movies_Название_key" UNIQUE ("Название");


--
-- TOC entry 3512 (class 2606 OID 17532)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3502 (class 2606 OID 17498)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3493 (class 2606 OID 17487)
-- Name: spectators spectators_E-mail_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spectators
    ADD CONSTRAINT "spectators_E-mail_key" UNIQUE ("E-mail");


--
-- TOC entry 3495 (class 2606 OID 17485)
-- Name: spectators spectators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spectators
    ADD CONSTRAINT spectators_pkey PRIMARY KEY (id);


--
-- TOC entry 3497 (class 2606 OID 17489)
-- Name: spectators spectators_Телефон_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spectators
    ADD CONSTRAINT "spectators_Телефон_key" UNIQUE ("Телефон");


--
-- TOC entry 3508 (class 2606 OID 17519)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- TOC entry 3480 (class 1259 OID 17462)
-- Name: idx_cinemas_address; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cinemas_address ON public.cinemas USING btree ("Адрес");


--
-- TOC entry 3481 (class 1259 OID 17461)
-- Name: idx_cinemas_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cinemas_name ON public.cinemas USING btree ("Название");


--
-- TOC entry 3482 (class 1259 OID 17463)
-- Name: idx_cinemas_phone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cinemas_phone ON public.cinemas USING btree ("Телефон");


--
-- TOC entry 3483 (class 1259 OID 17475)
-- Name: idx_movies_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_movies_name ON public.movies USING btree ("Название");


--
-- TOC entry 3484 (class 1259 OID 17476)
-- Name: idx_movies_release_year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_movies_release_year ON public.movies USING btree ("Год выхода");


--
-- TOC entry 3509 (class 1259 OID 17546)
-- Name: idx_orders_spectator; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_spectator ON public.orders USING btree (spectator_id);


--
-- TOC entry 3510 (class 1259 OID 17547)
-- Name: idx_orders_ticket; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_ticket ON public.orders USING btree (ticket_id);


--
-- TOC entry 3498 (class 1259 OID 17509)
-- Name: idx_sessions_date_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sessions_date_time ON public.sessions USING btree ("Дата и время");


--
-- TOC entry 3499 (class 1259 OID 17549)
-- Name: idx_sessions_movie; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sessions_movie ON public.sessions USING btree (movie_id);


--
-- TOC entry 3500 (class 1259 OID 17544)
-- Name: idx_sessions_movie_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sessions_movie_id ON public.sessions USING btree (movie_id);


--
-- TOC entry 3489 (class 1259 OID 17490)
-- Name: idx_spectators_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spectators_email ON public.spectators USING btree ("E-mail");


--
-- TOC entry 3490 (class 1259 OID 17550)
-- Name: idx_spectators_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spectators_name ON public.spectators USING btree ("Имя", "Фамилия");


--
-- TOC entry 3491 (class 1259 OID 17491)
-- Name: idx_spectators_phone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spectators_phone ON public.spectators USING btree ("Телефон");


--
-- TOC entry 3503 (class 1259 OID 17551)
-- Name: idx_tickets_composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tickets_composite ON public.tickets USING btree (id, "Место", session_id);


--
-- TOC entry 3504 (class 1259 OID 17548)
-- Name: idx_tickets_session; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tickets_session ON public.tickets USING btree (session_id);


--
-- TOC entry 3505 (class 1259 OID 17545)
-- Name: idx_tickets_session_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tickets_session_id ON public.tickets USING btree (session_id);


--
-- TOC entry 3506 (class 1259 OID 17525)
-- Name: idx_tickets_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tickets_status ON public.tickets USING btree ("Статус");


--
-- TOC entry 3516 (class 2606 OID 17533)
-- Name: orders orders_spectator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_spectator_id_fkey FOREIGN KEY (spectator_id) REFERENCES public.spectators(id);


--
-- TOC entry 3517 (class 2606 OID 17538)
-- Name: orders orders_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id);


--
-- TOC entry 3513 (class 2606 OID 17504)
-- Name: sessions sessions_cinema_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_cinema_id_fkey FOREIGN KEY (cinema_id) REFERENCES public.cinemas(id);


--
-- TOC entry 3514 (class 2606 OID 17499)
-- Name: sessions sessions_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);


--
-- TOC entry 3515 (class 2606 OID 17520)
-- Name: tickets tickets_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_session_id_fkey FOREIGN KEY (session_id) REFERENCES public.sessions(id);


-- Completed on 2026-10-27 23:11:40 MSK

--
-- PostgreSQL database dump complete
--

