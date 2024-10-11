SET session_replication_role = 'replica';


--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: about_us; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.about_us (
    id integer NOT NULL,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255),
    content text,
    meta_title character varying(255),
    meta_description text
);


ALTER TABLE public.about_us OWNER TO docker;

--
-- Name: about_us_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.about_us_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_us_id_seq OWNER TO docker;

--
-- Name: about_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.about_us_id_seq OWNED BY public.about_us.id;


--
-- Name: about_us_profiles; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.about_us_profiles (
    id integer NOT NULL,
    about_us_id integer,
    profiles_id uuid
);


ALTER TABLE public.about_us_profiles OWNER TO docker;

--
-- Name: about_us_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.about_us_profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_us_profiles_id_seq OWNER TO docker;

--
-- Name: about_us_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.about_us_profiles_id_seq OWNED BY public.about_us_profiles.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.categories (
    id uuid NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    "position" integer DEFAULT 10 NOT NULL,
    name character varying(255),
    meta_title character varying(255),
    meta_description text,
    description text,
    slug character varying(255) DEFAULT NULL::character varying NOT NULL,
    cover uuid
);


ALTER TABLE public.categories OWNER TO docker;

--
-- Name: config; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.config (
    id integer NOT NULL,
    website character varying(255),
    site_name character varying(255),
    meta_title character varying(255),
    meta_description text,
    profile uuid NOT NULL,
    og_image uuid,
    favicon uuid,
    profile_url character varying(255),
    logo uuid,
    logo_with integer DEFAULT 100,
    logo_height integer DEFAULT 30
);


ALTER TABLE public.config OWNER TO docker;

--
-- Name: config_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.config_id_seq OWNER TO docker;

--
-- Name: config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.config_id_seq OWNED BY public.config.id;


--
-- Name: directus_access; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


ALTER TABLE public.directus_access OWNER TO docker;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO docker;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO docker;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO docker;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO docker;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE public.directus_extensions OWNER TO docker;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO docker;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO docker;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);


ALTER TABLE public.directus_files OWNER TO docker;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO docker;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO docker;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO docker;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO docker;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_notifications_id_seq OWNER TO docker;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO docker;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO docker;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);


ALTER TABLE public.directus_permissions OWNER TO docker;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO docker;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_policies OWNER TO docker;

--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO docker;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO docker;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO docker;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO docker;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO docker;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO docker;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);


ALTER TABLE public.directus_roles OWNER TO docker;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


ALTER TABLE public.directus_sessions OWNER TO docker;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json
);


ALTER TABLE public.directus_settings OWNER TO docker;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO docker;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO docker;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO docker;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json
);


ALTER TABLE public.directus_users OWNER TO docker;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_versions OWNER TO docker;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json,
    was_active_before_deprecation boolean DEFAULT false NOT NULL,
    migrated_flow uuid
);


