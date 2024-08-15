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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description character varying(40),
    galaxy_type character varying(30),
    angular_diameter numeric(4,1),
    name character varying(30) NOT NULL
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
-- Name: milky_way; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.milky_way (
    milky_way_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer
);


ALTER TABLE public.milky_way OWNER TO freecodecamp;

--
-- Name: milky_way_milky_way_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.milky_way_milky_way_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.milky_way_milky_way_id_seq OWNER TO freecodecamp;

--
-- Name: milky_way_milky_way_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.milky_way_milky_way_id_seq OWNED BY public.milky_way.milky_way_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    color character varying(30),
    satellite_of_planet character varying(30),
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
    planet_type text,
    has_life boolean,
    distance_from_earth_million_miles integer,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_million_years integer,
    is_low_mass boolean,
    stellar_brightness integer,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: milky_way milky_way_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milky_way ALTER COLUMN milky_way_id SET DEFAULT nextval('public.milky_way_milky_way_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'A small spiral galaxy in the Local Group', 'Spiral galaxy', 18.7, 'Triangulum Galaxy');
INSERT INTO public.galaxy VALUES (2, 'The largest member of the Local Group', ' Spiral galaxy', 220.0, 'Andromeda Galaxy');
INSERT INTO public.galaxy VALUES (3, 'Our home galaxy', 'Barred spiral galaxy', 30.0, 'Milky Way');
INSERT INTO public.galaxy VALUES (4, 'Located in the constellation Dorado', 'Irregular galaxy', 15.0, 'Large Magellanic Cloud');
INSERT INTO public.galaxy VALUES (5, 'A large galaxy in  constellation Virgo', 'Unbarred spiral galaxy', 5.5, 'Sombrero Galaxy');
INSERT INTO public.galaxy VALUES (6, 'A galaxy in the constellation Ursa Major', 'Face-on spiral galaxy', 8.5, 'Pinwheel Galaxy');


--
-- Data for Name: milky_way; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.milky_way VALUES (4, 'Leo', NULL);
INSERT INTO public.milky_way VALUES (6, 'Sculptor', NULL);
INSERT INTO public.milky_way VALUES (3, 'Centaurus', 1);
INSERT INTO public.milky_way VALUES (5, 'Cygnus', 6);
INSERT INTO public.milky_way VALUES (2, 'Orion', 3);
INSERT INTO public.milky_way VALUES (1, 'Canis Major', 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4500, 'grey-white', 'Earth', 3);
INSERT INTO public.moon VALUES (7, 'Dione', NULL, NULL, 'Saturn', 6);
INSERT INTO public.moon VALUES (8, 'Rhea', NULL, NULL, 'Saturn', 6);
INSERT INTO public.moon VALUES (9, 'Iapetus', NULL, NULL, 'Saturn', 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', NULL, NULL, 'Saturn', 6);
INSERT INTO public.moon VALUES (11, 'Mimas', NULL, NULL, 'Saturn', 6);
INSERT INTO public.moon VALUES (12, 'Hyperion', NULL, NULL, 'Saturn', 6);
INSERT INTO public.moon VALUES (13, 'Phoebe', NULL, NULL, 'Saturn', 6);
INSERT INTO public.moon VALUES (19, 'Daphnis', NULL, NULL, 'Saturn', 6);
INSERT INTO public.moon VALUES (20, 'Pan', NULL, NULL, 'Saturn', 6);
INSERT INTO public.moon VALUES (21, 'Tethys', NULL, NULL, 'Saturn', 6);
INSERT INTO public.moon VALUES (14, 'Umbriel', NULL, NULL, 'Uranus', 7);
INSERT INTO public.moon VALUES (15, 'Titania', NULL, NULL, 'Uranus', 7);
INSERT INTO public.moon VALUES (16, 'Oberon', NULL, NULL, 'Uranus', 7);
INSERT INTO public.moon VALUES (17, 'Miranda', NULL, NULL, 'Uranus', 7);
INSERT INTO public.moon VALUES (18, 'Ariel', NULL, NULL, 'Uranus', 7);
INSERT INTO public.moon VALUES (2, 'Ganymede', NULL, NULL, 'Jupiter', 5);
INSERT INTO public.moon VALUES (3, 'Callisto', NULL, NULL, 'Jupiter', 5);
INSERT INTO public.moon VALUES (4, 'Europa', NULL, NULL, 'Jupiter', 5);
INSERT INTO public.moon VALUES (5, 'Io', NULL, NULL, 'Jupiter', 5);
INSERT INTO public.moon VALUES (6, 'Triton', NULL, NULL, 'Neptune', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial planet', false, 58, 3);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial planet', false, 108, 3);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial planet', true, NULL, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial planet', false, 225, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas giant', false, 778, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant', false, 1430, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant', false, 2880, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant', false, 4460, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet', false, NULL, 3);
INSERT INTO public.planet VALUES (10, 'Ceres', 'Dwarf planet', false, NULL, 3);
INSERT INTO public.planet VALUES (11, 'Eris', 'Dwarf planet', false, NULL, 3);
INSERT INTO public.planet VALUES (12, 'Haumea', 'Dwarf planet', false, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 4850, true, 0, 3);
INSERT INTO public.star VALUES (2, 'Sirius', 300, true, 25, 3);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8, false, 100000, 3);
INSERT INTO public.star VALUES (4, 'Rigel', 10, false, 120000, 3);
INSERT INTO public.star VALUES (5, 'Antares', 20, false, 10000, 3);
INSERT INTO public.star VALUES (6, 'Deneb', 10, false, 100000, 3);
INSERT INTO public.star VALUES (7, 'Vega', 400, true, 40, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: milky_way_milky_way_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.milky_way_milky_way_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: milky_way milky_way_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milky_way
    ADD CONSTRAINT milky_way_name_key UNIQUE (name);


--
-- Name: milky_way milky_way_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milky_way
    ADD CONSTRAINT milky_way_pkey PRIMARY KEY (milky_way_id);


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
-- Name: milky_way milky_way_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.milky_way
    ADD CONSTRAINT milky_way_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

