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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1768250819488', 2, 818);
INSERT INTO public.users VALUES ('user_1768250819489', 5, 177);
INSERT INTO public.users VALUES ('user_1768250877000', 2, 489);
INSERT INTO public.users VALUES ('user_1768250877001', 5, 367);
INSERT INTO public.users VALUES ('user_1768250943227', 2, 365);
INSERT INTO public.users VALUES ('user_1768250943228', 5, 54);
INSERT INTO public.users VALUES ('Me', 2, 3);
INSERT INTO public.users VALUES ('user_1768251126856', 2, 174);
INSERT INTO public.users VALUES ('user_1768251126857', 5, 150);
INSERT INTO public.users VALUES ('user_1768251811912', 2, 287);
INSERT INTO public.users VALUES ('user_1768251811913', 5, 11);
INSERT INTO public.users VALUES ('Test', 5, 2);
INSERT INTO public.users VALUES ('user_1768251960753', 2, 304);
INSERT INTO public.users VALUES ('user_1768251960754', 5, 82);
INSERT INTO public.users VALUES ('user_1768252004250', 2, 852);
INSERT INTO public.users VALUES ('user_1768252004251', 5, 109);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