ALTER TABLE public.directus_webhooks OWNER TO docker;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO docker;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.posts (
    id uuid NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    user_updated uuid NOT NULL,
    title character varying(255) DEFAULT NULL::character varying NOT NULL,
    content text NOT NULL,
    slug character varying(255) DEFAULT NULL::character varying NOT NULL,
    cover uuid,
    meta_description text,
    meta_title character varying(255),
    date_updated timestamp without time zone NOT NULL,
    views integer DEFAULT 0 NOT NULL,
    date_published timestamp with time zone NOT NULL,
    featured boolean,
    keywords character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.posts OWNER TO docker;

--
-- Name: posts_categories; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.posts_categories (
    id integer NOT NULL,
    posts_id uuid,
    categories_id uuid
);


ALTER TABLE public.posts_categories OWNER TO docker;

--
-- Name: posts_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.posts_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_categories_id_seq OWNER TO docker;

--
-- Name: posts_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.posts_categories_id_seq OWNED BY public.posts_categories.id;


--
-- Name: posts_tags; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.posts_tags (
    id integer NOT NULL,
    posts_id uuid,
    tags_id uuid,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.posts_tags OWNER TO docker;

--
-- Name: posts_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.posts_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_tags_id_seq OWNER TO docker;

--
-- Name: posts_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.posts_tags_id_seq OWNED BY public.posts_tags.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    status character varying(255) DEFAULT NULL::character varying NOT NULL,
    user_created uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    user_updated uuid NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    facebook character varying(255),
    github character varying(255),
    instagram character varying(255),
    mail character varying(255),
    twitter character varying(255),
    twitch character varying(255),
    youtube character varying(255),
    linkedin character varying(255),
    whatsapp character varying(255),
    snapchat character varying(255),
    pinterest character varying(255),
    tiktok character varying(255),
    codepen character varying(255),
    discord character varying(255),
    "gitLab" character varying(255),
    reddit character varying(255),
    skype character varying(255),
    steam character varying(255),
    telegram character varying(255),
    mastodon character varying(255),
    name character varying(255) DEFAULT NULL::character varying NOT NULL,
    description text,
    user_id uuid
);


ALTER TABLE public.profiles OWNER TO docker;

--
-- Name: related; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.related (
    id uuid NOT NULL,
    date_created timestamp with time zone,
    posts_id uuid,
    related_posts_id uuid
);


ALTER TABLE public.related OWNER TO docker;

--
-- Name: routings; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.routings (
    id uuid NOT NULL,
    user_created uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone,
    name character varying(255) DEFAULT NULL::character varying NOT NULL,
    identity character varying(255) DEFAULT NULL::character varying NOT NULL,
    meta_description text,
    meta_title character varying(255)
);


ALTER TABLE public.routings OWNER TO docker;

--
-- Name: static_pages; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.static_pages (
    id uuid NOT NULL,
    status character varying(255),
    user_created uuid NOT NULL,
    date_created timestamp with time zone NOT NULL,
    user_updated uuid NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    title character varying(255) DEFAULT NULL::character varying NOT NULL,
    meta_title character varying(255),
    meta_description text,
    slug character varying(255) DEFAULT NULL::character varying NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.static_pages OWNER TO docker;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.tags (
    id uuid NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    name character varying(255) DEFAULT NULL::character varying NOT NULL,
    posts_count integer DEFAULT 0 NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.tags OWNER TO docker;

--
-- Name: about_us id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.about_us ALTER COLUMN id SET DEFAULT nextval('public.about_us_id_seq'::regclass);


--
-- Name: about_us_profiles id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.about_us_profiles ALTER COLUMN id SET DEFAULT nextval('public.about_us_profiles_id_seq'::regclass);


--
-- Name: config id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.config ALTER COLUMN id SET DEFAULT nextval('public.config_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: posts_categories id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.posts_categories ALTER COLUMN id SET DEFAULT nextval('public.posts_categories_id_seq'::regclass);


--
-- Name: posts_tags id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.posts_tags ALTER COLUMN id SET DEFAULT nextval('public.posts_tags_id_seq'::regclass);


--
-- Data for Name: about_us; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.about_us (id, user_updated, date_updated, title, content, meta_title, meta_description) FROM stdin;
1	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-08 16:47:00.869+00	About	<p>About</p>	\N	\N
\.


--
-- Data for Name: about_us_profiles; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.about_us_profiles (id, about_us_id, profiles_id) FROM stdin;
1	1	d0316854-cb46-4986-87b2-239fabe7dad1
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.categories (id, user_created, date_created, user_updated, date_updated, "position", name, meta_title, meta_description, description, slug, cover) FROM stdin;
ebc7ae47-4f3a-49d3-afaa-d7a0e3872572	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-09 05:24:57.494+00	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-09 05:26:00.347+00	1	Guides	\N	\N	\N	guides	\N
\.


--
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.config (id, website, site_name, meta_title, meta_description, profile, og_image, favicon, profile_url, logo, logo_with, logo_height) FROM stdin;
1	http://localhost:4321	Simple Blog	Simple Blog: Build with Directus	Simple Blog: Build with Directus	d0316854-cb46-4986-87b2-239fabe7dad1	\N	\N	\N	\N	100	30
\.


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
aaf8576c-78aa-4f4f-8bc8-c8ea9907c2b1	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
ffc7c13e-a302-4ecb-9e33-bdeb261ba725	a111ed3a-859a-4365-9c5e-ae3783d69ba5	\N	ac5ba3ac-156a-4582-bf84-d6c6e0eb448c	\N
9204e6bc-7681-46b3-9f7c-d01da46b1a6f	1de2bdca-b3a5-4fdb-b14f-ff9779a483fb	\N	25b9b60b-f1ed-4a91-829f-8195c80504c3	1
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM stdin;
2183	delete	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-11 03:01:40.564+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	directus_flows	51695110-16fe-4b5f-8665-a2c78d45aaca	\N	http://localhost:8055
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
t	bfb1ce0e-d5f3-4377-b442-0cc3cedaed14	1aec0cf8-c821-44af-aec0-567a2a6f1a66	registry	\N
t	0313532b-295e-4e32-93c4-625ffc147ab3	25990187-d028-4099-ae46-70232d998d9f	registry	\N
t	e25af610-381b-4787-9ce6-a18dbffa863a	9bde3cf6-c3bd-4bbf-befe-e65294d4b632	registry	\N
t	78fc600e-085d-49e2-8c28-9e952a1765d9	e3065f4a-5810-431f-9a1c-2c8c3847e562	registry	\N
t	e9432070-157d-46ef-9bd6-ea1880e26188	directus-extension-hook-action	local	\N
t	2cba5a87-43f9-41d5-b917-b9dc05aaad49	directus-extension-markdown-to-html	local	\N
t	7be6f209-7702-4005-a449-1e3eef02a030	directus-extension-gemini-ai	local	\N
t	ca83a063-a522-4872-bbdb-0e87b82388d9	directus-extension-google-ai	local	\N
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
32	posts_tags	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
33	posts_tags	posts_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
34	posts_tags	tags_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
62	config	id	\N	input	\N	\N	\N	t	f	1	full	\N	\N	\N	f	\N	\N	\N
63	config	website	\N	input	\N	\N	\N	f	f	2	full	\N	\N	\N	t	\N	{"_and":[{"website":{"_starts_with":"http"}},{"_and":[]},{"website":{"_contains":"://"}}]}	\N
36	routings	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
37	routings	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	2	half	\N	\N	\N	f	\N	\N	\N
38	routings	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	3	half	\N	\N	\N	f	\N	\N	\N
39	routings	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
40	routings	name	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
43	routings	meta_title	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
42	routings	meta_description	\N	input-multiline	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
44	related	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
45	related	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	2	half	\N	\N	\N	f	\N	\N	\N
48	related	posts_id	\N	\N	\N	\N	\N	f	t	4	full	\N	\N	\N	f	\N	\N	\N
49	related	related_posts_id	\N	\N	\N	\N	\N	f	t	5	full	\N	\N	\N	f	\N	\N	\N
64	config	site_name	\N	input	{"trim":true}	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N
65	config	meta_title	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
66	config	meta_description	\N	input-multiline	{"trim":true}	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
129	profiles	name	\N	input	{"trim":true}	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
68	static_pages	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
69	static_pages	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
70	static_pages	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
71	static_pages	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
74	static_pages	title	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
77	static_pages	slug	\N	extension-wpslug	{"template":"{{title}}"}	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
75	static_pages	meta_title	\N	input	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
76	static_pages	meta_description	\N	input-multiline	{"trim":true}	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
78	static_pages	content	\N	input-rich-text-html	\N	\N	\N	f	f	11	full	\N	\N	\N	t	\N	\N	\N
72	static_pages	user_updated	user-updated,user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
73	static_pages	date_updated	date-updated,date-created	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
10	categories	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
11	categories	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	2	half	\N	\N	\N	f	\N	\N	\N
12	categories	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	3	half	\N	\N	\N	f	\N	\N	\N
13	categories	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
14	categories	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
16	categories	name	\N	input	\N	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
35	categories	slug	\N	extension-wpslug	{"template":"{{name}}"}	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
15	categories	position	\N	input	{"min":1}	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
52	categories	cover	file	file-image	\N	image	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
17	categories	meta_title	\N	input	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
18	categories	meta_description	\N	input-multiline	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
19	categories	description	\N	input-rich-text-html	\N	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N
24	tags	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	2	half	\N	\N	\N	f	\N	\N	\N
25	tags	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	3	half	\N	\N	\N	f	\N	\N	\N
26	tags	name	\N	input	\N	\N	\N	f	f	4	half	\N	\N	\N	t	\N	\N	\N
23	tags	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
41	routings	identity	\N	input	\N	\N	\N	t	f	6	full	\N	\N	\N	t	\N	\N	\N
84	about_us	content	\N	input-rich-text-html	\N	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
115	profiles	youtube	\N	input	\N	\N	\N	f	f	17	half	\N	\N	\N	f	\N	\N	\N
124	profiles	reddit	\N	input	\N	\N	\N	f	f	25	half	\N	\N	\N	f	\N	\N	\N
108	profiles	facebook	\N	input	\N	\N	\N	f	f	10	half	\N	\N	\N	f	\N	\N	\N
109	profiles	github	\N	input	\N	\N	\N	f	f	11	half	\N	\N	\N	f	\N	\N	\N
117	profiles	whatsapp	\N	input	\N	\N	\N	f	f	18	half	\N	\N	\N	f	\N	\N	\N
1	posts	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
3	posts	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
4	posts	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
50	posts	date_updated	date-updated,date-created	datetime	\N	\N	\N	f	t	7	half	\N	\N	\N	f	\N	\N	\N
6	posts	title	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
8	posts	slug	\N	extension-wpslug	{"template":"{{title}}"}	\N	\N	f	f	9	full	\N	\N	\N	t	\N	\N	\N
9	posts	cover	file	file-image	\N	image	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
79	posts	featured	cast-boolean	boolean	{"colorOn":"#3399FF"}	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N
22	posts	meta_title	\N	input	\N	\N	\N	f	f	13	full	\N	\N	\N	f	\N	\N	\N
20	posts	meta_description	\N	input-multiline	{"trim":true}	\N	\N	f	f	14	full	\N	\N	\N	f	\N	\N	\N
7	posts	content	\N	input-rich-text-html	\N	\N	\N	f	f	15	full	\N	\N	\N	t	\N	\N	\N
51	posts	views	\N	input	\N	\N	\N	f	t	19	full	\N	\N	\N	f	\N	\N	\N
105	profiles	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
118	profiles	snapchat	\N	input	\N	\N	\N	f	f	19	half	\N	\N	\N	f	\N	\N	\N
119	profiles	pinterest	\N	input	\N	\N	\N	f	f	20	half	\N	\N	\N	f	\N	\N	\N
125	profiles	skype	\N	input	\N	\N	\N	f	f	26	half	\N	\N	\N	f	\N	\N	\N
126	profiles	steam	\N	input	\N	\N	\N	f	f	27	half	\N	\N	\N	f	\N	\N	\N
120	profiles	tiktok	\N	input	\N	\N	\N	f	f	21	half	\N	\N	\N	f	\N	\N	\N
121	profiles	codepen	\N	input	\N	\N	\N	f	f	22	half	\N	\N	\N	f	\N	\N	\N
122	profiles	discord	\N	input	\N	\N	\N	f	f	23	half	\N	\N	\N	f	\N	\N	\N
127	profiles	telegram	\N	input	\N	\N	\N	f	f	28	half	\N	\N	\N	f	\N	\N	\N
128	profiles	mastodon	\N	input	\N	\N	\N	f	f	29	half	\N	\N	\N	f	\N	\N	\N
80	about_us	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
81	about_us	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	2	half	\N	\N	\N	f	\N	\N	\N
82	about_us	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	3	half	\N	\N	\N	f	\N	\N	\N
83	about_us	title	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
110	profiles	instagram	\N	input	\N	\N	\N	f	f	13	half	\N	\N	\N	f	\N	\N	\N
116	profiles	linkedin	\N	input	\N	\N	\N	f	f	12	half	\N	\N	\N	f	\N	\N	\N
123	profiles	gitLab	\N	input	\N	\N	\N	f	f	24	half	\N	\N	\N	f	\N	\N	\N
112	profiles	mail	\N	input	\N	\N	\N	f	f	14	half	\N	\N	\N	f	\N	\N	\N
113	profiles	twitter	\N	input	\N	\N	\N	f	f	15	half	\N	\N	\N	f	\N	\N	\N
114	profiles	twitch	\N	input	\N	\N	\N	f	f	16	half	\N	\N	\N	f	\N	\N	\N
102	profiles	id	uuid	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
104	profiles	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
103	profiles	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	half	\N	\N	\N	f	\N	\N	\N
131	profiles	description	\N	input-rich-text-html	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
134	about_us_profiles	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
135	about_us_profiles	about_us_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
136	about_us_profiles	profiles_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
137	about_us	meta_title	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
138	about_us	meta_description	\N	input-multiline	{"trim":true}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
133	about_us	team	m2m	list-m2m	{"layout":"table","fields":["profiles_id.user_id.email","profiles_id.name","profiles_id.status","profiles_id.user_id.avatar.$thumbnail"]}	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
142	posts_tags	date_created	date-created	datetime	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
139	config	profile	m2o	select-dropdown-m2o	{}	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
146	config	profile_url	\N	input	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	{"_and":[{"profile_url":{"_starts_with":"http"}}]}	\N
144	config	favicon	file	file-image	\N	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
147	config	logo	file	file-image	\N	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
150	config	logo_with	\N	input	{"min":20}	\N	\N	f	f	10	half	\N	\N	\N	t	\N	\N	\N
151	config	logo_height	\N	input	{"min":20}	\N	\N	f	f	11	half	\N	\N	\N	t	\N	\N	\N
143	config	og_image	file	file-image	\N	\N	\N	f	f	12	full	\N	\N	\N	f	\N	\N	\N
106	profiles	user_updated	user-updated,user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	8	half	\N	\N	\N	f	\N	\N	\N
107	profiles	date_updated	date-updated,date-created	datetime	\N	datetime	{"relative":true}	t	t	9	half	\N	\N	\N	f	\N	\N	\N
155	posts_categories	categories_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
132	profiles	user_id	m2o	select-dropdown-m2o	{"enableCreate":false,"template":"{{email}}"}	user	\N	f	f	3	half	[{"language":"en-US","translation":"User"}]	\N	\N	f	\N	\N	\N
153	posts_categories	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
154	posts_categories	posts_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
141	tags	posts_count	\N	input	\N	\N	\N	t	f	6	full	\N	\N	\N	f	\N	\N	\N
157	tags	display_name	\N	input	\N	\N	\N	f	f	5	half	\N	\N	\N	f	\N	\N	\N
2	posts	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}]}	f	f	2	half	\N	\N	\N	f	\N	\N	\N
67	posts	date_published	date-created	datetime	\N	datetime	\N	f	f	3	half	\N	\N	\N	t	\N	\N	\N
5	posts	user_updated	user-updated,user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
152	posts	category_ids	m2m	list-m2m	{"template":"{{categories_id.name}}"}	related-values	{"template":"{{categories_id.name}}"}	f	f	16	full	[{"language":"en-US","translation":"Categories"}]	\N	\N	f	\N	\N	\N
31	posts	tag_ids	m2m	extension-tags-m2m	{"referencingField":"name","allowMultiple":true}	\N	\N	f	f	17	full	[{"language":"en-US","translation":"Tags"}]	\N	\N	f	\N	\N	\N
47	posts	related	m2m	list-m2m	{"enableCreate":false,"layout":"table","fields":["related_posts_id.title","related_posts_id.status","related_posts_id.cover.$thumbnail"]}	related-values	{"template":"{{posts_id.title}}"}	f	f	18	full	\N	\N	\N	f	\N	\N	\N
158	posts	keywords	\N	input	\N	\N	\N	f	f	10	full	\N	For SEO AI Content	\N	f	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
bd967ca6-4208-41bd-b808-2d3daf6ffefd	local	bd967ca6-4208-41bd-b808-2d3daf6ffefd.webp	DALL·E 2024-10-09 09.48.48 - A digital-themed cover image for a 'Hello World' article. The background features a sleek, modern, abstract representation of binary code and data flo.webp	Dall·e 2024 10 09 09.48.48   a Digital Themed Cover Image for a 'hello World' Article. the Background Features a Sleek, Modern, Abstract Representation of Binary Code and Data Flo	image/webp	6144943f-2ada-47a9-aff6-52a20ac05afa	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-09 01:49:05.126+00	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-09 01:50:43.201+00	\N	310592	1024	1024	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2024-10-09 01:49:05.144+00
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
bb146cc5-15c7-4fb8-beec-c20352943a84	test mail	bolt	\N	\N	active	manual	all	{"collections":["config"]}	b1a4c997-5631-4188-8f08-3ba11362c1b3	2024-10-01 10:41:41.133+00	c95f7d22-c805-4afc-8c14-d3875b84881c
fdff203b-d7ce-4ab6-a87d-95be3aee8a2e	Content Generator With HTML	bolt	\N	Update Post Content	active	manual	activity	{"collections":["posts"],"location":"item","requireConfirmation":true,"fields":[{"field":"prompt","type":"string","name":"Prompt","meta":{"interface":"select-dropdown","options":{"choices":[{"text":"Rewrite the HTML content based on the topic and SEO keywords","value":"Rewrite the HTML content based on the topic and SEO keywords"}],"allowOther":true},"required":true}},{"field":"html_code","type":"text","name":"HTML","meta":{"interface":"input-multiline","required":true}}]}	6e0c8538-e1d1-4262-8577-5dcdea9fa589	2024-10-10 06:58:41.242+00	c95f7d22-c805-4afc-8c14-d3875b84881c
70698a53-7105-4728-8a66-1141a1ad4a5f	Build Gemini Prompt	bolt	\N	return string	active	operation	\N	{"return":"$last"}	1a5d7217-3389-4dd6-a477-b9e2867bc7e6	2024-10-10 07:53:27.064+00	c95f7d22-c805-4afc-8c14-d3875b84881c
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_folders (id, name, parent) FROM stdin;
6144943f-2ada-47a9-aff6-52a20ac05afa	blog	\N
34a9a06b-2b48-49b8-9f2e-86feb90aeb3b	avatar	\N
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2024-09-30 13:56:54.787198+00
20201029A	Remove System Relations	2024-09-30 13:56:54.790281+00
20201029B	Remove System Collections	2024-09-30 13:56:54.793529+00
20201029C	Remove System Fields	2024-09-30 13:56:54.798084+00
20201105A	Add Cascade System Relations	2024-09-30 13:56:54.819722+00
20201105B	Change Webhook URL Type	2024-09-30 13:56:54.823077+00
20210225A	Add Relations Sort Field	2024-09-30 13:56:54.826145+00
20210304A	Remove Locked Fields	2024-09-30 13:56:54.827849+00
20210312A	Webhooks Collections Text	2024-09-30 13:56:54.830072+00
20210331A	Add Refresh Interval	2024-09-30 13:56:54.831219+00
20210415A	Make Filesize Nullable	2024-09-30 13:56:54.834071+00
20210416A	Add Collections Accountability	2024-09-30 13:56:54.83603+00
20210422A	Remove Files Interface	2024-09-30 13:56:54.83707+00
20210506A	Rename Interfaces	2024-09-30 13:56:54.844917+00
20210510A	Restructure Relations	2024-09-30 13:56:54.85328+00
20210518A	Add Foreign Key Constraints	2024-09-30 13:56:54.857949+00
20210519A	Add System Fk Triggers	2024-09-30 13:56:54.870951+00
20210521A	Add Collections Icon Color	2024-09-30 13:56:54.872085+00
20210525A	Add Insights	2024-09-30 13:56:54.880303+00
20210608A	Add Deep Clone Config	2024-09-30 13:56:54.881315+00
20210626A	Change Filesize Bigint	2024-09-30 13:56:54.887003+00
20210716A	Add Conditions to Fields	2024-09-30 13:56:54.887971+00
20210721A	Add Default Folder	2024-09-30 13:56:54.89043+00
20210802A	Replace Groups	2024-09-30 13:56:54.892347+00
20210803A	Add Required to Fields	2024-09-30 13:56:54.893348+00
20210805A	Update Groups	2024-09-30 13:56:54.894995+00
20210805B	Change Image Metadata Structure	2024-09-30 13:56:54.897176+00
20210811A	Add Geometry Config	2024-09-30 13:56:54.898194+00
20210831A	Remove Limit Column	2024-09-30 13:56:54.899224+00
20210903A	Add Auth Provider	2024-09-30 13:56:54.904471+00
20210907A	Webhooks Collections Not Null	2024-09-30 13:56:54.906569+00
20210910A	Move Module Setup	2024-09-30 13:56:54.9078+00
20210920A	Webhooks URL Not Null	2024-09-30 13:56:54.909736+00
20210924A	Add Collection Organization	2024-09-30 13:56:54.911479+00
20210927A	Replace Fields Group	2024-09-30 13:56:54.914328+00
20210927B	Replace M2M Interface	2024-09-30 13:56:54.915177+00
20210929A	Rename Login Action	2024-09-30 13:56:54.916009+00
20211007A	Update Presets	2024-09-30 13:56:54.91843+00
20211009A	Add Auth Data	2024-09-30 13:56:54.91938+00
20211016A	Add Webhook Headers	2024-09-30 13:56:54.920417+00
20211103A	Set Unique to User Token	2024-09-30 13:56:54.922073+00
20211103B	Update Special Geometry	2024-09-30 13:56:54.923147+00
20211104A	Remove Collections Listing	2024-09-30 13:56:54.924+00
20211118A	Add Notifications	2024-09-30 13:56:54.929555+00
20211211A	Add Shares	2024-09-30 13:56:54.937359+00
20211230A	Add Project Descriptor	2024-09-30 13:56:54.938447+00
20220303A	Remove Default Project Color	2024-09-30 13:56:54.941584+00
20220308A	Add Bookmark Icon and Color	2024-09-30 13:56:54.942702+00
20220314A	Add Translation Strings	2024-09-30 13:56:54.943462+00
20220322A	Rename Field Typecast Flags	2024-09-30 13:56:54.945234+00
20220323A	Add Field Validation	2024-09-30 13:56:54.946163+00
20220325A	Fix Typecast Flags	2024-09-30 13:56:54.947764+00
20220325B	Add Default Language	2024-09-30 13:56:54.950284+00
20220402A	Remove Default Value Panel Icon	2024-09-30 13:56:54.952319+00
20220429A	Add Flows	2024-09-30 13:56:54.9655+00
20220429B	Add Color to Insights Icon	2024-09-30 13:56:54.966594+00
20220429C	Drop Non Null From IP of Activity	2024-09-30 13:56:54.967562+00
20220429D	Drop Non Null From Sender of Notifications	2024-09-30 13:56:54.968438+00
20220614A	Rename Hook Trigger to Event	2024-09-30 13:56:54.969338+00
20220801A	Update Notifications Timestamp Column	2024-09-30 13:56:54.971934+00
20220802A	Add Custom Aspect Ratios	2024-09-30 13:56:54.972776+00
20220826A	Add Origin to Accountability	2024-09-30 13:56:54.974005+00
20230401A	Update Material Icons	2024-09-30 13:56:54.97656+00
20230525A	Add Preview Settings	2024-09-30 13:56:54.97741+00
20230526A	Migrate Translation Strings	2024-09-30 13:56:54.981293+00
20230721A	Require Shares Fields	2024-09-30 13:56:54.983177+00
20230823A	Add Content Versioning	2024-09-30 13:56:54.990074+00
20230927A	Themes	2024-09-30 13:56:54.995835+00
20231009A	Update CSV Fields to Text	2024-09-30 13:56:54.997557+00
20231009B	Update Panel Options	2024-09-30 13:56:54.99845+00
20231010A	Add Extensions	2024-09-30 13:56:55.000186+00
20231215A	Add Focalpoints	2024-09-30 13:56:55.001061+00
20240122A	Add Report URL Fields	2024-09-30 13:56:55.002092+00
20240204A	Marketplace	2024-09-30 13:56:55.008832+00
20240305A	Change Useragent Type	2024-09-30 13:56:55.01252+00
20240311A	Deprecate Webhooks	2024-09-30 13:56:55.016838+00
20240422A	Public Registration	2024-09-30 13:56:55.019041+00
20240515A	Add Session Window	2024-09-30 13:56:55.019939+00
20240701A	Add Tus Data	2024-09-30 13:56:55.020827+00
20240716A	Update Files Date Fields	2024-09-30 13:56:55.022944+00
20240806A	Permissions Policies	2024-09-30 13:56:55.038761+00
20240817A	Update Icon Fields Length	2024-09-30 13:56:55.04516+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
b1a4c997-5631-4188-8f08-3ba11362c1b3	Send Email	mail_zdetv	mail	19	1	{"subject":"Config Changed","body":"Config Changed!","to":"admin@example.com"}	\N	\N	bb146cc5-15c7-4fb8-beec-c20352943a84	2024-10-01 10:43:46.222+00	c95f7d22-c805-4afc-8c14-d3875b84881c
116dc701-e826-49c1-94f3-b54afd2180d6	Log to Console	log_tt45q	log	5	39	{"message":"trigger {{$trigger}} - last {{$last}}"}	\N	\N	fdff203b-d7ce-4ab6-a87d-95be3aee8a2e	2024-10-10 07:21:45.892+00	c95f7d22-c805-4afc-8c14-d3875b84881c
ea03f3dc-13f8-4579-88f7-ee101ee6e98f	Log to Console	log_3q23m	log	22	22	{"message":"Error: {{$last}}"}	\N	\N	fdff203b-d7ce-4ab6-a87d-95be3aee8a2e	2024-10-10 07:00:09.204+00	c95f7d22-c805-4afc-8c14-d3875b84881c
2b8b6b46-0ff6-4ae5-8431-67fa1da57120	Update Content	log_vu9lb	item-update	43	41	{"collection":"posts","payload":{"content":"{{$last.text}}"},"key":"{{$trigger.body.keys[0]}}"}	\N	\N	fdff203b-d7ce-4ab6-a87d-95be3aee8a2e	2024-10-10 08:18:43.302+00	c95f7d22-c805-4afc-8c14-d3875b84881c
ef5d35f1-936c-4a35-a244-a1c7fdb638b1	Markdown To HTML	markdown_to_html_828vp	markdown-to-html	25	41	{"text":"{{gemini.data}}"}	2b8b6b46-0ff6-4ae5-8431-67fa1da57120	\N	fdff203b-d7ce-4ab6-a87d-95be3aee8a2e	2024-10-10 13:08:55.764+00	c95f7d22-c805-4afc-8c14-d3875b84881c
206fe936-75dc-4630-9244-1c610da4598e	Condition	condition_ler5l	condition	43	20	{"filter":{"$last":{"success":{"_eq":true}}}}	ef5d35f1-936c-4a35-a244-a1c7fdb638b1	\N	fdff203b-d7ce-4ab6-a87d-95be3aee8a2e	2024-10-10 08:47:18.92+00	c95f7d22-c805-4afc-8c14-d3875b84881c
428ff480-3609-4dbc-b36a-4f9f2c85ccda	Request Gemini API	gemini	google-ai	42	2	{"prompt":"{{prompt}}","aiModel":"gemini-1.5-flash"}	206fe936-75dc-4630-9244-1c610da4598e	\N	fdff203b-d7ce-4ab6-a87d-95be3aee8a2e	2024-10-10 07:00:09.217+00	c95f7d22-c805-4afc-8c14-d3875b84881c
7b59c324-ee65-4080-8f24-18922b01f9a2	Build Prompt	prompt	trigger	21	1	{"flow":"70698a53-7105-4728-8a66-1141a1ad4a5f","payload":{"user":"{{ $accountability.user }}","apikey":"Gemini ApiKey","title":"{{post[0].title}}","content":"{{post[0].content}}","keywords":"{{post[0].keywords}}","prompt":"{{ $trigger.body.prompt }}","html_code":"{{ $trigger.body.html_code }}","collection":"{{ $trigger.body.collection }}","keys":["{{ $trigger.body.keys[0] }}"]}}	428ff480-3609-4dbc-b36a-4f9f2c85ccda	ea03f3dc-13f8-4579-88f7-ee101ee6e98f	fdff203b-d7ce-4ab6-a87d-95be3aee8a2e	2024-10-10 07:00:09.233+00	c95f7d22-c805-4afc-8c14-d3875b84881c
6e0c8538-e1d1-4262-8577-5dcdea9fa589	Read Post	post	item-read	3	21	{"collection":"posts","emitEvents":true}	7b59c324-ee65-4080-8f24-18922b01f9a2	116dc701-e826-49c1-94f3-b54afd2180d6	fdff203b-d7ce-4ab6-a87d-95be3aee8a2e	2024-10-10 07:17:42.079+00	c95f7d22-c805-4afc-8c14-d3875b84881c
1a5d7217-3389-4dd6-a477-b9e2867bc7e6	Run Script	exec_jwdj1	exec	19	1	{"code":"/**\\n * Prompt Gemini API\\n * \\n * Content Generator With HTML\\n * @returns \\n */\\nmodule.exports = async function ({ $trigger }) {\\n  // title, keywords, content from post\\n  const { title, keywords, content, prompt, html_code } = $trigger;\\n\\n  let promptStr = `Article topic: ${title}\\\\n\\\\n`;\\n  if (keywords && keywords.trim() !== '') promptStr += `Article SEO keywords: ${keywords}\\\\n\\\\n`;\\n  promptStr += \\"```html\\\\n\\";\\n  promptStr += html_code;\\n  promptStr += \\"```\\\\n\\";\\n\\n  promptStr += `${prompt}\\\\n`;\\n  promptStr += `Article content structure (do not add an opening title): \\\\n\\\\n`;\\n  promptStr += `introduction Without Paragraph heading ... \\\\n\\\\n`;\\n  promptStr += `## Paragraph heading 1\\\\n\\\\n`;\\n  promptStr += `Paragraph...\\\\n\\\\n`;\\n  promptStr += `## Paragraph heading 2\\\\n\\\\n`;\\n  promptStr += `Paragraph...\\\\n\\\\n`;\\n  promptStr += `More sections ...\\\\n\\\\n`;\\n  promptStr += `## conclusion ...\\\\n\\\\n`;\\n  promptStr += `## Resource (if has resource) ...\\\\n\\\\n`;\\n  promptStr += `- [title](url)\\\\n\\\\n`;\\n  promptStr += `Only return the article content, do not return content unrelated to the article. The article paragraphs should have clear hierarchy, and key sentences should be appropriately bolded.`;\\n\\n  return promptStr\\n}\\n"}	\N	\N	70698a53-7105-4728-8a66-1141a1ad4a5f	2024-10-10 07:57:01.163+00	c95f7d22-c805-4afc-8c14-d3875b84881c
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
1	about_us	read	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
2	about_us	update	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
3	categories	read	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
4	categories	update	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
5	config	read	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
6	posts	create	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
7	posts	update	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
9	posts	read	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
10	posts_tags	update	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
11	posts_tags	delete	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
12	posts_tags	read	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
13	posts_tags	create	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
14	related	create	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
15	related	read	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
16	related	update	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
17	related	delete	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
18	routings	read	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
19	routings	update	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
24	static_pages	create	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
25	static_pages	read	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
26	static_pages	update	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
28	tags	create	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
29	tags	read	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
30	tags	update	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
31	tags	delete	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
32	directus_files	read	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
33	directus_files	create	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
35	profiles	read	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
36	profiles	create	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
37	profiles	update	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
38	about_us_profiles	read	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
39	directus_folders	read	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
40	categories	create	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
41	about_us_profiles	update	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
42	about_us_profiles	create	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
43	about_us_profiles	delete	\N	\N	\N	*	25b9b60b-f1ed-4a91-829f-8195c80504c3
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
ac5ba3ac-156a-4582-bf84-d6c6e0eb448c	Administrator	verified	$t:admin_description	\N	f	t	t
25b9b60b-f1ed-4a91-829f-8195c80504c3	Team	badge	\N	\N	f	f	t
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
14	\N	ae30be52-1092-4f8f-9890-5035478b1bd9	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N	bookmark	\N
11	\N	ae30be52-1092-4f8f-9890-5035478b1bd9	\N	tags	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
9	\N	ae30be52-1092-4f8f-9890-5035478b1bd9	\N	posts	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
10	\N	ae30be52-1092-4f8f-9890-5035478b1bd9	\N	directus_users	\N	cards	{"cards":{"sort":["email"],"page":1}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}	\N	\N	bookmark	\N
3	\N	c95f7d22-c805-4afc-8c14-d3875b84881c	\N	tags	\N	\N	{"tabular":{"page":1,"fields":["name","display_name","posts_count"]}}	{"tabular":{"widths":{"name":185.99609375}}}	\N	\N	bookmark	\N
13	\N	c95f7d22-c805-4afc-8c14-d3875b84881c	\N	static_pages	\N	\N	{"tabular":{"page":1,"fields":["title","slug","status","meta_title"]}}	{"tabular":{"widths":{}}}	\N	\N	bookmark	\N
7	\N	c95f7d22-c805-4afc-8c14-d3875b84881c	\N	directus_users	\N	cards	{"cards":{"sort":["email"],"page":1}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}	\N	\N	bookmark	\N
15	\N	c95f7d22-c805-4afc-8c14-d3875b84881c	\N	posts_tags	\N	\N	{"tabular":{"page":1,"fields":["date_created"]}}	{"tabular":{"widths":{"date_created":404.9765625}}}	\N	\N	bookmark	\N
5	\N	c95f7d22-c805-4afc-8c14-d3875b84881c	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1}}	{"cards":{"icon":"insert_drive_file","title":"{{title}}","subtitle":"{{type}} • {{filesize}}","size":5,"imageFit":"crop"}}	\N	\N	bookmark	\N
4	\N	c95f7d22-c805-4afc-8c14-d3875b84881c	\N	routings	\N	\N	{"tabular":{"page":1,"fields":["name","identity","meta_title","meta_description"]}}	{"tabular":{"widths":{}}}	\N	\N	bookmark	\N
1	\N	c95f7d22-c805-4afc-8c14-d3875b84881c	\N	posts	\N	\N	{"tabular":{"page":1,"fields":["title","slug","status","views","date_published"]}}	{"tabular":{"widths":{"title":473.98828125,"slug":173.6328125,"status":118.29296875,"views":148.828125,"date_published":284.85546875}}}	\N	\N	bookmark	\N
16	\N	c95f7d22-c805-4afc-8c14-d3875b84881c	\N	directus_activity	\N	tabular	{"tabular":{"sort":["-timestamp"],"fields":["action","collection","timestamp","user"],"page":1}}	{"tabular":{"widths":{"action":120,"collection":210,"timestamp":240,"user":240}}}	\N	\N	bookmark	\N
2	\N	c95f7d22-c805-4afc-8c14-d3875b84881c	\N	categories	\N	\N	{"tabular":{"page":1,"fields":["position","name","slug","cover"]}}	{"tabular":{"widths":{"position":97.8984375}}}	\N	\N	bookmark	\N
12	\N	c95f7d22-c805-4afc-8c14-d3875b84881c	\N	profiles	\N	\N	{"tabular":{"page":1,"fields":["name","status","user_id"]}}	{"tabular":{"widths":{}}}	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	posts	user_created	directus_users	\N	\N	\N	\N	\N	nullify
2	posts	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
3	posts	cover	directus_files	\N	\N	\N	\N	\N	nullify
4	categories	user_created	directus_users	\N	\N	\N	\N	\N	nullify
5	categories	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
6	tags	user_created	directus_users	\N	\N	\N	\N	\N	nullify
11	routings	user_created	directus_users	\N	\N	\N	\N	\N	nullify
12	related	related_posts_id	posts	\N	\N	\N	posts_id	\N	nullify
13	related	posts_id	posts	related	\N	\N	related_posts_id	\N	nullify
14	categories	cover	directus_files	\N	\N	\N	\N	\N	nullify
17	static_pages	user_created	directus_users	\N	\N	\N	\N	\N	nullify
18	static_pages	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
19	about_us	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
30	profiles	user_created	directus_users	\N	\N	\N	\N	\N	nullify
31	profiles	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
33	about_us_profiles	profiles_id	profiles	\N	\N	\N	about_us_id	\N	nullify
34	about_us_profiles	about_us_id	about_us	team	\N	\N	profiles_id	\N	nullify
9	posts_tags	tags_id	tags	\N	\N	\N	posts_id	\N	nullify
10	posts_tags	posts_id	posts	tag_ids	\N	\N	tags_id	\N	delete
36	config	og_image	directus_files	\N	\N	\N	\N	\N	nullify
37	config	favicon	directus_files	\N	\N	\N	\N	\N	nullify
35	config	profile	profiles	\N	\N	\N	\N	\N	nullify
38	config	logo	directus_files	\N	\N	\N	\N	\N	nullify
32	profiles	user_id	directus_users	\N	\N	\N	\N	\N	nullify
39	posts_categories	categories_id	categories	\N	\N	\N	posts_id	\N	nullify
40	posts_categories	posts_id	posts	category_ids	\N	\N	categories_id	\N	delete
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
a111ed3a-859a-4365-9c5e-ae3783d69ba5	Administrator	verified	$t:admin_description	\N
1de2bdca-b3a5-4fdb-b14f-ff9779a483fb	Team	supervised_user_circle	\N	\N
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
hlQd51eYVIrlRV10Sv4NAOkKDxfidC5dDtgrdUMroPvaWCaXzMgRSL4cjKBjrFWN	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-11 05:24:39.787+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
TSTSsyW8sglax6r3gPz9jD7YiK0vExR0YsyCoOl5yuELRXnhXEjYG4UiSzaKlMOu	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-17 05:32:04.42+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
r3TIaqeN_udpcTwpaJSJ4umloYM12NrZOz7pNFyQQ5Ex4r_Kqd8NysGF-WYiF8Yi	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-17 05:33:44.739+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
NXee5g69XXxLaaHOzMOdOZHC16ciaqdrAq8l_Rb3gdAnDBLSsOrEE3zuS7_mG0TL	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-11 03:01:24.765+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	http://localhost:8055	2t-Gltigt3SB7VKlZhHTEnC4IRrj-9UuFw2Cnoc77m0vR3IJbLtGHNWLTaAwDBAW
2t-Gltigt3SB7VKlZhHTEnC4IRrj-9UuFw2Cnoc77m0vR3IJbLtGHNWLTaAwDBAW	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-12 03:01:14.765+00	192.168.65.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter) FROM stdin;
1	Directus	\N	#6644FF	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"link","id":"docs","name":"Documentation","url":"https://docs.directus.io","icon":"help","enabled":true},{"type":"module","id":"settings","enabled":true,"locked":true},{"type":"module","id":"generate-types","enabled":true}]	\N	en-US	\N	\N	auto	\N	\N	\N	\N	\N	\N	\N	f	t	\N	\N
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
ae30be52-1092-4f8f-9890-5035478b1bd9	team	example	team@example.com	$argon2id$v=19$m=65536,t=3,p=4$eOk7AmDWI4encuD5p6l+VQ$PuK7TxHm5eBUaN/qs5i9XypK84DcsgpPgtzUGJZ73Tw	\N	\N	\N	\N	\N	\N	\N	active	1de2bdca-b3a5-4fdb-b14f-ff9779a483fb	\N	2024-10-04 17:12:10.956+00	/files/folders/34a9a06b-2b48-49b8-9f2e-86feb90aeb3b	default	\N	\N	t	\N	\N	\N	\N	\N
c95f7d22-c805-4afc-8c14-d3875b84881c	Admin	User	admin@example.com	$argon2id$v=19$m=65536,t=3,p=4$sD37G8H5SrYjEXCMyeBsiw$LzizPUZt5w/uV/cABpmpaneTjtzkkZs7VFuMs9ioCt4	\N	\N	\N	\N	\N	\N	\N	active	a111ed3a-859a-4365-9c5e-ae3783d69ba5	ns40P30Eg2QoMpMLrEy62zc5Id04uKA6	2024-10-11 03:01:14.768+00	/settings/flows	default	\N	\N	t	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers, was_active_before_deprecation, migrated_flow) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.posts (id, status, user_created, date_created, user_updated, title, content, slug, cover, meta_description, meta_title, date_updated, views, date_published, featured, keywords) FROM stdin;
fbd1a788-2390-4369-9d29-dcd591611fc3	published	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-09 01:46:30.103+00	c95f7d22-c805-4afc-8c14-d3875b84881c	Hello World: The First Step into a New Digital Journey	<p>Whether you're a developer, a beginner, or just a tech enthusiast, "Hello World" is likely one of the first phrases you encounter in programming. It's not just a simple piece of code; it's a symbolic entry into the world of technology. With just a few lines, "Hello World" declares that your journey into the realm of development has officially begun.</p>\n<p>In today&rsquo;s modern applications, however, "Hello World" often involves more than just basic code. Behind the scenes, there can be a complex backend system managing data and functionality. One such system that many developers use is <strong>Directus</strong>. Directus is a no-code/low-code platform that empowers developers to build, extend, and customize their content management systems with ease.</p>\n<p>By leveraging Directus, developers can efficiently manage their content data, even for projects as simple as a "Hello World" app. Whether you're creating a small personal site or a large-scale application, Directus provides a powerful backend that simplifies your development process.</p>\n<p><strong>Conclusion</strong><br>Start your journey with "Hello World" and use modern tools like Directus to make development easier. The door to the digital world is open, and the possibilities are endless!</p>	hello-world	bd967ca6-4208-41bd-b808-2d3daf6ffefd	\N	\N	2024-10-10 15:12:25.642	0	2024-10-09 01:46:30.104+00	\N	Hello World
c0947bf2-15a8-4d9e-bea3-5f28cf772d42	published	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-09 05:35:07.802+00	c95f7d22-c805-4afc-8c14-d3875b84881c	What is Directus?	<p>In today&#39;s fast-paced digital landscape, businesses need flexible and efficient solutions for managing their content and data. Enter <strong>Directus</strong>, an innovative open-source headless CMS that&#39;s changing the game for developers and content creators alike.</p>\n<h2>What is Directus?</h2>\n<p>Directus is a modern, open-source headless content management system (CMS) that provides a powerful and flexible solution for managing any type of data. Unlike traditional CMSs, Directus decouples the content management interface from the presentation layer, allowing developers to use any technology stack for the frontend while providing a robust backend for content storage and retrieval. </p>\n<h2>Key Features of Directus:</h2>\n<ul>\n<li><strong>Database-First Approach:</strong> Directus can work with any SQL database, instantly transforming it into a dynamic API and intuitive admin app.</li>\n<li><strong>RESTful API and GraphQL:</strong> Offers both REST and GraphQL APIs out of the box, providing developers with flexibility in how they interact with data.</li>\n<li><strong>User-Friendly Interface:</strong> Boasts an intuitive, customizable admin app that makes content management accessible to non-technical users.</li>\n<li><strong>Extensibility:</strong> Supports custom modules, hooks, and interfaces, allowing for tailored solutions to meet specific project needs.</li>\n<li><strong>Multi-Language Support:</strong> Built-in internationalization features for managing multilingual content.</li>\n<li><strong>Version Control:</strong> Includes revision history and the ability to revert changes, ensuring data integrity.</li>\n<li><strong>Role-Based Access Control:</strong> Granular permissions system for secure data management.</li>\n</ul>\n<h2>Why Choose Directus?</h2>\n<ul>\n<li><strong>Flexibility:</strong> Works with existing databases and can be integrated into any tech stack.</li>\n<li><strong>Scalability:</strong> Designed to handle projects of any size, from small websites to large-scale enterprise applications.</li>\n<li><strong>Cost-Effective:</strong> Open-source core with self-hosting options, reducing licensing costs.</li>\n<li><strong>Developer-Friendly:</strong> Provides the tools developers need without imposing limitations on the frontend technology.</li>\n<li><strong>Future-Proof:</strong> Separating content from presentation ensures longevity and adaptability of your projects.</li>\n</ul>\n<h2>Use Cases for Directus:</h2>\n<ul>\n<li>Content Management for Websites and Apps</li>\n<li>Digital Asset Management</li>\n<li>E-commerce Product Catalogs</li>\n<li>Customer Relationship Management (CRM)</li>\n<li>Internet of Things (IoT) Data Management</li>\n<li>Custom Dashboards and Analytics Platforms</li>\n</ul>\n<h2>Conclusion:</h2>\n<p>Directus stands out as a versatile and powerful solution in the world of content management systems. Its headless architecture, combined with a user-friendly interface and robust API, makes it an excellent choice for businesses looking to streamline their content operations and build scalable, future-proof digital experiences. </p>\n<p>Whether you&#39;re a developer seeking flexibility, a content creator looking for an intuitive management interface, or a business owner aiming to optimize your digital presence, Directus offers a comprehensive solution that adapts to your needs and grows with your ambitions. Explore Directus today and unlock the full potential of your data and content management capabilities. </p>\n<h2>Resource:</h2>\n<ul>\n<li><a href="https://directus.io/">Directus Website</a></li>\n</ul>\n	what-is-directus	\N	Discover Directus, a powerful open-source headless CMS that transforms any SQL database into a dynamic API and intuitive app for content management.	Directus: The Ultimate Open-Source Headless CMS for Modern Data Management ok	2024-10-10 18:25:41.309	0	2024-10-09 05:35:07.805+00	\N	Directus, Headless CMS, Open-Source CMS, CMS
\.


