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
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    description text,
    shape character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

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
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    is_spherical boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    distance_from_earth_in_million_km numeric(1000,1),
    has_life boolean,
    star_id integer
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
-- Name: space_missions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_missions (
    space_missions_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year integer,
    successful boolean,
    planet_id integer
);


ALTER TABLE public.space_missions OWNER TO freecodecamp;

--
-- Name: space_missions_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_missions_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_missions_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_missions_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_missions_mission_id_seq OWNED BY public.space_missions.space_missions_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    galaxy_id integer,
    type character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_planet_id_seq OWNER TO freecodecamp;

--
-- Name: star_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_planet_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_missions space_missions_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_missions ALTER COLUMN space_missions_id SET DEFAULT nextval('public.space_missions_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_planet_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 14, 'Is the galaxy that contains our solar system', 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10, 'Nearest major galaxy to the Milky Way, 2.5 million light years from Earth', 'spiral');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 13, 'Spiral galaxy located in constellation Virgo', 'elliptical');
INSERT INTO public.galaxy VALUES (4, 'Canis Major Dwarf', 7, 'Small and irregulary shaped galaxy', 'elliptical');
INSERT INTO public.galaxy VALUES (5, 'Maffei I', NULL, 'Massive elliptical galaxy in the constellation Cassiopeia', 'elliptical');
INSERT INTO public.galaxy VALUES (6, 'Cigar', NULL, 'Starbust galaxyy in the constallation Ursa Major', 'elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 1, false, 2);
INSERT INTO public.moon VALUES (2, 'Deimos', 1, false, 2);
INSERT INTO public.moon VALUES (3, 'Europa', 4, true, 4);
INSERT INTO public.moon VALUES (4, 'Gaminedes', 4, true, 4);
INSERT INTO public.moon VALUES (5, 'Calisto', 4, true, 4);
INSERT INTO public.moon VALUES (6, 'Amaltea', 4, true, 4);
INSERT INTO public.moon VALUES (7, 'Cilene', 4, true, 4);
INSERT INTO public.moon VALUES (8, 'Titan', 4, true, 6);
INSERT INTO public.moon VALUES (9, 'Mimas', 4, true, 6);
INSERT INTO public.moon VALUES (10, 'Dione', 4, true, 6);
INSERT INTO public.moon VALUES (11, 'Tetis', 4, true, 6);
INSERT INTO public.moon VALUES (12, 'Hiperion', 4, false, 6);
INSERT INTO public.moon VALUES (13, 'Febe', 4, false, 6);
INSERT INTO public.moon VALUES (14, 'Dafne', 4, false, 6);
INSERT INTO public.moon VALUES (15, 'Titania', 4, true, 7);
INSERT INTO public.moon VALUES (16, 'Miranda', 4, true, 7);
INSERT INTO public.moon VALUES (17, 'Triton', 4, true, 8);
INSERT INTO public.moon VALUES (18, 'Nereida', 4, false, 8);
INSERT INTO public.moon VALUES (19, 'Caronte', 4, true, 9);
INSERT INTO public.moon VALUES (20, 'Cerbero', 4, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Venus', 4, 61.0, false, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4, 401.0, false, 1);
INSERT INTO public.planet VALUES (3, 'Mercurio', 4, 48.0, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 4, 716.0, false, 1);
INSERT INTO public.planet VALUES (5, 'Ceres', 4, 484.0, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturno', 4, 887.0, false, 1);
INSERT INTO public.planet VALUES (7, 'Urano', 4, 988.0, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptuno', 4, 889.0, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 4, 999.0, false, 1);
INSERT INTO public.planet VALUES (10, 'Haumea', 4, 768.0, false, 1);
INSERT INTO public.planet VALUES (11, 'Eris', 4, 776.0, false, 1);
INSERT INTO public.planet VALUES (12, 'Sedna', 4, 556.0, false, 1);
INSERT INTO public.planet VALUES (13, 'Phatie', 4, 945.0, false, 1);


--
-- Data for Name: space_missions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_missions VALUES (1, 'InSight', 2018, true, 2);
INSERT INTO public.space_missions VALUES (2, 'BepiColombo', 2018, true, 3);
INSERT INTO public.space_missions VALUES (3, 'ExoMars', 2020, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4, 1, 'Yellow dwarf');
INSERT INTO public.star VALUES (2, 'Alpheratz', 70, 2, 'Blue');
INSERT INTO public.star VALUES (6, 'Andromedae', 60, 2, 'Blue');
INSERT INTO public.star VALUES (3, 'Canis Majoris', 4, 1, 'Red supergiant');
INSERT INTO public.star VALUES (4, 'Antares', 11, 1, 'Red supergiant');
INSERT INTO public.star VALUES (5, 'Mirach', NULL, 2, 'Red supergiant');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: space_missions_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_missions_mission_id_seq', 3, true);


--
-- Name: star_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_planet_id_seq', 6, true);


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
-- Name: space_missions space_missions_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_missions
    ADD CONSTRAINT space_missions_name_key UNIQUE (name);


--
-- Name: space_missions space_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_missions
    ADD CONSTRAINT space_missions_pkey PRIMARY KEY (space_missions_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: space_missions space_missions_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_missions
    ADD CONSTRAINT space_missions_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey1 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

