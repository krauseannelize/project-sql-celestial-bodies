--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    iau_abbreviation character varying(5) NOT NULL,
    area_square_degrees numeric,
    celestial_hemisphere character varying(10),
    meaning text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(30),
    size character varying(30),
    distance_ly integer,
    diameter_ly integer,
    constellation_id integer NOT NULL
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
    orbital_period_days numeric,
    is_tidally_locked boolean,
    planet_id integer NOT NULL
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
    type character varying(30),
    orbital_period_years numeric,
    surface_temperature_celsius integer,
    has_life boolean,
    has_water boolean,
    star_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    evolutionary_stage character varying(30),
    age_billions_years numeric,
    temperature_kelvin integer,
    part_of_cluster boolean,
    galaxy_id integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'Sgr', 867, 'Southern', 'Sagittarius is Latin for "archer" and is commonly represented as a centaur drawing a bow.');
INSERT INTO public.constellation VALUES (2, 'Andromeda', 'And', 722, 'Northern', 'Andromeda is known as "the Chained Lady" or "the Chained Woman". It is named for Andromeda, daughter of Cassiopeia, in the Greek myth, who was chained to a rock to be eaten by the sea monster Cetus.');
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 'UMa', 1280, 'Northern', 'Ursa Major is Latin for "Great Bear". It is one of the most recognizable constellations in the northern sky, containing the Big Dipper asterism.');
INSERT INTO public.constellation VALUES (4, 'Mensa', 'Men', 153, 'Southern', 'Mensa is Latin for "table" or "altar". It was originally named "Mons Mensae" (Table Mountain) by Nicolas Louis de Lacaille, after Table Mountain in South Africa.');
INSERT INTO public.constellation VALUES (5, 'Tucana', 'Tuc', 295, 'Southern', 'Tucana is named after the toucan, a South American bird.');
INSERT INTO public.constellation VALUES (6, 'Cassiopeia', 'Cas', 598, 'Northern', 'Cassiopeia is named after the vain queen Cassiopeia in Greek mythology, the wife of Cepheus and mother of Andromeda. It is easily recognized by its distinctive "W" shape.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 'Intermediate/Typical', 0, 100000, 1);
INSERT INTO public.galaxy VALUES (2, 'Ursa Major III', 'Dwarf Irregular', 'Dwarf', 330000, 1000, 3);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Dwarf Irregular', 'Dwarf', 158200, 14000, 4);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'Dwarf Irregular', 'Dwarf', 200000, 7000, 5);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 'Spiral', 'Intermediate/Typical', 2537000, 220000, 2);
INSERT INTO public.galaxy VALUES (6, 'Maffei 1', 'Elliptical', 'Giant', 10000000, 80000, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 27.3, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.3, true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1.3, true, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1.8, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3.6, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 7.2, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 16.7, true, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 0.5, true, 5);
INSERT INTO public.moon VALUES (9, 'Titan', 15.9, true, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 1.4, true, 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 0.9, true, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 1.9, true, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 2.7, true, 6);
INSERT INTO public.moon VALUES (14, 'Rhea', 4.5, true, 6);
INSERT INTO public.moon VALUES (15, 'Iapetus', 79.3, true, 6);
INSERT INTO public.moon VALUES (16, 'Hyperion', 21.3, false, 6);
INSERT INTO public.moon VALUES (17, 'Thebe', 0.7, true, 5);
INSERT INTO public.moon VALUES (18, 'Adrastea', 0.3, true, 5);
INSERT INTO public.moon VALUES (19, 'Metis', 0.4, true, 5);
INSERT INTO public.moon VALUES (20, 'Elara', 259.6, false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 0.24, 167, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 0.62, 464, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 1.00, 15, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 1.88, -63, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 11.86, -145, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 29.46, -178, false, false, 1);
INSERT INTO public.planet VALUES (7, 'TRAPPIST-1b', 'Terrestrial', 0.0151, 227, false, false, 2);
INSERT INTO public.planet VALUES (8, 'TRAPPIST-1c', 'Terrestrial', 0.0225, 221, false, true, 2);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Terrestrial', 0.03, -39, false, true, 3);
INSERT INTO public.planet VALUES (10, 'GJ 1214 b', 'Water World', 0.623, 280, false, true, 4);
INSERT INTO public.planet VALUES (11, 'Kepler-186 f', 'Terrestrial', 0.36, -85, false, true, 5);
INSERT INTO public.planet VALUES (12, 'upsilon Andromedae b', 'Hot Jupiter', 0.0048, NULL, false, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'G2V', 4.603, 5778, false, 1);
INSERT INTO public.star VALUES (2, 'TRAPPIST-1', 'Red Dwarf', 7.6, 2550, true, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Red Dwarf', 4.85, 3050, false, 1);
INSERT INTO public.star VALUES (4, 'GJ 1214', 'Red Dwarf', 8.0, 3250, false, 1);
INSERT INTO public.star VALUES (5, 'Kepler-186', 'Red Dwarf', 4.0, 3800, false, 1);
INSERT INTO public.star VALUES (6, 'υ Andromedae', 'F-type', 3.18, 6300, false, 5);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_iau_abbreviation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_iau_abbreviation_key UNIQUE (iau_abbreviation);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