--
-- Data for Name: posts_categories; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.posts_categories (id, posts_id, categories_id) FROM stdin;
1	fbd1a788-2390-4369-9d29-dcd591611fc3	ebc7ae47-4f3a-49d3-afaa-d7a0e3872572
\.


--
-- Data for Name: posts_tags; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.posts_tags (id, posts_id, tags_id, date_created) FROM stdin;
59	c0947bf2-15a8-4d9e-bea3-5f28cf772d42	f277f0b2-19af-4e1d-a3da-e7b23185c951	2024-10-09 07:15:11.274+00
60	c0947bf2-15a8-4d9e-bea3-5f28cf772d42	e814057c-caa2-4c18-ab21-be6f0d77c8a7	2024-10-09 07:15:19.375+00
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.profiles (id, status, user_created, date_created, user_updated, date_updated, facebook, github, instagram, mail, twitter, twitch, youtube, linkedin, whatsapp, snapchat, pinterest, tiktok, codepen, discord, "gitLab", reddit, skype, steam, telegram, mastodon, name, description, user_id) FROM stdin;
d0316854-cb46-4986-87b2-239fabe7dad1	published	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-01 08:30:54.631+00	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-09 01:21:28.215+00	\N	seadfeng	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Team	\N	ae30be52-1092-4f8f-9890-5035478b1bd9
\.


