--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Database creation
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: categories_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categories_category (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    description character varying(100) NOT NULL,
    parent_id integer
);


ALTER TABLE categories_category OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_category_id_seq OWNER TO postgres;

--
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_category_id_seq OWNED BY categories_category.id;


--
-- Name: categories_orderitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categories_orderitem (
    id integer NOT NULL,
    item_name character varying(100) NOT NULL,
    description character varying(300),
    price numeric(6,2) NOT NULL,
    parent_category_id integer,
    place_id integer
);


ALTER TABLE categories_orderitem OWNER TO postgres;

--
-- Name: categories_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_orderitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_orderitem_id_seq OWNER TO postgres;

--
-- Name: categories_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_orderitem_id_seq OWNED BY categories_orderitem.id;


--
-- Name: categories_orderplace; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categories_orderplace (
    id integer NOT NULL,
    place_name character varying(50) NOT NULL,
    address character varying(100) NOT NULL
);


ALTER TABLE categories_orderplace OWNER TO postgres;

--
-- Name: categories_orderplace_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_orderplace_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_orderplace_id_seq OWNER TO postgres;

--
-- Name: categories_orderplace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_orderplace_id_seq OWNED BY categories_orderplace.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_accesstoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_provider_accesstoken (
    id bigint DEFAULT nextval('oauth2_provider_accesstoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id integer,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE oauth2_provider_accesstoken OWNER TO postgres;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_application_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_provider_application (
    id bigint DEFAULT nextval('oauth2_provider_application_id_seq'::regclass) NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE oauth2_provider_application OWNER TO postgres;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_grant_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_provider_grant (
    id bigint DEFAULT nextval('oauth2_provider_grant_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE oauth2_provider_grant OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_refreshtoken_id_seq OWNER TO postgres;

--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE oauth2_provider_refreshtoken OWNER TO postgres;

--
-- Name: profiles_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE profiles_profile (
    id integer NOT NULL,
    phone character varying(15),
    user_id integer NOT NULL
);


ALTER TABLE profiles_profile OWNER TO postgres;

--
-- Name: profiles_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE profiles_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profiles_profile_id_seq OWNER TO postgres;

--
-- Name: profiles_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE profiles_profile_id_seq OWNED BY profiles_profile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: categories_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories_category ALTER COLUMN id SET DEFAULT nextval('categories_category_id_seq'::regclass);


--
-- Name: categories_orderitem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories_orderitem ALTER COLUMN id SET DEFAULT nextval('categories_orderitem_id_seq'::regclass);


--
-- Name: categories_orderplace id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories_orderplace ALTER COLUMN id SET DEFAULT nextval('categories_orderplace_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: profiles_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profiles_profile ALTER COLUMN id SET DEFAULT nextval('profiles_profile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add application	7	add_application
20	Can change application	7	change_application
21	Can delete application	7	delete_application
22	Can add access token	8	add_accesstoken
23	Can change access token	8	change_accesstoken
24	Can delete access token	8	delete_accesstoken
25	Can add grant	9	add_grant
26	Can change grant	9	change_grant
27	Can delete grant	9	delete_grant
28	Can add refresh token	10	add_refreshtoken
29	Can change refresh token	10	change_refreshtoken
30	Can delete refresh token	10	delete_refreshtoken
31	Can add cors model	11	add_corsmodel
32	Can change cors model	11	change_corsmodel
33	Can delete cors model	11	delete_corsmodel
34	Can add profile	12	add_profile
35	Can change profile	12	change_profile
36	Can delete profile	12	delete_profile
67	Can add category	34	add_category
68	Can change category	34	change_category
69	Can delete category	34	delete_category
70	Can add order item	35	add_orderitem
71	Can change order item	35	change_orderitem
72	Can delete order item	35	delete_orderitem
73	Can add order place	36	add_orderplace
74	Can change order place	36	change_orderplace
75	Can delete order place	36	delete_orderplace
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$vb4Vwra3pKgn$5ElrN5OATxoQ2rSE70ZJgzMvm3R1LA+9fFpr2FWm2+4=	2018-11-12 05:38:43.477951+00	t	admin			sino@g.ucla.edu	t	t	2018-11-10 00:05:14.372589+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: categories_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories_category (id, name, description, parent_id) FROM stdin;
1	UCLA Takeout		\N
2	De Neve Late Night		1
3	Bruin Cafe		1
4	Cafe 1919		1
5	Rendezvous		1
6	The Study at Hedrick		1
\.


--
-- Data for Name: categories_orderitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories_orderitem (id, item_name, description, price, parent_category_id, place_id) FROM stdin;
1	Custom Pizza		8.00	6	4
2	Custom Salad		8.00	6	4
3	Custom Sandwich		8.00	6	4
4	Pasteries 		4.00	6	4
5	Cookies		4.00	6	4
6	Cakes & Tarts		4.00	6	4
7	Tartines		7.00	6	4
8	Crepes		7.00	6	4
9	Belgian Waffles		6.00	6	4
10	Odwalla		5.00	6	4
11	Kombucha		5.00	6	4
12	﻿Combo Meal		8.00	5	1
13	Chipotle Chicken Burrito (Monday)		8.00	5	1
14	Vegan BBQ Chicken Quesadilla (Monday & Wednesday)		8.00	5	1
15	Vegetarian BBQ Chicken Quesadilla  (Monday & Wednesday)		8.00	5	1
16	Potato Enchiladas (Tuesday & Friday)		8.00	5	1
17	Three Taco Combination (Tuesday)		8.00	5	1
18	BBQ Chicken Quesadilla (Wednesday)		8.00	5	1
19	California Steak Burrito (Thursday)		8.00	5	1
20	California Veggie Burrito (Thursday)		8.00	5	1
21	Chicken Enchiladas (Friday)		8.00	5	1
22	Mandoo Ramen (Monday)		8.00	5	1
23	Vegetable Ramen Soup (Monday, Wednesday, Friday)	\N	8.00	5	1
24	Korean Vegetable Bowl (Monday & Wednesday)		8.00	5	1
25	Pork Tonkatsu (Monday)		8.00	5	1
26	Chicken Katsu Udon (Tuesday)		8.00	5	1
27	Vegetarian Miso Ramen (Tuesday)		8.00	5	1
28	Japanese Chicken Curry (Tuesday)		8.00	5	1
29	Japanese Tofu Curry (Tuesday)		8.00	5	1
30	Tan Tan Ramen Soup (Wednesday)		8.00	5	1
31	BBQ Korean Pork Spare Ribs (Wednesday)		8.00	5	1
32	Beef Pho (Thursday)		8.00	5	1
33	Vegetarian Miso Ramen Soup (Thursday)		8.00	5	1
34	Teriyaki Chicken Bowl (Thursday)		8.00	5	1
35	Vegan Teriaki Chicken Bowl (Thursday)		8.00	5	1
36	Chilled Kimchi & Buckwheat Noodle Soup (Friday)		8.00	5	1
37	Shrimp Sushi Bowl (Friday)		8.00	5	1
38	Vegetable Sushi Bowl (Friday)		8.00	5	1
39	Regular Boba		4.00	5	1
40	Large Boba		6.00	5	1
41	﻿Chicken Tenders		5.00	2	2
42	Chili Cheese Curly Fries		5.00	2	2
43	Mac & Cheese		5.00	2	2
44	Mozzarella Sticks		5.00	2	2
45	Onion Rings 6oz		5.00	2	2
46	Vegan Chick'n Fingers		5.00	2	2
47	Carne Asada Fries		10.00	2	2
48	Chicken Tenders 1lb		10.00	2	2
49	Onion Rings 12 oz		10.00	2	2
50	Vegan Chick'n Fingers		10.00	2	2
51	﻿Classic Sandwiches		8.00	3	5
52	Salads		8.00	3	5
53	Coffee & Tea		5.00	3	5
54	Strawberry Sensation Smoothie		5.00	3	5
55	Very Raspberry Smoothie		5.00	3	5
56	Caribbean Island Smoothie		5.00	3	5
57	Mango Madness Smoothie		5.00	3	5
58	Bruin Fresh Smoothie		5.00	3	5
59	Green Lemonade Smoothie		5.00	3	5
60	Iced Mocha		5.00	3	5
61	Iced Vanilla		5.00	3	5
62	Iced Caramel		5.00	3	5
63	Iced Pure Chocolate		5.00	3	5
64	Iced Pure Vanilla		5.00	3	5
65	Iced Green Tea		5.00	3	5
66	Ice Pomegranate Blueberry		5.00	3	5
67	Iced Chai		5.00	3	5
68	﻿Custom Pizza		8.00	4	3
69	Custom Salad		8.00	4	3
70	Custom Sandwhich		8.00	4	3
71	Pasteries 		4.00	4	3
72	Cookies		4.00	4	3
73	Cakes & Tarts		4.00	4	3
74	Tartines		7.00	4	3
75	Crepes		7.00	4	3
76	Belgian Waffles		6.00	4	3
77	Odwalla		5.00	4	3
78	Kombucha		5.00	4	3
\.


--
-- Data for Name: categories_orderplace; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories_orderplace (id, place_name, address) FROM stdin;
1	Rendezvous	330 De Neve Dr, Los Angeles, CA 90024
2	De Neve Late Night	351 Charles E Young Drive West, Los Angeles, CA 90024
3	Cafe 1919	330 De Neve Dr, Los Angeles, CA 90095
4	The Study at Hedrick	250 De Neve Dr, Los Angeles, CA 90024
5	Bruin Cafe	350 De Neve Dr, Los Angeles, CA 90095
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-11-10 00:22:15.701745+00	3	Profile object	1	[{"added": {}}]	12	1
2	2018-11-12 05:34:41.607661+00	2	test@test.com	3		12	1
3	2018-11-12 05:34:50.498253+00	36	test@test.com	3		4	1
4	2018-11-12 05:35:05.705142+00	3	admin	2	[{"changed": {"fields": ["phone"]}}]	12	1
5	2018-11-17 00:10:24.4904+00	1	UCLA Takeout	1	[{"added": {}}]	34	1
6	2018-11-17 00:10:29.818988+00	1	UCLA Takeout	2	[]	34	1
7	2018-11-17 00:10:59.17709+00	2	De Neve Late Night	1	[{"added": {}}]	34	1
8	2018-11-17 00:11:09.31177+00	3	Bruin Cafe	1	[{"added": {}}]	34	1
9	2018-11-17 00:11:23.760919+00	4	Cafe 1919	1	[{"added": {}}]	34	1
10	2018-11-17 00:11:46.464189+00	5	Rendezvous	1	[{"added": {}}]	34	1
11	2018-11-17 00:12:37.000601+00	6	The Study at Hilltop	1	[{"added": {}}]	34	1
12	2018-11-17 00:14:10.977504+00	1	Rendezvous	1	[{"added": {}}]	36	1
13	2018-11-17 00:14:31.35328+00	2	De Neve Late Night	1	[{"added": {}}]	36	1
14	2018-11-17 00:14:52.663153+00	3	Cafe 1919	1	[{"added": {}}]	36	1
15	2018-11-17 00:15:29.399659+00	6	The Study at Hedrick	2	[{"changed": {"fields": ["name"]}}]	34	1
16	2018-11-17 00:16:02.979638+00	4	The Study at Hedrick	1	[{"added": {}}]	36	1
17	2018-11-17 00:16:25.329483+00	5	Bruin Cafe	1	[{"added": {}}]	36	1
18	2018-11-17 01:01:45.329972+00	23	Vegetable Ramen Soup (Monday, Wednesday, Friday)	1	[{"added": {}}]	35	1
19	2018-11-17 01:05:03.599408+00	4	test@test.com	3		12	1
20	2018-11-17 01:05:14.752251+00	37	test@test.com	3		4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	oauth2_provider	application
8	oauth2_provider	accesstoken
9	oauth2_provider	grant
10	oauth2_provider	refreshtoken
11	corsheaders	corsmodel
12	profiles	profile
34	categories	category
35	categories	orderitem
36	categories	orderplace
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-11-10 00:03:28.689554+00
2	auth	0001_initial	2018-11-10 00:03:28.80706+00
3	admin	0001_initial	2018-11-10 00:03:28.83938+00
4	admin	0002_logentry_remove_auto_add	2018-11-10 00:03:28.860008+00
5	contenttypes	0002_remove_content_type_name	2018-11-10 00:03:28.8889+00
6	auth	0002_alter_permission_name_max_length	2018-11-10 00:03:28.90059+00
7	auth	0003_alter_user_email_max_length	2018-11-10 00:03:28.918866+00
8	auth	0004_alter_user_username_opts	2018-11-10 00:03:28.934059+00
9	auth	0005_alter_user_last_login_null	2018-11-10 00:03:28.951415+00
10	auth	0006_require_contenttypes_0002	2018-11-10 00:03:28.955421+00
11	auth	0007_alter_validators_add_error_messages	2018-11-10 00:03:28.970606+00
12	auth	0008_alter_user_username_max_length	2018-11-10 00:03:28.987964+00
13	oauth2_provider	0001_initial	2018-11-10 00:03:29.12793+00
14	oauth2_provider	0002_08_updates	2018-11-10 00:03:29.249388+00
15	oauth2_provider	0003_auto_20160316_1503	2018-11-10 00:03:29.271523+00
16	oauth2_provider	0004_auto_20160525_1623	2018-11-10 00:03:29.342952+00
17	oauth2_provider	0005_auto_20170514_1141	2018-11-10 00:03:29.865579+00
18	sessions	0001_initial	2018-11-10 00:03:29.886384+00
34	profiles	0001_initial	2018-11-10 00:19:52.437037+00
35	categories	0001_initial	2018-11-17 00:07:57.876608+00
36	categories	0002_auto_20181117_0010	2018-11-17 00:10:14.711953+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
25lbm9dlguwsj03raqi1p4rn9aqv33wy	MzI4YTdhZGMwMDkyMTNjMzFiMjEwYzhjZjY0MjBiYTFmMmE1MWExYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyM2VhZDVlZWQ5MzY2ZTUzODZlYjkxMjMxMzY5ODVhOGUwMTlkMmRlIn0=	2018-11-24 00:05:34.167754+00
ocjh3jshb6xylq10j7lur4fm65izyoa4	MzI4YTdhZGMwMDkyMTNjMzFiMjEwYzhjZjY0MjBiYTFmMmE1MWExYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyM2VhZDVlZWQ5MzY2ZTUzODZlYjkxMjMxMzY5ODVhOGUwMTlkMmRlIn0=	2018-11-26 05:38:43.491137+00
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated) FROM stdin;
1	FKWBikmeleAgWJrcSjNCsFuYsGIofm	2018-11-10 10:14:33.411907+00	read write groups	1	1	2018-11-10 00:14:33.412419+00	2018-11-10 00:14:33.412435+00
2	Ov0hSrh2LqeGDHrGyN4TkF5yBAYeol	2018-11-12 15:39:08.203393+00	read write groups	1	1	2018-11-12 05:39:08.203805+00	2018-11-12 05:39:08.20383+00
3	ynZIhZp7aBBPVJiUqnJs58AlKN0x5z	2018-11-13 13:16:52.810671+00	read write groups	1	1	2018-11-13 03:16:52.811201+00	2018-11-13 03:16:52.811214+00
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
1	OSw0Kd1vaKL7gDh7dNJqnmBB1BtrtwknjKYTAEkp		confidential	password	ZMEjf0oDEhwJETXAm2SI0UaK48aazQO78ZgbNg2tV26kSumTU616yHpIwLpXhbQaXgADSy1oVGZDa53B5GvzRXbc0aQ9W9el9voh7AonCSSHLHcJ1BEksOI09j121R2A	Powered	1	f	2018-11-10 00:13:57.02327+00	2018-11-10 00:13:57.023328+00
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated) FROM stdin;
1	XlAuPPnXnuGVrWFzp9c7pyCIPUSNL0	1	1	1	2018-11-10 00:14:33.414633+00	2018-11-10 00:14:33.41466+00
2	kkb6142UxhVdoSQByLCOyVT9EELQul	2	1	1	2018-11-12 05:39:08.20556+00	2018-11-12 05:39:08.205589+00
3	wSkR07EiIbGcEvzhitZ0DVPzxpu9LE	3	1	1	2018-11-13 03:16:52.824456+00	2018-11-13 03:16:52.824477+00
\.


--
-- Data for Name: profiles_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY profiles_profile (id, phone, user_id) FROM stdin;
3	N/A	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 75, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 37, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_category_id_seq', 6, true);


--
-- Name: categories_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_orderitem_id_seq', 78, true);


--
-- Name: categories_orderplace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_orderplace_id_seq', 5, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 20, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 36, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 36, true);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_provider_accesstoken_id_seq', 6, true);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_provider_application_id_seq', 1, true);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('oauth2_provider_refreshtoken_id_seq', 6, true);


--
-- Name: profiles_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('profiles_profile_id_seq', 4, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: categories_category categories_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories_category
    ADD CONSTRAINT categories_category_pkey PRIMARY KEY (id);


--
-- Name: categories_orderitem categories_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories_orderitem
    ADD CONSTRAINT categories_orderitem_pkey PRIMARY KEY (id);


--
-- Name: categories_orderplace categories_orderplace_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories_orderplace
    ADD CONSTRAINT categories_orderplace_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_8af090f8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_d090daa4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_d090daa4_uniq UNIQUE (token);


--
-- Name: profiles_profile profiles_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_pkey PRIMARY KEY (id);


--
-- Name: profiles_profile profiles_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: categories_category_parent_id_f141de59; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_category_parent_id_f141de59 ON categories_category USING btree (parent_id);


--
-- Name: categories_orderitem_parent_category_id_01709635; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_orderitem_parent_category_id_01709635 ON categories_orderitem USING btree (parent_category_id);


--
-- Name: categories_orderitem_place_id_fdd503fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_orderitem_place_id_fdd503fb ON categories_orderitem USING btree (place_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_token_d090daa4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_token_d090daa4_like ON oauth2_provider_refreshtoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: categories_category categories_category_parent_id_f141de59_fk_categorie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories_category
    ADD CONSTRAINT categories_category_parent_id_f141de59_fk_categorie FOREIGN KEY (parent_id) REFERENCES categories_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: categories_orderitem categories_orderitem_parent_category_id_01709635_fk_categorie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories_orderitem
    ADD CONSTRAINT categories_orderitem_parent_category_id_01709635_fk_categorie FOREIGN KEY (parent_category_id) REFERENCES categories_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: categories_orderitem categories_orderitem_place_id_fdd503fb_fk_categorie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories_orderitem
    ADD CONSTRAINT categories_orderitem_place_id_fdd503fb_fk_categorie FOREIGN KEY (place_id) REFERENCES categories_orderplace(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_application_id_b22886e1_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_application_user_id_79829054_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_application_id_81923564_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_application_id_81923564_fk FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_775e84e8_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_775e84e8_fk FOREIGN KEY (access_token_id) REFERENCES oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_application_id_2d1c311b_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: profiles_profile profiles_profile_user_id_a3e81f91_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profiles_profile
    ADD CONSTRAINT profiles_profile_user_id_a3e81f91_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

