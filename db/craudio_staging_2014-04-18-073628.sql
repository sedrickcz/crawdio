--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

DROP INDEX public.unique_schema_migrations;
DROP INDEX public.index_seo_meta_on_id;
DROP INDEX public.index_refinery_users_on_slug;
DROP INDEX public.index_refinery_users_on_id;
DROP INDEX public.index_refinery_user_plugins_on_user_id_and_name;
DROP INDEX public.index_refinery_user_plugins_on_name;
DROP INDEX public.index_refinery_roles_users_on_user_id_and_role_id;
DROP INDEX public.index_refinery_roles_users_on_role_id_and_user_id;
DROP INDEX public.index_refinery_pages_on_rgt;
DROP INDEX public.index_refinery_pages_on_parent_id;
DROP INDEX public.index_refinery_pages_on_lft;
DROP INDEX public.index_refinery_pages_on_id;
DROP INDEX public.index_refinery_pages_on_depth;
DROP INDEX public.index_refinery_page_translations_on_refinery_page_id;
DROP INDEX public.index_refinery_page_translations_on_locale;
DROP INDEX public.index_refinery_page_parts_on_refinery_page_id;
DROP INDEX public.index_refinery_page_parts_on_id;
DROP INDEX public.index_refinery_page_part_translations_on_refinery_page_part_id;
DROP INDEX public.index_refinery_page_part_translations_on_locale;
DROP INDEX public.id_type_index_on_seo_meta;
ALTER TABLE ONLY public.user_pledges DROP CONSTRAINT user_pledges_pkey;
ALTER TABLE ONLY public.seo_meta DROP CONSTRAINT seo_meta_pkey;
ALTER TABLE ONLY public.refinery_users DROP CONSTRAINT refinery_users_pkey;
ALTER TABLE ONLY public.refinery_user_plugins DROP CONSTRAINT refinery_user_plugins_pkey;
ALTER TABLE ONLY public.refinery_user_histories DROP CONSTRAINT refinery_user_histories_pkey;
ALTER TABLE ONLY public.refinery_tiers DROP CONSTRAINT refinery_tiers_pkey;
ALTER TABLE ONLY public.refinery_roles DROP CONSTRAINT refinery_roles_pkey;
ALTER TABLE ONLY public.refinery_resources DROP CONSTRAINT refinery_resources_pkey;
ALTER TABLE ONLY public.refinery_projects DROP CONSTRAINT refinery_projects_pkey;
ALTER TABLE ONLY public.refinery_pages DROP CONSTRAINT refinery_pages_pkey;
ALTER TABLE ONLY public.refinery_page_translations DROP CONSTRAINT refinery_page_translations_pkey;
ALTER TABLE ONLY public.refinery_page_parts DROP CONSTRAINT refinery_page_parts_pkey;
ALTER TABLE ONLY public.refinery_page_part_translations DROP CONSTRAINT refinery_page_part_translations_pkey;
ALTER TABLE ONLY public.refinery_orders DROP CONSTRAINT refinery_orders_pkey;
ALTER TABLE ONLY public.refinery_images DROP CONSTRAINT refinery_images_pkey;
ALTER TABLE public.user_pledges ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.seo_meta ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.refinery_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.refinery_user_plugins ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.refinery_user_histories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.refinery_tiers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.refinery_roles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.refinery_resources ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.refinery_projects ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.refinery_pages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.refinery_page_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.refinery_page_parts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.refinery_page_part_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.refinery_orders ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.refinery_images ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.user_pledges_id_seq;
DROP TABLE public.user_pledges;
DROP SEQUENCE public.seo_meta_id_seq;
DROP TABLE public.seo_meta;
DROP TABLE public.schema_migrations;
DROP SEQUENCE public.refinery_users_id_seq;
DROP TABLE public.refinery_users;
DROP SEQUENCE public.refinery_user_plugins_id_seq;
DROP TABLE public.refinery_user_plugins;
DROP SEQUENCE public.refinery_user_histories_id_seq;
DROP TABLE public.refinery_user_histories;
DROP SEQUENCE public.refinery_tiers_id_seq;
DROP TABLE public.refinery_tiers;
DROP TABLE public.refinery_roles_users;
DROP SEQUENCE public.refinery_roles_id_seq;
DROP TABLE public.refinery_roles;
DROP SEQUENCE public.refinery_resources_id_seq;
DROP TABLE public.refinery_resources;
DROP SEQUENCE public.refinery_projects_id_seq;
DROP TABLE public.refinery_projects;
DROP SEQUENCE public.refinery_pages_id_seq;
DROP TABLE public.refinery_pages;
DROP SEQUENCE public.refinery_page_translations_id_seq;
DROP TABLE public.refinery_page_translations;
DROP SEQUENCE public.refinery_page_parts_id_seq;
DROP TABLE public.refinery_page_parts;
DROP SEQUENCE public.refinery_page_part_translations_id_seq;
DROP TABLE public.refinery_page_part_translations;
DROP SEQUENCE public.refinery_orders_id_seq;
DROP TABLE public.refinery_orders;
DROP SEQUENCE public.refinery_images_id_seq;
DROP TABLE public.refinery_images;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


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
-- Name: refinery_images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_images (
    id integer NOT NULL,
    image_mime_type character varying(255),
    image_name character varying(255),
    image_size integer,
    image_width integer,
    image_height integer,
    image_uid character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_images_id_seq OWNED BY refinery_images.id;


--
-- Name: refinery_orders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_orders (
    id integer NOT NULL,
    user_id integer,
    tier_id integer,
    price double precision,
    paid boolean,
    paid_at timestamp without time zone,
    pay_type character varying(255),
    payment_id integer,
    email character varying(255),
    tier_name character varying(255),
    name character varying(255),
    street character varying(255),
    city character varying(255),
    country character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    payment_status character varying(255),
    cart_id integer,
    transaction_id character varying(255),
    platform_1 character varying(255),
    platform_2 character varying(255),
    tshirt character varying(255),
    ingame_name character varying(255),
    sword_legal boolean DEFAULT false,
    agree boolean DEFAULT false,
    state_code character varying(255),
    zip character varying(255)
);


--
-- Name: refinery_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_orders_id_seq OWNED BY refinery_orders.id;


--
-- Name: refinery_page_part_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_page_part_translations (
    id integer NOT NULL,
    refinery_page_part_id integer,
    locale character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    body text
);


--
-- Name: refinery_page_part_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_page_part_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_page_part_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_page_part_translations_id_seq OWNED BY refinery_page_part_translations.id;


--
-- Name: refinery_page_parts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_page_parts (
    id integer NOT NULL,
    refinery_page_id integer,
    title character varying(255),
    body text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_page_parts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_page_parts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_page_parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_page_parts_id_seq OWNED BY refinery_page_parts.id;


--
-- Name: refinery_page_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_page_translations (
    id integer NOT NULL,
    refinery_page_id integer,
    locale character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying(255),
    custom_slug character varying(255),
    menu_title character varying(255),
    slug character varying(255)
);


--
-- Name: refinery_page_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_page_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_page_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_page_translations_id_seq OWNED BY refinery_page_translations.id;


--
-- Name: refinery_pages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_pages (
    id integer NOT NULL,
    parent_id integer,
    path character varying(255),
    slug character varying(255),
    show_in_menu boolean DEFAULT true,
    link_url character varying(255),
    menu_match character varying(255),
    deletable boolean DEFAULT true,
    draft boolean DEFAULT false,
    skip_to_first_child boolean DEFAULT false,
    lft integer,
    rgt integer,
    depth integer,
    view_template character varying(255),
    layout_template character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_pages_id_seq OWNED BY refinery_pages.id;


--
-- Name: refinery_projects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_projects (
    id integer NOT NULL,
    title character varying(255),
    short_description text,
    long_description text,
    goal double precision,
    main_image_id integer,
    image_1_id integer,
    image_2_id integer,
    image_3_id integer,
    image_4_id integer,
    image_5_id integer,
    active boolean,
    video character varying(255),
    faq text,
    terms text,
    updates text,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    goal_text text
);


--
-- Name: refinery_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_projects_id_seq OWNED BY refinery_projects.id;


--
-- Name: refinery_resources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_resources (
    id integer NOT NULL,
    file_mime_type character varying(255),
    file_name character varying(255),
    file_size integer,
    file_uid character varying(255),
    file_ext character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_resources_id_seq OWNED BY refinery_resources.id;


--
-- Name: refinery_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_roles (
    id integer NOT NULL,
    title character varying(255)
);


--
-- Name: refinery_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_roles_id_seq OWNED BY refinery_roles.id;


--
-- Name: refinery_roles_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_roles_users (
    user_id integer,
    role_id integer
);


--
-- Name: refinery_tiers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_tiers (
    id integer NOT NULL,
    title character varying(255),
    price double precision,
    "limit" integer,
    physical boolean,
    short_description text,
    long_description text,
    active boolean,
    image_1_id integer,
    image_2_id integer,
    image_3_id integer,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project_id integer,
    platform_1 boolean DEFAULT false,
    platform_2 boolean DEFAULT false,
    tshirt boolean DEFAULT false,
    ingame_name boolean DEFAULT false,
    sword_legal boolean DEFAULT false,
    side_text text,
    price_text text
);


--
-- Name: refinery_tiers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_tiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_tiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_tiers_id_seq OWNED BY refinery_tiers.id;


--
-- Name: refinery_user_histories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_user_histories (
    id integer NOT NULL,
    user_id integer,
    field character varying(255),
    original_value character varying(255),
    new_value character varying(255),
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: refinery_user_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_user_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_user_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_user_histories_id_seq OWNED BY refinery_user_histories.id;


--
-- Name: refinery_user_plugins; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_user_plugins (
    id integer NOT NULL,
    user_id integer,
    name character varying(255),
    "position" integer
);


--
-- Name: refinery_user_plugins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_user_plugins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_user_plugins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_user_plugins_id_seq OWNED BY refinery_user_plugins.id;


--
-- Name: refinery_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE refinery_users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    encrypted_password character varying(255) NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    sign_in_count integer,
    remember_created_at timestamp without time zone,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying(255),
    name character varying(255),
    street character varying(255),
    city character varying(255),
    country character varying(255),
    activated boolean DEFAULT false,
    activation_token character varying(255),
    age integer DEFAULT 0,
    state_code character varying(255),
    zip character varying(255)
);


--
-- Name: refinery_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refinery_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refinery_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refinery_users_id_seq OWNED BY refinery_users.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: seo_meta; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE seo_meta (
    id integer NOT NULL,
    seo_meta_id integer,
    seo_meta_type character varying(255),
    browser_title character varying(255),
    meta_description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: seo_meta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE seo_meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seo_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE seo_meta_id_seq OWNED BY seo_meta.id;


--
-- Name: user_pledges; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_pledges (
    id integer NOT NULL,
    user_id integer,
    tier_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_pledges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_pledges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_pledges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_pledges_id_seq OWNED BY user_pledges.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_images ALTER COLUMN id SET DEFAULT nextval('refinery_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_orders ALTER COLUMN id SET DEFAULT nextval('refinery_orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_page_part_translations ALTER COLUMN id SET DEFAULT nextval('refinery_page_part_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_page_parts ALTER COLUMN id SET DEFAULT nextval('refinery_page_parts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_page_translations ALTER COLUMN id SET DEFAULT nextval('refinery_page_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_pages ALTER COLUMN id SET DEFAULT nextval('refinery_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_projects ALTER COLUMN id SET DEFAULT nextval('refinery_projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_resources ALTER COLUMN id SET DEFAULT nextval('refinery_resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_roles ALTER COLUMN id SET DEFAULT nextval('refinery_roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_tiers ALTER COLUMN id SET DEFAULT nextval('refinery_tiers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_user_histories ALTER COLUMN id SET DEFAULT nextval('refinery_user_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_user_plugins ALTER COLUMN id SET DEFAULT nextval('refinery_user_plugins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refinery_users ALTER COLUMN id SET DEFAULT nextval('refinery_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY seo_meta ALTER COLUMN id SET DEFAULT nextval('seo_meta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_pledges ALTER COLUMN id SET DEFAULT nextval('user_pledges_id_seq'::regclass);


--
-- Data for Name: refinery_images; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_images (id, image_mime_type, image_name, image_size, image_width, image_height, image_uid, created_at, updated_at) FROM stdin;
1	image/png	21_19_43_298_peasant.png	21462	128	128	2014/03/03/06_15_36_755_21_19_43_298_peasant.png	2014-03-03 02:15:36.758037	2014-03-03 02:15:36.758037
2	image/png	21_20_15_207_baron.png	16547	128	128	2014/03/03/06_15_36_823_21_20_15_207_baron.png	2014-03-03 02:15:36.824259	2014-03-03 02:15:36.824259
3	image/png	21_20_15_269_duke.png	18634	128	128	2014/03/03/06_15_37_191_21_20_15_269_duke.png	2014-03-03 02:15:37.191853	2014-03-03 02:15:37.191853
4	image/png	21_20_15_328_earl.png	17390	128	128	2014/03/03/06_15_37_240_21_20_15_328_earl.png	2014-03-03 02:15:37.241122	2014-03-03 02:15:37.241122
5	image/png	21_20_15_390_emperor.png	18793	128	128	2014/03/03/06_15_37_295_21_20_15_390_emperor.png	2014-03-03 02:15:37.296677	2014-03-03 02:15:37.296677
6	image/png	21_20_15_447_illuminatus.png	16395	128	128	2014/03/03/06_15_39_165_21_20_15_447_illuminatus.png	2014-03-03 02:15:39.170338	2014-03-03 02:15:39.170338
7	image/png	21_20_15_504_king.png	17244	128	128	2014/03/03/06_15_39_305_21_20_15_504_king.png	2014-03-03 02:15:39.305882	2014-03-03 02:15:39.305882
8	image/png	21_20_15_562_knight.png	15968	128	128	2014/03/03/06_15_39_353_21_20_15_562_knight.png	2014-03-03 02:15:39.353801	2014-03-03 02:15:39.353801
9	image/png	21_20_15_623_pope.png	20435	128	128	2014/03/03/06_15_39_404_21_20_15_623_pope.png	2014-03-03 02:15:39.40535	2014-03-03 02:15:39.40535
10	image/png	21_20_15_681_saint.png	24307	128	128	2014/03/03/06_15_39_450_21_20_15_681_saint.png	2014-03-03 02:15:39.451066	2014-03-03 02:15:39.451066
11	image/png	21_20_15_736_soldier.png	14233	128	128	2014/03/03/06_15_39_499_21_20_15_736_soldier.png	2014-03-03 02:15:39.500444	2014-03-03 02:15:39.500444
12	image/png	21_20_15_792_wenzel.png	20041	128	128	2014/03/03/06_15_39_554_21_20_15_792_wenzel.png	2014-03-03 02:15:39.555002	2014-03-03 02:15:39.555002
13	image/png	21_23_38_639_Screen_Shot_2014_02_25_at_21.22.34.png	12197	53	79	2014/03/03/06_15_39_608_21_23_38_639_Screen_Shot_2014_02_25_at_21.22.34.png	2014-03-03 02:15:39.609912	2014-03-03 02:15:39.609912
14	image/png	21_23_38_706_Screen_Shot_2014_02_25_at_21.22.43.png	21863	83	99	2014/03/03/06_15_39_661_21_23_38_706_Screen_Shot_2014_02_25_at_21.22.43.png	2014-03-03 02:15:39.662621	2014-03-03 02:15:39.662621
15	image/png	21_23_38_773_Screen_Shot_2014_02_25_at_21.22.53.png	45497	198	123	2014/03/03/06_15_39_717_21_23_38_773_Screen_Shot_2014_02_25_at_21.22.53.png	2014-03-03 02:15:39.717859	2014-03-03 02:15:39.717859
16	image/png	21_23_38_847_Screen_Shot_2014_02_25_at_21.22.59.png	53888	192	120	2014/03/03/06_15_39_767_21_23_38_847_Screen_Shot_2014_02_25_at_21.22.59.png	2014-03-03 02:15:39.768396	2014-03-03 02:15:39.768396
17	image/png	21_23_38_936_Screen_Shot_2014_02_25_at_21.23.09.png	160462	279	324	2014/03/03/06_15_39_822_21_23_38_936_Screen_Shot_2014_02_25_at_21.23.09.png	2014-03-03 02:15:39.823292	2014-03-03 02:15:39.823292
18	image/gif	Knight Physical.gif	9148	183	107	2014/03/14/21_00_32_835_Knight_Physical.gif	2014-03-14 17:00:32.837156	2014-03-14 17:00:32.837156
19	image/png	Knight physical.png	28556	183	107	2014/03/14/21_02_06_578_Knight_physical.png	2014-03-14 17:02:06.579143	2014-03-14 17:02:06.579143
20	image/jpeg	coins.jpg	136774	550	516	2014/03/28/16_56_34_526_coins.jpg	2014-03-28 12:56:34.580908	2014-03-28 12:56:34.580908
21	image/jpeg	engraving.jpg	113094	550	583	2014/03/28/16_56_44_401_engraving.jpg	2014-03-28 12:56:44.403019	2014-03-28 12:56:44.403019
22	image/jpeg	figurky.jpg	66352	550	411	2014/03/28/16_56_50_410_figurky.jpg	2014-03-28 12:56:50.411691	2014-03-28 12:56:50.411691
23	image/jpeg	meceazbroje.jpg	75688	550	411	2014/03/28/16_56_55_955_meceazbroje.jpg	2014-03-28 12:56:55.955944	2014-03-28 12:56:55.955944
24	image/png	Viscount.png	20348	128	128	2014/04/17/19_55_41_695_Viscount.png	2014-04-17 15:55:41.697461	2014-04-17 15:55:41.697461
25	image/png	Box a manual.png	59692	213	227	2014/04/17/19_59_55_702_Box_a_manual.png	2014-04-17 15:59:55.703711	2014-04-17 15:59:55.703711
26	image/png	Digipak.png	104726	346	227	2014/04/17/20_03_33_688_Digipak.png	2014-04-17 16:03:33.689529	2014-04-17 16:03:33.689529
27	image/png	Beta.png	10787	208	227	2014/04/17/20_03_49_241_Beta.png	2014-04-17 16:03:49.24296	2014-04-17 16:03:49.24296
28	image/png	Alpha.png	11379	206	227	2014/04/17/20_04_47_674_Alpha.png	2014-04-17 16:04:47.675168	2014-04-17 16:04:47.675168
29	image/png	Figure.png	35373	220	227	2014/04/17/20_06_04_83_Figure.png	2014-04-17 16:06:04.084442	2014-04-17 16:06:04.084442
\.


--
-- Name: refinery_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('refinery_images_id_seq', 29, true);


--
-- Data for Name: refinery_orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_orders (id, user_id, tier_id, price, paid, paid_at, pay_type, payment_id, email, tier_name, name, street, city, country, "position", created_at, updated_at, payment_status, cart_id, transaction_id, platform_1, platform_2, tshirt, ingame_name, sword_legal, agree, state_code, zip) FROM stdin;
7	1	6	1000	t	2014-03-03 22:51:46.007618	\N	\N	admin@sedrick.cz	WENZEL der FAULE (ULTIMATE ED.)	Jirka	Na pískách	Praha	CZ	\N	2014-03-03 22:51:27.848531	2014-03-03 22:51:46.065993	\N	\N	\N	\N	\N	\N	\N	f	f	\N	\N
26	13	1	5	\N	\N	\N	\N	martin.fryvaldsky@bmmanagement.cz	PEASANT TIER	\N	\N	\N	\N	\N	2014-04-15 11:53:41.344073	2014-04-15 11:53:41.344073	\N	\N	\N	\N	\N	\N	\N	f	t	\N	\N
29	15	3	35	\N	\N	\N	\N	chumaj001@seznam.cz	SOLDIER TIER (PHYSICAL)	Daniel Vavra	Malostranske namesti 6	Praha	CZ	\N	2014-04-15 16:05:16.135795	2014-04-15 16:05:16.135795	\N	\N	\N	PC	\N	\N	\N	f	t		\N
27	7	4	35	f	2014-04-15 12:59:00		\N	jiri.rydl@warhorsestudios.cz	KNIGHT TIER (DIGITAL)					\N	2014-04-15 12:54:08.616209	2014-04-16 21:49:55.979468	Refunded	27	9G648464JR976042A	PC	PC	S (woman)		f	t	\N	
20	7	2	25	f	2014-04-14 10:37:00		\N	jiri.rydl@warhorsestudios.cz	SOLDIER TIER (DIGITAL)					13	2014-04-14 10:32:45.235024	2014-04-16 21:50:05.922961	Refunded	20	0BY81189XU658340U	PC	PC	S (woman)		f	t	\N	
8	2	6	1000	t	2014-03-03 23:43:01.661793	\N	\N	kratoj@gmail.com	WENZEL der FAULE (ULTIMATE ED.)	Jiří Kratochvíl	Ovenecká 330/44	Praha 7	Czech Republic	1	2014-03-03 23:42:38.520288	2014-04-14 13:18:34.97336	Completed	8	4FC45115MK8867022	XBOX	PC	L	Sedrick	t	t	\N	\N
9	6	1	5	t	2014-03-04 22:10:45.766893	\N	\N	u1@sedrick.cz	PEASANT TIER	\N	\N	\N	\N	2	2014-03-04 22:10:18.26985	2014-04-14 13:18:34.978114	Completed	9	257599505R203960X	\N	\N	\N	\N	f	t	\N	\N
10	6	6	995	t	2014-03-04 22:13:17.057704	\N	\N	u1@sedrick.cz	WENZEL der FAULE (ULTIMATE ED.)	Jiří Kratochvíl	Nerudova 709	Jirkov	Česká Republika	3	2014-03-04 22:12:53.036169	2014-04-14 13:18:34.982529	Completed	10	74178318DD378552P	PC	PC	L	Sedrick	t	t	\N	\N
11	6	6	1000	t	2014-03-04 22:18:52.520547	\N	\N	u1bracha@sedrick.cz	WENZEL der FAULE (ULTIMATE ED.)	Jiří Kratochvíl	Nerudova 709	Jirkov	Česká Republika	4	2014-03-04 22:18:20.135958	2014-04-14 13:18:34.989686	Completed	11	4H200254VK597004B	XBOX	PC	XXXL	SedrickCZ	f	t	\N	\N
12	6	8	20	t	2014-03-31 20:35:32.649167	\N	\N	u1@sedrick.cz	VISCOUNT TIER (DIGITAL)	\N	\N	\N	\N	5	2014-03-31 20:34:57.834664	2014-04-14 13:18:35.002444	Completed	12	9RR50250PW394835S	PC	\N	\N	\N	f	t	\N	\N
13	7	4	40	\N	\N	\N	\N	jiri.rydl@warhorsestudios.cz	KNIGHT TIER (DIGITAL)	\N	\N	\N	\N	6	2014-04-03 10:40:09.313053	2014-04-14 13:18:35.016821	\N	\N	\N	PC	\N	\N	\N	f	t	\N	\N
14	9	4	40	t	2014-04-06 18:30:41.084284	\N	\N	user123@sedrick.cz	KNIGHT TIER (DIGITAL)	\N	\N	\N	\N	7	2014-04-06 18:27:52.570092	2014-04-14 13:18:35.022065	Completed	14	0YF56561KY878831K	MAC	\N	\N	\N	f	t	\N	\N
15	9	8	40	\N	\N	\N	\N	user123@sedrick.cz	VISCOUNT TIER (DIGITAL)	\N	\N	\N	\N	8	2014-04-06 20:43:19.079474	2014-04-14 13:18:35.026944	\N	\N	\N	PC	\N	\N	\N	f	t	\N	\N
17	7	4	40	\N	\N	\N	\N	jiri.rydl@warhorsestudios.cz	KNIGHT TIER (DIGITAL)	\N	\N	\N	\N	10	2014-04-07 21:13:54.453914	2014-04-14 13:18:35.037496	\N	\N	\N	PC	\N	\N	\N	f	t	\N	\N
18	11	6	60	\N	\N	\N	\N	mklima@outlook.com	BARON TIER (DIGITAL)	\N	\N	\N	\N	11	2014-04-09 10:10:44.395395	2014-04-14 13:18:35.04371	\N	\N	\N	PS4	\N	\N	\N	f	t	\N	\N
19	6	8	80	\N	\N	\N	\N	u1@sedrick.cz	VISCOUNT TIER (DIGITAL)	\N	\N	\N	\N	12	2014-04-14 09:42:31.217957	2014-04-14 13:18:35.048955	\N	\N	\N	PC	\N	\N	\N	f	t	\N	\N
30	7	5	10	\N	\N	\N	\N	jiri.rydl@warhorsestudios.cz	KNIGHT TIER PHYSICAL (Special Edition)	J.R.	Pernerova 55	Prague 8	CZ	\N	2014-04-17 11:59:28.805102	2014-04-17 11:59:28.805102	\N	\N	\N	PC	\N	\N	\N	f	t		18200
23	12	4	40	t	2014-04-14 21:31:54.807167	\N	\N	king@sedrick.cz	KNIGHT TIER (DIGITAL)	\N	\N	\N	\N	\N	2014-04-14 21:31:09.830638	2014-04-14 21:31:55.001344	Completed	23	75S13690P6895031G	PC	\N	\N	\N	f	t	\N	\N
24	12	6	20	t	2014-04-14 21:49:04.297971	\N	\N	king@sedrick.cz	BARON TIER (DIGITAL)	\N	\N	\N	\N	\N	2014-04-14 21:48:37.007908	2014-04-14 21:49:04.480735	Completed	24	3KS67892XR841900S	PC	\N	\N	\N	f	t	\N	\N
25	12	7	10	t	2014-04-14 21:50:34.844445	\N	\N	king@sedrick.cz	BARON TIER (PHYSICAL)	Adrian Sedrick	5th Avanue	New York	US	\N	2014-04-14 21:50:17.275898	2014-04-14 21:50:34.929193	Completed	25	8GW2043473500693E	PC	\N	\N	\N	f	t	NY	\N
\.


--
-- Name: refinery_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('refinery_orders_id_seq', 30, true);


--
-- Data for Name: refinery_page_part_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_page_part_translations (id, refinery_page_part_id, locale, created_at, updated_at, body) FROM stdin;
1	1	en	2014-03-03 01:52:30.964548	2014-03-03 01:52:30.964548	<p>Welcome to our site. This is just a place holder page while we gather our content.</p>
2	2	en	2014-03-03 01:52:30.974708	2014-03-03 01:52:30.974708	<p>This is another block of content over here.</p>
3	3	en	2014-03-03 01:52:31.053016	2014-03-03 01:52:31.053016	<h2>Sorry, there was a problem...</h2><p>The page you requested was not found.</p><p><a href='/'>Return to the home page</a></p>
4	4	en	2014-03-03 01:52:31.116235	2014-03-03 01:52:31.116235	<p>This is just a standard text page example. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin metus dolor, hendrerit sit amet, aliquet nec, posuere sed, purus. Nullam et velit iaculis odio sagittis placerat. Duis metus tellus, pellentesque ut, luctus id, egestas a, lorem. Praesent vitae mauris. Aliquam sed nulla. Sed id nunc vitae leo suscipit viverra. Proin at leo ut lacus consequat rhoncus. In hac habitasse platea dictumst. Nunc quis tortor sed libero hendrerit dapibus.\n\nInteger interdum purus id erat. Duis nec velit vitae dolor mattis euismod. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse pellentesque dignissim lacus. Nulla semper euismod arcu. Suspendisse egestas, erat a consectetur dapibus, felis orci cursus eros, et sollicitudin purus urna et metus. Integer eget est sed nunc euismod vestibulum. Integer nulla dui, tristique in, euismod et, interdum imperdiet, enim. Mauris at lectus. Sed egestas tortor nec mi.</p>
5	5	en	2014-03-03 01:52:31.126786	2014-03-03 01:52:31.126786	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus fringilla nisi a elit. Duis ultricies orci ut arcu. Ut ac nibh. Duis blandit rhoncus magna. Pellentesque semper risus ut magna. Etiam pulvinar tellus eget diam. Morbi blandit. Donec pulvinar mauris at ligula. Sed pellentesque, ipsum id congue molestie, lectus risus egestas pede, ac viverra diam lacus ac urna. Aenean elit.</p>
6	6	en	2014-03-03 01:52:31.366019	2014-03-03 01:52:31.366019	\N
7	7	en	2014-03-03 01:52:31.377675	2014-03-03 01:52:31.377675	\N
8	8	en	2014-03-03 01:52:31.43933	2014-03-03 01:52:31.43933	\N
9	9	en	2014-03-03 01:52:31.448098	2014-03-03 01:52:31.448098	\N
10	10	en	2014-03-03 01:52:31.518293	2014-03-03 01:52:31.518293	\N
11	11	en	2014-03-03 01:52:31.526493	2014-03-03 01:52:31.526493	\N
12	12	en	2014-03-03 01:52:31.594129	2014-03-03 01:52:31.594129	\N
13	13	en	2014-03-03 01:52:31.604566	2014-03-03 01:52:31.604566	\N
14	14	en	2014-03-03 02:21:39.413314	2014-03-03 02:21:39.413314	
15	15	en	2014-03-03 02:21:39.420262	2014-03-03 02:21:39.420262	
17	17	en	2014-03-03 02:22:13.003522	2014-03-03 02:22:13.003522	
21	21	en	2014-03-03 02:23:08.02927	2014-03-03 02:23:08.02927	
23	23	en	2014-03-03 02:23:36.786249	2014-03-03 02:23:36.786249	
25	25	en	2014-03-08 00:36:43.209906	2014-03-08 00:36:43.209906	
27	27	en	2014-03-08 00:38:40.307281	2014-03-08 00:38:40.307281	
22	22	en	2014-03-03 02:23:36.696258	2014-04-14 10:24:38.789729	<p>Thank you for your support of our game Kingdom Come: Deliverance!</p>
20	20	en	2014-03-03 02:23:08.02447	2014-03-28 14:50:35.449754	
26	26	en	2014-03-08 00:38:40.301671	2014-04-15 12:17:57.203726	<h2>1. GENERAL PROVISIONS</h2>\r\n<p>1.1. The company <strong>Prague Game Studios s.r.o.</strong>, ID no. 241 55 489, with its registered office at Praha 8, Pernerova 652/55, post code 186 00, registered with the commercial register maintained by the Municipal Court in Prague, section C, file no. 183756 (the <strong>Company</strong>) hereby issues these General Fundraising Terms and Conditions (the <strong>TaC</strong>).</p>\r\n<p>1.2. The Company is raising funds for the development of a computer game with the title “<em>Kingdom Come: Deliverance</em>” (the <strong>Project</strong>). Legal relations between the Company and the person contributing certain amount of money to the Company for the purposes of the Project development (the <strong>Donor</strong>) shall be regulated by these TaC.</p>\r\n<p>1.3. These TaC shall form an integral part of each Contract.</p>\r\n<h2>2. DEFINITIONS</h2>\r\n<p><span style="background-color: transparent;">2.1. Apart from the terms defined elsewhere in these TaC, the following definitions shall apply throughout these TaC:</span>\r\n</p>\r\n<ul><li><span style="background-color: transparent;"><strong>Civil Code</strong> means Czech Act no. 89/2012 Coll., the Civil Code, as amended;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Contribution </strong>means a monetary contribution of the Donor to the Company;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Contract </strong>means a contract between the Company and the Donor regarding the rights and duties of the Parties connected with the Contribution, as further specified by these TaC;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Publishing Date</strong> means the official publishing date of the Project, i.e. the day the Project shall become finished and available via official distribution;&#160;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Parties </strong>mean the Company and the Donor and the Party means any of them;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Payment System</strong> means external internet payment service for the payment of the Contribution;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Personal Information </strong>means the name, e-mail and the address of the Donor;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Price </strong>means lowest possible Contribution connected with specific Reward;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Product</strong> means the outcome of the Project in the form of &#160;user game application;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Reward </strong>means an item, whether tangible or intangible, specified on the Website for each Reward Tier;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Reward Tier </strong>means a combination of Price and Reward specified on the Website; and</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Website </strong>means the website www.kingdomcomerpg.com.</span>\r\n</li>\r\n</ul>\r\n<h2>3. CONCLUSION OF THE CONTRACT</h2>\r\n<p>3.1. The Contract shall be concluded and shall become valid and effective by clicking on the button located on the Website indicating that the Donor agrees with these TaC. By clicking on the button, the Donor accepts these TaC unconditionally and in their full extent.</p>\r\n<p>3.2. The Contract can only be concluded between the Company and a natural person of age 18 or higher. No legal person, whether a company, collective, association or any other kind thereof shall be allowed to enter into the Contract. If a natural person that is entitled to act for or on behalf of any legal person enters into the Contract, that natural person alone shall be bound by the Contract regardless of that person’s powers vis-à-vis the respective legal person.</p>\r\n<h2>4. THE CONTRIBUTION</h2>\r\n<p>4.1. After entering into the Contract, the Donor shall choose the Reward Tier.</p>\r\n<p>4.2. The Donor is obliged to contribute to the Company the Contribution in the amount of the Price according to the chosen Reward Tier or any amount higher, subject to the Donor’s discretion.</p>\r\n<p>4.3. The Contribution shall be paid via the Payment System without undue delay after the conclusion of the Contract.</p>\r\n<p>4.4. In case the Contribution payment is not entered into the Payment System within next 24 hours after the conclusion of the Contract, the Contract automatically terminates (<em>condition subsequent</em>).</p>\r\n<p>4.5. The Contribution is a non-refundable donation that shall be used by the Company solely for the purposes of the development and distribution of the Project and/or the manufacturing and distribution of the Rewards (the Use). Should the total sum of the Contributions exceed the costs of the Use, the exceeding amount shall also be regarded as a non-refundable donation. The Donor waives any right to return of the Contribution or any part of it to the maximum extent allowed by the mandatory provisions of the Civil Code, provided that the Project and the Reward are developed, produced and delivered to the Donor properly.</p>\r\n<p>4.6.\tThe Donor expressly acknowledges that the Contribution is not a purchase. While the Company will take every measure to create the game and provide the Donor with specified Reward, the final product, if any, may be substantially different from the description provided to the Donor at the time when the Contribution was made.</p>\r\n<h2>5. PERSONAL INFORMATION</h2>\r\n<p>5.1. The Donor shall submit to the Company the Personal Information. The Company shall use the Personal Information solely for the purposes of distribution of the Project and the Reward to the Donor (the <strong>Purpose</strong>).</p>\r\n<p>5.2. The Company shall not use the Personal Information for any other purpose. The Company is entitled to disclose the Personal Information to a third party only if such disclosure is necessary for the Purpose.</p>\r\n<p>5.3. The Donor acknowledges that the submission and processing of the Personal Information is necessary for the obligations of the Company under the Contract. The Donor expressly gives his consent to the processing and use of the Personal Information for the Purpose according to this Article 5.</p>\r\n<p>5.4. The Company is not liable for any damage caused by the use of the Personal Information according to this Article 5.</p>\r\n<p>5.5. The Donor represents and warrants that the submitted Personal Information is whole and correct. The Company shall not be liable and shall not be in default regarding any of its obligations under the Contract, should the representation be incorrect or misleading.</p>\r\n<h2>6. RIGHTS AND DUTIES OF THE PARTIES</h2>\r\n<p>6.1. The Company shall deliver to the Donor the Reward and the Product (subject to conditions specified by the relevant Reward Tier chosen by the Donor) without undue delay after the Publishing Date, provided that the Project has been finished.</p>\r\n<p>6.2. By the delivery of the Product to the Donor, the Company grants to the Donor a non-exclusive, limited, non-transferable, personal, end-user licence to use the Product for the Donor’s individual, non-commercial and entertainment purposes only, subject to further End-User Licence Agreement between the Donor and the Company.</p>\r\n<p>6.3. The final form, state and features of the Product and the Reward are strictly subject to the Company’s discretion. The Donor shall not have any rights in that respect and no claim of the Donor shall arise from the final form, state and features of the Product and the Reward.</p>\r\n<p>6.4. Unless expressly stated otherwise, nothing in the Contract and / or these TaC shall have any impact on the intellectual property rights of the Company, including (but not limited to) any such rights with respect to any software, software updates or patches, or other utilities and tools or any other technology, text and audio visual material, the design and appearance of the Website, the Project, the Product and / or the Reward.</p>\r\n<p>6.5. The Company shall use all necessary diligence and professional care to develop, produce and deliver the Product and the Reward with the use of the Contribution. Should the development, production and delivery of the Product and / or the Reward become impossible or non-proportionally difficult, the Company has the right to cancel the Project. In such case, the Company shall publish on the Website an audited financial report regarding the use of the Contributions. The Contribution used according to the report shall be in such case regarded as a non-refundable donation and the Donor waives any right to return of the Contribution or any part of it to the maximum extent allowed by the mandatory provisions of the Civil Code.</p>\r\n<h2>7. LIMITATION OF LIABILITY</h2>\r\n<p>7.1. To the maximum extent permitted by the applicable law, the Donor agrees that the use of the Product and / or the Reward and / or the Website is at the Donor’s sole risk. The Company grants no warranty, whether expressed or implied, regarding the Product, Reward or the Website, unless it is mandatory under applicable legal regulations.</p>\r\n<p>7.2. To the maximum extent permitted by the applicable law, the Parties hereby expressly exclude any liability of the Company for the damage caused by the use of the Product, the Reward or the Website.</p>\r\n<p>7.3. To the maximum extent permitted by the applicable law and unless expressly stated otherwise, the Parties hereby expressly exclude any liability of the Company for the damage caused by the failure of the Company to complete the Project, or to develop, produce and / or deliver the Product and / or the Reward.</p>\r\n<p>7.4. The Company shall not be liable for any delay or failure to perform resulting from causes outside the reasonable control of the Company, including, without limitation, any failure to perform due to unforeseen circumstances or cause beyond the Company’s control such as war, terrorism, riots, embargoes, acts of civil or military authorities, fire, floods, accidents, strikes, or shortages of transportation facilities, fuel, energy, labour or materials.</p>\r\n<h2>8. FINAL PROVISIONS</h2>\r\n<p>8.1. The Contract shall be governed by the Czech law in particular sections 2055-2078 and 2756-2757 of the Civil Code.</p>\r\n<p>8.2. For the purposes of any disputes arising from the Contract, the Parties hereby expressly agree on the international jurisdiction of the Czech courts and local jurisdiction of the relevant courts according to the registered seat of the Company.</p>\r\n<p>8.3. Clauses in these TaC regarding the termination of the Contract contain only conditions for the termination of the Contract. The Parties expressly exclude any and all relevant provisions of the Civil Code that would allow any Party to terminate the Contract or to recall the Contribution in any other way, and in particular the sections 2059, 2068, 2072 of the Civil Code.</p>\r\n<p>8.4. Each Party waives any rights and claims that might arise from the conduct of the other Party prior to conclusion of the Contract. Both Parties acknowledge that they have been made aware of all facts and legal circumstances whilst entering into the Contract in such a way that each Party could rely on the possibility of entering into a valid agreement and that the intent of the other Party to enter into the Contract was undisputable.</p>\r\n<p>8.5. Neither Party is a weaker Party in relation to the other Party. The Contribution is not granted to the Company in a consumer – entrepreneur relation. The Donor acknowledges and accepts that his profit from the Contract in the form of Reward and the right to use the product depends on a future uncertain event (finalisation of the Project) in the meaning of Sec. 2756 and seq. of the Civil Code.</p>\r\n<p>8.6. These TaC shall become valid and effective as of January 1st 2014.</p>
24	24	en	2014-03-08 00:36:43.107138	2014-04-15 21:20:15.425058	<h1><strong>Frequently Asked Questions</strong>\r\n</h1>\r\n<p><strong>I don’t understand the concept of Acts. What is Act I, II and III? Why there is not cheaper tier offering all three Acts?</strong> </p>\r\n<p>Kingdom Come: Deliverance, Act I, as it is planned, is a full scale, stand-alone game. It has 30+ hours of gameplay, complete open world map, all quests and closed story line. Most (if not all) game mechanics described above will be included: horse riding, combat, castle sieges, there will be at least one large-scale battle. Acts II &amp; III extend the story, add new environment in separate maps, new quests, gear and weapons. They will also add new quests to the map of Act I. It will be possible to travel between maps of all Acts, some quests will require you to visit all of them.</p>\r\n<p>We definitely intend to make Acts II &amp; III and release them as soon as possible. However, our funding and schedule does not reach past first Act. We will finalize our plans for the release of Acts II &amp; III when we get closer to the release date of Act I. For these reasons we don’t want to offer and promise them as a Kickstarter reward in their own right. We want to use them as a token of our gratitude to higher tiers backers, but you should think about it more like 100% discount offer than a guaranteed reward.</p>\r\n<p><strong style="background-color: transparent;">What platforms are offered to backers and what is minimum requirement of PC version ?</strong>\r\n</p>\r\n<p>We are developing the game to run smoothly on “good gaming PC” and next-gen consoles. If you have a PC, hardware-wise similar to Xbox One or PS4, you should be able to run Kingdom Come: Deliverance well.</p>\r\n<p><span style="background-color: transparent;">We can offer all version in all tiers (i.e. Windows PC / Mac / Linux / Xbox One / PS4), with the proviso that on consoles the game must be approved by the platform holders first. In case we are not able to finish or release the game on the platform you chose for any reason, you will be able to choose again from available platforms.</span>\r\n</p>\r\n<p><strong style="background-color: transparent;">But how can I choose a specific platform while pledging?</strong>\r\n</p>\r\n<p>Just choose a platform that suits you. You can change this any time later.</p>\r\n<p><strong style="background-color: transparent;">What are the differences between PC and console versions of the game?</strong>\r\n</p>\r\n<p>We develop both version together so neither is a port of the other. Technically speaking, console version will be very similar to a PC one; it’s probable that on a high-end PC you can get better and smoother visual effects but artistic feeling should be very close.</p>\r\n<p>Controls-wise, the game is designed separately for console controller and for keyboard &amp; mouse gaming. Of course, you can still use your favorite game controller on PC or on SteamBox. But if you decide to use mouse and keyboard, you will control the game just like other first-person games on the market: you will be able to use your mouse in the UI, there will be no controller hints and controls will be fully customizable. Some control elements may be slightly different on keyboard &amp; mouse than they are on a gamepad but neither control method will be generally superior to the other.</p>\r\n<p><strong style="background-color: transparent;">Do you plan to support Oculus Rift?</strong>\r\n</p>\r\n<p>Cryengine supports Oculus Rift by default, so general answer is: yes. We plan to support this awesome hardware gadget.</p>\r\n<p>Oculus Rift captured the imagination of many players and you ask about it very often. Cryengine supports Oculus Rift by default, however we realize that the game has to be developed with Oculus in mind and we are aware of their recommended Best Practices. We shall try to stick to these recommendations, but VR is still an uncharted territory and we can’t guarantee ideal results from get go. To create horse riding experience that won’t give you motion sickness looks like a real challenge.</p>\r\n<p><strong style="background-color: transparent;">What language versions do you plan?</strong>\r\n</p>\r\n<p>We’re creating the game in English and with English voiceovers. We would like to make French, Italian, German and Spanish versions of the game as well. Our past experience also suggests there will be a Polish, Russian and Czech version of the game, not necessarily with voiceovers, though.</p>\r\n<p><strong style="background-color: transparent;">You described the game also as a sandbox but how much sandboxy is going to be? Can I buy castles or run an army for example?</strong>\r\n</p>\r\n<p>Many people wonder how much of a sandbox our sandbox is going to be. You will be able to solve quests in multiple ways, kill most of NPCs or influence their day/night cycles. We have a complex system of reputation, relationships and law. You can influence local economy to an extent (price of goods).</p>\r\n<p>The player’s character is going to have a place to stay and live, but you will not be able to buy and sell real estate. Nor you can control other characters. Companions/henchmen have their own AI and they are quest-specific. Your character will develop relationships with NPCs.</p>\r\n<p><strong style="background-color: transparent;">9 square km doesn't sound like a lot so what about the map size?</strong>\r\n</p>\r\n<p>Some people are concerned about our maps size and seem to think that 9 sq. km. is not enough. Please trust us that it is. Our map is bigger than the one in Read Dead Redemption. The population/point-of-interest density is going to be on par with RDR. We want the world to look natural.</p>\r\n<p>Also please mind that both Act II and Act III will each come with their own map, although they will be a bit smaller the length of designed gameplay should be on par with Act I.</p>\r\n<p><strong style="background-color: transparent;">What about multiplayer? Some of your systems could make for a cool multiplayre experience.</strong>\r\n</p>\r\n<p>There seems to be demand for multiplayer experience. Unfortunately, Kingdom Come: Deliverance is a singleplayer game only. We are thinking about cooperative multiplayer in some further future, but definitely not for Act I.</p>\r\n<p><strong style="background-color: transparent;">Do you plan to implement 3rd person view?</strong>\r\n</p>\r\n<p>We are sorry, but we do not plan to allow you to control your character in 3rd person view (TPV). You will be able to see your character e.g. in cutscenes, dialogues or in the inventory screen, you can also see your body and hands all the time. We believe that FPV allows for better immersion in the world; we also think that we can make the FPV combat work. Moreover the many of the systems, including combat, are designed with FPV in mind and wouldn't work in TPV without a major redesign.</p>\r\n<p><strong style="background-color: transparent;">Can I get a DRM-free version of the game?</strong>\r\n</p>\r\n<p>We get many questions about DRM and whether our game is going to be DRM free. Frankly, we have to admit we are not sure at this moment. We are planning to use Steam on open platforms, so the game will be using Steam default copy protection mechanics. Other options including <a href="http://www.gog.com/" title="http://www.gog.com/" target="_blank">GOG.com</a> are being considered but can't be confirmed as of yet.</p>
18	18	en	2014-03-03 02:22:38.803601	2014-04-16 13:22:03.985517	<h1><strong>Rewards Description</strong>\r\n</h1>\r\n<h2><strong>Basic Edition</strong>\r\n</h2>\r\n<p><strong>Forum access &amp; badge: </strong>You will be able to post on our forums with your backer's badge. You will have access to VIP part of forum to discuss game features. </p>\r\n<p><strong>Digital copy of the game: </strong>You will be able to download and play a copy of Act I of our game.</p>\r\n<p><strong>Digital manual, Soundtrack, Making-of video: </strong>You will get PDF copy of the game manual, complete game soundtrack in mp3, and digital version of our making of documentary.</p>\r\n<p><strong>Boxed copy of the game: </strong>You will receive your own copy of Act I in standard DVD box with manual.</p>\r\n<h2>Special Edition</h2>\r\n<p><strong>Alpha access: </strong>You will in-effect become part of our development team, getting access to the earliest barely playable version of Kingdom Come: Deliverance. Your comments and observations will help to shape the game.</p>\r\n<p><strong>Beta access:</strong> This is similar to <a href="/kingdom-come-deliverance/what-is-early-access" title="What is Early Access">Early access</a> on Steam.</p>\r\n<h2><strong>Collector's edition</strong>\r\n</h2>\r\n<p><strong style="background-color: transparent;">T-Shirt: </strong>\r\n<span style="background-color: transparent;">T-shirt with Kingdom Come: Deliverance motifs.</span>\r\n</p>\r\n<div><p><span style="background-color: transparent;"><strong>Art book: </strong>100+ pages art book printed on quality stock paper, with artworks for the game.</span>\r\n</p>\r\n<p><span style="background-color: transparent;"><strong>Digital art book:&#160;</strong>100+ pages art book with artworks for the game in PDF format.</span>\r\n</p>\r\n<p><span style="background-color: transparent;"><strong>Poster/Signed poster: </strong>24" x 36" full color poster of the game. In higher tiers this poster will be signed by members of the development team.</span>\r\n</p>\r\n<p><strong>Digital High-res Poster:&#160;</strong>24" x 36" full color poster of the game in high resolution ready to print.<span style="background-color: transparent;"></span>\r\n</p>\r\n<p><strong>Digital High-res Map: </strong>Detailed map&#160;of the playable area of Act I in high resolution ready to print.</p>\r\n<p><strong>Screenplay of Act I: </strong>Screenplay introducing the historical background, main characters of Act I&#160;<span style="background-color: transparent;">and featured story lines in PDF format.</span>\r\n</p>\r\n<p><strong style="background-color: transparent;">Action figure: </strong>\r\n<span style="background-color: transparent;">A quality die-cast 4" action figure. We briefly entertained a possibility of making plastic figures in China, but then we thought better of it. Europe has a tradition of tin soldiers and so we found someone to produce a beautiful, detailed, metal, four inch figure of a knight.</span>\r\n</p>\r\n<p><strong>3D printer ready Action figure model: </strong>Design of a character from Act I in a file supporting 3D printers, ready to create the action figure at home.<span style="background-color: transparent;"></span>\r\n</p>\r\n<p><strong>Acts II &amp; III: </strong>You will be able to download Act II or II &amp; III of Kingdom Come: Deliverance if and when they are released. We assume that it will take us nine months to develop Act II and further nine months for Act III. Please note that we cannot guarantee developing these Acts; while it is our best intention to do so at this moment, circumstances beyond our control may force us to alter our plans. <a href="/kingdom-come-deliverance/faq" title="FAQ">What are these Acts?</a>\r\n</p>\r\n<p><strong>Dice:</strong> A set for playing authentic medieval precursor to computer games.</p>\r\n<p><strong>Commemorative coin:</strong> Unique coin with original design, stamped in limited quantity for our backers. In lower tiers, the coin will be made of brass; for higher levels, it will be made of sterling silver. Our coin is not going to be a thin penny-press elongateds. One of our best engravers, Dan’s buddy and former classmate, Martin Reichard, who creates gold and silver designs for the best mints, will create a top notch collectible 30x2mm coin with a game motif. Look at his older designs (works for the <a href="http://www.prague-mint.eu/" title="http://www.prague-mint.eu/">Prague Mint</a>) and see for yourself.</p>\r\n<p><strong style="background-color: transparent;">Copper engraving:</strong>\r\n<span style="background-color: transparent;"> An original, limited series print from one of the best engravers in our country and Dan’s friend, Jindra (Henry) Faktor. You can get ready for an exceptional artistic work, numbered and signed on luxury, hand-made paper. This will be an 6" x 8" print made from wooden plate in limited quantity. It will feature a motif from the game.</span>\r\n</p>\r\n<p><strong style="background-color: transparent;">Visit in our office: </strong>\r\n<span style="background-color: transparent;">Opportunity to visit our studio and talk with the team in medieval tavern.</span>\r\n</p>\r\n<p><strong>Guided tour: </strong>We will treat you to a two day trip through the real-world locations that served as models for the places within the game. We shall have a professional archaeologist/historian to guide you and explain everything and you will be able to get to places that are normally off limits. </p>\r\n<h2>In-game bonuses</h2>\r\n<p><strong>In-game Calvary memorial (crucifix): </strong>The world of Kingdom Come: Deliverance is dotted with small memorial crosses – small stone or wooden crucifixes on a stone plinth. The plinth carries an inscription that can include your name.</p>\r\n<p><strong>In-game Conciliatory cross: </strong>Similar to the Calvary memorial above, but smaller and less conspicuous. These crosses were usually put up on places where a crime has occurred, as a gesture of reconciliation. The cross will carry your name.</p>\r\n<p><strong>In-game Church painting: </strong>Every town or village in Kingdom Come: Deliverance will have a church. You face can appear in one of them as the face of a saint, or some other figure, on paintings inside.</p>\r\n<p><strong>In-game Statue:</strong> We shall create a statue of a saint of your choice and endow him or her with your likeness. The statue will be a prominent feature of one of the in-game churches.</p>\r\n<h2>Collector's items</h2>\r\n<p>Various collector's items are part of our special editions. We are making an authentic medieval game and everything you are going to get, are unique, bespoke crafted items, far cry from plastic tchotchke.&#160;It may have something to do with the fact that Dan studied at School of applied arts in Turnov among engravers, smiths and goldsmiths, he doesn’t settle for less and knows a lot of craftsmen that can help us.</p>\r\n<h3><span style="background-color: transparent;">Swords</span>\r\n</h3>\r\n<p>Swords are perhaps the most attractive reward. Fantastic looking swords covered from grip to tip by Celtic knots, glass gems and entwined dragons are available almost anywhere for few bucks. Such a worthless trinket will of course break when a zombie apocalypse comes and you try to use it to decapitate an undead one.</p>\r\n<p>Our swords are real, made for fencing, with forged blades, you can take them to battle. Of course, these are replicas of real swords, no phantasmagoria from a kids movie. The blade will be decorated by etching or engraving and pommel with a pattern. This is not a toy! You have to be 18+. Please check your country laws about import.</p>\r\n<ul><li><span style="background-color: transparent;"><strong>Sword (Emperor): </strong>You will receive a hand made, forged, one-handed sword with inscription</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Deliverance Sword (Wenzel)</strong> – Deliverance motive&#160;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Sword (Pope)</strong> – Personal inscription</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Sword (Iluminatus/Saint)</strong> – One and half handed, personal inscription</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Shield: </strong>This will be hand-decorated shield adorned with coat-of-arms of a noble family related to the events within the game</span>\r\n</li>\r\n</ul>\r\n<p><span style="background-color: transparent;">As we are going to need really lot of swords, they are probably going to be produced in more workshops. At the bottom, you can watch the video where Dan visits some of them to see their manufacturing process. In this case it’s Dan’s former fellow student Ondřej Piskáček and one of the biggest armories in Europe – </span>\r\n<a title="http://www.kovex-ars.cz/" href="http://www.kovex-ars.cz/" target="_blank" style="background-color: transparent;">Kovex Ars</a>\r\n<span style="background-color: transparent;">.</span>\r\n</p>\r\n<p>&#160;<img src="/system/images/W1siZiIsIjIwMTQvMDMvMjgvMTZfNTZfNTVfOTU1X21lY2VhemJyb2plLmpwZyJdLFsicCIsInRodW1iIiwiNDUweDQ1MD4iXSxbInAiLCJzdHJpcCJdXQ/meceazbroje.jpg" title="Meceazbroje" alt="Meceazbroje" data-rel="450x450" height="336" width="450" /></p>\r\n<h3>Action Figure</h3>\r\n<p>We briefly entertained a possibility of making plastic figures in China, but then we thought better of it. Europe has a tradition of tin soldiers and so we were looking for someone to produce a beautiful, detailed, metal, four inch figure of a knight. And we found him, as you can see. (The images demonstrate quality of craftsmanship, the actual figure will be that of an in-game character.)</p>\r\n<p><img src="/system/images/W1siZiIsIjIwMTQvMDMvMjgvMTZfNTZfNTBfNDEwX2ZpZ3Vya3kuanBnIl0sWyJwIiwidGh1bWIiLCI0NTB4NDUwPiJdLFsicCIsInN0cmlwIl1d/figurky.jpg" title="Figurky" alt="Figurky" data-rel="450x450" height="336" width="450" /></p>\r\n<h3>Engraving</h3>\r\n<p>We can give you a poster (actually, we will). But for higher tiers we wanted something special – an original, limited series print from one of the best engravers in our country and Dan’s friend, Jindra (Henry) Faktor.</p>\r\n<p>Originally we were thinking about a copper engraving (and that’s what the rewards say), but then we realized copper engravings only became widespread in the second half of 15th century. Jindra suggested woodcut and you can get ready for an exceptional artistic work, numbered and signed on luxury, hand-made paper. The pictures show some of Jindra’s work and an original print of a fifteenth century woodblock.</p>\r\n<p><img src="/system/images/W1siZiIsIjIwMTQvMDMvMjgvMTZfNTZfNDRfNDAxX2VuZ3JhdmluZy5qcGciXSxbInAiLCJ0aHVtYiIsIjQ1MHg0NTA%2BIl0sWyJwIiwic3RyaXAiXV0/engraving.jpg" title="Engraving" alt="Engraving" data-rel="450x450" height="450" width="425" /></p>\r\n<h3>Coin</h3>\r\n<p>Our coin is not going to be a thin penny-press elongateds. One of our best engravers, Dan’s buddy and former classmate, Martin Reichard, who creates gold and silver designs for the best mints, will create a top notch collectible 30x2mm coin with a game motif. Look at his older designs (works for the <a title="http://www.prague-mint.eu/" href="http://www.prague-mint.eu/" target="_blank">Prague Mint</a>) and see for yourself.</p>\r\n<p><img src="/system/images/W1siZiIsIjIwMTQvMDMvMjgvMTZfNTZfMzRfNTI2X2NvaW5zLmpwZyJdLFsicCIsInRodW1iIiwiNDUweDQ1MD4iXSxbInAiLCJzdHJpcCJdXQ/coins.jpg" title="Coins" alt="Coins" data-rel="450x450" height="422" width="450" /></p>\r\n</div>
19	19	en	2014-03-03 02:22:38.808537	2014-04-17 12:48:14.511791	<h3>Kickstarter rewards</h3>\r\n<p>The ingame bonuses and collector's items were offered through the <a href="http://www.kickstarter.com/projects/1294225970/kingdom-come-deliverance" title="http://www.kickstarter.com/projects/1294225970/kingdom-come-deliverance" target="_blank">Kickstarter campaign</a> and are no longer available, at least for now. Please visit our shop often to see, what new pledges become available.</p>\r\n<p>Thank you!</p>
16	16	en	2014-03-03 02:22:12.998358	2014-04-15 23:09:26.365739	<h1>What is Early Access</h1>\r\n<p>Since we are going to self-publish the game and are asking for the help of the community, we are also willing to give something back and develop the game with the community.</p>\r\n<p>What does it mean? In Q4 2014 we will release an early build of the game, with one smaller location (village and a part of the countryside) where you will be able to test core mechanics of the game. We will start with the basic mechanics (interaction with the world, inventory, map, NPC cycles) and we will constantly update this build with new features as we progress with the development (dialogues, bows, hunting, crafting, combat, horses). This is the access to Alpha version of the game and it will be available to all tiers from the Baron onwards.</p>\r\n<p>When the game is in Beta stage, we will release it as Early Access on PC (or any other platform where it’s going to be possible) for all backers up from the Knight Tier.</p>\r\n<p>Our backers can influence the development, help us improve the game, and give us feedback about our game mechanics.</p>
\.


--
-- Name: refinery_page_part_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('refinery_page_part_translations_id_seq', 27, true);


--
-- Data for Name: refinery_page_parts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_page_parts (id, refinery_page_id, title, body, "position", created_at, updated_at) FROM stdin;
1	1	Body	<p>Welcome to our site. This is just a place holder page while we gather our content.</p>	0	2014-03-03 01:52:30.950867	2014-03-03 01:52:30.950867
2	1	Side Body	<p>This is another block of content over here.</p>	1	2014-03-03 01:52:30.972135	2014-03-03 01:52:30.972135
3	2	Body	<h2>Sorry, there was a problem...</h2><p>The page you requested was not found.</p><p><a href='/'>Return to the home page</a></p>	0	2014-03-03 01:52:31.049973	2014-03-03 01:52:31.049973
4	3	Body	<p>This is just a standard text page example. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin metus dolor, hendrerit sit amet, aliquet nec, posuere sed, purus. Nullam et velit iaculis odio sagittis placerat. Duis metus tellus, pellentesque ut, luctus id, egestas a, lorem. Praesent vitae mauris. Aliquam sed nulla. Sed id nunc vitae leo suscipit viverra. Proin at leo ut lacus consequat rhoncus. In hac habitasse platea dictumst. Nunc quis tortor sed libero hendrerit dapibus.\n\nInteger interdum purus id erat. Duis nec velit vitae dolor mattis euismod. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse pellentesque dignissim lacus. Nulla semper euismod arcu. Suspendisse egestas, erat a consectetur dapibus, felis orci cursus eros, et sollicitudin purus urna et metus. Integer eget est sed nunc euismod vestibulum. Integer nulla dui, tristique in, euismod et, interdum imperdiet, enim. Mauris at lectus. Sed egestas tortor nec mi.</p>	0	2014-03-03 01:52:31.113529	2014-03-03 01:52:31.113529
5	3	Side Body	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus fringilla nisi a elit. Duis ultricies orci ut arcu. Ut ac nibh. Duis blandit rhoncus magna. Pellentesque semper risus ut magna. Etiam pulvinar tellus eget diam. Morbi blandit. Donec pulvinar mauris at ligula. Sed pellentesque, ipsum id congue molestie, lectus risus egestas pede, ac viverra diam lacus ac urna. Aenean elit.</p>	1	2014-03-03 01:52:31.124125	2014-03-03 01:52:31.124125
6	4	Body	\N	0	2014-03-03 01:52:31.362357	2014-03-03 01:52:31.362357
7	4	Side Body	\N	1	2014-03-03 01:52:31.375101	2014-03-03 01:52:31.375101
8	5	Body	\N	0	2014-03-03 01:52:31.436623	2014-03-03 01:52:31.436623
9	5	Side Body	\N	1	2014-03-03 01:52:31.445226	2014-03-03 01:52:31.445226
10	6	Body	\N	0	2014-03-03 01:52:31.514907	2014-03-03 01:52:31.514907
11	6	Side Body	\N	1	2014-03-03 01:52:31.52388	2014-03-03 01:52:31.52388
12	7	Body	\N	0	2014-03-03 01:52:31.587161	2014-03-03 01:52:31.587161
13	7	Side Body	\N	1	2014-03-03 01:52:31.601531	2014-03-03 01:52:31.601531
14	8	Body		0	2014-03-03 02:21:39.398973	2014-03-03 02:21:39.398973
15	8	Side Body		1	2014-03-03 02:21:39.417529	2014-03-03 02:21:39.417529
17	9	Side Body		1	2014-03-03 02:22:13.000812	2014-03-03 02:22:13.000812
21	11	Side Body		1	2014-03-03 02:23:08.02667	2014-03-03 02:23:08.02667
23	12	Side Body		1	2014-03-03 02:23:36.698276	2014-03-03 02:23:36.698276
25	13	Side Body		1	2014-03-08 00:36:43.206611	2014-03-08 00:36:43.206611
27	14	Side Body		1	2014-03-08 00:38:40.304866	2014-03-08 00:38:40.304866
22	12	Body	<p>Thank you for your support of our game Kingdom Come: Deliverance!</p>	0	2014-03-03 02:23:36.693758	2014-04-14 10:24:38.785917
20	11	Body		0	2014-03-03 02:23:08.021583	2014-03-28 14:50:35.440402
26	14	Body	<h2>1. GENERAL PROVISIONS</h2>\r\n<p>1.1. The company <strong>Prague Game Studios s.r.o.</strong>, ID no. 241 55 489, with its registered office at Praha 8, Pernerova 652/55, post code 186 00, registered with the commercial register maintained by the Municipal Court in Prague, section C, file no. 183756 (the <strong>Company</strong>) hereby issues these General Fundraising Terms and Conditions (the <strong>TaC</strong>).</p>\r\n<p>1.2. The Company is raising funds for the development of a computer game with the title “<em>Kingdom Come: Deliverance</em>” (the <strong>Project</strong>). Legal relations between the Company and the person contributing certain amount of money to the Company for the purposes of the Project development (the <strong>Donor</strong>) shall be regulated by these TaC.</p>\r\n<p>1.3. These TaC shall form an integral part of each Contract.</p>\r\n<h2>2. DEFINITIONS</h2>\r\n<p><span style="background-color: transparent;">2.1. Apart from the terms defined elsewhere in these TaC, the following definitions shall apply throughout these TaC:</span>\r\n</p>\r\n<ul><li><span style="background-color: transparent;"><strong>Civil Code</strong> means Czech Act no. 89/2012 Coll., the Civil Code, as amended;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Contribution </strong>means a monetary contribution of the Donor to the Company;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Contract </strong>means a contract between the Company and the Donor regarding the rights and duties of the Parties connected with the Contribution, as further specified by these TaC;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Publishing Date</strong> means the official publishing date of the Project, i.e. the day the Project shall become finished and available via official distribution;&#160;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Parties </strong>mean the Company and the Donor and the Party means any of them;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Payment System</strong> means external internet payment service for the payment of the Contribution;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Personal Information </strong>means the name, e-mail and the address of the Donor;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Price </strong>means lowest possible Contribution connected with specific Reward;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Product</strong> means the outcome of the Project in the form of &#160;user game application;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Reward </strong>means an item, whether tangible or intangible, specified on the Website for each Reward Tier;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Reward Tier </strong>means a combination of Price and Reward specified on the Website; and</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Website </strong>means the website www.kingdomcomerpg.com.</span>\r\n</li>\r\n</ul>\r\n<h2>3. CONCLUSION OF THE CONTRACT</h2>\r\n<p>3.1. The Contract shall be concluded and shall become valid and effective by clicking on the button located on the Website indicating that the Donor agrees with these TaC. By clicking on the button, the Donor accepts these TaC unconditionally and in their full extent.</p>\r\n<p>3.2. The Contract can only be concluded between the Company and a natural person of age 18 or higher. No legal person, whether a company, collective, association or any other kind thereof shall be allowed to enter into the Contract. If a natural person that is entitled to act for or on behalf of any legal person enters into the Contract, that natural person alone shall be bound by the Contract regardless of that person’s powers vis-à-vis the respective legal person.</p>\r\n<h2>4. THE CONTRIBUTION</h2>\r\n<p>4.1. After entering into the Contract, the Donor shall choose the Reward Tier.</p>\r\n<p>4.2. The Donor is obliged to contribute to the Company the Contribution in the amount of the Price according to the chosen Reward Tier or any amount higher, subject to the Donor’s discretion.</p>\r\n<p>4.3. The Contribution shall be paid via the Payment System without undue delay after the conclusion of the Contract.</p>\r\n<p>4.4. In case the Contribution payment is not entered into the Payment System within next 24 hours after the conclusion of the Contract, the Contract automatically terminates (<em>condition subsequent</em>).</p>\r\n<p>4.5. The Contribution is a non-refundable donation that shall be used by the Company solely for the purposes of the development and distribution of the Project and/or the manufacturing and distribution of the Rewards (the Use). Should the total sum of the Contributions exceed the costs of the Use, the exceeding amount shall also be regarded as a non-refundable donation. The Donor waives any right to return of the Contribution or any part of it to the maximum extent allowed by the mandatory provisions of the Civil Code, provided that the Project and the Reward are developed, produced and delivered to the Donor properly.</p>\r\n<p>4.6.\tThe Donor expressly acknowledges that the Contribution is not a purchase. While the Company will take every measure to create the game and provide the Donor with specified Reward, the final product, if any, may be substantially different from the description provided to the Donor at the time when the Contribution was made.</p>\r\n<h2>5. PERSONAL INFORMATION</h2>\r\n<p>5.1. The Donor shall submit to the Company the Personal Information. The Company shall use the Personal Information solely for the purposes of distribution of the Project and the Reward to the Donor (the <strong>Purpose</strong>).</p>\r\n<p>5.2. The Company shall not use the Personal Information for any other purpose. The Company is entitled to disclose the Personal Information to a third party only if such disclosure is necessary for the Purpose.</p>\r\n<p>5.3. The Donor acknowledges that the submission and processing of the Personal Information is necessary for the obligations of the Company under the Contract. The Donor expressly gives his consent to the processing and use of the Personal Information for the Purpose according to this Article 5.</p>\r\n<p>5.4. The Company is not liable for any damage caused by the use of the Personal Information according to this Article 5.</p>\r\n<p>5.5. The Donor represents and warrants that the submitted Personal Information is whole and correct. The Company shall not be liable and shall not be in default regarding any of its obligations under the Contract, should the representation be incorrect or misleading.</p>\r\n<h2>6. RIGHTS AND DUTIES OF THE PARTIES</h2>\r\n<p>6.1. The Company shall deliver to the Donor the Reward and the Product (subject to conditions specified by the relevant Reward Tier chosen by the Donor) without undue delay after the Publishing Date, provided that the Project has been finished.</p>\r\n<p>6.2. By the delivery of the Product to the Donor, the Company grants to the Donor a non-exclusive, limited, non-transferable, personal, end-user licence to use the Product for the Donor’s individual, non-commercial and entertainment purposes only, subject to further End-User Licence Agreement between the Donor and the Company.</p>\r\n<p>6.3. The final form, state and features of the Product and the Reward are strictly subject to the Company’s discretion. The Donor shall not have any rights in that respect and no claim of the Donor shall arise from the final form, state and features of the Product and the Reward.</p>\r\n<p>6.4. Unless expressly stated otherwise, nothing in the Contract and / or these TaC shall have any impact on the intellectual property rights of the Company, including (but not limited to) any such rights with respect to any software, software updates or patches, or other utilities and tools or any other technology, text and audio visual material, the design and appearance of the Website, the Project, the Product and / or the Reward.</p>\r\n<p>6.5. The Company shall use all necessary diligence and professional care to develop, produce and deliver the Product and the Reward with the use of the Contribution. Should the development, production and delivery of the Product and / or the Reward become impossible or non-proportionally difficult, the Company has the right to cancel the Project. In such case, the Company shall publish on the Website an audited financial report regarding the use of the Contributions. The Contribution used according to the report shall be in such case regarded as a non-refundable donation and the Donor waives any right to return of the Contribution or any part of it to the maximum extent allowed by the mandatory provisions of the Civil Code.</p>\r\n<h2>7. LIMITATION OF LIABILITY</h2>\r\n<p>7.1. To the maximum extent permitted by the applicable law, the Donor agrees that the use of the Product and / or the Reward and / or the Website is at the Donor’s sole risk. The Company grants no warranty, whether expressed or implied, regarding the Product, Reward or the Website, unless it is mandatory under applicable legal regulations.</p>\r\n<p>7.2. To the maximum extent permitted by the applicable law, the Parties hereby expressly exclude any liability of the Company for the damage caused by the use of the Product, the Reward or the Website.</p>\r\n<p>7.3. To the maximum extent permitted by the applicable law and unless expressly stated otherwise, the Parties hereby expressly exclude any liability of the Company for the damage caused by the failure of the Company to complete the Project, or to develop, produce and / or deliver the Product and / or the Reward.</p>\r\n<p>7.4. The Company shall not be liable for any delay or failure to perform resulting from causes outside the reasonable control of the Company, including, without limitation, any failure to perform due to unforeseen circumstances or cause beyond the Company’s control such as war, terrorism, riots, embargoes, acts of civil or military authorities, fire, floods, accidents, strikes, or shortages of transportation facilities, fuel, energy, labour or materials.</p>\r\n<h2>8. FINAL PROVISIONS</h2>\r\n<p>8.1. The Contract shall be governed by the Czech law in particular sections 2055-2078 and 2756-2757 of the Civil Code.</p>\r\n<p>8.2. For the purposes of any disputes arising from the Contract, the Parties hereby expressly agree on the international jurisdiction of the Czech courts and local jurisdiction of the relevant courts according to the registered seat of the Company.</p>\r\n<p>8.3. Clauses in these TaC regarding the termination of the Contract contain only conditions for the termination of the Contract. The Parties expressly exclude any and all relevant provisions of the Civil Code that would allow any Party to terminate the Contract or to recall the Contribution in any other way, and in particular the sections 2059, 2068, 2072 of the Civil Code.</p>\r\n<p>8.4. Each Party waives any rights and claims that might arise from the conduct of the other Party prior to conclusion of the Contract. Both Parties acknowledge that they have been made aware of all facts and legal circumstances whilst entering into the Contract in such a way that each Party could rely on the possibility of entering into a valid agreement and that the intent of the other Party to enter into the Contract was undisputable.</p>\r\n<p>8.5. Neither Party is a weaker Party in relation to the other Party. The Contribution is not granted to the Company in a consumer – entrepreneur relation. The Donor acknowledges and accepts that his profit from the Contract in the form of Reward and the right to use the product depends on a future uncertain event (finalisation of the Project) in the meaning of Sec. 2756 and seq. of the Civil Code.</p>\r\n<p>8.6. These TaC shall become valid and effective as of January 1st 2014.</p>	0	2014-03-08 00:38:40.297833	2014-04-15 12:17:57.177424
24	13	Body	<h1><strong>Frequently Asked Questions</strong>\r\n</h1>\r\n<p><strong>I don’t understand the concept of Acts. What is Act I, II and III? Why there is not cheaper tier offering all three Acts?</strong> </p>\r\n<p>Kingdom Come: Deliverance, Act I, as it is planned, is a full scale, stand-alone game. It has 30+ hours of gameplay, complete open world map, all quests and closed story line. Most (if not all) game mechanics described above will be included: horse riding, combat, castle sieges, there will be at least one large-scale battle. Acts II &amp; III extend the story, add new environment in separate maps, new quests, gear and weapons. They will also add new quests to the map of Act I. It will be possible to travel between maps of all Acts, some quests will require you to visit all of them.</p>\r\n<p>We definitely intend to make Acts II &amp; III and release them as soon as possible. However, our funding and schedule does not reach past first Act. We will finalize our plans for the release of Acts II &amp; III when we get closer to the release date of Act I. For these reasons we don’t want to offer and promise them as a Kickstarter reward in their own right. We want to use them as a token of our gratitude to higher tiers backers, but you should think about it more like 100% discount offer than a guaranteed reward.</p>\r\n<p><strong style="background-color: transparent;">What platforms are offered to backers and what is minimum requirement of PC version ?</strong>\r\n</p>\r\n<p>We are developing the game to run smoothly on “good gaming PC” and next-gen consoles. If you have a PC, hardware-wise similar to Xbox One or PS4, you should be able to run Kingdom Come: Deliverance well.</p>\r\n<p><span style="background-color: transparent;">We can offer all version in all tiers (i.e. Windows PC / Mac / Linux / Xbox One / PS4), with the proviso that on consoles the game must be approved by the platform holders first. In case we are not able to finish or release the game on the platform you chose for any reason, you will be able to choose again from available platforms.</span>\r\n</p>\r\n<p><strong style="background-color: transparent;">But how can I choose a specific platform while pledging?</strong>\r\n</p>\r\n<p>Just choose a platform that suits you. You can change this any time later.</p>\r\n<p><strong style="background-color: transparent;">What are the differences between PC and console versions of the game?</strong>\r\n</p>\r\n<p>We develop both version together so neither is a port of the other. Technically speaking, console version will be very similar to a PC one; it’s probable that on a high-end PC you can get better and smoother visual effects but artistic feeling should be very close.</p>\r\n<p>Controls-wise, the game is designed separately for console controller and for keyboard &amp; mouse gaming. Of course, you can still use your favorite game controller on PC or on SteamBox. But if you decide to use mouse and keyboard, you will control the game just like other first-person games on the market: you will be able to use your mouse in the UI, there will be no controller hints and controls will be fully customizable. Some control elements may be slightly different on keyboard &amp; mouse than they are on a gamepad but neither control method will be generally superior to the other.</p>\r\n<p><strong style="background-color: transparent;">Do you plan to support Oculus Rift?</strong>\r\n</p>\r\n<p>Cryengine supports Oculus Rift by default, so general answer is: yes. We plan to support this awesome hardware gadget.</p>\r\n<p>Oculus Rift captured the imagination of many players and you ask about it very often. Cryengine supports Oculus Rift by default, however we realize that the game has to be developed with Oculus in mind and we are aware of their recommended Best Practices. We shall try to stick to these recommendations, but VR is still an uncharted territory and we can’t guarantee ideal results from get go. To create horse riding experience that won’t give you motion sickness looks like a real challenge.</p>\r\n<p><strong style="background-color: transparent;">What language versions do you plan?</strong>\r\n</p>\r\n<p>We’re creating the game in English and with English voiceovers. We would like to make French, Italian, German and Spanish versions of the game as well. Our past experience also suggests there will be a Polish, Russian and Czech version of the game, not necessarily with voiceovers, though.</p>\r\n<p><strong style="background-color: transparent;">You described the game also as a sandbox but how much sandboxy is going to be? Can I buy castles or run an army for example?</strong>\r\n</p>\r\n<p>Many people wonder how much of a sandbox our sandbox is going to be. You will be able to solve quests in multiple ways, kill most of NPCs or influence their day/night cycles. We have a complex system of reputation, relationships and law. You can influence local economy to an extent (price of goods).</p>\r\n<p>The player’s character is going to have a place to stay and live, but you will not be able to buy and sell real estate. Nor you can control other characters. Companions/henchmen have their own AI and they are quest-specific. Your character will develop relationships with NPCs.</p>\r\n<p><strong style="background-color: transparent;">9 square km doesn't sound like a lot so what about the map size?</strong>\r\n</p>\r\n<p>Some people are concerned about our maps size and seem to think that 9 sq. km. is not enough. Please trust us that it is. Our map is bigger than the one in Read Dead Redemption. The population/point-of-interest density is going to be on par with RDR. We want the world to look natural.</p>\r\n<p>Also please mind that both Act II and Act III will each come with their own map, although they will be a bit smaller the length of designed gameplay should be on par with Act I.</p>\r\n<p><strong style="background-color: transparent;">What about multiplayer? Some of your systems could make for a cool multiplayre experience.</strong>\r\n</p>\r\n<p>There seems to be demand for multiplayer experience. Unfortunately, Kingdom Come: Deliverance is a singleplayer game only. We are thinking about cooperative multiplayer in some further future, but definitely not for Act I.</p>\r\n<p><strong style="background-color: transparent;">Do you plan to implement 3rd person view?</strong>\r\n</p>\r\n<p>We are sorry, but we do not plan to allow you to control your character in 3rd person view (TPV). You will be able to see your character e.g. in cutscenes, dialogues or in the inventory screen, you can also see your body and hands all the time. We believe that FPV allows for better immersion in the world; we also think that we can make the FPV combat work. Moreover the many of the systems, including combat, are designed with FPV in mind and wouldn't work in TPV without a major redesign.</p>\r\n<p><strong style="background-color: transparent;">Can I get a DRM-free version of the game?</strong>\r\n</p>\r\n<p>We get many questions about DRM and whether our game is going to be DRM free. Frankly, we have to admit we are not sure at this moment. We are planning to use Steam on open platforms, so the game will be using Steam default copy protection mechanics. Other options including <a href="http://www.gog.com/" title="http://www.gog.com/" target="_blank">GOG.com</a> are being considered but can't be confirmed as of yet.</p>	0	2014-03-08 00:36:42.962435	2014-04-15 21:20:15.420934
18	10	Body	<h1><strong>Rewards Description</strong>\r\n</h1>\r\n<h2><strong>Basic Edition</strong>\r\n</h2>\r\n<p><strong>Forum access &amp; badge: </strong>You will be able to post on our forums with your backer's badge. You will have access to VIP part of forum to discuss game features. </p>\r\n<p><strong>Digital copy of the game: </strong>You will be able to download and play a copy of Act I of our game.</p>\r\n<p><strong>Digital manual, Soundtrack, Making-of video: </strong>You will get PDF copy of the game manual, complete game soundtrack in mp3, and digital version of our making of documentary.</p>\r\n<p><strong>Boxed copy of the game: </strong>You will receive your own copy of Act I in standard DVD box with manual.</p>\r\n<h2>Special Edition</h2>\r\n<p><strong>Alpha access: </strong>You will in-effect become part of our development team, getting access to the earliest barely playable version of Kingdom Come: Deliverance. Your comments and observations will help to shape the game.</p>\r\n<p><strong>Beta access:</strong> This is similar to <a href="/kingdom-come-deliverance/what-is-early-access" title="What is Early Access">Early access</a> on Steam.</p>\r\n<h2><strong>Collector's edition</strong>\r\n</h2>\r\n<p><strong style="background-color: transparent;">T-Shirt: </strong>\r\n<span style="background-color: transparent;">T-shirt with Kingdom Come: Deliverance motifs.</span>\r\n</p>\r\n<div><p><span style="background-color: transparent;"><strong>Art book: </strong>100+ pages art book printed on quality stock paper, with artworks for the game.</span>\r\n</p>\r\n<p><span style="background-color: transparent;"><strong>Digital art book:&#160;</strong>100+ pages art book with artworks for the game in PDF format.</span>\r\n</p>\r\n<p><span style="background-color: transparent;"><strong>Poster/Signed poster: </strong>24" x 36" full color poster of the game. In higher tiers this poster will be signed by members of the development team.</span>\r\n</p>\r\n<p><strong>Digital High-res Poster:&#160;</strong>24" x 36" full color poster of the game in high resolution ready to print.<span style="background-color: transparent;"></span>\r\n</p>\r\n<p><strong>Digital High-res Map: </strong>Detailed map&#160;of the playable area of Act I in high resolution ready to print.</p>\r\n<p><strong>Screenplay of Act I: </strong>Screenplay introducing the historical background, main characters of Act I&#160;<span style="background-color: transparent;">and featured story lines in PDF format.</span>\r\n</p>\r\n<p><strong style="background-color: transparent;">Action figure: </strong>\r\n<span style="background-color: transparent;">A quality die-cast 4" action figure. We briefly entertained a possibility of making plastic figures in China, but then we thought better of it. Europe has a tradition of tin soldiers and so we found someone to produce a beautiful, detailed, metal, four inch figure of a knight.</span>\r\n</p>\r\n<p><strong>3D printer ready Action figure model: </strong>Design of a character from Act I in a file supporting 3D printers, ready to create the action figure at home.<span style="background-color: transparent;"></span>\r\n</p>\r\n<p><strong>Acts II &amp; III: </strong>You will be able to download Act II or II &amp; III of Kingdom Come: Deliverance if and when they are released. We assume that it will take us nine months to develop Act II and further nine months for Act III. Please note that we cannot guarantee developing these Acts; while it is our best intention to do so at this moment, circumstances beyond our control may force us to alter our plans. <a href="/kingdom-come-deliverance/faq" title="FAQ">What are these Acts?</a>\r\n</p>\r\n<p><strong>Dice:</strong> A set for playing authentic medieval precursor to computer games.</p>\r\n<p><strong>Commemorative coin:</strong> Unique coin with original design, stamped in limited quantity for our backers. In lower tiers, the coin will be made of brass; for higher levels, it will be made of sterling silver. Our coin is not going to be a thin penny-press elongateds. One of our best engravers, Dan’s buddy and former classmate, Martin Reichard, who creates gold and silver designs for the best mints, will create a top notch collectible 30x2mm coin with a game motif. Look at his older designs (works for the <a href="http://www.prague-mint.eu/" title="http://www.prague-mint.eu/">Prague Mint</a>) and see for yourself.</p>\r\n<p><strong style="background-color: transparent;">Copper engraving:</strong>\r\n<span style="background-color: transparent;"> An original, limited series print from one of the best engravers in our country and Dan’s friend, Jindra (Henry) Faktor. You can get ready for an exceptional artistic work, numbered and signed on luxury, hand-made paper. This will be an 6" x 8" print made from wooden plate in limited quantity. It will feature a motif from the game.</span>\r\n</p>\r\n<p><strong style="background-color: transparent;">Visit in our office: </strong>\r\n<span style="background-color: transparent;">Opportunity to visit our studio and talk with the team in medieval tavern.</span>\r\n</p>\r\n<p><strong>Guided tour: </strong>We will treat you to a two day trip through the real-world locations that served as models for the places within the game. We shall have a professional archaeologist/historian to guide you and explain everything and you will be able to get to places that are normally off limits. </p>\r\n<h2>In-game bonuses</h2>\r\n<p><strong>In-game Calvary memorial (crucifix): </strong>The world of Kingdom Come: Deliverance is dotted with small memorial crosses – small stone or wooden crucifixes on a stone plinth. The plinth carries an inscription that can include your name.</p>\r\n<p><strong>In-game Conciliatory cross: </strong>Similar to the Calvary memorial above, but smaller and less conspicuous. These crosses were usually put up on places where a crime has occurred, as a gesture of reconciliation. The cross will carry your name.</p>\r\n<p><strong>In-game Church painting: </strong>Every town or village in Kingdom Come: Deliverance will have a church. You face can appear in one of them as the face of a saint, or some other figure, on paintings inside.</p>\r\n<p><strong>In-game Statue:</strong> We shall create a statue of a saint of your choice and endow him or her with your likeness. The statue will be a prominent feature of one of the in-game churches.</p>\r\n<h2>Collector's items</h2>\r\n<p>Various collector's items are part of our special editions. We are making an authentic medieval game and everything you are going to get, are unique, bespoke crafted items, far cry from plastic tchotchke.&#160;It may have something to do with the fact that Dan studied at School of applied arts in Turnov among engravers, smiths and goldsmiths, he doesn’t settle for less and knows a lot of craftsmen that can help us.</p>\r\n<h3><span style="background-color: transparent;">Swords</span>\r\n</h3>\r\n<p>Swords are perhaps the most attractive reward. Fantastic looking swords covered from grip to tip by Celtic knots, glass gems and entwined dragons are available almost anywhere for few bucks. Such a worthless trinket will of course break when a zombie apocalypse comes and you try to use it to decapitate an undead one.</p>\r\n<p>Our swords are real, made for fencing, with forged blades, you can take them to battle. Of course, these are replicas of real swords, no phantasmagoria from a kids movie. The blade will be decorated by etching or engraving and pommel with a pattern. This is not a toy! You have to be 18+. Please check your country laws about import.</p>\r\n<ul><li><span style="background-color: transparent;"><strong>Sword (Emperor): </strong>You will receive a hand made, forged, one-handed sword with inscription</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Deliverance Sword (Wenzel)</strong> – Deliverance motive&#160;</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Sword (Pope)</strong> – Personal inscription</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Sword (Iluminatus/Saint)</strong> – One and half handed, personal inscription</span>\r\n</li>\r\n<li><span style="background-color: transparent;"><strong>Shield: </strong>This will be hand-decorated shield adorned with coat-of-arms of a noble family related to the events within the game</span>\r\n</li>\r\n</ul>\r\n<p><span style="background-color: transparent;">As we are going to need really lot of swords, they are probably going to be produced in more workshops. At the bottom, you can watch the video where Dan visits some of them to see their manufacturing process. In this case it’s Dan’s former fellow student Ondřej Piskáček and one of the biggest armories in Europe – </span>\r\n<a title="http://www.kovex-ars.cz/" href="http://www.kovex-ars.cz/" target="_blank" style="background-color: transparent;">Kovex Ars</a>\r\n<span style="background-color: transparent;">.</span>\r\n</p>\r\n<p>&#160;<img src="/system/images/W1siZiIsIjIwMTQvMDMvMjgvMTZfNTZfNTVfOTU1X21lY2VhemJyb2plLmpwZyJdLFsicCIsInRodW1iIiwiNDUweDQ1MD4iXSxbInAiLCJzdHJpcCJdXQ/meceazbroje.jpg" title="Meceazbroje" alt="Meceazbroje" data-rel="450x450" height="336" width="450" /></p>\r\n<h3>Action Figure</h3>\r\n<p>We briefly entertained a possibility of making plastic figures in China, but then we thought better of it. Europe has a tradition of tin soldiers and so we were looking for someone to produce a beautiful, detailed, metal, four inch figure of a knight. And we found him, as you can see. (The images demonstrate quality of craftsmanship, the actual figure will be that of an in-game character.)</p>\r\n<p><img src="/system/images/W1siZiIsIjIwMTQvMDMvMjgvMTZfNTZfNTBfNDEwX2ZpZ3Vya3kuanBnIl0sWyJwIiwidGh1bWIiLCI0NTB4NDUwPiJdLFsicCIsInN0cmlwIl1d/figurky.jpg" title="Figurky" alt="Figurky" data-rel="450x450" height="336" width="450" /></p>\r\n<h3>Engraving</h3>\r\n<p>We can give you a poster (actually, we will). But for higher tiers we wanted something special – an original, limited series print from one of the best engravers in our country and Dan’s friend, Jindra (Henry) Faktor.</p>\r\n<p>Originally we were thinking about a copper engraving (and that’s what the rewards say), but then we realized copper engravings only became widespread in the second half of 15th century. Jindra suggested woodcut and you can get ready for an exceptional artistic work, numbered and signed on luxury, hand-made paper. The pictures show some of Jindra’s work and an original print of a fifteenth century woodblock.</p>\r\n<p><img src="/system/images/W1siZiIsIjIwMTQvMDMvMjgvMTZfNTZfNDRfNDAxX2VuZ3JhdmluZy5qcGciXSxbInAiLCJ0aHVtYiIsIjQ1MHg0NTA%2BIl0sWyJwIiwic3RyaXAiXV0/engraving.jpg" title="Engraving" alt="Engraving" data-rel="450x450" height="450" width="425" /></p>\r\n<h3>Coin</h3>\r\n<p>Our coin is not going to be a thin penny-press elongateds. One of our best engravers, Dan’s buddy and former classmate, Martin Reichard, who creates gold and silver designs for the best mints, will create a top notch collectible 30x2mm coin with a game motif. Look at his older designs (works for the <a title="http://www.prague-mint.eu/" href="http://www.prague-mint.eu/" target="_blank">Prague Mint</a>) and see for yourself.</p>\r\n<p><img src="/system/images/W1siZiIsIjIwMTQvMDMvMjgvMTZfNTZfMzRfNTI2X2NvaW5zLmpwZyJdLFsicCIsInRodW1iIiwiNDUweDQ1MD4iXSxbInAiLCJzdHJpcCJdXQ/coins.jpg" title="Coins" alt="Coins" data-rel="450x450" height="422" width="450" /></p>\r\n</div>	0	2014-03-03 02:22:38.79884	2014-04-16 13:22:03.965888
19	10	Side Body	<h3>Kickstarter rewards</h3>\r\n<p>The ingame bonuses and collector's items were offered through the <a href="http://www.kickstarter.com/projects/1294225970/kingdom-come-deliverance" title="http://www.kickstarter.com/projects/1294225970/kingdom-come-deliverance" target="_blank">Kickstarter campaign</a> and are no longer available, at least for now. Please visit our shop often to see, what new pledges become available.</p>\r\n<p>Thank you!</p>	1	2014-03-03 02:22:38.805881	2014-04-17 12:48:14.507987
16	9	Body	<h1>What is Early Access</h1>\r\n<p>Since we are going to self-publish the game and are asking for the help of the community, we are also willing to give something back and develop the game with the community.</p>\r\n<p>What does it mean? In Q4 2014 we will release an early build of the game, with one smaller location (village and a part of the countryside) where you will be able to test core mechanics of the game. We will start with the basic mechanics (interaction with the world, inventory, map, NPC cycles) and we will constantly update this build with new features as we progress with the development (dialogues, bows, hunting, crafting, combat, horses). This is the access to Alpha version of the game and it will be available to all tiers from the Baron onwards.</p>\r\n<p>When the game is in Beta stage, we will release it as Early Access on PC (or any other platform where it’s going to be possible) for all backers up from the Knight Tier.</p>\r\n<p>Our backers can influence the development, help us improve the game, and give us feedback about our game mechanics.</p>	0	2014-03-03 02:22:12.995422	2014-04-15 23:09:26.3632
\.


--
-- Name: refinery_page_parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('refinery_page_parts_id_seq', 27, true);


--
-- Data for Name: refinery_page_translations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_page_translations (id, refinery_page_id, locale, created_at, updated_at, title, custom_slug, menu_title, slug) FROM stdin;
1	1	en	2014-03-03 01:52:30.797311	2014-03-03 01:52:30.826894	Home	\N	\N	home
2	2	en	2014-03-03 01:52:30.99175	2014-03-03 01:52:30.99877	Page not found	\N	\N	page-not-found
3	3	en	2014-03-03 01:52:31.070454	2014-03-03 01:52:31.07739	About	\N	\N	about
4	4	en	2014-03-03 01:52:31.322357	2014-03-03 01:52:31.329485	Projects	\N	\N	projects
5	5	en	2014-03-03 01:52:31.395238	2014-03-03 01:52:31.407318	Tiers	\N	\N	tiers
6	6	en	2014-03-03 01:52:31.466736	2014-03-03 01:52:31.481403	Orders	\N	\N	orders
7	7	en	2014-03-03 01:52:31.540088	2014-03-03 01:52:31.551958	User Histories	\N	\N	user-histories
8	8	en	2014-03-03 02:21:39.38341	2014-03-03 02:21:39.395125	Kingdom Come: Deliverance	\N		kingdom-come-deliverance
9	9	en	2014-03-03 02:22:12.984688	2014-03-03 02:22:12.992983	What is Early Access	\N		what-is-early-access
12	12	en	2014-03-03 02:23:36.685402	2014-03-03 02:23:36.691812	Thank you	\N		thank-you
13	13	en	2014-03-08 00:36:42.941993	2014-03-08 00:36:42.958984	FAQ	\N		faq
14	14	en	2014-03-08 00:38:40.288437	2014-03-08 00:38:40.295859	Terms & Conditions	\N		terms-conditions
10	10	en	2014-03-03 02:22:38.789817	2014-03-28 13:00:16.010431	Rewards Description	\N		rewards-description--2
11	11	en	2014-03-03 02:23:08.012128	2014-04-14 08:30:58.938541	Back This Project	\N		back-this-project
\.


--
-- Name: refinery_page_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('refinery_page_translations_id_seq', 14, true);


--
-- Data for Name: refinery_pages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_pages (id, parent_id, path, slug, show_in_menu, link_url, menu_match, deletable, draft, skip_to_first_child, lft, rgt, depth, view_template, layout_template, created_at, updated_at) FROM stdin;
13	8	\N	faq	f		\N	t	f	f	24	25	1	show	\N	2014-03-08 00:36:42.955836	2014-03-08 00:36:42.955836
9	8	\N	what-is-early-access	f		\N	t	f	f	18	19	1	show	\N	2014-03-03 02:22:12.990117	2014-03-03 02:22:12.990117
10	8	\N	rewards-description--2	f		\N	t	f	f	20	21	1	show	\N	2014-03-03 02:22:38.794232	2014-03-28 13:00:16.005515
1	\N	\N	home	t	/	^/$	f	f	f	1	4	0	\N	\N	2014-03-03 01:52:30.823488	2014-03-03 01:52:30.823488
2	1	\N	page-not-found	f	\N	^/404$	f	f	f	2	3	1	\N	\N	2014-03-03 01:52:30.996978	2014-03-03 01:52:30.996978
3	\N	\N	about	t	\N	\N	t	f	f	5	6	0	\N	\N	2014-03-03 01:52:31.075557	2014-03-03 01:52:31.075557
4	\N	\N	projects	t	/projects	^/projects(/|/.+?|)$	f	f	f	7	8	0	\N	\N	2014-03-03 01:52:31.327602	2014-03-03 01:52:31.327602
5	\N	\N	tiers	t	/tiers	^/tiers(/|/.+?|)$	f	f	f	9	10	0	\N	\N	2014-03-03 01:52:31.40414	2014-03-03 01:52:31.40414
6	\N	\N	orders	t	/orders	^/orders(/|/.+?|)$	f	f	f	11	12	0	\N	\N	2014-03-03 01:52:31.477421	2014-03-03 01:52:31.477421
7	\N	\N	user-histories	t	/user_histories	^/user_histories(/|/.+?|)$	f	f	f	13	14	0	\N	\N	2014-03-03 01:52:31.547828	2014-03-03 01:52:31.547828
8	\N	\N	kingdom-come-deliverance	f		\N	t	f	f	15	26	0	show	\N	2014-03-03 02:21:39.391783	2014-03-03 02:21:39.391783
11	8	\N	back-this-project	f	/#tier	\N	t	f	f	16	17	1	show	\N	2014-03-03 02:23:08.017328	2014-04-14 08:30:58.933932
12	\N	\N	thank-you	f		\N	t	f	f	27	28	0	show	\N	2014-03-03 02:23:36.689721	2014-03-03 02:23:36.689721
14	8	\N	terms-conditions	f		\N	t	f	f	22	23	1	show	\N	2014-03-08 00:38:40.293771	2014-03-08 00:38:40.293771
\.


--
-- Name: refinery_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('refinery_pages_id_seq', 14, true);


--
-- Data for Name: refinery_projects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_projects (id, title, short_description, long_description, goal, main_image_id, image_1_id, image_2_id, image_3_id, image_4_id, image_5_id, active, video, faq, terms, updates, "position", created_at, updated_at, goal_text) FROM stdin;
1	Kingdom Come: Deliverance		<h1>Crowd Funding Revolution</h1>\r\n<p>In the past, when you wanted to develop a big AAA game, you needed a publisher. You needed to convince guys in suits, who don’t understand games at all, to give you money. Those guys usually don’t like <span id="626c7a63-f7f7-490c-bb29-733c65784121" class="GINGER_SOFTWARE_mark">original unproven</span> ideas and so most of the games were uninspired clones of each other. Fortunately these times are over.</p>\r\n<p>Our game is being developed without the aid of traditional publishers, so it relies on your support and funding from private investors. Originally we tried to approach publishers, but they refused to finance <span id="f0de4adf-c0da-4c58-8acc-92b2dcc1c1a1" class="GINGER_SOFTWARE_mark">project</span> they considered to be too risky and niche.</p>\r\n<p>After two years of development without finding a publisher to finance us, it seemed that we would have to close doors. So we tried our last chance and started a Kickstarter campaign. And it turned out that our game is anything but <span id="c59a56a4-1d8e-4cde-8a87-86a28e59091b" class="GINGER_SOFTWARE_mark">niche</span>. We raised over <strong>£1.1 million</strong> (US$1.82 million) within one month and the response from gamers and media was awesome.</p>\r\n<p>The game was saved and overnight it grew to be one of the most expected projects. We can hardly expressed how we felt after months of desperation. Now we are independent of publishers, funded by private investors and our fans. This gives us creative freedom to make the best game we can. If you like what we do, please support our game. In exchange you will get a chance to influence its design and play an early access version.</p>\r\n<p>Help us to bring our vision to life. Help us to create not the 176th free-to-play mobile RPG MMO Elven village-builder with DIAMONDS™, but a unique, engaging experience we think you’d like to play. Every extra dollar will allow us to make the final product that much better because it means more money for development and more support from our investor.</p>	2000000	\N	\N	\N	\N	\N	\N	t					0	2014-03-03 02:05:50.150266	2014-04-15 20:17:11.169092	<p>We shall be able to hire better actors for both voiceovers and performance capture. This will enhance the atmosphere and immersion in the game.</p>
\.


--
-- Name: refinery_projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('refinery_projects_id_seq', 1, true);


--
-- Data for Name: refinery_resources; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_resources (id, file_mime_type, file_name, file_size, file_uid, file_ext, created_at, updated_at) FROM stdin;
\.


--
-- Name: refinery_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('refinery_resources_id_seq', 1, false);


--
-- Data for Name: refinery_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_roles (id, title) FROM stdin;
1	Refinery
2	Superuser
3	Backer
\.


--
-- Name: refinery_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('refinery_roles_id_seq', 3, true);


--
-- Data for Name: refinery_roles_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_roles_users (user_id, role_id) FROM stdin;
1	2
1	1
2	3
3	1
3	2
6	3
7	3
8	3
9	3
10	3
11	3
12	3
13	3
14	3
15	3
16	3
17	3
\.


--
-- Data for Name: refinery_tiers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_tiers (id, title, price, "limit", physical, short_description, long_description, active, image_1_id, image_2_id, image_3_id, "position", created_at, updated_at, project_id, platform_1, platform_2, tshirt, ingame_name, sword_legal, side_text, price_text) FROM stdin;
2	SOLDIER TIER DIGITAL (Basic Edition)	25	\N	f	<p>With the Soldier (digital) reward tier you are going to receive digital copy of Act I and access to our forums with the Soldier forum badge.</p>	\r\n\r\n<p><strong style="background-color: transparent;">Forum access &amp; badge: </strong>\r\n<span style="background-color: transparent;">You will be able to post on our forums with your backer's badge and have access to VIP part of forum to discuss game features.</span>\r\n</p>\r\n<p><strong>Digital copy of the game: </strong>You will be able to download and play a copy of <a href="/kingdom-come-deliverance/faq" title="FAQ">Act I</a> of our game available on Steam.</p>	t	11	25	\N	1	2014-03-03 02:17:08.360496	2014-04-17 19:54:16.294992	1	t	f	f	f	f	<h2>Minimum hardware requirements </h2>\r\n<p>Quadcore CPU </p>\r\n<p>DirectX 11.0 capable GPU</p>\r\n<p>8GB RAM </p>\r\n<p>25GB HDD</p>\r\n<p><span style="background-color: transparent;">Internet connection</span>\r\n</p>\r\n<h2>Avilable platforms </h2>\r\n<p>PC (Windows 7 x64 or Linux)</p>\r\n<p>Apple Mac</p>\r\n<h2><span style="background-color: transparent;">Release date</span>\r\n</h2>\r\n<p>Aprox Q4 2015</p>	
1	PEASANT TIER	5	\N	f	<p>With the Peasant reward tier you are going to receive access to our forums with the Peasant forum badge.</p>	\r\n<p><strong style="background-color: transparent;">Forum access &amp; badge: </strong>\r\n<span style="background-color: transparent;">\r\n</span>\r\n<span style="background-color: transparent;">You will be able to post on our forums with your backer's badge and have access to VIP part of forum to discuss game features.</span>\r\n</p>	t	1	\N	\N	0	2014-03-03 02:15:50.363482	2014-04-17 19:53:56.011832	1	f	f	f	f	f		
3	SOLDIER TIER PHYSICAL (Basic Edition)	35	\N	t	<p>With the Soldier (physical) reward tier you are going to receive boxed copy of Act I and access to our forums with the Soldier forum badge.</p>	\r\n\r\n<p><strong style="background-color: transparent;">Forum access &amp; badge: </strong>\r\n<span style="background-color: transparent;">You will be able to post on our forums with your backer's badge and have access to VIP part of forum to discuss game features.&#160;</span>\r\n</p>\r\n<p><strong>Boxed copy of the game: </strong>You will receive your own copy of <a href="/kingdom-come-deliverance/faq" title="FAQ">Act I</a> in standard DVD box with manual.</p>	t	11	25	\N	2	2014-03-03 02:18:00.838174	2014-04-17 19:54:32.067711	1	t	f	f	f	f	<h2>Minimum hardware requirements</h2>\r\n<p>Quadcore CPU</p>\r\n<p>DirectX 11.0 capable GPU</p>\r\n<p>8GB RAM</p>\r\n<p>25GB HDD</p>\r\n<p>DVD/Blue-ray drive</p>\r\n<p>Internet connection</p>\r\n<h2>Available platforms</h2>\r\n<p>PC (Windows 7 x64 or Linux)</p>\r\n<p>Apple Mac</p>\r\n<h2>Release date</h2>\r\n<p>Aprox Q4 2015</p>	
5	KNIGHT TIER PHYSICAL (Special Edition)	45	\N	t	<p>With the Knight (physical) reward tier you are going to receive digipak including copy of Act I, printed&#160;manual, soundtrack CD and making-of DVD, access to our forums with the Knight forum badge and Beta access.</p>	\r\n\r\n<p><strong style="background-color: transparent;">Forum access &amp; badge:</strong>\r\n<span style="background-color: transparent;">\r\n</span>\r\n<span style="background-color: transparent;"> You will be able to post on our forums with your backer's badge and have access to VIP part of forum to discuss game features.&#160;</span>\r\n</p>\r\n<p><strong>Digipak copy of the game: </strong>You will receive your own copy of Act I in a nice digipak box.</p>\r\n<p><strong>Manual:</strong> Copy of the printed game manual.</p>\r\n<p><strong>OST:</strong> Complete game soundtrack on CD<span style="background-color: transparent;">.</span>\r\n</p>\r\n<p><span style="background-color: transparent;"><strong>Making-of: </strong>DVD with our making-of documentary.</span>\r\n</p>\r\n<p><strong>Beta access: </strong>This is similar to <a href="/kingdom-come-deliverance/what-is-early-access" title="What is Early Access">Early access</a> on Steam.</p>	t	8	27	\N	4	2014-03-03 02:19:51.950712	2014-04-17 19:54:57.84535	1	t	f	f	f	f	<h2>Minimum hardware requirements</h2>\r\n<p>Quadcore CPU</p>\r\n<p>DirectX 11.0 capable GPU</p>\r\n<p>8GB RAM</p>\r\n<p>25GB HDD</p>\r\n<p>DVD/Blue-ray drive</p>\r\n<p>Internet connection</p>\r\n<h2>Available platforms</h2>\r\n<p>PC (Windows 7 x64 or Linux)</p>\r\n<p>Apple Mac</p>\r\n<h2>Release date</h2>\r\n<p>Aprox Q4 2015</p>	
8	VISCOUNT TIER DIGITAL (Collector's Edition)	70	\N	f	<p>With the Viscount (digital) reward tier you are going to receive digital copy of Act I, access to our forums with the Viscount forum badge, Beta access, Alpha access and collector's items including digital art book, high-res poster and map, screenplay of Act I or 3D printer ready Action figure model.</p>	\r\n<p><strong style="background-color: transparent;">Forum access &amp; badge:</strong>\r\n<span style="background-color: transparent;"> You will be able to post on our forums with your backer's badge and have access to VIP part of forum to discuss game features.&#160;</span>\r\n</p>\r\n<p><strong>Digital copy of the game: </strong>You will be able to download and play a copy of <a href="/kingdom-come-deliverance/faq" title="FAQ">Act I</a> of our game available on Steam.</p>\r\n<p><strong>Manual: </strong>PDF copy of the game manual.</p>\r\n<p><strong>OST: </strong>Complete game soundtrack in mp3.</p>\r\n<p><strong>Making-of: </strong>Digital version of our making-of documentary.</p>\r\n<p><strong style="background-color: transparent;">Alpha access:</strong>\r\n<span style="background-color: transparent;"> You will in-effect become part of our development team, getting access to the earliest barely playable version of <em>Kingdom Come: Deliverance</em>. Your comments and observations will help to shape the game.</span>\r\n</p>\r\n<p><strong>Beta access: </strong>This is similar to <a href="/kingdom-come-deliverance/what-is-early-access" title="What is Early Access">Early access</a> on Steam.</p>\r\n<p><strong>Digital art book: </strong>100+ pages art book with artworks for the game in PDF format.</p>\r\n<p><span style="background-color: transparent;"><strong>Digital High-res Poster: </strong>24" x 36" full color poster of the game in high resolution ready to print.</span>\r\n</p>\r\n<p><strong>Digital High-res Map: </strong>Detailed map of the playable area of Act I in high resolution ready to print.</p>\r\n<p><strong>Screenplay of Act I: </strong>Screenplay introducing the historical background, main characters of Act I and featured story lines in PDF format.</p>\r\n<p><strong>3D printer ready Action figure model: </strong>Design of a character from Act I in a file supporting 3D printers, ready to create the action figure at home.</p>	t	24	29	\N	7	2014-03-29 00:04:13.925759	2014-04-17 19:55:35.032692	1	t	f	f	f	f	<h2>Minimum hardware requirements</h2>\r\n<p>Quadcore CPU</p>\r\n<p>DirectX 11.0 capable GPU</p>\r\n<p>8GB RAM</p>\r\n<p>25GB HDD</p>\r\n<p><span style="background-color: transparent;">Internet connection</span>\r\n</p>\r\n<h2>Available platforms</h2>\r\n<p>PC (Windows 7 x64 or Linux)</p>\r\n<p>Apple Mac</p>\r\n<h2>Release date</h2>\r\n<p>Aprox Q4 2015</p>	
7	BARON TIER PHYSICAL (Special Edition)	55	\N	t	<p>With the Baron (physical) reward tier you are going to receive digipak including copy of Act I, printed manual, soundtrack CD and making-of DVD,  access to our forums with the Baron forum badge, Beta access and Alpha access.</p>	\r\n<p><strong style="background-color: transparent;">Forum access &amp; badge:</strong>\r\n<span style="background-color: transparent;">\r\n</span>\r\n<span style="background-color: transparent;"> You will be able to post on our forums with your backer's badge and have access to VIP part of forum to&#160;</span>\r\n<span style="background-color: transparent;">\r\n</span>\r\n<span style="background-color: transparent;">discuss game features.&#160;</span>\r\n</p>\r\n<p><span style="background-color: transparent;"><strong>Digipak copy of the game: </strong>You will receive your own copy of <a href="/kingdom-come-deliverance/faq" title="FAQ">Act I</a> in a nice digipak box.&#160;</span>\r\n</p>\r\n<p><strong>Manual:</strong> Copy of the printed game manual.</p>\r\n<p><strong>OST: </strong>Complete game soundtrack on CD.</p>\r\n<p><strong>Making-of: </strong>DVD with our making-of documentary.</p>\r\n<p><strong>Alpha access: </strong>You will in-effect become part of our development team, getting access to the earliest barely playable version of <em>Kingdom Come: Deliverance</em>. Your comments and observations will help to shape the game.</p>\r\n<p><strong>Beta access: </strong>This is similar to <a href="/kingdom-come-deliverance/what-is-early-access" title="What is Early Access">Early access</a> on Steam.</p>	t	2	28	\N	6	2014-03-28 23:55:38.877398	2014-04-17 19:55:21.291033	1	t	f	f	f	f	<h2>Minimum hardware requirements</h2>\r\n<p>Quadcore CPU</p>\r\n<p>DirectX 11.0 capable GPU</p>\r\n<p>8GB RAM</p>\r\n<p>25 GB HDD</p>\r\n<p>DVD/Blue-ray drive</p>\r\n<p>Internet connection</p>\r\n<h2>Available platforms</h2>\r\n<p>PC (Windows 7 x64 or Linux)</p>\r\n<p>Apple Mac</p>\r\n<h2>Release date</h2>\r\n<p>Aprox Q4 2015</p>	
4	KNIGHT TIER DIGITAL (Special Edition)	35	\N	f	<p>With the Knight (digital) reward tier you are going to receive digital copy of Act I, access to our forums with the Knight forum badge, digital manual, soundtrack and making-of video and Beta Access.</p>	\r\n<p><strong style="background-color: transparent;">Forum access &amp; badge: </strong>\r\n<span style="background-color: transparent;">You will be able to post on our forums with your backer's badge and have access to VIP part of forum to discuss game features.&#160;</span>\r\n</p>\r\n<p><span style="background-color: transparent;"><strong>Digital copy of the game: </strong>You will be able to download and play a copy of <a href="/kingdom-come-deliverance/faq" title="FAQ">Act I</a> of our game available on Steam.</span>\r\n</p>\r\n<p><strong>Manual: </strong>PDF copy of the game manual.</p>\r\n<p><strong>OST: </strong>Complete game soundtrack in mp3.</p>\r\n<p><strong>Making-of: </strong>Digital version of our making-of documentary.</p>\r\n<p><strong>Beta access:</strong> This is similar to <a href="/kingdom-come-deliverance/what-is-early-access" title="What is Early Access">Early access</a> on Steam.</p>	t	8	27	\N	3	2014-03-03 02:18:50.932715	2014-04-17 19:54:44.395252	1	t	f	f	f	f	<h2><strong>Minimum hardware requirements</strong>\r\n</h2>\r\n<p>Quadcore CPU</p>\r\n<p>DirectX 11.0 capable GPU</p>\r\n<p>8GB RAM</p>\r\n<p>25GB HDD</p>\r\n<p><span style="background-color: transparent;">Internet connection</span>\r\n</p>\r\n<h2><strong>Available platforms</strong>\r\n</h2>\r\n<p>PC (Windows 7 x64 or Linux)</p>\r\n<p>Apple Mac</p>\r\n<h2><strong>Release date</strong>\r\n</h2>\r\n<p>Aprox Q4 2015</p>	
6	BARON TIER DIGITAL (Special Edition)	45	\N	f	<p>With the Baron (digital) reward tier you are going to receive digital copy of Act I, access to our forums with the Baron forum badge, digital manual, soundtrack and making-of video, Beta access and Alpha access.</p>	\r\n\r\n<p><strong style="background-color: transparent;">Forum access &amp; badge: </strong>\r\n<span style="background-color: transparent;">You will be able to post on our forums with your backer's badge and have access to VIP part of forum to discuss game features.&#160;</span>\r\n</p>\r\n<p><strong>Digital copy of the game: </strong>You will be able to download and play a copy of <a href="/kingdom-come-deliverance/faq" title="FAQ">Act I</a> of our game available on Steam.</p>\r\n<p><strong>Manual: </strong>PDF copy of the game manual.</p>\r\n<p><strong>OST: </strong>Complete game soundtrack in mp3.</p>\r\n<p><strong>Making-of: </strong>Digital version of our making-of documentary.</p>\r\n<p><strong style="background-color: transparent;">Alpha access: </strong>\r\n<span style="background-color: transparent;">You will in-effect become part of our development team, getting access to the earliest barely playable version of </span>\r\n<em style="background-color: transparent;">Kingdom Come: Deliverance</em>\r\n<span style="background-color: transparent;">. Your comments and observations will help to shape the game.</span>\r\n</p>\r\n<p><span style="background-color: transparent;"><strong>Beta access: </strong>This is similar to <a href="/kingdom-come-deliverance/what-is-early-access" title="What is Early Access">Early access</a>&#160;on Steam.</span>\r\n</p>\r\n	t	2	28	\N	5	2014-03-03 02:20:49.683927	2014-04-17 19:55:09.169824	1	t	f	f	f	f	<h2>Minimum hardware requirements </h2>\r\n<p>Quadcore CPU </p>\r\n<p>DirectX 11.0 capable GPU</p>\r\n<p>8GB RAM </p>\r\n<p>25GB HDD</p>\r\n<p><span style="background-color: transparent;">Internet connection</span>\r\n</p>\r\n<h2>Available platforms </h2>\r\n<p>PC (Windows 7 x64 or Linux)</p>\r\n<p>Apple Mac</p>\r\n<h2>Release date</h2>\r\n<p>Aprox Q4 2015</p>	
\.


--
-- Name: refinery_tiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('refinery_tiers_id_seq', 8, true);


--
-- Data for Name: refinery_user_histories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_user_histories (id, user_id, field, original_value, new_value, "position", created_at, updated_at) FROM stdin;
1	15	street	Malostranske namesti 6	Za řekou 18	\N	2014-04-15 16:11:02.797062	2014-04-15 16:11:02.797062
2	15	city	Praha	Brno	\N	2014-04-15 16:11:02.836657	2014-04-15 16:11:02.836657
3	7	country	Czech Republic	CZ	\N	2014-04-17 08:29:22.336781	2014-04-17 08:29:22.336781
4	7	state_code	\N		\N	2014-04-17 08:29:22.3415	2014-04-17 08:29:22.3415
5	7	age	0	38	\N	2014-04-17 08:29:22.345679	2014-04-17 08:29:22.345679
6	7	zip	\N	18200	\N	2014-04-17 08:29:22.347974	2014-04-17 08:29:22.347974
7	3	street	Praha	Pernerova 55	\N	2014-04-17 20:44:32.441172	2014-04-17 20:44:32.441172
8	3	state_code	\N		\N	2014-04-17 20:44:32.446432	2014-04-17 20:44:32.446432
9	3	age	0	45	\N	2014-04-17 20:44:32.449823	2014-04-17 20:44:32.449823
10	3	zip	\N	18200	\N	2014-04-17 20:44:32.452507	2014-04-17 20:44:32.452507
\.


--
-- Name: refinery_user_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('refinery_user_histories_id_seq', 10, true);


--
-- Data for Name: refinery_user_plugins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_user_plugins (id, user_id, name, "position") FROM stdin;
1	1	refinery_i18n	0
2	1	refinery_core	1
3	1	refinery_dialogs	2
4	1	refinery_dashboard	0
9	1	projects	1
10	1	tiers	2
11	1	orders	3
8	1	refinery_pages	4
5	1	refinery_users	5
7	1	refinery_files	8
12	1	user_histories	6
6	1	refinery_images	7
13	3	refinery_dashboard	0
18	3	projects	1
19	3	tiers	2
16	3	orders	3
17	3	refinery_pages	4
21	3	refinery_users	5
20	3	user_histories	6
14	3	refinery_files	7
15	3	refinery_images	8
\.


--
-- Name: refinery_user_plugins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('refinery_user_plugins_id_seq', 21, true);


--
-- Data for Name: refinery_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY refinery_users (id, username, email, encrypted_password, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, sign_in_count, remember_created_at, reset_password_token, reset_password_sent_at, created_at, updated_at, slug, name, street, city, country, activated, activation_token, age, state_code, zip) FROM stdin;
2	kratoj	kratoj@gmail.com	$2a$10$50Uo4fWbspPohxbUarVdFukBjdKCiAooeUtSsbH3J9kDvst7lquS6	2014-03-03 23:34:39.491407	2014-03-03 02:24:39.326985	94.230.152.10	94.230.152.10	2	\N	\N	\N	2014-03-03 02:24:39.291526	2014-03-03 23:34:39.499427	kratoj	Jiří Kratochvíl	Ovenecká 330/44	Praha 7	Czech Republic	f	\N	0	\N	\N
1	sedrickcz	admin@sedrick.cz	$2a$10$r8Jn1CCLH.Ys3gyvTwHw/.CZR0xMpOuasjRP/WQb/SF4DApW7oDHS	2014-03-04 22:00:12.697197	2014-03-03 23:41:50.221551	94.230.152.10	94.230.152.10	6	\N	\N	\N	2014-03-03 02:00:50.156552	2014-03-04 22:00:12.702439	sedrickcz	Jirka	Na pískách	Praha	CZ	f	\N	0	\N	\N
9	user123	user123@sedrick.cz	$2a$10$gsDyyVTIjSyktykWoxLjg.ouf6MVCEOWdEHFuPrqKeTXNfgJTT0fa	2014-04-17 19:24:51.606369	2014-04-17 18:25:30.947841	94.230.146.246	94.230.146.246	3	\N	\N	\N	2014-04-06 18:24:39.638865	2014-04-17 19:24:51.609434	user123	Eli Wood	Kelt st. 11	Dontknowville	US	t		29	AK	\N
8	user1986	user1986@sedrick.cz	$2a$10$z2fWZkkafrSoiUEcBNLdn.RLHLCX4o.pc/01Mk5tPD8a/JG0btN.C	2014-04-03 23:04:08.097189	2014-04-03 23:04:08.097189	94.230.146.246	94.230.146.246	1	\N	\N	\N	2014-04-03 23:02:17.334819	2014-04-03 23:04:08.100735	user1986	Petr Kolář	Pražská 11	Chomutov	CZ	t		18		\N
11	elw	mklima@outlook.com	$2a$10$JyIBy9ntO0dK809rGHtSe.0rnw3icPoMX.i6ofsKdqrXkcoOWyUuu	2014-04-09 10:10:13.334032	2014-04-09 10:10:13.334032	82.113.62.170	82.113.62.170	1	\N	\N	\N	2014-04-09 10:05:37.358695	2014-04-09 10:10:13.340241	elw	Martin Klima	Vydrova 14	Praha 10	CZ	t		45		\N
13	mfryvaldsky	martin.fryvaldsky@bmmanagement.cz	$2a$10$c6PDnBbpB7FGgzP51iynVumo83i5kF7eVayuuw2bn.wyUYSFZAQEe	2014-04-15 11:52:15.839895	2014-04-15 11:52:15.839895	90.182.183.107	90.182.183.107	1	\N	\N	\N	2014-04-15 11:52:03.96458	2014-04-15 11:52:15.843536	mfryvaldsky	Martin Fryvaldsky	Ceskomalinska 16	Praha 6	CZ	t		44		\N
6	user1	u1@sedrick.cz	$2a$10$.IlnYi3PY4cem5z/qKvWjO7KFadNbauLM9PtrEOEynRF7W4jC44e2	2014-04-17 19:48:13.20484	2014-04-17 11:40:38.07648	78.102.20.156	78.102.20.156	7	\N	\N	\N	2014-03-04 22:08:03.360427	2014-04-17 19:48:13.208123	user1	Jiří Kratochvíl	Nerudova 709	Jirkov	Česká Republika	t		0	\N	\N
3	warhorse	warhorse@sedrick.cz	$2a$10$KeSu.bxvsR9/scw/IPuV6OU9aO8lNEQjrIyd2r0lAxN9rxqzOM.2W	2014-04-17 19:53:39.06887	2014-04-17 19:25:17.436644	194.228.68.241	94.230.146.246	52	\N	\N	\N	2014-03-03 11:34:13.240126	2014-04-17 20:44:32.409783	warhorse	warhorse	Pernerova 55	Praha	CZ	f	\N	45		18200
16	jirka	jiri.rydl@centrum.cz	$2a$10$Sd7ZwcnDVyzAZY.lOfPSz.NGKnp1fETIqxJW1bUkBmCX3qO8LkJ1S	\N	\N	\N	\N	\N	\N	\N	\N	2014-04-17 08:41:53.50671	2014-04-17 08:41:53.56207	jirka	Jiří Rýdl	Slancova 1257/12	Praha 8	CZ	f	tXg-D2SovRVQ_a8OksoGoA	18		18200
10	gf	dgdgfd@gsgr.cz	$2a$10$r2YsfxOA9EX5fMpnLpeeceLt5tuTxzwwVnfdx8oVTqmZGxxXc2XX.	\N	\N	\N	\N	\N	\N	\N	\N	2014-04-07 21:04:19.517357	2014-04-07 21:04:19.576831	gf	gdgfddf	ddd	gsgs	US	f	4BC74vilip0YG2uyxDJPSQ	29	HI	\N
14	chumaj001	chumaj001@centrum.cz	$2a$10$cdxBemWoaTL12sfwI6ymmOuQsKCq0cp7vAesCXz4.OsfheDR68AHS	\N	\N	\N	\N	\N	\N	\N	\N	2014-04-15 15:04:36.597358	2014-04-15 15:12:57.84043	chumaj001	chumaj001	Malostranské náměstí 6	Praha	CZ	f	nFEbVMqKhuou5eUP-qUzQw	38		\N
15	hellboy	chumaj001@seznam.cz	$2a$10$Xg5Bwxd3argP.Jii66ydReNQV.EpIOeQYkVY72gIFcvnZ/2T9hzZC	2014-04-17 11:34:21.996099	2014-04-15 15:59:48.352182	82.113.62.170	82.113.62.170	3	\N	\N	\N	2014-04-15 15:40:17.100984	2014-04-17 11:34:21.999414	hellboy	Daniel Vavra	Za řekou 18	Brno	CZ	t		38		\N
12	king bedrock	king@sedrick.cz	$2a$10$Q5FgtaMKvQ9geUvYDHFsU.kkEMZnGOgO3dFvRQJwatMKFyyPilmeC	2014-04-14 21:19:29.357623	2014-04-14 21:19:29.357623	94.230.146.246	94.230.146.246	1	\N	\N	\N	2014-04-14 21:19:00.125953	2014-04-14 21:19:29.359737	king-bedrock	Adrian Sedrick	5th Avanue	New York	US	t		29	NY	\N
17	petrsimi	info@petrsimcik.cz	$2a$10$0EWwsdGfj2bOcc.x7T1rH..CO.k7tcWE3j7oDq/PccyH2/JaOogKK	2014-04-17 21:45:02.180369	2014-04-17 21:45:02.180369	78.102.20.156	78.102.20.156	1	\N	\N	\N	2014-04-17 21:43:31.046807	2014-04-17 21:45:02.183529	petrsimi	Petr Šimčík	Roudnická 447/10	Praha 8	CZ	t		18		18200
7	j.r.	jiri.rydl@warhorsestudios.cz	$2a$10$tEdBgGqUYBh9mdDEClTjT.fpOD4PnGxd3i3WmNh4DqrqDJWHRJlB2	2014-04-17 21:58:45.851209	2014-04-17 21:44:13.841326	78.102.20.156	78.102.20.156	21	\N	\N	\N	2014-04-03 10:30:08.163695	2014-04-17 21:58:45.869324	j-r	J.R.	Pernerova 55	Prague 8	CZ	t		38		18200
\.


--
-- Name: refinery_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('refinery_users_id_seq', 17, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20140221101821
20140221101822
20140221101829
20140221101836
20140221101841
20140221101842
20140221101848
20140221101849
20140221104626
20140221105312
20140221110120
20140221110925
20140221111135
20140225180429
20140303021019
20140303195853
20140303201534
20140303225754
20140303225945
20140304191958
20140307175952
20140403205215
20140403212116
20140403212832
20140406225245
20140410202317
20140416091841
\.


--
-- Data for Name: seo_meta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY seo_meta (id, seo_meta_id, seo_meta_type, browser_title, meta_description, created_at, updated_at) FROM stdin;
1	1	Refinery::Page::Translation	\N	\N	2014-03-03 01:52:30.817529	2014-03-03 01:52:30.817529
2	2	Refinery::Page::Translation	\N	\N	2014-03-03 01:52:30.994533	2014-03-03 01:52:30.994533
3	3	Refinery::Page::Translation	\N	\N	2014-03-03 01:52:31.073099	2014-03-03 01:52:31.073099
4	4	Refinery::Page::Translation	\N	\N	2014-03-03 01:52:31.325082	2014-03-03 01:52:31.325082
5	5	Refinery::Page::Translation	\N	\N	2014-03-03 01:52:31.399906	2014-03-03 01:52:31.399906
6	6	Refinery::Page::Translation	\N	\N	2014-03-03 01:52:31.472263	2014-03-03 01:52:31.472263
7	7	Refinery::Page::Translation	\N	\N	2014-03-03 01:52:31.543636	2014-03-03 01:52:31.543636
8	8	Refinery::Page::Translation			2014-03-03 02:21:39.386948	2014-03-03 02:21:39.386948
9	9	Refinery::Page::Translation			2014-03-03 02:22:12.986548	2014-03-03 02:22:12.986548
10	10	Refinery::Page::Translation			2014-03-03 02:22:38.791677	2014-03-03 02:22:38.791677
11	11	Refinery::Page::Translation			2014-03-03 02:23:08.014251	2014-03-03 02:23:08.014251
12	12	Refinery::Page::Translation			2014-03-03 02:23:36.687189	2014-03-03 02:23:36.687189
13	13	Refinery::Page::Translation			2014-03-08 00:36:42.950332	2014-03-08 00:36:42.950332
14	14	Refinery::Page::Translation			2014-03-08 00:38:40.290671	2014-03-08 00:38:40.290671
\.


--
-- Name: seo_meta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('seo_meta_id_seq', 14, true);


--
-- Data for Name: user_pledges; Type: TABLE DATA; Schema: public; Owner: -
--

COPY user_pledges (id, user_id, tier_id, created_at, updated_at) FROM stdin;
1	1	6	2014-03-03 22:51:46.031041	2014-03-03 22:51:46.031041
2	2	6	2014-03-03 23:43:01.6935	2014-03-03 23:43:01.6935
3	6	1	2014-03-04 22:10:45.873505	2014-03-04 22:10:45.873505
4	6	6	2014-03-04 22:13:17.152802	2014-03-04 22:13:17.152802
5	6	6	2014-03-04 22:18:52.729458	2014-03-04 22:18:52.729458
6	6	8	2014-03-31 20:35:33.032266	2014-03-31 20:35:33.032266
7	9	4	2014-04-06 18:30:41.253021	2014-04-06 18:30:41.253021
8	7	2	2014-04-14 10:37:06.077391	2014-04-14 10:37:06.077391
9	12	4	2014-04-14 21:31:54.997109	2014-04-14 21:31:54.997109
10	12	6	2014-04-14 21:49:04.476012	2014-04-14 21:49:04.476012
11	12	7	2014-04-14 21:50:34.92612	2014-04-14 21:50:34.92612
12	7	4	2014-04-15 12:59:19.654382	2014-04-15 12:59:19.654382
\.


--
-- Name: user_pledges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_pledges_id_seq', 12, true);


--
-- Name: refinery_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_images
    ADD CONSTRAINT refinery_images_pkey PRIMARY KEY (id);


--
-- Name: refinery_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_orders
    ADD CONSTRAINT refinery_orders_pkey PRIMARY KEY (id);


--
-- Name: refinery_page_part_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_page_part_translations
    ADD CONSTRAINT refinery_page_part_translations_pkey PRIMARY KEY (id);


--
-- Name: refinery_page_parts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_page_parts
    ADD CONSTRAINT refinery_page_parts_pkey PRIMARY KEY (id);


--
-- Name: refinery_page_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_page_translations
    ADD CONSTRAINT refinery_page_translations_pkey PRIMARY KEY (id);


--
-- Name: refinery_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_pages
    ADD CONSTRAINT refinery_pages_pkey PRIMARY KEY (id);


--
-- Name: refinery_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_projects
    ADD CONSTRAINT refinery_projects_pkey PRIMARY KEY (id);


--
-- Name: refinery_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_resources
    ADD CONSTRAINT refinery_resources_pkey PRIMARY KEY (id);


--
-- Name: refinery_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_roles
    ADD CONSTRAINT refinery_roles_pkey PRIMARY KEY (id);


--
-- Name: refinery_tiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_tiers
    ADD CONSTRAINT refinery_tiers_pkey PRIMARY KEY (id);


--
-- Name: refinery_user_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_user_histories
    ADD CONSTRAINT refinery_user_histories_pkey PRIMARY KEY (id);


--
-- Name: refinery_user_plugins_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_user_plugins
    ADD CONSTRAINT refinery_user_plugins_pkey PRIMARY KEY (id);


--
-- Name: refinery_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY refinery_users
    ADD CONSTRAINT refinery_users_pkey PRIMARY KEY (id);


--
-- Name: seo_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY seo_meta
    ADD CONSTRAINT seo_meta_pkey PRIMARY KEY (id);


--
-- Name: user_pledges_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_pledges
    ADD CONSTRAINT user_pledges_pkey PRIMARY KEY (id);


--
-- Name: id_type_index_on_seo_meta; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX id_type_index_on_seo_meta ON seo_meta USING btree (seo_meta_id, seo_meta_type);


--
-- Name: index_refinery_page_part_translations_on_locale; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_page_part_translations_on_locale ON refinery_page_part_translations USING btree (locale);


--
-- Name: index_refinery_page_part_translations_on_refinery_page_part_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_page_part_translations_on_refinery_page_part_id ON refinery_page_part_translations USING btree (refinery_page_part_id);


--
-- Name: index_refinery_page_parts_on_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_page_parts_on_id ON refinery_page_parts USING btree (id);


--
-- Name: index_refinery_page_parts_on_refinery_page_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_page_parts_on_refinery_page_id ON refinery_page_parts USING btree (refinery_page_id);


--
-- Name: index_refinery_page_translations_on_locale; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_page_translations_on_locale ON refinery_page_translations USING btree (locale);


--
-- Name: index_refinery_page_translations_on_refinery_page_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_page_translations_on_refinery_page_id ON refinery_page_translations USING btree (refinery_page_id);


--
-- Name: index_refinery_pages_on_depth; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_pages_on_depth ON refinery_pages USING btree (depth);


--
-- Name: index_refinery_pages_on_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_pages_on_id ON refinery_pages USING btree (id);


--
-- Name: index_refinery_pages_on_lft; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_pages_on_lft ON refinery_pages USING btree (lft);


--
-- Name: index_refinery_pages_on_parent_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_pages_on_parent_id ON refinery_pages USING btree (parent_id);


--
-- Name: index_refinery_pages_on_rgt; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_pages_on_rgt ON refinery_pages USING btree (rgt);


--
-- Name: index_refinery_roles_users_on_role_id_and_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_roles_users_on_role_id_and_user_id ON refinery_roles_users USING btree (role_id, user_id);


--
-- Name: index_refinery_roles_users_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_roles_users_on_user_id_and_role_id ON refinery_roles_users USING btree (user_id, role_id);


--
-- Name: index_refinery_user_plugins_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_user_plugins_on_name ON refinery_user_plugins USING btree (name);


--
-- Name: index_refinery_user_plugins_on_user_id_and_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_refinery_user_plugins_on_user_id_and_name ON refinery_user_plugins USING btree (user_id, name);


--
-- Name: index_refinery_users_on_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_users_on_id ON refinery_users USING btree (id);


--
-- Name: index_refinery_users_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_refinery_users_on_slug ON refinery_users USING btree (slug);


--
-- Name: index_seo_meta_on_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_seo_meta_on_id ON seo_meta USING btree (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