--
-- Data for Name: related; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.related (id, date_created, posts_id, related_posts_id) FROM stdin;
98fcafaf-7ac5-4017-a119-575e0419dbd2	2024-10-01 01:06:47.593+00	\N	\N
\.


--
-- Data for Name: routings; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.routings (id, user_created, date_created, date_updated, name, identity, meta_description, meta_title) FROM stdin;
5bc54df1-6e71-4cff-a7fc-6bc10998664d	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-01 01:14:26.886+00	\N	post	post	\N	\N
71d63c52-a40f-45a0-a721-8a247391b477	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-01 01:14:51.397+00	\N	tag show	tag_show	\N	\N
5996ce66-fd6f-4dab-8ed0-cd1fc9f840f0	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-01 01:15:00.863+00	\N	Tags	tags	\N	\N
ce592f4e-0588-41b5-a356-3d03b711c2ee	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-01 01:15:29.693+00	\N	category show	category_show	\N	\N
a4838e2e-5de6-4239-ace2-ab4ad595cfe8	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-01 01:16:04.493+00	\N	blog	blog	\N	\N
\.


--
-- Data for Name: static_pages; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.static_pages (id, status, user_created, date_created, user_updated, date_updated, title, meta_title, meta_description, slug, content) FROM stdin;
e643c94e-42bf-46c5-824c-f1b3589074bb	published	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-09 04:21:19.101+00	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-09 04:21:19.102+00	Privacy Policy	\N	\N	privacy-policy	<h2>1. Introduction</h2>\n<p>Welcome to [Your Blog Name] ("we," "us," or "our"). We respect your privacy and are committed to protecting your personal data. This privacy policy will inform you about how we look after your personal data when you visit our website and tell you about your privacy rights and how the law protects you.</p>\n<h2>2. Information We Collect</h2>\n<p>We may collect, use, store and transfer different kinds of personal data about you which we have grouped together as follows:</p>\n<p>- Identity Data: includes first name, last name, username or similar identifier.<br>- Contact Data: includes email address and telephone numbers.<br>- Technical Data: includes internet protocol (IP) address, your login data, browser type and version, time zone setting and location, browser plug-in types and versions, operating system and platform, and other technology on the devices you use to access this website.<br>- Usage Data: includes information about how you use our website and services.</p>\n<h2>3. How We Use Your Information</h2>\n<p>We will only use your personal data when the law allows us to. Most commonly, we will use your personal data in the following circumstances:</p>\n<p>- To provide and maintain our Service<br>- To notify you about changes to our Service<br>- To allow you to participate in interactive features of our Service when you choose to do so<br>- To provide customer support<br>- To gather analysis or valuable information so that we can improve our Service<br>- To monitor the usage of our Service<br>- To detect, prevent and address technical issues</p>\n<h2>4. Data Security</h2>\n<p>We have put in place appropriate security measures to prevent your personal data from being accidentally lost, used or accessed in an unauthorized way, altered or disclosed.</p>\n<h2>5. Data Retention</h2>\n<p>We will only retain your personal data for as long as reasonably necessary to fulfill the purposes we collected it for, including for the purposes of satisfying any legal, regulatory, tax, accounting or reporting requirements.</p>\n<h2>6. Your Legal Rights</h2>\n<p>Under certain circumstances, you have rights under data protection laws in relation to your personal data, including the right to access, correct, erase, restrict, transfer, or object to the processing of your personal data.</p>\n<h2>7. Third-Party Links</h2>\n<p>Our website may include links to third-party websites, plug-ins and applications. Clicking on those links or enabling those connections may allow third parties to collect or share data about you. We do not control these third-party websites and are not responsible for their privacy statements.</p>\n<p>8. Changes to This Privacy Policy</p>\n<p>We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last updated" date at the top of this Privacy Policy.</p>\n<p>9. Contact Us</p>\n<p>If you have any questions about this Privacy Policy, please contact us at [Your Contact Information].</p>
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.tags (id, user_created, date_created, name, posts_count, display_name) FROM stdin;
f277f0b2-19af-4e1d-a3da-e7b23185c951	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-09 07:15:11.265+00	cms	1	CMS
e814057c-caa2-4c18-ab21-be6f0d77c8a7	c95f7d22-c805-4afc-8c14-d3875b84881c	2024-10-09 05:27:33.66+00	directus	1	Directus
\.


