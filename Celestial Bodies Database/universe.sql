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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_name character varying(40) NOT NULL,
    diameter_in_lightyear integer NOT NULL,
    mass_in_ton integer NOT NULL,
    rotation_time_in_year numeric,
    name character varying(40)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_cluster (
    name character varying(40),
    galaxy_cluster_id integer NOT NULL,
    diameter_in_lightyear integer NOT NULL,
    mass_in_ton integer NOT NULL
);


ALTER TABLE public.galaxy_cluster OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_galaxy_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    moon_name character varying(40) NOT NULL,
    diameter_in_lightyear integer NOT NULL,
    mass_in_ton integer NOT NULL,
    habitable boolean,
    name character varying(40),
    planet_name character varying(40) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_name character varying(40) NOT NULL,
    diameter_in_lightyear integer NOT NULL,
    mass_in_ton integer NOT NULL,
    habitable boolean,
    name character varying(40),
    star_name character varying(40) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_name character varying(40) NOT NULL,
    diameter_in_lightyear integer NOT NULL,
    mass_in_ton integer NOT NULL,
    color text,
    name character varying(40),
    galaxy_name character varying(40) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_galaxy_cluster_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 0, 0, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 0, 0, NULL);
INSERT INTO public.galaxy VALUES (3, 'Cigar', 37000, 0, 0, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 50000, 0, 0, NULL);
INSERT INTO public.galaxy VALUES (5, 'Tadpole', 280000, 0, 0, NULL);
INSERT INTO public.galaxy VALUES (6, 'Hoags Object', 100000, 0, 0, NULL);


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_cluster VALUES ('Virgo', 3, 0, 0);
INSERT INTO public.galaxy_cluster VALUES ('Fornax', 4, 0, 0);
INSERT INTO public.galaxy_cluster VALUES ('Antlia', 5, 0, 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'My Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (2, 'Our Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (3, 'New Moon Saga', 0, 0, true, NULL, 'Earth');
INSERT INTO public.moon VALUES (4, 'Moon 2.0', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (5, 'To The Moon', 0, 0, true, NULL, 'Earth');
INSERT INTO public.moon VALUES (6, 'Honey Moon', 0, 0, true, NULL, 'Earth');
INSERT INTO public.moon VALUES (7, 'Moonshine', 0, 0, true, NULL, 'Earth');
INSERT INTO public.moon VALUES (8, 'What Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (9, 'Wolf Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (10, 'Snow Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (11, 'Worm Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (12, 'Pink Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (13, 'Flower Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (14, 'Strawberry Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (15, 'Buck Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (16, 'Sturgeon Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (17, 'Harvest Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (18, 'Hunters Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (19, 'Beaver Moon', 0, 0, false, NULL, 'Earth');
INSERT INTO public.moon VALUES (20, 'Cold Moon', 0, 0, false, NULL, 'Earth');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 0, false, NULL, 'Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 0, 0, false, NULL, 'Sun');
INSERT INTO public.planet VALUES (3, 'Earth', 0, 0, true, NULL, 'Sun');
INSERT INTO public.planet VALUES (4, 'Mars', 0, 0, false, NULL, 'Sun');
INSERT INTO public.planet VALUES (5, 'Jupiter', 0, 0, false, NULL, 'Sun');
INSERT INTO public.planet VALUES (6, 'Saturn', 0, 0, false, NULL, 'Sun');
INSERT INTO public.planet VALUES (7, 'Uranus', 0, 0, false, NULL, 'Sun');
INSERT INTO public.planet VALUES (8, 'Neptune', 0, 0, false, NULL, 'Sun');
INSERT INTO public.planet VALUES (9, 'ET Planet 1', 0, 0, false, NULL, 'Sun');
INSERT INTO public.planet VALUES (10, 'ET Planet 2', 0, 0, false, NULL, 'Sun');
INSERT INTO public.planet VALUES (11, 'ET Planet 3', 0, 0, false, NULL, 'Sun');
INSERT INTO public.planet VALUES (12, 'ET Planet 4', 0, 0, false, NULL, 'Sun');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (6, 'Sun', 0, 0, 'Yellow', NULL, 'Milky Way');
INSERT INTO public.star VALUES (7, 'Death Star', 0, 0, 'Steel Gray', NULL, 'Andromeda');
INSERT INTO public.star VALUES (8, 'Spica', 0, 0, 'White', NULL, 'Cigar');
INSERT INTO public.star VALUES (9, 'Sirius B', 0, 0, 'White', NULL, 'Sombrero');
INSERT INTO public.star VALUES (10, 'Proxima Centauri', 0, 0, 'Red', NULL, 'Milky Way');
INSERT INTO public.star VALUES (11, 'Betelguese', 0, 0, 'Red', NULL, 'Hoags Object');


--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_cluster_galaxy_cluster_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: galaxy_cluster galaxy_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_name_key UNIQUE (name);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (moon_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (planet_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (star_name);


--
-- Name: moon moon_planet_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_name_fkey FOREIGN KEY (planet_name) REFERENCES public.planet(planet_name);


--
-- Name: planet planet_star_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_name_fkey FOREIGN KEY (star_name) REFERENCES public.star(star_name);


--
-- Name: star star_galaxy_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_name_fkey FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(galaxy_name);


--
-- PostgreSQL database dump complete
--

