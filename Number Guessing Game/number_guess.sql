--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: main; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.main (
    id integer NOT NULL,
    username character varying(60) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.main OWNER TO freecodecamp;

--
-- Name: main_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.main_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_id_seq OWNER TO freecodecamp;

--
-- Name: main_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.main_id_seq OWNED BY public.main.id;


--
-- Name: main id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.main ALTER COLUMN id SET DEFAULT nextval('public.main_id_seq'::regclass);


--
-- Data for Name: main; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.main VALUES (27, 'user_1663665720204', 2, 623);
INSERT INTO public.main VALUES (26, 'user_1663665720205', 5, 191);
INSERT INTO public.main VALUES (29, 'user_1663665739237', 2, 201);
INSERT INTO public.main VALUES (28, 'user_1663665739238', 5, 451);
INSERT INTO public.main VALUES (31, 'user_1663665796041', 2, 463);
INSERT INTO public.main VALUES (30, 'user_1663665796042', 5, 154);
INSERT INTO public.main VALUES (33, 'user_1663665838611', 2, 120);
INSERT INTO public.main VALUES (32, 'user_1663665838612', 5, 16);


--
-- Name: main_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.main_id_seq', 33, true);


--
-- Name: main main_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_pkey PRIMARY KEY (id);


--
-- Name: main main_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.main
    ADD CONSTRAINT main_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