--
-- Name: about_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.about_us_id_seq', 1, true);


--
-- Name: about_us_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.about_us_profiles_id_seq', 1, true);


--
-- Name: config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.config_id_seq', 1, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 2183, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 158, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 43, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 16, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 40, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 2067, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: posts_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.posts_categories_id_seq', 1, true);


--
-- Name: posts_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.posts_tags_id_seq', 60, true);


--
-- Name: about_us about_us_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.about_us
    ADD CONSTRAINT about_us_pkey PRIMARY KEY (id);


--
-- Name: about_us_profiles about_us_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.about_us_profiles
    ADD CONSTRAINT about_us_profiles_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_unique UNIQUE (slug);


--
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id);


--
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: posts_categories posts_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.posts_categories
    ADD CONSTRAINT posts_categories_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts posts_slug_unique; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_slug_unique UNIQUE (slug);


--
-- Name: posts_tags posts_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.posts_tags
    ADD CONSTRAINT posts_tags_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: related related_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.related
    ADD CONSTRAINT related_pkey PRIMARY KEY (id);


--
-- Name: routings routings_identity_unique; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.routings
    ADD CONSTRAINT routings_identity_unique UNIQUE (identity);


--
-- Name: routings routings_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.routings
    ADD CONSTRAINT routings_pkey PRIMARY KEY (id);


