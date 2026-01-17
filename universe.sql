--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    type character varying(20),
    messier character varying(10),
    ngc character varying(10)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_galaxy_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovery_year integer,
    planet_id integer,
    discoverer character varying(20)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    aphelion_au numeric(5,2),
    perihelion_au numeric(5,2),
    orbital_speed_km_s numeric(5,2),
    discovery_year integer,
    comments text,
    rocky boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    spectral_type character varying(10),
    galaxy_id integer,
    has_known_planets boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_star_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_star_seq OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_star_seq OWNED BY public.star.star_id;


--
-- Name: tno; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.tno (
    tno_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovery_year integer NOT NULL
);


ALTER TABLE public.tno OWNER TO freecodecamp;

--
-- Name: tno_tno_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.tno_tno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tno_tno_id_seq OWNER TO freecodecamp;

--
-- Name: tno_tno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.tno_tno_id_seq OWNED BY public.tno.tno_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_galaxy_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_moon_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_planet_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_star_seq'::regclass);


--
-- Name: tno tno_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tno ALTER COLUMN tno_id SET DEFAULT nextval('public.tno_tno_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'barred spiral', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Cocoon', 'barred spiral', NULL, '4490');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'barred spiral', 'M31', '224');
INSERT INTO public.galaxy VALUES (4, 'Barnard', 'barred irregular', NULL, '6822');
INSERT INTO public.galaxy VALUES (5, 'Bode', 'grand design spiral', 'M81', '3031');
INSERT INTO public.galaxy VALUES (3, 'Coma Pinwheel', 'grand design spiral', 'M99', '4254');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 3, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 5, 'Galileo');
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 4, 'Hall');
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 4, 'Hall');
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 5, 'Galileo');
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, 5, 'Galileo');
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, 5, 'Galileo');
INSERT INTO public.moon VALUES (8, 'Amalthea', 1892, 5, 'Barnard');
INSERT INTO public.moon VALUES (9, 'Himalia', 1904, 5, 'Perrine');
INSERT INTO public.moon VALUES (10, 'Elara', 1905, 5, 'Perrine');
INSERT INTO public.moon VALUES (11, 'Pasiphae', 1908, 5, 'Melotte');
INSERT INTO public.moon VALUES (12, 'Sinope', 1914, 5, 'Nicholson');
INSERT INTO public.moon VALUES (13, 'Lysithea', 1938, 5, 'Nicholson');
INSERT INTO public.moon VALUES (14, 'Carme', 1938, 5, 'Nicholson');
INSERT INTO public.moon VALUES (15, 'Ananke', 1951, 5, 'Nicholson');
INSERT INTO public.moon VALUES (16, 'Leda', 1974, 5, 'Kowal');
INSERT INTO public.moon VALUES (17, 'Thebe', 1979, 5, 'Synnott');
INSERT INTO public.moon VALUES (18, 'Adrastea', 1979, 5, 'Jewitt');
INSERT INTO public.moon VALUES (19, 'Metis', 1979, 5, 'Synnott');
INSERT INTO public.moon VALUES (20, 'Mimas', 1789, 6, 'Herschel');
INSERT INTO public.moon VALUES (21, 'Enceladus', 1789, 6, 'Herschel');
INSERT INTO public.moon VALUES (22, 'Tethys', 1684, 6, 'Cassini');
INSERT INTO public.moon VALUES (23, 'Dione', 1684, 6, 'Cassini');
INSERT INTO public.moon VALUES (24, 'Rhea', 1672, 6, 'Cassini');
INSERT INTO public.moon VALUES (25, 'Titan', 1655, 6, 'Huygens');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Venus', 0.73, 0.72, 35.02, NULL, NULL, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.02, 0.98, 29.78, NULL, NULL, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1.67, 1.38, 24.07, NULL, NULL, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 10.12, 9.04, 9.68, NULL, NULL, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 20.10, 18.29, 6.80, 1781, NULL, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 30.33, 29.81, 5.45, 1846, NULL, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5.46, 4.95, 13.06, NULL, NULL, false, 1);
INSERT INTO public.planet VALUES (1, 'Mercury', 0.47, 0.31, 47.36, NULL, 'An anomaly with the precession which could not be explained with Newtonian mechanics was successfully explained by Einstein with his theory of relativity', true, 1);
INSERT INTO public.planet VALUES (9, 'Gamma Cephei Ab', NULL, NULL, NULL, 2002, NULL, NULL, 7);
INSERT INTO public.planet VALUES (10, '51 Pegasi b', NULL, NULL, NULL, 1995, NULL, NULL, 8);
INSERT INTO public.planet VALUES (11, 'OGLE-TR-56 b', NULL, NULL, NULL, 2002, NULL, NULL, 9);
INSERT INTO public.planet VALUES (12, '2M1207 b', NULL, NULL, NULL, 2005, NULL, NULL, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sirius', 'A0mA1 Va', 1, NULL);
INSERT INTO public.star VALUES (3, 'Vega', 'A0Va', 1, NULL);
INSERT INTO public.star VALUES (4, 'Aldebaran', 'K5+ III', 1, NULL);
INSERT INTO public.star VALUES (5, 'Procyon', 'F5 IV-V', 1, NULL);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'M1-M2', 1, NULL);
INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 1, true);
INSERT INTO public.star VALUES (7, 'Gamma Cephei A', 'K1II-Iv', 1, true);
INSERT INTO public.star VALUES (8, '51 Pegasi', 'G2V+', 1, true);
INSERT INTO public.star VALUES (9, 'OGLE-TR-56', 'G', 1, true);
INSERT INTO public.star VALUES (10, '2M1207', 'M8IVe', 1, true);


--
-- Data for Name: tno; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.tno VALUES (1, 'Pluto', 1930);
INSERT INTO public.tno VALUES (2, '15760 Albion', 1992);
INSERT INTO public.tno VALUES (3, 'Eris', 2005);
INSERT INTO public.tno VALUES (4, 'Haumea', 2004);
INSERT INTO public.tno VALUES (5, 'Makemake', 2005);
INSERT INTO public.tno VALUES (6, 'Quaoar', 2002);


--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_galaxy_seq', 6, true);


--
-- Name: moon_id_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_moon_seq', 25, true);


--
-- Name: planet_id_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_planet_seq', 12, true);


--
-- Name: star_id_star_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_star_seq', 10, true);


--
-- Name: tno_tno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.tno_tno_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: tno tno_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tno
    ADD CONSTRAINT tno_name_key UNIQUE (name);


--
-- Name: tno tno_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tno
    ADD CONSTRAINT tno_pkey PRIMARY KEY (tno_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

