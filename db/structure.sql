--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cohorts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cohorts (
    id integer NOT NULL,
    name character varying NOT NULL,
    program_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cohorts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cohorts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cohorts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cohorts_id_seq OWNED BY cohorts.id;


--
-- Name: lesson_recommendations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lesson_recommendations (
    id integer NOT NULL,
    lesson_id integer,
    program_mod_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: lesson_recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lesson_recommendations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lesson_recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lesson_recommendations_id_seq OWNED BY lesson_recommendations.id;


--
-- Name: lessons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lessons (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lessons_id_seq OWNED BY lessons.id;


--
-- Name: mods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mods (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: mods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mods_id_seq OWNED BY mods.id;


--
-- Name: program_mods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE program_mods (
    id integer NOT NULL,
    program_id integer,
    mod_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: program_mods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE program_mods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: program_mods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE program_mods_id_seq OWNED BY program_mods.id;


--
-- Name: programs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programs (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    abbreviation character varying
);


--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE programs_id_seq OWNED BY programs.id;


--
-- Name: scheduled_lessons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE scheduled_lessons (
    id integer NOT NULL,
    lesson_id integer,
    scheduled_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: scheduled_lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE scheduled_lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: scheduled_lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE scheduled_lessons_id_seq OWNED BY scheduled_lessons.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: suggested_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE suggested_topics (
    id integer NOT NULL,
    topic character varying NOT NULL,
    archived boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: suggested_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE suggested_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: suggested_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE suggested_topics_id_seq OWNED BY suggested_topics.id;


--
-- Name: user_votes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_votes (
    id integer NOT NULL,
    user_id integer,
    suggested_topic_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_votes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_votes_id_seq OWNED BY user_votes.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    email character varying NOT NULL,
    username character varying NOT NULL,
    password_digest character varying NOT NULL,
    cohort_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: cohorts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cohorts ALTER COLUMN id SET DEFAULT nextval('cohorts_id_seq'::regclass);


--
-- Name: lesson_recommendations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lesson_recommendations ALTER COLUMN id SET DEFAULT nextval('lesson_recommendations_id_seq'::regclass);


--
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lessons ALTER COLUMN id SET DEFAULT nextval('lessons_id_seq'::regclass);


--
-- Name: mods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mods ALTER COLUMN id SET DEFAULT nextval('mods_id_seq'::regclass);


--
-- Name: program_mods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_mods ALTER COLUMN id SET DEFAULT nextval('program_mods_id_seq'::regclass);


--
-- Name: programs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY programs ALTER COLUMN id SET DEFAULT nextval('programs_id_seq'::regclass);


--
-- Name: scheduled_lessons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY scheduled_lessons ALTER COLUMN id SET DEFAULT nextval('scheduled_lessons_id_seq'::regclass);


--
-- Name: suggested_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY suggested_topics ALTER COLUMN id SET DEFAULT nextval('suggested_topics_id_seq'::regclass);


--
-- Name: user_votes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_votes ALTER COLUMN id SET DEFAULT nextval('user_votes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cohorts cohorts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cohorts
    ADD CONSTRAINT cohorts_pkey PRIMARY KEY (id);


--
-- Name: lesson_recommendations lesson_recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lesson_recommendations
    ADD CONSTRAINT lesson_recommendations_pkey PRIMARY KEY (id);


--
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- Name: mods mods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mods
    ADD CONSTRAINT mods_pkey PRIMARY KEY (id);


--
-- Name: program_mods program_mods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_mods
    ADD CONSTRAINT program_mods_pkey PRIMARY KEY (id);


--
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: scheduled_lessons scheduled_lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY scheduled_lessons
    ADD CONSTRAINT scheduled_lessons_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: suggested_topics suggested_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY suggested_topics
    ADD CONSTRAINT suggested_topics_pkey PRIMARY KEY (id);


--
-- Name: user_votes user_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_votes
    ADD CONSTRAINT user_votes_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_cohorts_on_program_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cohorts_on_program_id ON cohorts USING btree (program_id);


--
-- Name: index_lesson_recommendations_on_lesson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_recommendations_on_lesson_id ON lesson_recommendations USING btree (lesson_id);


--
-- Name: index_lesson_recommendations_on_program_mod_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_lesson_recommendations_on_program_mod_id ON lesson_recommendations USING btree (program_mod_id);


--
-- Name: index_program_mods_on_mod_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_program_mods_on_mod_id ON program_mods USING btree (mod_id);


--
-- Name: index_program_mods_on_program_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_program_mods_on_program_id ON program_mods USING btree (program_id);


--
-- Name: index_scheduled_lessons_on_lesson_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_scheduled_lessons_on_lesson_id ON scheduled_lessons USING btree (lesson_id);


--
-- Name: index_user_votes_on_suggested_topic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_votes_on_suggested_topic_id ON user_votes USING btree (suggested_topic_id);


--
-- Name: index_user_votes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_user_votes_on_user_id ON user_votes USING btree (user_id);


--
-- Name: index_users_on_cohort_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_cohort_id ON users USING btree (cohort_id);


--
-- Name: program_mods fk_rails_1505f3cd86; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_mods
    ADD CONSTRAINT fk_rails_1505f3cd86 FOREIGN KEY (mod_id) REFERENCES mods(id);


--
-- Name: scheduled_lessons fk_rails_422dd557b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY scheduled_lessons
    ADD CONSTRAINT fk_rails_422dd557b1 FOREIGN KEY (lesson_id) REFERENCES lessons(id);


--
-- Name: user_votes fk_rails_54f8e1677c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_votes
    ADD CONSTRAINT fk_rails_54f8e1677c FOREIGN KEY (suggested_topic_id) REFERENCES suggested_topics(id);


--
-- Name: user_votes fk_rails_917cb3e60d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_votes
    ADD CONSTRAINT fk_rails_917cb3e60d FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: lesson_recommendations fk_rails_94a920bb24; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lesson_recommendations
    ADD CONSTRAINT fk_rails_94a920bb24 FOREIGN KEY (lesson_id) REFERENCES lessons(id);


--
-- Name: cohorts fk_rails_a140d90731; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cohorts
    ADD CONSTRAINT fk_rails_a140d90731 FOREIGN KEY (program_id) REFERENCES programs(id);


--
-- Name: lesson_recommendations fk_rails_a66c81e682; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lesson_recommendations
    ADD CONSTRAINT fk_rails_a66c81e682 FOREIGN KEY (program_mod_id) REFERENCES program_mods(id);


--
-- Name: users fk_rails_bb5c38f7a7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_bb5c38f7a7 FOREIGN KEY (cohort_id) REFERENCES cohorts(id);


--
-- Name: program_mods fk_rails_e67f1946ec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_mods
    ADD CONSTRAINT fk_rails_e67f1946ec FOREIGN KEY (program_id) REFERENCES programs(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20170305204234'),
('20170305204838'),
('20170305205125'),
('20170305205339'),
('20170305205517'),
('20170305205713'),
('20170305205814'),
('20170305210028'),
('20170305214658'),
('20170305214913'),
('20170305215457'),
('20170305220202'),
('20170305230548'),
('20170312205254');