--
-- Name: static_pages static_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.static_pages
    ADD CONSTRAINT static_pages_pkey PRIMARY KEY (id);


--
-- Name: tags tags_name_unique; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_name_unique UNIQUE (name);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: categories_name_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX categories_name_index ON public.categories USING btree (name);


--
-- Name: categories_position_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX categories_position_index ON public.categories USING btree ("position");


--
-- Name: categories_slug_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX categories_slug_index ON public.categories USING btree (slug);


--
-- Name: posts_date_published_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX posts_date_published_index ON public.posts USING btree (date_published);


--
-- Name: posts_featured_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX posts_featured_index ON public.posts USING btree (featured);


--
-- Name: posts_slug_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX posts_slug_index ON public.posts USING btree (slug);


--
-- Name: posts_title_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX posts_title_index ON public.posts USING btree (title);


--
-- Name: posts_views_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX posts_views_index ON public.posts USING btree (views);


--
-- Name: profiles_name_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX profiles_name_index ON public.profiles USING btree (name);


--
-- Name: profiles_status_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX profiles_status_index ON public.profiles USING btree (status);


--
-- Name: profiles_user_created_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX profiles_user_created_index ON public.profiles USING btree (user_created);


--
-- Name: profiles_user_id_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX profiles_user_id_index ON public.profiles USING btree (user_id);


