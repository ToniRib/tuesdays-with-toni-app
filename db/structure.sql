--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cohorts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: lesson_recommendations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: lessons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: mods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: program_mods; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: programs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: scheduled_lessons; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: user_votes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_votes (
    id integer NOT NULL,
    user_id integer,
    voted_lesson_topic_id integer,
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
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
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
-- Name: voted_lesson_topics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE voted_lesson_topics (
    id integer NOT NULL,
    topic character varying NOT NULL,
    archived boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: voted_lesson_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE voted_lesson_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: voted_lesson_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE voted_lesson_topics_id_seq OWNED BY voted_lesson_topics.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cohorts ALTER COLUMN id SET DEFAULT nextval('cohorts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lesson_recommendations ALTER COLUMN id SET DEFAULT nextval('lesson_recommendations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lessons ALTER COLUMN id SET DEFAULT nextval('lessons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mods ALTER COLUMN id SET DEFAULT nextval('mods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_mods ALTER COLUMN id SET DEFAULT nextval('program_mods_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY programs ALTER COLUMN id SET DEFAULT nextval('programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY scheduled_lessons ALTER COLUMN id SET DEFAULT nextval('scheduled_lessons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_votes ALTER COLUMN id SET DEFAULT nextval('user_votes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY voted_lesson_topics ALTER COLUMN id SET DEFAULT nextval('voted_lesson_topics_id_seq'::regclass);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cohorts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cohorts
    ADD CONSTRAINT cohorts_pkey PRIMARY KEY (id);


--
-- Name: lesson_recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lesson_recommendations
    ADD CONSTRAINT lesson_recommendations_pkey PRIMARY KEY (id);


--
-- Name: lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- Name: mods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mods
    ADD CONSTRAINT mods_pkey PRIMARY KEY (id);


--
-- Name: program_mods_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY program_mods
    ADD CONSTRAINT program_mods_pkey PRIMARY KEY (id);


--
-- Name: programs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: scheduled_lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY scheduled_lessons
    ADD CONSTRAINT scheduled_lessons_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: user_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_votes
    ADD CONSTRAINT user_votes_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: voted_lesson_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY voted_lesson_topics
    ADD CONSTRAINT voted_lesson_topics_pkey PRIMARY KEY (id);


--
-- Name: index_cohorts_on_program_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cohorts_on_program_id ON cohorts USING btree (program_id);


--
-- Name: index_lesson_recommendations_on_lesson_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_lesson_recommendations_on_lesson_id ON lesson_recommendations USING btree (lesson_id);


--
-- Name: index_lesson_recommendations_on_program_mod_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_lesson_recommendations_on_program_mod_id ON lesson_recommendations USING btree (program_mod_id);


--
-- Name: index_program_mods_on_mod_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_program_mods_on_mod_id ON program_mods USING btree (mod_id);


--
-- Name: index_program_mods_on_program_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_program_mods_on_program_id ON program_mods USING btree (program_id);


--
-- Name: index_scheduled_lessons_on_lesson_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_scheduled_lessons_on_lesson_id ON scheduled_lessons USING btree (lesson_id);


--
-- Name: index_user_votes_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_votes_on_user_id ON user_votes USING btree (user_id);


--
-- Name: index_user_votes_on_voted_lesson_topic_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_votes_on_voted_lesson_topic_id ON user_votes USING btree (voted_lesson_topic_id);


--
-- Name: index_users_on_cohort_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_cohort_id ON users USING btree (cohort_id);


--
-- Name: fk_rails_1505f3cd86; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_mods
    ADD CONSTRAINT fk_rails_1505f3cd86 FOREIGN KEY (mod_id) REFERENCES mods(id);


--
-- Name: fk_rails_422dd557b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY scheduled_lessons
    ADD CONSTRAINT fk_rails_422dd557b1 FOREIGN KEY (lesson_id) REFERENCES lessons(id);


--
-- Name: fk_rails_54f8e1677c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_votes
    ADD CONSTRAINT fk_rails_54f8e1677c FOREIGN KEY (voted_lesson_topic_id) REFERENCES voted_lesson_topics(id);


--
-- Name: fk_rails_917cb3e60d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_votes
    ADD CONSTRAINT fk_rails_917cb3e60d FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_94a920bb24; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lesson_recommendations
    ADD CONSTRAINT fk_rails_94a920bb24 FOREIGN KEY (lesson_id) REFERENCES lessons(id);


--
-- Name: fk_rails_a140d90731; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cohorts
    ADD CONSTRAINT fk_rails_a140d90731 FOREIGN KEY (program_id) REFERENCES programs(id);


--
-- Name: fk_rails_a66c81e682; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lesson_recommendations
    ADD CONSTRAINT fk_rails_a66c81e682 FOREIGN KEY (program_mod_id) REFERENCES program_mods(id);


--
-- Name: fk_rails_bb5c38f7a7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_bb5c38f7a7 FOREIGN KEY (cohort_id) REFERENCES cohorts(id);


--
-- Name: fk_rails_e67f1946ec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_mods
    ADD CONSTRAINT fk_rails_e67f1946ec FOREIGN KEY (program_id) REFERENCES programs(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

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
('20170305230548');