--
-- Name: profiles_user_updated_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX profiles_user_updated_index ON public.profiles USING btree (user_updated);


--
-- Name: routings_identity_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX routings_identity_index ON public.routings USING btree (identity);


--
-- Name: routings_name_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX routings_name_index ON public.routings USING btree (name);


--
-- Name: static_pages_slug_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX static_pages_slug_index ON public.static_pages USING btree (slug);


--
-- Name: static_pages_status_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX static_pages_status_index ON public.static_pages USING btree (status);


--
-- Name: tags_name_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX tags_name_index ON public.tags USING btree (name);


--
-- Name: tags_posts_count_index; Type: INDEX; Schema: public; Owner: docker
--

CREATE INDEX tags_posts_count_index ON public.tags USING btree (posts_count);


--
-- Name: about_us_profiles about_us_profiles_about_us_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.about_us_profiles
    ADD CONSTRAINT about_us_profiles_about_us_id_foreign FOREIGN KEY (about_us_id) REFERENCES public.about_us(id) ON DELETE SET NULL;


--
-- Name: about_us_profiles about_us_profiles_profiles_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.about_us_profiles
    ADD CONSTRAINT about_us_profiles_profiles_id_foreign FOREIGN KEY (profiles_id) REFERENCES public.profiles(id) ON DELETE SET NULL;


--
-- Name: about_us about_us_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.about_us
    ADD CONSTRAINT about_us_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: categories categories_cover_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_cover_foreign FOREIGN KEY (cover) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: categories categories_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: categories categories_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: config config_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_favicon_foreign FOREIGN KEY (favicon) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: config config_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_logo_foreign FOREIGN KEY (logo) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: config config_og_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_og_image_foreign FOREIGN KEY (og_image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: config config_profile_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_profile_foreign FOREIGN KEY (profile) REFERENCES public.profiles(id);


--
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--




SET session_replication_role = 'origin';
