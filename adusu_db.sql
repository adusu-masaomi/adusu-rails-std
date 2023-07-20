--
-- PostgreSQL database dump
--

-- Dumped from database version 11.20
-- Dumped by pg_dump version 11.20

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

SET default_with_oids = false;

--
-- Name: affiliations; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.affiliations (
    id integer NOT NULL,
    affiliation_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.affiliations OWNER TO adusu;

--
-- Name: affiliations_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.affiliations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.affiliations_id_seq OWNER TO adusu;

--
-- Name: affiliations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.affiliations_id_seq OWNED BY public.affiliations.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO adusu;

--
-- Name: business_holidays; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.business_holidays (
    id integer NOT NULL,
    working_date date,
    holiday_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.business_holidays OWNER TO adusu;

--
-- Name: business_holidays_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.business_holidays_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.business_holidays_id_seq OWNER TO adusu;

--
-- Name: business_holidays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.business_holidays_id_seq OWNED BY public.business_holidays.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    name character varying,
    representative_title character varying,
    representative_name character varying,
    post character varying,
    address character varying,
    house_number character varying,
    address2 character varying,
    tel character varying,
    fax character varying,
    email character varying,
    invoice_number character varying,
    estimate_material_cost_rate double precision,
    estimate_execution_labor_cost integer,
    estimate_labor_cost integer,
    responsible_order character varying,
    responsible_estimate character varying,
    responsible_invoice character varying,
    responsible_delivery character varying,
    bank_name_1 character varying,
    bank_branch_name_1 character varying,
    account_type_1 integer,
    account_number_1 character varying,
    holder_1 character varying,
    bank_name_2 character varying,
    bank_branch_name_2 character varying,
    account_type_2 integer,
    account_number_2 character varying,
    holder_2 character varying,
    bank_name_3 character varying,
    bank_branch_name_3 character varying,
    account_type_3 integer,
    account_number_3 character varying,
    holder_3 character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.companies OWNER TO adusu;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO adusu;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: constants; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.constants (
    id integer NOT NULL,
    purchase_order_last_header_code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.constants OWNER TO adusu;

--
-- Name: constants_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.constants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constants_id_seq OWNER TO adusu;

--
-- Name: constants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.constants_id_seq OWNED BY public.constants.id;


--
-- Name: construction_attachments; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.construction_attachments (
    id integer NOT NULL,
    construction_datum_id integer,
    title character varying,
    attachment character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.construction_attachments OWNER TO adusu;

--
-- Name: construction_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.construction_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.construction_attachments_id_seq OWNER TO adusu;

--
-- Name: construction_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.construction_attachments_id_seq OWNED BY public.construction_attachments.id;


--
-- Name: construction_costs; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.construction_costs (
    id integer NOT NULL,
    construction_datum_id integer,
    purchase_amount integer,
    supplies_expense integer,
    labor_cost integer,
    misellaneous_expense integer,
    execution_amount integer,
    constructing_amount integer,
    purchase_order_amount character varying,
    final_return_division integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.construction_costs OWNER TO adusu;

--
-- Name: construction_costs_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.construction_costs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.construction_costs_id_seq OWNER TO adusu;

--
-- Name: construction_costs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.construction_costs_id_seq OWNED BY public.construction_costs.id;


--
-- Name: construction_daily_reports; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.construction_daily_reports (
    id integer NOT NULL,
    working_date date,
    construction_datum_id integer,
    staff_id integer,
    start_time_1 time without time zone,
    end_time_1 time without time zone,
    start_time_2 time without time zone,
    end_time_2 time without time zone,
    working_times integer,
    man_month numeric,
    labor_cost integer,
    working_details character varying,
    is_one_day_work integer,
    is_no_break_time_1 integer,
    is_no_break_time_2 integer,
    is_no_break_time_3 integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.construction_daily_reports OWNER TO adusu;

--
-- Name: construction_daily_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.construction_daily_reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.construction_daily_reports_id_seq OWNER TO adusu;

--
-- Name: construction_daily_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.construction_daily_reports_id_seq OWNED BY public.construction_daily_reports.id;


--
-- Name: construction_data; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.construction_data (
    id integer NOT NULL,
    construction_code character varying,
    construction_name character varying,
    alias_name character varying,
    reception_date date,
    customer_id integer,
    personnel character varying,
    site_id integer,
    construction_start_date date,
    construction_end_date date,
    construction_period_start date,
    construction_period_end date,
    post character varying,
    address character varying,
    house_number character varying,
    address2 character varying,
    latitude numeric,
    longitude numeric,
    construction_detail character varying,
    attention_matter character varying,
    working_safety_matter_id integer,
    working_safety_matter_name character varying,
    estimated_amount integer,
    final_amount integer,
    billing_due_date date,
    deposit_due_date date,
    deposit_date date,
    quotation_header_id integer,
    delivery_slip_header_id integer,
    billed_flag integer,
    calculated_flag integer,
    order_flag integer,
    quotation_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.construction_data OWNER TO adusu;

--
-- Name: construction_data_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.construction_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.construction_data_id_seq OWNER TO adusu;

--
-- Name: construction_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.construction_data_id_seq OWNED BY public.construction_data.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    name character varying,
    search_character character varying,
    company_name character varying,
    affiliation character varying,
    department character varying,
    post character varying,
    address character varying,
    tel character varying,
    fax character varying,
    email character varying,
    url character varying,
    partner_division_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.contacts OWNER TO adusu;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO adusu;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: customer_masters; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.customer_masters (
    id integer NOT NULL,
    customer_name character varying,
    search_character character varying,
    post character varying,
    address character varying,
    house_number character varying,
    address2 character varying,
    tel_main character varying,
    fax_main character varying,
    email_main character varying,
    closing_date integer,
    closing_date_division integer,
    due_date integer,
    due_date_division integer,
    honorific_id integer,
    responsible1 character varying,
    responsible2 character varying,
    contact_id integer,
    payment_bank_id integer,
    card_not_flag integer,
    contractor_flag integer,
    public_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.customer_masters OWNER TO adusu;

--
-- Name: customer_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.customer_masters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_masters_id_seq OWNER TO adusu;

--
-- Name: customer_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.customer_masters_id_seq OWNED BY public.customer_masters.id;


--
-- Name: delivery_slip_detail_large_classifications; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.delivery_slip_detail_large_classifications (
    id integer NOT NULL,
    delivery_slip_header_id integer,
    delivery_slip_items_division_id integer,
    working_large_item_id integer,
    working_specific_middle_item_id integer,
    working_large_item_name character varying,
    working_large_item_short_name character varying,
    working_middle_item_category_id integer,
    working_middle_item_category_id_call integer,
    working_middle_item_subcategory_id integer,
    working_middle_item_subcategory_id_call integer,
    working_large_specification character varying,
    line_number integer,
    quantity numeric(11,2),
    execution_quantity numeric(11,2),
    working_unit_id integer,
    working_unit_name character varying,
    working_unit_price integer,
    delivery_slip_price integer,
    execution_unit_price integer,
    execution_price integer,
    labor_productivity_unit numeric(11,3),
    labor_productivity_unit_total numeric(11,3),
    last_line_number integer,
    remarks character varying,
    construction_type integer,
    piping_wiring_flag integer,
    equipment_mounting_flag integer,
    labor_cost_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.delivery_slip_detail_large_classifications OWNER TO adusu;

--
-- Name: delivery_slip_detail_large_classifications_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.delivery_slip_detail_large_classifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_slip_detail_large_classifications_id_seq OWNER TO adusu;

--
-- Name: delivery_slip_detail_large_classifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.delivery_slip_detail_large_classifications_id_seq OWNED BY public.delivery_slip_detail_large_classifications.id;


--
-- Name: delivery_slip_detail_middle_classifications; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.delivery_slip_detail_middle_classifications (
    id integer NOT NULL,
    delivery_slip_header_id integer,
    delivery_slip_detail_large_classification_id integer,
    delivery_slip_item_division_id integer,
    working_middle_item_id integer,
    working_specific_middle_item_id integer,
    working_middle_item_name character varying,
    working_middle_item_short_name character varying,
    working_middle_item_category_id integer,
    working_middle_item_category_id_call integer,
    working_middle_item_subcategory_id integer,
    working_middle_item_subcategory_id_call integer,
    line_number integer,
    working_middle_specification character varying,
    quantity numeric(11,2),
    execution_quantity numeric(11,2),
    working_unit_id integer,
    working_unit_name character varying,
    working_unit_price integer,
    delivery_slip_price integer,
    execution_unit_price integer,
    execution_price integer,
    material_id integer,
    working_material_name character varying,
    material_unit_price integer,
    labor_unit_price numeric(11,2),
    labor_productivity_unit numeric(11,3),
    labor_productivity_unit_total numeric(11,3),
    material_quantity integer,
    accessory_cost integer,
    material_cost_total integer,
    labor_cost_total integer,
    other_cost integer,
    remarks character varying,
    construction_type integer,
    piping_wiring_flag integer,
    equipment_mounting_flag integer,
    labor_cost_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.delivery_slip_detail_middle_classifications OWNER TO adusu;

--
-- Name: delivery_slip_detail_middle_classifications_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.delivery_slip_detail_middle_classifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_slip_detail_middle_classifications_id_seq OWNER TO adusu;

--
-- Name: delivery_slip_detail_middle_classifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.delivery_slip_detail_middle_classifications_id_seq OWNED BY public.delivery_slip_detail_middle_classifications.id;


--
-- Name: delivery_slip_headers; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.delivery_slip_headers (
    id integer NOT NULL,
    delivery_slip_code character varying,
    quotation_code character varying,
    invoice_code character varying,
    delivery_slip_header_origin_id integer,
    delivery_slip_date date,
    construction_datum_id integer,
    construction_name character varying,
    customer_id integer,
    customer_name character varying,
    honorific_id integer,
    responsible1 character varying,
    responsible2 character varying,
    post character varying,
    address character varying,
    house_number character varying,
    address2 character varying,
    tel character varying,
    fax character varying,
    construction_period character varying,
    construction_period_date1 date,
    construction_period_date2 date,
    construction_post character varying,
    construction_place character varying,
    construction_house_number character varying,
    construction_place2 character varying,
    delivery_amount integer,
    execution_amount integer,
    last_line_number integer,
    category_saved_flag integer,
    category_saved_id integer,
    subcategory_saved_id integer,
    fixed_flag integer,
    final_return_division integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.delivery_slip_headers OWNER TO adusu;

--
-- Name: delivery_slip_headers_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.delivery_slip_headers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.delivery_slip_headers_id_seq OWNER TO adusu;

--
-- Name: delivery_slip_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.delivery_slip_headers_id_seq OWNED BY public.delivery_slip_headers.id;


--
-- Name: inventories; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.inventories (
    id integer NOT NULL,
    warehouse_id integer,
    location_id integer,
    material_master_id integer,
    inventory_quantity numeric(11,2),
    unit_master_id integer,
    inventory_amount integer,
    supplier_master_id integer,
    current_history_id integer,
    current_warehousing_date date,
    current_quantity numeric(11,2),
    current_unit_price numeric(11,2),
    last_warehousing_date date,
    last_unit_price numeric(11,2),
    next_history_id_1 integer,
    next_warehousing_date_1 date,
    next_quantity_1 numeric(11,2),
    next_unit_price_1 numeric(11,2),
    next_history_id_2 integer,
    next_warehousing_date_2 date,
    next_quantity_2 numeric(11,2),
    next_unit_price_2 numeric(11,2),
    no_stocktake_flag integer,
    image character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.inventories OWNER TO adusu;

--
-- Name: inventories_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.inventories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventories_id_seq OWNER TO adusu;

--
-- Name: inventories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.inventories_id_seq OWNED BY public.inventories.id;


--
-- Name: inventory_categories; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.inventory_categories (
    id integer NOT NULL,
    name character varying,
    seq integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.inventory_categories OWNER TO adusu;

--
-- Name: inventory_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.inventory_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_categories_id_seq OWNER TO adusu;

--
-- Name: inventory_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.inventory_categories_id_seq OWNED BY public.inventory_categories.id;


--
-- Name: inventory_histories; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.inventory_histories (
    id integer NOT NULL,
    inventory_date date,
    inventory_division_id integer,
    construction_datum_id integer,
    material_master_id integer,
    quantity numeric(11,2),
    inventory_quantity integer,
    unit_master_id integer,
    unit_price numeric(11,2),
    price integer,
    supplier_master_id integer,
    slip_code character varying,
    purchase_datum_id integer,
    previous_quantity integer,
    previous_unit_price numeric(11,2),
    current_quantity numeric(11,2),
    current_unit_price numeric(11,2),
    current_history_id integer,
    current_warehousing_date date,
    next_quantity_1 numeric(11,2),
    next_unit_price_1 numeric(11,2),
    next_history_id_1 integer,
    next_warehousing_date_1 date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.inventory_histories OWNER TO adusu;

--
-- Name: inventory_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.inventory_histories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inventory_histories_id_seq OWNER TO adusu;

--
-- Name: inventory_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.inventory_histories_id_seq OWNED BY public.inventory_histories.id;


--
-- Name: invoice_detail_large_classifications; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.invoice_detail_large_classifications (
    id integer NOT NULL,
    invoice_header_id integer,
    invoice_items_division_id integer,
    working_large_item_id integer,
    working_large_item_name character varying,
    working_large_item_short_name character varying,
    working_large_specification character varying,
    line_number integer,
    quantity numeric(11,2),
    execution_quantity numeric(11,2),
    working_unit_id integer,
    working_unit_name character varying,
    working_unit_price integer,
    invoice_price integer,
    execution_unit_price integer,
    execution_price integer,
    labor_productivity_unit numeric(11,3),
    labor_productivity_unit_total numeric(11,3),
    last_line_number integer,
    remarks character varying,
    delivery_slip_header_id integer,
    construction_type integer,
    piping_wiring_flag integer,
    equipment_mounting_flag integer,
    labor_cost_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.invoice_detail_large_classifications OWNER TO adusu;

--
-- Name: invoice_detail_large_classifications_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.invoice_detail_large_classifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_detail_large_classifications_id_seq OWNER TO adusu;

--
-- Name: invoice_detail_large_classifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.invoice_detail_large_classifications_id_seq OWNED BY public.invoice_detail_large_classifications.id;


--
-- Name: invoice_detail_middle_classifications; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.invoice_detail_middle_classifications (
    id integer NOT NULL,
    invoice_header_id integer,
    invoice_detail_large_classification_id integer,
    invoice_item_division_id integer,
    working_middle_item_id integer,
    working_middle_item_name character varying,
    working_middle_item_short_name character varying,
    line_number integer,
    working_middle_specification character varying,
    quantity numeric(11,2),
    execution_quantity numeric(11,2),
    working_unit_id integer,
    working_unit_name character varying,
    working_unit_price integer,
    invoice_price integer,
    execution_unit_price integer,
    execution_price integer,
    material_id integer,
    working_material_name character varying,
    material_unit_price integer,
    labor_unit_price double precision,
    labor_productivity_unit numeric(11,3),
    labor_productivity_unit_total numeric(11,3),
    material_quantity integer,
    accessory_cost integer,
    material_cost_total integer,
    labor_cost_total integer,
    other_cost integer,
    remarks character varying,
    construction_type integer,
    piping_wiring_flag integer,
    equipment_mounting_flag integer,
    labor_cost_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.invoice_detail_middle_classifications OWNER TO adusu;

--
-- Name: invoice_detail_middle_classifications_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.invoice_detail_middle_classifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_detail_middle_classifications_id_seq OWNER TO adusu;

--
-- Name: invoice_detail_middle_classifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.invoice_detail_middle_classifications_id_seq OWNED BY public.invoice_detail_middle_classifications.id;


--
-- Name: invoice_headers; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.invoice_headers (
    id integer NOT NULL,
    invoice_code character varying,
    quotation_code character varying,
    delivery_slip_code character varying,
    invoice_date date,
    construction_datum_id integer,
    construction_name character varying,
    customer_id integer,
    customer_name character varying,
    honorific_id integer,
    responsible1 character varying,
    responsible2 character varying,
    post character varying,
    address character varying,
    house_number character varying,
    address2 character varying,
    tel character varying,
    fax character varying,
    construction_period character varying,
    construction_place character varying,
    construction_house_number character varying,
    construction_place2 character varying,
    payment_period character varying,
    invoice_period_start_date date,
    invoice_period_end_date date,
    billing_amount integer,
    execution_amount integer,
    deposit_amount integer,
    payment_method_id integer,
    commission integer,
    payment_date date,
    labor_insurance_not_flag integer,
    last_line_number integer,
    remarks character varying,
    final_return_division integer,
    deposit_complete_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.invoice_headers OWNER TO adusu;

--
-- Name: invoice_headers_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.invoice_headers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.invoice_headers_id_seq OWNER TO adusu;

--
-- Name: invoice_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.invoice_headers_id_seq OWNED BY public.invoice_headers.id;


--
-- Name: maker_masters; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.maker_masters (
    id integer NOT NULL,
    maker_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.maker_masters OWNER TO adusu;

--
-- Name: maker_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.maker_masters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.maker_masters_id_seq OWNER TO adusu;

--
-- Name: maker_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.maker_masters_id_seq OWNED BY public.maker_masters.id;


--
-- Name: material_categories; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.material_categories (
    id integer NOT NULL,
    name character varying,
    seq integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.material_categories OWNER TO adusu;

--
-- Name: material_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.material_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.material_categories_id_seq OWNER TO adusu;

--
-- Name: material_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.material_categories_id_seq OWNED BY public.material_categories.id;


--
-- Name: material_masters; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.material_masters (
    id integer NOT NULL,
    material_code character varying,
    internal_code character varying,
    material_name character varying,
    maker_id integer,
    unit_id integer,
    list_price integer,
    list_price_quotation integer,
    standard_quantity integer,
    standard_labor_productivity_unit numeric(11,3),
    standard_rate numeric(11,4),
    last_unit_price numeric(11,2),
    last_unit_price_update_at date,
    inventory_category_id integer,
    material_category_id integer,
    list_price_update_at date,
    notes character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.material_masters OWNER TO adusu;

--
-- Name: material_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.material_masters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.material_masters_id_seq OWNER TO adusu;

--
-- Name: material_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.material_masters_id_seq OWNED BY public.material_masters.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    purchase_order_history_id integer,
    material_id integer,
    material_code character varying,
    material_name character varying,
    maker_id integer,
    maker_name character varying,
    quantity integer,
    unit_master_id integer,
    list_price integer,
    order_unit_price numeric(11,2),
    order_price integer,
    material_category_id integer,
    mail_sent_flag integer,
    delivery_complete_flag integer,
    sequential_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO adusu;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO adusu;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: outsourcing_costs; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.outsourcing_costs (
    id integer NOT NULL,
    invoice_code character varying,
    purchase_order_datum_id integer,
    construction_datum_id integer,
    staff_id integer,
    supplier_master_id integer,
    working_start_date date,
    working_end_date date,
    purchase_amount integer,
    supplies_expense integer,
    labor_cost integer,
    misellaneous_expense integer,
    execution_amount integer,
    billing_amount integer,
    purchase_order_amount character varying,
    closing_date date,
    source_bank_id integer,
    payment_amount integer,
    unpaid_amount integer,
    payment_due_date date,
    payment_date date,
    unpaid_payment_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.outsourcing_costs OWNER TO adusu;

--
-- Name: outsourcing_costs_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.outsourcing_costs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.outsourcing_costs_id_seq OWNER TO adusu;

--
-- Name: outsourcing_costs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.outsourcing_costs_id_seq OWNED BY public.outsourcing_costs.id;


--
-- Name: purchase_data; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.purchase_data (
    id integer NOT NULL,
    purchase_date date,
    slip_code character varying,
    purchase_order_datum_id integer,
    construction_datum_id integer,
    material_id integer,
    material_code character varying,
    material_name character varying,
    maker_id integer,
    maker_name character varying,
    quantity numeric(11,2),
    quantity2 numeric(11,2),
    unit_id integer,
    purchase_unit_price numeric(11,2),
    purchase_unit_price2 numeric(11,2),
    purchase_amount integer,
    list_price integer,
    purchase_id integer,
    division_id integer,
    supplier_id integer,
    inventory_division_id integer,
    unit_price_not_update_flag integer,
    outsourcing_invoice_flag integer,
    outsourcing_payment_flag integer,
    purchase_header_id integer,
    working_end_date date,
    closing_date date,
    payment_due_date date,
    payment_date date,
    unpaid_payment_date date,
    notes character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.purchase_data OWNER TO adusu;

--
-- Name: purchase_data_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.purchase_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_data_id_seq OWNER TO adusu;

--
-- Name: purchase_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.purchase_data_id_seq OWNED BY public.purchase_data.id;


--
-- Name: purchase_divisions; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.purchase_divisions (
    id integer NOT NULL,
    purchase_division_name character varying,
    purchase_division_long_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.purchase_divisions OWNER TO adusu;

--
-- Name: purchase_divisions_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.purchase_divisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_divisions_id_seq OWNER TO adusu;

--
-- Name: purchase_divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.purchase_divisions_id_seq OWNED BY public.purchase_divisions.id;


--
-- Name: purchase_headers; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.purchase_headers (
    id integer NOT NULL,
    slip_code character varying,
    complete_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.purchase_headers OWNER TO adusu;

--
-- Name: purchase_headers_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.purchase_headers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_headers_id_seq OWNER TO adusu;

--
-- Name: purchase_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.purchase_headers_id_seq OWNED BY public.purchase_headers.id;


--
-- Name: purchase_order_data; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.purchase_order_data (
    id integer NOT NULL,
    purchase_order_code character varying,
    construction_datum_id integer,
    supplier_master_id integer,
    supplier_responsible_id integer,
    alias_name character varying,
    purchase_order_date date,
    mail_sent_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.purchase_order_data OWNER TO adusu;

--
-- Name: purchase_order_data_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.purchase_order_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_order_data_id_seq OWNER TO adusu;

--
-- Name: purchase_order_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.purchase_order_data_id_seq OWNED BY public.purchase_order_data.id;


--
-- Name: purchase_order_histories; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.purchase_order_histories (
    id integer NOT NULL,
    purchase_order_date date,
    supplier_master_id integer,
    purchase_order_datum_id integer,
    mail_sent_flag integer,
    delivery_place_flag integer,
    notes character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.purchase_order_histories OWNER TO adusu;

--
-- Name: purchase_order_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.purchase_order_histories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_order_histories_id_seq OWNER TO adusu;

--
-- Name: purchase_order_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.purchase_order_histories_id_seq OWNED BY public.purchase_order_histories.id;


--
-- Name: purchase_unit_prices; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.purchase_unit_prices (
    id integer NOT NULL,
    supplier_id integer,
    material_id integer,
    supplier_material_code character varying,
    unit_price numeric(11,2),
    list_price integer,
    unit_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.purchase_unit_prices OWNER TO adusu;

--
-- Name: purchase_unit_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.purchase_unit_prices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_unit_prices_id_seq OWNER TO adusu;

--
-- Name: purchase_unit_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.purchase_unit_prices_id_seq OWNED BY public.purchase_unit_prices.id;


--
-- Name: quatation_material_headers; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.quatation_material_headers (
    id integer NOT NULL,
    quotation_code character varying,
    requested_date date,
    construction_datum_id integer,
    supplier_master_id integer,
    responsible character varying,
    email character varying,
    delivery_place_flag integer,
    notes_1 character varying,
    notes_2 character varying,
    notes_3 character varying,
    quotation_header_origin_id integer,
    total_quotation_price_1 integer,
    total_quotation_price_2 integer,
    total_quotation_price_3 integer,
    total_order_price_1 integer,
    total_order_price_2 integer,
    total_order_price_3 integer,
    supplier_id_1 integer,
    supplier_id_2 integer,
    supplier_id_3 integer,
    supplier_responsible_id_1 integer,
    supplier_responsible_id_2 integer,
    supplier_responsible_id_3 integer,
    quotation_email_flag_1 integer,
    quotation_email_flag_2 integer,
    quotation_email_flag_3 integer,
    order_email_flag_1 integer,
    order_email_flag_2 integer,
    order_email_flag_3 integer,
    all_bid_flag_1 integer,
    all_bid_flag_2 integer,
    all_bid_flag_3 integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.quatation_material_headers OWNER TO adusu;

--
-- Name: quatation_material_headers_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.quatation_material_headers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quatation_material_headers_id_seq OWNER TO adusu;

--
-- Name: quatation_material_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.quatation_material_headers_id_seq OWNED BY public.quatation_material_headers.id;


--
-- Name: quotation_detail_large_classifications; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.quotation_detail_large_classifications (
    id integer NOT NULL,
    quotation_header_id integer,
    quotation_items_division_id integer,
    working_large_item_id integer,
    working_specific_middle_item_id integer,
    working_large_item_name character varying,
    working_large_item_short_name character varying,
    working_middle_item_category_id integer,
    working_middle_item_category_id_call integer,
    working_middle_item_subcategory_id integer,
    working_middle_item_subcategory_id_call integer,
    working_large_specification character varying,
    line_number integer,
    quantity numeric(11,2),
    execution_quantity numeric(11,2),
    working_unit_id integer,
    working_unit_name character varying,
    working_unit_price integer,
    quote_price integer,
    execution_unit_price integer,
    execution_price integer,
    labor_productivity_unit numeric(11,3),
    labor_productivity_unit_total numeric(11,3),
    last_line_number integer,
    remarks character varying,
    construction_type integer,
    piping_wiring_flag integer,
    equipment_mounting_flag integer,
    labor_cost_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.quotation_detail_large_classifications OWNER TO adusu;

--
-- Name: quotation_detail_large_classifications_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.quotation_detail_large_classifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotation_detail_large_classifications_id_seq OWNER TO adusu;

--
-- Name: quotation_detail_large_classifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.quotation_detail_large_classifications_id_seq OWNED BY public.quotation_detail_large_classifications.id;


--
-- Name: quotation_detail_middle_classifications; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.quotation_detail_middle_classifications (
    id integer NOT NULL,
    quotation_header_id integer,
    quotation_detail_large_classification_id integer,
    quotation_items_division_id integer,
    working_middle_item_id integer,
    working_specific_middle_item_id integer,
    working_middle_item_name character varying,
    working_middle_item_short_name character varying,
    working_middle_item_category_id integer,
    working_middle_item_category_id_call integer,
    working_middle_item_subcategory_id integer,
    working_middle_item_subcategory_id_call integer,
    line_number integer,
    working_middle_specification character varying,
    quantity integer,
    execution_quantity integer,
    working_unit_id integer,
    working_unit_name character varying,
    working_unit_price integer,
    quote_price integer,
    execution_unit_price integer,
    execution_price integer,
    material_id integer,
    quotation_material_name character varying,
    material_unit_price integer,
    labor_unit_price double precision,
    labor_productivity_unit double precision,
    labor_productivity_unit_total double precision,
    material_quantity integer,
    accessory_cost integer,
    material_cost_total integer,
    labor_cost_total integer,
    other_cost integer,
    remarks character varying,
    construction_type integer,
    piping_wiring_flag integer,
    equipment_mounting_flag integer,
    labor_cost_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.quotation_detail_middle_classifications OWNER TO adusu;

--
-- Name: quotation_detail_middle_classifications_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.quotation_detail_middle_classifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotation_detail_middle_classifications_id_seq OWNER TO adusu;

--
-- Name: quotation_detail_middle_classifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.quotation_detail_middle_classifications_id_seq OWNED BY public.quotation_detail_middle_classifications.id;


--
-- Name: quotation_headers; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.quotation_headers (
    id integer NOT NULL,
    quotation_code character varying,
    invoice_code character varying,
    delivery_slip_code character varying,
    quotation_header_origin_id integer,
    quotation_date date,
    construction_datum_id integer,
    construction_name character varying,
    customer_id integer,
    customer_name character varying,
    honorific_id integer,
    responsible1 character varying,
    responsible2 character varying,
    post character varying,
    address character varying,
    house_number character varying,
    address2 character varying,
    tel character varying,
    fax character varying,
    construction_period character varying,
    construction_period_date1 date,
    construction_period_date2 date,
    construction_post character varying,
    construction_place character varying,
    construction_house_number character varying,
    construction_place2 character varying,
    trading_method character varying,
    effective_period character varying,
    quote_price integer,
    execution_amount integer,
    net_amount integer,
    last_line_number integer,
    category_saved_flag integer,
    category_saved_id integer,
    subcategory_saved_id integer,
    invoice_period_start_date date,
    invoice_period_end_date date,
    fixed_flag integer,
    not_sum_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.quotation_headers OWNER TO adusu;

--
-- Name: quotation_headers_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.quotation_headers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotation_headers_id_seq OWNER TO adusu;

--
-- Name: quotation_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.quotation_headers_id_seq OWNED BY public.quotation_headers.id;


--
-- Name: quotation_material_details; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.quotation_material_details (
    id integer NOT NULL,
    quotation_material_header_id integer,
    material_id integer,
    material_code character varying,
    material_name character varying,
    maker_id integer,
    maker_name character varying,
    quantity integer,
    unit_master_id integer,
    list_price integer,
    quotation_unit_price_1 integer,
    quotation_unit_price_2 integer,
    quotation_unit_price_3 integer,
    quotation_price_1 integer,
    quotation_price_2 integer,
    quotation_price_3 integer,
    bid_flag_1 integer,
    bid_flag_2 integer,
    bid_flag_3 integer,
    mail_sent_flag integer,
    quotation_email_flag_1 integer,
    quotation_email_flag_2 integer,
    quotation_email_flag_3 integer,
    order_email_flag_1 integer,
    order_email_flag_2 integer,
    order_email_flag_3 integer,
    sequential_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.quotation_material_details OWNER TO adusu;

--
-- Name: quotation_material_details_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.quotation_material_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotation_material_details_id_seq OWNER TO adusu;

--
-- Name: quotation_material_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.quotation_material_details_id_seq OWNED BY public.quotation_material_details.id;


--
-- Name: quotation_material_headers; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.quotation_material_headers (
    id integer NOT NULL,
    quotation_code character varying,
    requested_date date,
    construction_datum_id integer,
    supplier_master_id integer,
    responsible character varying,
    email character varying,
    delivery_place_flag integer,
    notes_1 character varying,
    notes_2 character varying,
    notes_3 character varying,
    quotation_header_origin_id integer,
    total_quotation_price_1 integer,
    total_quotation_price_2 integer,
    total_quotation_price_3 integer,
    total_order_price_1 integer,
    total_order_price_2 integer,
    total_order_price_3 integer,
    supplier_id_1 integer,
    supplier_id_2 integer,
    supplier_id_3 integer,
    supplier_responsible_id_1 integer,
    supplier_responsible_id_2 integer,
    supplier_responsible_id_3 integer,
    quotation_email_flag_1 integer,
    quotation_email_flag_2 integer,
    quotation_email_flag_3 integer,
    order_email_flag_1 integer,
    order_email_flag_2 integer,
    order_email_flag_3 integer,
    all_bid_flag_1 integer,
    all_bid_flag_2 integer,
    all_bid_flag_3 integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.quotation_material_headers OWNER TO adusu;

--
-- Name: quotation_material_headers_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.quotation_material_headers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quotation_material_headers_id_seq OWNER TO adusu;

--
-- Name: quotation_material_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.quotation_material_headers_id_seq OWNED BY public.quotation_material_headers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO adusu;

--
-- Name: sites; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.sites (
    id integer NOT NULL,
    name character varying,
    post character varying,
    address character varying,
    house_number character varying,
    address2 character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sites OWNER TO adusu;

--
-- Name: sites_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sites_id_seq OWNER TO adusu;

--
-- Name: sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.sites_id_seq OWNED BY public.sites.id;


--
-- Name: staffs; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.staffs (
    id integer NOT NULL,
    staff_name character varying,
    furigana character varying,
    affiliation_id integer,
    hourly_wage integer,
    daily_pay integer,
    supplier_master_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.staffs OWNER TO adusu;

--
-- Name: staffs_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.staffs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staffs_id_seq OWNER TO adusu;

--
-- Name: staffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.staffs_id_seq OWNED BY public.staffs.id;


--
-- Name: stocktakes; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.stocktakes (
    id integer NOT NULL,
    stocktake_date date,
    material_master_id integer,
    inventory_id integer,
    physical_quantity numeric(11,2),
    unit_price numeric(11,2),
    physical_amount integer,
    book_quantity numeric(11,2),
    book_amount integer,
    inventory_update_flag integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.stocktakes OWNER TO adusu;

--
-- Name: stocktakes_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.stocktakes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocktakes_id_seq OWNER TO adusu;

--
-- Name: stocktakes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.stocktakes_id_seq OWNED BY public.stocktakes.id;


--
-- Name: supplier_masters; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.supplier_masters (
    id integer NOT NULL,
    supplier_name character varying,
    tel_main character varying,
    fax_main character varying,
    email_main character varying,
    responsible1 character varying,
    email1 character varying,
    responsible2 character varying,
    email2 character varying,
    responsible3 character varying,
    email3 character varying,
    responsible_cc character varying,
    email_cc character varying,
    search_character character varying,
    outsourcing_flag integer,
    post character varying,
    address character varying,
    bank_name character varying,
    bank_branch_name character varying,
    account_type integer,
    account_number character varying,
    holder character varying,
    responsible_title character varying,
    responsible_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.supplier_masters OWNER TO adusu;

--
-- Name: supplier_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.supplier_masters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_masters_id_seq OWNER TO adusu;

--
-- Name: supplier_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.supplier_masters_id_seq OWNED BY public.supplier_masters.id;


--
-- Name: supplier_responsibles; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.supplier_responsibles (
    id integer NOT NULL,
    supplier_master_id integer,
    responsible_name character varying,
    responsible_email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.supplier_responsibles OWNER TO adusu;

--
-- Name: supplier_responsibles_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.supplier_responsibles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supplier_responsibles_id_seq OWNER TO adusu;

--
-- Name: supplier_responsibles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.supplier_responsibles_id_seq OWNED BY public.supplier_responsibles.id;


--
-- Name: unit_masters; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.unit_masters (
    id integer NOT NULL,
    unit_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.unit_masters OWNER TO adusu;

--
-- Name: unit_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.unit_masters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unit_masters_id_seq OWNER TO adusu;

--
-- Name: unit_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.unit_masters_id_seq OWNED BY public.unit_masters.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO adusu;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO adusu;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: working_categories; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.working_categories (
    id integer NOT NULL,
    category_name character varying,
    seq integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.working_categories OWNER TO adusu;

--
-- Name: working_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.working_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.working_categories_id_seq OWNER TO adusu;

--
-- Name: working_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.working_categories_id_seq OWNED BY public.working_categories.id;


--
-- Name: working_middle_items; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.working_middle_items (
    id bigint NOT NULL,
    working_middle_item_name character varying,
    working_middle_item_short_name character varying,
    working_middle_item_category_id integer,
    working_subcategory_id integer,
    working_middle_specification character varying,
    working_unit_id integer,
    working_unit_name character varying,
    working_unit_price double precision,
    execution_unit_price integer,
    material_id integer,
    working_material_name character varying,
    execution_material_unit_price double precision,
    material_unit_price double precision,
    execution_labor_unit_price double precision,
    labor_unit_price double precision,
    labor_unit_price_standard integer,
    labor_productivity_unit double precision,
    labor_productivity_unit_total double precision,
    material_quantity integer,
    accessory_cost integer,
    material_cost_total integer,
    labor_cost_total integer,
    other_cost integer,
    seq integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.working_middle_items OWNER TO adusu;

--
-- Name: working_middle_items_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.working_middle_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.working_middle_items_id_seq OWNER TO adusu;

--
-- Name: working_middle_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.working_middle_items_id_seq OWNED BY public.working_middle_items.id;


--
-- Name: working_safety_matters; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.working_safety_matters (
    id integer NOT NULL,
    working_safety_matter_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.working_safety_matters OWNER TO adusu;

--
-- Name: working_safety_matters_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.working_safety_matters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.working_safety_matters_id_seq OWNER TO adusu;

--
-- Name: working_safety_matters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.working_safety_matters_id_seq OWNED BY public.working_safety_matters.id;


--
-- Name: working_small_items; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.working_small_items (
    id integer NOT NULL,
    working_middle_item_id integer,
    working_small_item_id integer,
    working_small_item_code character varying,
    working_small_item_name character varying,
    rate double precision,
    unit_price double precision,
    quantity integer,
    material_price double precision,
    maker_master_id integer,
    unit_master_id integer,
    labor_productivity_unit double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.working_small_items OWNER TO adusu;

--
-- Name: working_small_items_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.working_small_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.working_small_items_id_seq OWNER TO adusu;

--
-- Name: working_small_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.working_small_items_id_seq OWNED BY public.working_small_items.id;


--
-- Name: working_specific_middle_items; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.working_specific_middle_items (
    id bigint NOT NULL,
    quotation_header_id integer,
    delivery_slip_header_id integer,
    working_middle_item_name character varying,
    working_middle_item_short_name character varying,
    working_middle_item_category_id integer,
    working_subcategory_id integer,
    working_middle_specification character varying,
    working_unit_id integer,
    working_unit_name character varying,
    working_unit_price double precision,
    execution_unit_price integer,
    material_id integer,
    working_material_name character varying,
    execution_material_unit_price double precision,
    material_unit_price double precision,
    execution_labor_unit_price double precision,
    labor_unit_price double precision,
    labor_unit_price_standard integer,
    labor_productivity_unit double precision,
    labor_productivity_unit_total double precision,
    material_cost_total integer,
    seq integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.working_specific_middle_items OWNER TO adusu;

--
-- Name: working_specific_middle_items_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.working_specific_middle_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.working_specific_middle_items_id_seq OWNER TO adusu;

--
-- Name: working_specific_middle_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.working_specific_middle_items_id_seq OWNED BY public.working_specific_middle_items.id;


--
-- Name: working_specific_small_items; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.working_specific_small_items (
    id integer NOT NULL,
    working_specific_middle_item_id integer,
    working_small_item_id integer,
    working_small_item_code character varying,
    working_small_item_name character varying,
    unit_price double precision,
    rate double precision,
    quantity integer,
    material_price double precision,
    maker_master_id integer,
    unit_master_id integer,
    labor_productivity_unit double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.working_specific_small_items OWNER TO adusu;

--
-- Name: working_specific_small_items_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.working_specific_small_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.working_specific_small_items_id_seq OWNER TO adusu;

--
-- Name: working_specific_small_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.working_specific_small_items_id_seq OWNED BY public.working_specific_small_items.id;


--
-- Name: working_subcategories; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.working_subcategories (
    id integer NOT NULL,
    working_category_id integer,
    name character varying,
    seq integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.working_subcategories OWNER TO adusu;

--
-- Name: working_subcategories_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.working_subcategories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.working_subcategories_id_seq OWNER TO adusu;

--
-- Name: working_subcategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.working_subcategories_id_seq OWNED BY public.working_subcategories.id;


--
-- Name: working_times; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.working_times (
    id integer NOT NULL,
    employment_status_id integer,
    working_time_start_time time without time zone,
    working_time_end_time time without time zone,
    overtime_start_time time without time zone,
    overtime_end_time time without time zone,
    overtime_early_start_time time without time zone,
    overtime_early_end_time time without time zone,
    overtime_midnight_start_time time without time zone,
    overtime_midnight_end_time time without time zone,
    break_time_1_start_time time without time zone,
    break_time_1_end_time time without time zone,
    break_time_2_start_time time without time zone,
    break_time_2_end_time time without time zone,
    break_time_3_start_time time without time zone,
    break_time_3_end_time time without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.working_times OWNER TO adusu;

--
-- Name: working_times_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.working_times_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.working_times_id_seq OWNER TO adusu;

--
-- Name: working_times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.working_times_id_seq OWNED BY public.working_times.id;


--
-- Name: working_units; Type: TABLE; Schema: public; Owner: adusu
--

CREATE TABLE public.working_units (
    id integer NOT NULL,
    working_unit_name character varying,
    seq integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.working_units OWNER TO adusu;

--
-- Name: working_units_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.working_units_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.working_units_id_seq OWNER TO adusu;

--
-- Name: working_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adusu
--

ALTER SEQUENCE public.working_units_id_seq OWNED BY public.working_units.id;


--
-- Name: affiliations id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.affiliations ALTER COLUMN id SET DEFAULT nextval('public.affiliations_id_seq'::regclass);


--
-- Name: business_holidays id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.business_holidays ALTER COLUMN id SET DEFAULT nextval('public.business_holidays_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: constants id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.constants ALTER COLUMN id SET DEFAULT nextval('public.constants_id_seq'::regclass);


--
-- Name: construction_attachments id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.construction_attachments ALTER COLUMN id SET DEFAULT nextval('public.construction_attachments_id_seq'::regclass);


--
-- Name: construction_costs id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.construction_costs ALTER COLUMN id SET DEFAULT nextval('public.construction_costs_id_seq'::regclass);


--
-- Name: construction_daily_reports id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.construction_daily_reports ALTER COLUMN id SET DEFAULT nextval('public.construction_daily_reports_id_seq'::regclass);


--
-- Name: construction_data id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.construction_data ALTER COLUMN id SET DEFAULT nextval('public.construction_data_id_seq'::regclass);


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: customer_masters id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.customer_masters ALTER COLUMN id SET DEFAULT nextval('public.customer_masters_id_seq'::regclass);


--
-- Name: delivery_slip_detail_large_classifications id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.delivery_slip_detail_large_classifications ALTER COLUMN id SET DEFAULT nextval('public.delivery_slip_detail_large_classifications_id_seq'::regclass);


--
-- Name: delivery_slip_detail_middle_classifications id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.delivery_slip_detail_middle_classifications ALTER COLUMN id SET DEFAULT nextval('public.delivery_slip_detail_middle_classifications_id_seq'::regclass);


--
-- Name: delivery_slip_headers id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.delivery_slip_headers ALTER COLUMN id SET DEFAULT nextval('public.delivery_slip_headers_id_seq'::regclass);


--
-- Name: inventories id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.inventories ALTER COLUMN id SET DEFAULT nextval('public.inventories_id_seq'::regclass);


--
-- Name: inventory_categories id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.inventory_categories ALTER COLUMN id SET DEFAULT nextval('public.inventory_categories_id_seq'::regclass);


--
-- Name: inventory_histories id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.inventory_histories ALTER COLUMN id SET DEFAULT nextval('public.inventory_histories_id_seq'::regclass);


--
-- Name: invoice_detail_large_classifications id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.invoice_detail_large_classifications ALTER COLUMN id SET DEFAULT nextval('public.invoice_detail_large_classifications_id_seq'::regclass);


--
-- Name: invoice_detail_middle_classifications id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.invoice_detail_middle_classifications ALTER COLUMN id SET DEFAULT nextval('public.invoice_detail_middle_classifications_id_seq'::regclass);


--
-- Name: invoice_headers id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.invoice_headers ALTER COLUMN id SET DEFAULT nextval('public.invoice_headers_id_seq'::regclass);


--
-- Name: maker_masters id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.maker_masters ALTER COLUMN id SET DEFAULT nextval('public.maker_masters_id_seq'::regclass);


--
-- Name: material_categories id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.material_categories ALTER COLUMN id SET DEFAULT nextval('public.material_categories_id_seq'::regclass);


--
-- Name: material_masters id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.material_masters ALTER COLUMN id SET DEFAULT nextval('public.material_masters_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: outsourcing_costs id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.outsourcing_costs ALTER COLUMN id SET DEFAULT nextval('public.outsourcing_costs_id_seq'::regclass);


--
-- Name: purchase_data id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.purchase_data ALTER COLUMN id SET DEFAULT nextval('public.purchase_data_id_seq'::regclass);


--
-- Name: purchase_divisions id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.purchase_divisions ALTER COLUMN id SET DEFAULT nextval('public.purchase_divisions_id_seq'::regclass);


--
-- Name: purchase_headers id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.purchase_headers ALTER COLUMN id SET DEFAULT nextval('public.purchase_headers_id_seq'::regclass);


--
-- Name: purchase_order_data id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.purchase_order_data ALTER COLUMN id SET DEFAULT nextval('public.purchase_order_data_id_seq'::regclass);


--
-- Name: purchase_order_histories id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.purchase_order_histories ALTER COLUMN id SET DEFAULT nextval('public.purchase_order_histories_id_seq'::regclass);


--
-- Name: purchase_unit_prices id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.purchase_unit_prices ALTER COLUMN id SET DEFAULT nextval('public.purchase_unit_prices_id_seq'::regclass);


--
-- Name: quatation_material_headers id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.quatation_material_headers ALTER COLUMN id SET DEFAULT nextval('public.quatation_material_headers_id_seq'::regclass);


--
-- Name: quotation_detail_large_classifications id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.quotation_detail_large_classifications ALTER COLUMN id SET DEFAULT nextval('public.quotation_detail_large_classifications_id_seq'::regclass);


--
-- Name: quotation_detail_middle_classifications id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.quotation_detail_middle_classifications ALTER COLUMN id SET DEFAULT nextval('public.quotation_detail_middle_classifications_id_seq'::regclass);


--
-- Name: quotation_headers id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.quotation_headers ALTER COLUMN id SET DEFAULT nextval('public.quotation_headers_id_seq'::regclass);


--
-- Name: quotation_material_details id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.quotation_material_details ALTER COLUMN id SET DEFAULT nextval('public.quotation_material_details_id_seq'::regclass);


--
-- Name: quotation_material_headers id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.quotation_material_headers ALTER COLUMN id SET DEFAULT nextval('public.quotation_material_headers_id_seq'::regclass);


--
-- Name: sites id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.sites ALTER COLUMN id SET DEFAULT nextval('public.sites_id_seq'::regclass);


--
-- Name: staffs id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.staffs ALTER COLUMN id SET DEFAULT nextval('public.staffs_id_seq'::regclass);


--
-- Name: stocktakes id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.stocktakes ALTER COLUMN id SET DEFAULT nextval('public.stocktakes_id_seq'::regclass);


--
-- Name: supplier_masters id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.supplier_masters ALTER COLUMN id SET DEFAULT nextval('public.supplier_masters_id_seq'::regclass);


--
-- Name: supplier_responsibles id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.supplier_responsibles ALTER COLUMN id SET DEFAULT nextval('public.supplier_responsibles_id_seq'::regclass);


--
-- Name: unit_masters id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.unit_masters ALTER COLUMN id SET DEFAULT nextval('public.unit_masters_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: working_categories id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_categories ALTER COLUMN id SET DEFAULT nextval('public.working_categories_id_seq'::regclass);


--
-- Name: working_middle_items id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_middle_items ALTER COLUMN id SET DEFAULT nextval('public.working_middle_items_id_seq'::regclass);


--
-- Name: working_safety_matters id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_safety_matters ALTER COLUMN id SET DEFAULT nextval('public.working_safety_matters_id_seq'::regclass);


--
-- Name: working_small_items id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_small_items ALTER COLUMN id SET DEFAULT nextval('public.working_small_items_id_seq'::regclass);


--
-- Name: working_specific_middle_items id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_specific_middle_items ALTER COLUMN id SET DEFAULT nextval('public.working_specific_middle_items_id_seq'::regclass);


--
-- Name: working_specific_small_items id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_specific_small_items ALTER COLUMN id SET DEFAULT nextval('public.working_specific_small_items_id_seq'::regclass);


--
-- Name: working_subcategories id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_subcategories ALTER COLUMN id SET DEFAULT nextval('public.working_subcategories_id_seq'::regclass);


--
-- Name: working_times id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_times ALTER COLUMN id SET DEFAULT nextval('public.working_times_id_seq'::regclass);


--
-- Name: working_units id; Type: DEFAULT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_units ALTER COLUMN id SET DEFAULT nextval('public.working_units_id_seq'::regclass);


--
-- Data for Name: affiliations; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.affiliations (id, affiliation_name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-07-13 13:16:11.855029	2023-07-13 13:16:11.855029
\.


--
-- Data for Name: business_holidays; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.business_holidays (id, working_date, holiday_flag, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.companies (id, name, representative_title, representative_name, post, address, house_number, address2, tel, fax, email, invoice_number, estimate_material_cost_rate, estimate_execution_labor_cost, estimate_labor_cost, responsible_order, responsible_estimate, responsible_invoice, responsible_delivery, bank_name_1, bank_branch_name_1, account_type_1, account_number_1, holder_1, bank_name_2, bank_branch_name_2, account_type_2, account_number_2, holder_2, bank_name_3, bank_branch_name_3, account_type_3, account_number_3, holder_3, created_at, updated_at) FROM stdin;
1	株式会社デモサンプル	代表取締役	デモ太郎	〒163-8001	東京都新宿区西新宿2-8-1	\N		9999-88-7777	8888-77-6666			1.35000000000000009	10000	15000	サンプル太郎	\N	\N	\N	アールバンク銀行	ペーペー銀行	0	88888888	カ）アンプル	さんさん信用金庫	本店	0	7777777	カ）サンプル	ＵＦＯ銀行	東京中央支店	0	1234567	カ　サンプル	2023-07-14 11:01:09.048729	2023-07-15 16:18:59.732544
\.


--
-- Data for Name: constants; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.constants (id, purchase_order_last_header_code, created_at, updated_at) FROM stdin;
1	A2306	2023-06-24 16:07:13.752305	2023-07-10 15:47:30.047076
\.


--
-- Data for Name: construction_attachments; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.construction_attachments (id, construction_datum_id, title, attachment, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: construction_costs; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.construction_costs (id, construction_datum_id, purchase_amount, supplies_expense, labor_cost, misellaneous_expense, execution_amount, constructing_amount, purchase_order_amount, final_return_division, created_at, updated_at) FROM stdin;
1	1	0	\N	\N	\N	0	\N		\N	2023-05-12 16:32:22.923508	2023-05-12 16:32:22.923508
3	3	0	\N	\N	\N	0	\N		\N	2023-06-24 16:51:56.536284	2023-06-24 16:51:56.536284
5	5	0	\N	\N	\N	0	\N		\N	2023-07-01 16:45:11.112013	2023-07-01 16:45:11.112013
2	2	2100	\N	\N	\N	2100	\N	仕入材料,株式会社サンプルA,A2301,2100	\N	2023-05-23 10:19:25.62166	2023-07-11 18:38:17.005919
6	6	0	\N	\N	\N	0	\N		\N	2023-07-11 18:59:32.855056	2023-07-11 18:59:32.855056
7	4	0	\N	\N	\N	0	\N		\N	2023-07-15 16:05:58.61378	2023-07-15 16:05:58.61378
\.


--
-- Data for Name: construction_daily_reports; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.construction_daily_reports (id, working_date, construction_datum_id, staff_id, start_time_1, end_time_1, start_time_2, end_time_2, working_times, man_month, labor_cost, working_details, is_one_day_work, is_no_break_time_1, is_no_break_time_2, is_no_break_time_3, created_at, updated_at) FROM stdin;
1	2023-06-23	2	1	08:00:00	17:00:00	00:00:00	00:00:00	27000	1.0	11332	配線等	0	0	0	0	2023-06-23 14:52:56.140775	2023-07-01 11:49:53.525165
2	2023-06-24	2	2	08:00:00	12:00:00	00:00:00	00:00:00	12600	0.467	7472	配線等	0	0	0	0	2023-07-01 17:52:00.429419	2023-07-01 17:52:00.429419
3	2023-06-24	3	3	08:00:00	17:00:00	00:00:00	00:00:00	25200	0.933	13995	打合せ	0	0	0	0	2023-07-01 17:58:02.77522	2023-07-01 17:58:02.77522
4	2023-07-25	3	4	08:00:00	16:00:00	00:00:00	00:00:00	21600	0.8	10400	打合せ	0	0	0	0	2023-07-01 17:58:28.230935	2023-07-01 17:58:28.230935
\.


--
-- Data for Name: construction_data; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.construction_data (id, construction_code, construction_name, alias_name, reception_date, customer_id, personnel, site_id, construction_start_date, construction_end_date, construction_period_start, construction_period_end, post, address, house_number, address2, latitude, longitude, construction_detail, attention_matter, working_safety_matter_id, working_safety_matter_name, estimated_amount, final_amount, billing_due_date, deposit_due_date, deposit_date, quotation_header_id, delivery_slip_header_id, billed_flag, calculated_flag, order_flag, quotation_flag, created_at, updated_at) FROM stdin;
1	-	-	-	2023-07-01	1		\N	2023-07-01	2000-01-01	2023-01-01	2023-01-01					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	2023-07-01 16:45:11.093592	2023-07-12 14:30:00.222016
4	20230004	Cサンプル工事	Cサンプル工事	2023-07-01	5		\N	2023-07-15	2023-07-26	2023-01-01	2023-01-01					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	2023-07-01 16:44:44.714748	2023-07-15 16:05:58.629229
2	20230002	Aサンプル工事	Aサン工事	2023-05-23	2	試験太郎	\N	2023-07-11	2023-06-24	2023-01-01	2023-01-01	〒955-0013	新潟県三条市井栗	1丁目		\N	\N	飲食店工事	壁・床等傷つけないように注意	\N	脚立からの転落に注意	\N	\N	\N	\N	\N	\N	\N	0	0	0	1	2023-05-23 10:19:25.367732	2023-07-15 17:30:04.028649
3	20230003	Bサンプル工事	Bサンプル工事	2023-06-24	5		\N	2023-06-24	2023-07-25	2023-01-01	2023-01-01					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	2023-06-24 16:51:56.391937	2023-07-05 13:31:56.345206
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.contacts (id, name, search_character, company_name, affiliation, department, post, address, tel, fax, email, url, partner_division_id, created_at, updated_at) FROM stdin;
2			株式会社サンプル得意先B	\N	\N	〒955-0013	新潟県三条市東三条	0120-11-1111			\N	1	2023-05-23 10:19:50.04715	2023-05-23 10:19:50.04715
3			株式会社サンプル得意先C	\N	\N	〒955-0013	新潟県三条市東三条	0120-11-1111			\N	1	2023-06-07 13:36:09.096025	2023-06-07 13:36:09.096025
4			株式会社サンプル得意先Ｄ	\N	\N	〒955-0013	新潟県三条市東三条	0120-11-1111			\N	1	2023-06-07 13:36:27.755897	2023-06-07 13:36:27.755897
5			株式会社サンプル得意先E	\N	\N	〒955-0013	新潟県三条市東三条	0120-11-1111			\N	1	2023-07-01 16:09:47.806967	2023-07-01 16:09:47.806967
6			株式会社サンプル得意先D	\N	\N	〒955-0013	新潟県三条市東三条	0120-11-1111			\N	1	2023-07-01 16:18:18.641978	2023-07-01 16:18:18.641978
1			＜手入力用＞	\N	\N						\N	1	2023-05-11 17:53:57.155652	2023-07-01 16:19:56.855081
7			株式会社サンプル得意先A	\N	\N	〒955-0013	新潟県三条市東三条	0120-11-1111			\N	1	2023-07-01 16:20:24.955282	2023-07-01 16:20:24.955282
8			株式会社サンプル得意先B	\N	\N	〒955-0013	新潟県三条市東三条	0120-11-1111			\N	1	2023-07-01 16:20:40.187493	2023-07-01 16:20:40.187493
9			株式会社サンプル得意先C	\N	\N	〒955-0013	新潟県三条市東三条	0120-11-1111			\N	1	2023-07-01 16:21:06.478977	2023-07-01 16:21:06.478977
10			株式会社サンプル得意先D	\N	\N	〒955-0013	新潟県三条市東三条	0120-11-1111			\N	1	2023-07-01 16:21:18.063724	2023-07-01 16:21:18.063724
11			株式会社サンプル得意先E	\N	\N						\N	1	2023-07-01 16:21:34.575191	2023-07-01 16:21:34.575191
12			株式会社サンプル得意先F	\N	\N						\N	1	2023-07-01 16:21:44.77293	2023-07-01 16:21:44.77293
13			株式会社サンプル得意先F	\N	\N						\N	1	2023-07-01 16:52:38.311185	2023-07-01 16:52:38.311185
14			株式会社サンプルｃ	\N	\N						\N	1	2023-07-03 08:28:24.426276	2023-07-03 08:28:24.426276
\.


--
-- Data for Name: customer_masters; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.customer_masters (id, customer_name, search_character, post, address, house_number, address2, tel_main, fax_main, email_main, closing_date, closing_date_division, due_date, due_date_division, honorific_id, responsible1, responsible2, contact_id, payment_bank_id, card_not_flag, contractor_flag, public_flag, created_at, updated_at) FROM stdin;
1	＜手入力用＞									0	0	0	0	\N			1	1	0	0	0	2023-05-11 17:54:04.139601	2023-07-01 16:19:56.837125
5	株式会社サンプル得意先B		〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			0	0	0	0	0			\N	1	0	0	0	2023-06-03 16:03:47.02586	2023-07-01 16:20:40.179118
6	株式会社サンプル得意先C		〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			0	0	0	0	0			\N	1	0	0	0	2023-06-03 16:06:19.405301	2023-07-01 16:21:06.465656
8	株式会社サンプル得意先D		〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			0	0	0	0	0			\N	\N	\N	0	\N	2023-06-23 16:10:13.603308	2023-07-01 16:21:18.051488
2	株式会社サンプル得意先A		〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			0	0	0	0	0			\N	1	0	0	0	2023-05-20 17:35:59.957922	2023-07-12 16:03:30.177495
\.


--
-- Data for Name: delivery_slip_detail_large_classifications; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.delivery_slip_detail_large_classifications (id, delivery_slip_header_id, delivery_slip_items_division_id, working_large_item_id, working_specific_middle_item_id, working_large_item_name, working_large_item_short_name, working_middle_item_category_id, working_middle_item_category_id_call, working_middle_item_subcategory_id, working_middle_item_subcategory_id_call, working_large_specification, line_number, quantity, execution_quantity, working_unit_id, working_unit_name, working_unit_price, delivery_slip_price, execution_unit_price, execution_price, labor_productivity_unit, labor_productivity_unit_total, last_line_number, remarks, construction_type, piping_wiring_flag, equipment_mounting_flag, labor_cost_flag, created_at, updated_at) FROM stdin;
90	1	1	1	\N	※入力してください※	1	\N	\N	\N	\N		1	1.00	1.00	\N	\N	\N	300	\N	240	0.000	0.000	3	\N	0	0	0	0	2023-06-19 14:23:48.490454	2023-06-19 14:23:48.596179
\.


--
-- Data for Name: delivery_slip_detail_middle_classifications; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.delivery_slip_detail_middle_classifications (id, delivery_slip_header_id, delivery_slip_detail_large_classification_id, delivery_slip_item_division_id, working_middle_item_id, working_specific_middle_item_id, working_middle_item_name, working_middle_item_short_name, working_middle_item_category_id, working_middle_item_category_id_call, working_middle_item_subcategory_id, working_middle_item_subcategory_id_call, line_number, working_middle_specification, quantity, execution_quantity, working_unit_id, working_unit_name, working_unit_price, delivery_slip_price, execution_unit_price, execution_price, material_id, working_material_name, material_unit_price, labor_unit_price, labor_productivity_unit, labor_productivity_unit_total, material_quantity, accessory_cost, material_cost_total, labor_cost_total, other_cost, remarks, construction_type, piping_wiring_flag, equipment_mounting_flag, labor_cost_flag, created_at, updated_at) FROM stdin;
5	1	3	1	1	\N	配線テスト２	1	1	1	\N	\N	2		1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-15 14:04:03.759704	2023-06-15 14:04:03.759704
6	1	3	1	1	\N	配線テスト	1	1	1	\N	\N	1		1.00	1.00	1	<手入力>	50	100	40	80	\N	\N	\N	\N	0.000	0.000	\N	\N	\N	\N	\N		0	0	0	0	2023-06-15 14:04:03.853227	2023-06-15 14:04:03.853227
7	1	4	1	1	\N	配線テスト２	1	1	1	\N	\N	3		1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-15 14:06:18.935134	2023-06-15 14:06:18.935134
8	1	4	1	1	\N	配線テスト	1	1	1	\N	\N	2		1.00	1.00	1	<手入力>	50	100	40	80	\N	\N	\N	\N	0.000	0.000	\N	\N	\N	\N	\N		0	0	0	0	2023-06-15 14:06:18.948624	2023-06-15 14:06:18.948624
9	1	4	1	1	\N	※入力してください※	1	\N	\N	\N	\N	1		1.00	1.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	2023-06-15 14:06:18.964236	2023-06-15 14:06:18.964236
31	1	35	1	1	\N	配線テスト１	1	1	1	\N	\N	3		1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-15 18:46:39.681356	2023-06-15 18:46:39.681356
32	1	35	1	1	\N	配線テスト２	1	1	1	\N	\N	2		1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-15 18:46:39.728121	2023-06-15 18:46:39.728121
33	1	35	1	1	\N	※備考としても入力できます	1	1	1	\N	\N	1		\N	\N	1	<手入力>	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-15 18:46:39.769629	2023-06-15 18:46:39.769629
34	1	36	1	1	\N	※入力してください※	1	\N	\N	\N	\N	1		1.00	1.00	\N	\N	\N	200	\N	160	\N	\N	\N	\N	0.000	0.000	\N	\N	\N	\N	\N	\N	0	0	0	0	2023-06-15 18:46:58.437066	2023-06-15 18:46:58.437066
71	1	90	1	1	\N	配線テスト２	1	1	1	\N	\N	1		1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-19 14:23:48.51383	2023-06-19 14:23:48.51383
72	1	90	\N	1	\N	配線テスト３	1	1	\N	\N	\N	2		1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	\N	\N	\N	2023-06-19 14:23:48.555258	2023-06-19 14:23:48.555258
73	1	90	1	1	\N	配線テスト１	1	1	1	\N	\N	3		1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-19 14:23:48.570926	2023-06-19 14:23:48.570926
\.


--
-- Data for Name: delivery_slip_headers; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.delivery_slip_headers (id, delivery_slip_code, quotation_code, invoice_code, delivery_slip_header_origin_id, delivery_slip_date, construction_datum_id, construction_name, customer_id, customer_name, honorific_id, responsible1, responsible2, post, address, house_number, address2, tel, fax, construction_period, construction_period_date1, construction_period_date2, construction_post, construction_place, construction_house_number, construction_place2, delivery_amount, execution_amount, last_line_number, category_saved_flag, category_saved_id, subcategory_saved_id, fixed_flag, final_return_division, created_at, updated_at) FROM stdin;
1	2023010101			\N	2023-01-01	1	Ａサンプル工事	4	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					300	240	1	1	\N	\N	0	0	2023-06-03 11:03:13.418812	2023-06-19 14:23:48.648715
\.


--
-- Data for Name: inventories; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.inventories (id, warehouse_id, location_id, material_master_id, inventory_quantity, unit_master_id, inventory_amount, supplier_master_id, current_history_id, current_warehousing_date, current_quantity, current_unit_price, last_warehousing_date, last_unit_price, next_history_id_1, next_warehousing_date_1, next_quantity_1, next_unit_price_1, next_history_id_2, next_warehousing_date_2, next_quantity_2, next_unit_price_2, no_stocktake_flag, image, created_at, updated_at) FROM stdin;
3	1	1	4	10.00	2	500	2	\N	\N	10.00	50.00	\N	50.00	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	2023-07-03 09:39:08.344842	2023-07-03 09:39:08.344842
2	1	1	3	13.00	1	1500	4	\N	\N	10.00	150.00	2023-07-18	\N	15	2023-07-18	3.00	\N	15	2023-07-18	3.00	\N	0	\N	2023-07-03 09:36:46.416037	2023-07-18 14:28:53.417857
6	1	1	1	5.00	2	500	4	\N	\N	5.00	100.00	\N	100.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-18 15:07:17.104976	2023-07-18 15:07:42.081261
7	1	1	12	5.00	2	0	4	\N	\N	5.00	150.00	\N	100.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-18 16:56:27.562389	2023-07-18 16:56:27.562389
4	1	1	1	80.00	2	8000	4	\N	\N	80.00	100.00	\N	100.00	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	2023-07-03 09:41:01.828312	2023-07-18 17:31:36.365434
1	1	1	2	8.00	2	800	4	7	2023-07-10	8.00	100.00	2023-07-18	100.00	0	\N	0.00	\N	0	\N	0.00	\N	0	\N	2023-06-06 17:27:38.033877	2023-07-19 15:33:50.63388
\.


--
-- Data for Name: inventory_categories; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.inventory_categories (id, name, seq, created_at, updated_at) FROM stdin;
1	照明器具	\N	2023-05-12 09:30:23.79892	2023-05-12 09:33:29.617975
2	配線器具	\N	2023-05-12 09:33:44.389506	2023-05-12 09:33:44.389506
\.


--
-- Data for Name: inventory_histories; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.inventory_histories (id, inventory_date, inventory_division_id, construction_datum_id, material_master_id, quantity, inventory_quantity, unit_master_id, unit_price, price, supplier_master_id, slip_code, purchase_datum_id, previous_quantity, previous_unit_price, current_quantity, current_unit_price, current_history_id, current_warehousing_date, next_quantity_1, next_unit_price_1, next_history_id_1, next_warehousing_date_1, created_at, updated_at) FROM stdin;
17	2023-07-18	0	2	2	-1.00	8	2	100.00	-100	4		27	\N	\N	-1.00	100.00	7	2023-07-10	0.00	\N	\N	\N	2023-07-19 15:33:50.625177	2023-07-19 15:33:50.64189
18	2023-07-04	2	978	2	-2.00	\N	2	50.00	-100	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-20 08:55:46.331706	2023-07-20 08:55:46.331706
\.


--
-- Data for Name: invoice_detail_large_classifications; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.invoice_detail_large_classifications (id, invoice_header_id, invoice_items_division_id, working_large_item_id, working_large_item_name, working_large_item_short_name, working_large_specification, line_number, quantity, execution_quantity, working_unit_id, working_unit_name, working_unit_price, invoice_price, execution_unit_price, execution_price, labor_productivity_unit, labor_productivity_unit_total, last_line_number, remarks, delivery_slip_header_id, construction_type, piping_wiring_flag, equipment_mounting_flag, labor_cost_flag, created_at, updated_at) FROM stdin;
1	1	1	1	VVFケーブル　配線	1		1	1.00	1.00	1	<手入力>	100	100	50	80	0.000	0.000	1	\N	\N	0	0	0	0	2023-06-03 16:51:21.743621	2023-06-06 14:10:30.456972
3	2	1	1	配線工事２	1		2	1.00	1.00	2	箇所	1000	1000	800	800	\N	\N	\N	\N	\N	0	0	0	0	2023-06-16 17:31:55.602799	2023-06-16 17:31:55.602799
11	2	1	2	配線Ａ	1		3	1.00	1.00	2	箇所	1000	1000	800	800	\N	\N	\N	\N	\N	0	0	0	0	2023-06-17 09:30:36.47805	2023-06-17 09:48:59.219915
12	2	1	1	小計	1		8	1.00	1.00	1	<手入力>	\N	2200	\N	1760	\N	0.000	\N	\N	\N	1	\N	\N	\N	2023-06-17 09:52:42.603648	2023-06-17 09:52:42.603648
2	2	1	1	配線工事	1		1	1.00	1.00	2	箇所	\N	200	\N	160	0.000	0.000	3		\N	0	0	0	0	2023-06-16 16:35:07.283798	2023-06-17 15:15:36.511867
13	3	1	2	配線Ａ	1		1	1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	0	\N	\N	\N	2023-06-26 09:29:42.845377	2023-06-26 09:29:42.845377
15	4	1	1	※入力してください※	1		1	1.00	1.00	1	式	\N	150	\N	120	0.000	0.000	3		\N	0	0	0	0	2023-07-12 14:09:51.301319	2023-07-12 14:09:51.301319
\.


--
-- Data for Name: invoice_detail_middle_classifications; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.invoice_detail_middle_classifications (id, invoice_header_id, invoice_detail_large_classification_id, invoice_item_division_id, working_middle_item_id, working_middle_item_name, working_middle_item_short_name, line_number, working_middle_specification, quantity, execution_quantity, working_unit_id, working_unit_name, working_unit_price, invoice_price, execution_unit_price, execution_price, material_id, working_material_name, material_unit_price, labor_unit_price, labor_productivity_unit, labor_productivity_unit_total, material_quantity, accessory_cost, material_cost_total, labor_cost_total, other_cost, remarks, construction_type, piping_wiring_flag, equipment_mounting_flag, labor_cost_flag, created_at, updated_at) FROM stdin;
1	1	1	\N	1	配線テスト	1	1		1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	2023-06-06 14:10:30.007844	2023-06-06 14:10:30.007844
3	2	2	1	1	配線テスト１	1	1		1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-16 16:35:27.721612	2023-06-16 16:35:27.721612
4	2	2	\N	1	配線テスト２	1	2		1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	2023-06-17 15:15:15.094377	2023-06-17 15:15:15.094377
5	2	2	\N	1	小計	1	3		1.00	1.00	2	箇所	\N	200	\N	160	\N	\N	\N	\N	\N	0.000	\N	\N	\N	\N	\N	\N	1	0	0	0	2023-06-17 15:15:36.441411	2023-06-17 15:15:36.441411
6	4	15	1	1	配線	1	2	配線テスト	1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N	\N	0.000	0.000	\N	\N	\N	\N	\N		0	0	0	0	2023-07-12 14:09:51.356813	2023-07-12 14:09:51.356813
7	4	15	1	1	配線テスト２	1	3		1.00	1.00	2	箇所	50	50	40	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-07-12 14:09:51.374233	2023-07-12 14:09:51.374233
\.


--
-- Data for Name: invoice_headers; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.invoice_headers (id, invoice_code, quotation_code, delivery_slip_code, invoice_date, construction_datum_id, construction_name, customer_id, customer_name, honorific_id, responsible1, responsible2, post, address, house_number, address2, tel, fax, construction_period, construction_place, construction_house_number, construction_place2, payment_period, invoice_period_start_date, invoice_period_end_date, billing_amount, execution_amount, deposit_amount, payment_method_id, commission, payment_date, labor_insurance_not_flag, last_line_number, remarks, final_return_division, deposit_complete_flag, created_at, updated_at) FROM stdin;
3	2023010101			\N	1	サンプル工事	2	株式会社サンプル得意先A	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	\N	\N	\N		\N	\N	100	80	\N	0	\N	\N	0	1		0	0	2023-06-23 16:10:13.860195	2023-07-05 14:13:16.340237
\.


--
-- Data for Name: maker_masters; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.maker_masters (id, maker_name, created_at, updated_at) FROM stdin;
1	-	2023-05-12 08:58:23.913475	2023-05-15 18:31:06.394751
4	PAST	2023-07-05 15:57:07.90495	2023-07-05 15:57:07.90495
5	パーナ	2023-07-15 17:25:39.642049	2023-07-15 17:25:39.642049
\.


--
-- Data for Name: material_categories; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.material_categories (id, name, seq, created_at, updated_at) FROM stdin;
1	照明器具	\N	2023-05-12 09:09:29.77533	2023-05-12 09:09:29.77533
2	配線器具	\N	2023-05-12 09:10:59.504923	2023-05-12 09:10:59.504923
3	\N	\N	2023-07-07 18:36:07.846066	2023-07-07 18:36:07.846066
4	\N	\N	2023-07-07 18:36:11.747362	2023-07-07 18:36:11.747362
\.


--
-- Data for Name: material_masters; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.material_masters (id, material_code, internal_code, material_name, maker_id, unit_id, list_price, list_price_quotation, standard_quantity, standard_labor_productivity_unit, standard_rate, last_unit_price, last_unit_price_update_at, inventory_category_id, material_category_id, list_price_update_at, notes, created_at, updated_at) FROM stdin;
1	<手入力用>		<手入力用>	1	1	\N	\N	\N	\N	\N	14928.00	2023-06-01	\N	\N	\N		2023-05-12 09:33:00.551371	2023-06-10 11:42:18.692968
7	WWF202	\N	WWFケーブル2.0mm-2C	4	4	\N	\N	\N	\N	\N	\N	2000-01-01	\N	\N	\N		2023-07-13 15:28:21.513473	2023-07-13 15:28:52.632301
3	ZN1002		サンプル２	2	2	151	151	\N	\N	0.0000	\N	2023-07-18	\N	2	\N		2023-07-01 16:33:53.546762	2023-07-18 13:48:43.410907
8	vvv	\N		\N	\N	\N	\N	\N	\N	\N	\N	2000-01-01	\N	\N	\N		2023-07-18 13:54:13.105766	2023-07-18 13:54:13.105766
4	ZN1003			1	2	150	\N	\N	\N	\N	\N	2000-01-01	\N	2	\N		2023-07-03 09:33:39.136199	2023-07-18 16:43:19.78414
2	ZN1001		サンプル１	5	2	200	200	\N	\N	0.5000	100.00	2023-07-18	2	2	\N		2023-05-15 18:29:50.831334	2023-07-19 15:33:50.489542
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.orders (id, purchase_order_history_id, material_id, material_code, material_name, maker_id, maker_name, quantity, unit_master_id, list_price, order_unit_price, order_price, material_category_id, mail_sent_flag, delivery_complete_flag, sequential_id, created_at, updated_at) FROM stdin;
106	37	3	ZN1002	サンプル２	2	\N	3	2	151	\N	\N	2	\N	0	3	2023-07-08 16:36:09.13389	2023-07-15 15:55:33.131128
112	6	4	ZN1003	サンプル３	2	\N	2	2	150	\N	\N	2	\N	0	1	2023-07-10 16:01:14.893588	2023-07-15 15:55:33.156465
113	6	5	ZN1004	サンプル４	2	\N	0	2	230	\N	\N	2	\N	0	2	2023-07-10 16:01:14.914179	2023-07-15 15:55:33.169649
114	6	2	ZN1001	ZN10011	2	\N	5	2	200	0.00	0	2	\N	0	3	2023-07-10 16:01:14.930788	2023-07-15 15:55:33.184341
1	1	2	ZN10011	ZN10011	2	\N	1	2	200	\N	\N	2	\N	0	1	2023-06-12 17:50:27.535941	2023-07-15 15:55:32.803088
2	2	2	ZN10011	ZN10011	2	\N	1	2	200	\N	\N	2	\N	0	1	2023-06-12 17:55:31.549748	2023-07-15 15:55:32.816706
3	3	2	ZN10011	ZN10011	2	\N	1	2	200	\N	\N	2	\N	0	1	2023-06-12 17:56:01.284337	2023-07-15 15:55:32.829017
53	4	2	ZN10011	ZN10011	2	\N	10	2	200	0.00	0	2	\N	0	1	2023-06-24 13:56:30.185721	2023-07-15 15:55:32.843235
54	5	2	ZN10011	ZN10011	2	パーナ	10	2	200	300.00	3000	\N	1	0	1	2023-06-24 15:34:43.043768	2023-07-15 15:55:32.859931
64	15	2	ZN1001	ZN10011	2	\N	5	2	200	0.00	0	2	\N	0	1	2023-07-07 17:31:36.119761	2023-07-15 15:55:32.876424
65	16	2	ZN1001	ZN10011	2	\N	5	2	200	0.00	0	2	\N	0	1	2023-07-07 17:31:44.126182	2023-07-15 15:55:32.893895
66	17	2	ZN1001	ZN10011	2	\N	5	2	200	0.00	0	2	\N	0	1	2023-07-07 17:32:01.42436	2023-07-15 15:55:32.90732
67	18	2	ZN1001	ZN10011	2	\N	5	2	200	0.00	0	2	\N	0	1	2023-07-07 17:39:15.792809	2023-07-15 15:55:32.918831
68	19	2	ZN1001	ZN10011	2	\N	5	2	200	0.00	0	2	\N	0	1	2023-07-07 17:39:24.795139	2023-07-15 15:55:32.927301
69	20	2	ZN1001	ZN10011	2	\N	5	2	200	0.00	0	2	\N	0	1	2023-07-07 17:41:15.312006	2023-07-15 15:55:32.938149
71	22	2	ZN1001	ZN10011	2	\N	2	2	200	0.00	0	2	\N	0	1	2023-07-07 17:48:06.699138	2023-07-15 15:55:32.947716
72	23	2	ZN1001	ZN10011	2	\N	2	2	200	0.00	0	2	\N	0	1	2023-07-07 17:48:12.477558	2023-07-15 15:55:32.95856
73	24	2	ZN1001	ZN10011	2	\N	2	2	200	0.00	0	2	\N	0	1	2023-07-07 17:48:16.384748	2023-07-15 15:55:32.971755
74	25	2	ZN1001	ZN10011	2	\N	2	2	200	0.00	0	2	\N	0	1	2023-07-07 17:48:27.256297	2023-07-15 15:55:32.98145
75	26	2	ZN1001	ZN10011	2	\N	2	2	200	0.00	0	2	\N	0	1	2023-07-07 17:48:39.229464	2023-07-15 15:55:32.992272
76	27	2	ZN1001	ZN10011	2	\N	2	2	200	0.00	0	2	\N	0	1	2023-07-07 17:49:02.847349	2023-07-15 15:55:33.004083
77	28	2	ZN1001	ZN10011	2	\N	2	2	200	0.00	0	2	\N	0	1	2023-07-07 17:49:14.856587	2023-07-15 15:55:33.019283
78	29	2	ZN1001	ZN10011	2	\N	2	2	200	0.00	0	2	\N	0	1	2023-07-07 17:50:28.755454	2023-07-15 15:55:33.029063
79	30	6	ZN1005	サンプル５	2	\N	5	2	250	\N	\N	4	\N	0	1	2023-07-07 18:39:33.770172	2023-07-15 15:55:33.044124
80	31	5	ZN1004	サンプル４	2	\N	2	2	230	\N	\N	2	\N	0	1	2023-07-07 18:39:47.498468	2023-07-15 15:55:33.056183
81	31	6	ZN1005	サンプル５	2	\N	5	2	250	\N	\N	4	\N	0	2	2023-07-07 18:39:47.512328	2023-07-15 15:55:33.066622
82	32	5	ZN1004	サンプル４	2	\N	2	2	230	\N	\N	2	\N	0	1	2023-07-07 18:40:40.048299	2023-07-15 15:55:33.077973
83	32	6	ZN1005	サンプル５	2	\N	5	2	250	\N	\N	4	\N	0	2	2023-07-07 18:40:40.065983	2023-07-15 15:55:33.091336
84	33	6	ZN1005	サンプル５	2	\N	2	2	250	\N	\N	4	\N	0	1	2023-07-07 18:46:57.106272	2023-07-15 15:55:33.102777
104	37	5	ZN1004	サンプル４	2	\N	5	2	230	\N	\N	2	\N	0	1	2023-07-08 16:36:09.103273	2023-07-15 15:55:33.111405
105	37	4	ZN1003	サンプル３	2	\N	3	2	150	\N	\N	2	\N	0	2	2023-07-08 16:36:09.120281	2023-07-15 15:55:33.122879
\.


--
-- Data for Name: outsourcing_costs; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.outsourcing_costs (id, invoice_code, purchase_order_datum_id, construction_datum_id, staff_id, supplier_master_id, working_start_date, working_end_date, purchase_amount, supplies_expense, labor_cost, misellaneous_expense, execution_amount, billing_amount, purchase_order_amount, closing_date, source_bank_id, payment_amount, unpaid_amount, payment_due_date, payment_date, unpaid_payment_date, created_at, updated_at) FROM stdin;
1	2023051501	1	1	\N	4	\N	2023-05-15	\N	\N	0	\N	\N	1000	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-09 16:03:06.043419	2023-06-09 16:03:06.043419
2	2023060101	2	2	\N	4	\N	2023-06-01	\N	\N	14928	\N	\N	14928	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-10 08:13:00.256029	2023-06-10 08:20:56.951163
3	2023060101	2	2	\N	3	\N	2023-06-01	\N	\N	0	\N	\N	14928	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-10 11:42:18.650338	2023-06-10 11:42:18.650338
4	2023/07/03	4	1	\N	3	\N	\N	\N	\N	0	\N	\N	200	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-24 17:41:33.44206	2023-07-03 09:18:17.740349
\.


--
-- Data for Name: purchase_data; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.purchase_data (id, purchase_date, slip_code, purchase_order_datum_id, construction_datum_id, material_id, material_code, material_name, maker_id, maker_name, quantity, quantity2, unit_id, purchase_unit_price, purchase_unit_price2, purchase_amount, list_price, purchase_id, division_id, supplier_id, inventory_division_id, unit_price_not_update_flag, outsourcing_invoice_flag, outsourcing_payment_flag, purchase_header_id, working_end_date, closing_date, payment_due_date, payment_date, unpaid_payment_date, notes, created_at, updated_at) FROM stdin;
31	2023-07-18		4	2	3	ZN1002	サンプル２	1	-	\N	\N	1	\N	\N	0	151	\N	1	4	0	0	\N	\N	\N	\N	\N	\N	\N	\N		2023-07-18 14:28:19.679865	2023-07-19 15:21:03.183817
10	2023-06-24	2	4	1	1	<手入力用>	外注費	1	-	1.00	\N	1	10000.00	\N	10000	\N	\N	1	3	\N	0	0	\N	2	\N	\N	\N	\N	\N		2023-06-24 17:41:33.536436	2023-07-03 08:54:48.310839
27	2023-07-18		4	2	2	ZN1001	サンプル１	5	パーナ	-1.00	\N	2	100.00	\N	-100	200	\N	1	4	0	0	\N	\N	\N	\N	\N	\N	\N	\N		2023-07-18 12:01:49.931268	2023-07-19 15:33:50.519102
25	2023-07-18		4	2	2	ZN1001	サンプル１	5	パーナ	3.00	\N	2	100.00	\N	300	200	\N	3	4	\N	0	\N	\N	\N	\N	\N	\N	\N	\N		2023-07-18 11:59:46.131354	2023-07-18 11:59:46.131354
\.


--
-- Data for Name: purchase_divisions; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.purchase_divisions (id, purchase_division_name, purchase_division_long_name, created_at, updated_at) FROM stdin;
2	外注	外注費	2023-07-05 11:00:28.555174	2023-07-05 11:00:28.555174
3	入庫	入庫	2023-07-05 11:00:41.070803	2023-07-05 11:00:41.070803
4	出庫	出庫	2023-07-05 11:00:52.802784	2023-07-05 11:00:52.802784
1	仕入	仕入材料	2023-07-05 13:06:18.093233	2023-07-05 13:06:18.093233
\.


--
-- Data for Name: purchase_headers; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.purchase_headers (id, slip_code, complete_flag, created_at, updated_at) FROM stdin;
2	2	\N	2023-07-03 08:54:48.303264	2023-07-03 08:54:48.303264
3	3	\N	2023-07-03 08:55:07.45491	2023-07-03 08:55:07.45491
4	4	\N	2023-07-03 08:55:19.759678	2023-07-03 08:55:19.759678
1	1	0	2023-07-03 08:45:44.031183	2023-07-10 14:30:15.561149
\.


--
-- Data for Name: purchase_order_data; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.purchase_order_data (id, purchase_order_code, construction_datum_id, supplier_master_id, supplier_responsible_id, alias_name, purchase_order_date, mail_sent_flag, created_at, updated_at) FROM stdin;
5	A2302	3	5	13	Bサンプル工事	\N	0	2023-07-03 08:38:04.151229	2023-07-05 13:34:16.365162
1	-	1	2	9		\N	1	2023-06-24 16:07:18.304486	2023-07-05 13:33:16.502849
4	A2301	2	4	12	Aサン工事	\N	0	2023-06-24 17:40:59.241689	2023-07-10 18:54:31.483968
\.


--
-- Data for Name: purchase_order_histories; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.purchase_order_histories (id, purchase_order_date, supplier_master_id, purchase_order_datum_id, mail_sent_flag, delivery_place_flag, notes, created_at, updated_at) FROM stdin;
1	2023-06-12	2	1	\N	\N		2023-06-12 17:50:27.401616	2023-06-12 17:50:27.401616
2	2023-06-12	2	1	\N	\N		2023-06-12 17:55:31.493576	2023-06-12 17:55:31.493576
3	2023-06-12	2	1	\N	\N		2023-06-12 17:56:01.269651	2023-06-12 17:56:01.269651
4	2023-06-23	2	1	\N	\N		2023-06-23 17:12:49.211645	2023-06-24 13:56:23.665462
5	2023-06-24	2	\N	1	\N	\N	2023-06-24 15:34:42.158786	2023-06-24 15:34:42.158786
6	2023-07-06	4	4	\N	\N		2023-07-06 09:59:59.934334	2023-07-06 09:59:59.934334
7	2023-07-06	4	4	\N	\N		2023-07-06 10:30:53.662959	2023-07-06 10:30:53.662959
8	2023-07-06	4	4	\N	\N		2023-07-06 10:31:09.385158	2023-07-06 10:31:09.385158
9	2023-07-07	4	4	\N	\N		2023-07-07 16:03:59.20436	2023-07-07 16:03:59.20436
10	2023-07-07	4	4	\N	\N		2023-07-07 16:04:11.401739	2023-07-07 16:04:11.401739
11	2023-07-07	4	4	\N	\N		2023-07-07 16:04:24.0304	2023-07-07 16:04:24.0304
12	2023-07-07	4	4	\N	\N		2023-07-07 16:04:28.639833	2023-07-07 16:04:28.639833
13	2023-07-07	4	4	\N	\N		2023-07-07 16:04:37.536615	2023-07-07 16:04:37.536615
14	2023-07-07	5	5	\N	\N		2023-07-07 17:26:56.316796	2023-07-07 17:26:56.316796
15	2023-07-07	5	5	\N	\N		2023-07-07 17:31:36.103278	2023-07-07 17:31:36.103278
16	2023-07-07	5	5	\N	\N		2023-07-07 17:31:44.058895	2023-07-07 17:31:44.058895
17	2023-07-07	5	5	\N	\N		2023-07-07 17:32:01.407732	2023-07-07 17:32:01.407732
18	2023-07-07	5	5	\N	\N		2023-07-07 17:39:15.775171	2023-07-07 17:39:15.775171
19	2023-07-07	5	5	\N	\N		2023-07-07 17:39:24.772687	2023-07-07 17:39:24.772687
20	2023-07-07	5	5	\N	\N		2023-07-07 17:41:15.295496	2023-07-07 17:41:15.295496
21	2023-07-07	5	5	\N	\N		2023-07-07 17:41:37.319615	2023-07-07 17:41:37.319615
22	2023-07-07	5	5	\N	\N		2023-07-07 17:48:06.682129	2023-07-07 17:48:06.682129
23	2023-07-07	5	5	\N	\N		2023-07-07 17:48:12.451117	2023-07-07 17:48:12.451117
24	2023-07-07	5	5	\N	\N		2023-07-07 17:48:16.367533	2023-07-07 17:48:16.367533
25	2023-07-07	5	5	\N	\N		2023-07-07 17:48:27.237145	2023-07-07 17:48:27.237145
26	2023-07-07	5	5	\N	\N		2023-07-07 17:48:39.213446	2023-07-07 17:48:39.213446
27	2023-07-07	5	5	\N	\N		2023-07-07 17:49:02.821314	2023-07-07 17:49:02.821314
28	2023-07-07	5	5	\N	\N		2023-07-07 17:49:14.839817	2023-07-07 17:49:14.839817
29	2023-07-07	5	5	\N	\N		2023-07-07 17:50:28.728224	2023-07-07 17:50:28.728224
30	2023-07-07	5	5	\N	\N		2023-07-07 18:39:33.744359	2023-07-07 18:39:33.744359
31	2023-07-07	5	5	\N	\N		2023-07-07 18:39:47.476741	2023-07-07 18:39:47.476741
32	2023-07-07	5	5	\N	\N		2023-07-07 18:40:40.028548	2023-07-07 18:40:40.028548
33	2023-07-07	5	5	\N	\N		2023-07-07 18:46:57.086804	2023-07-07 18:46:57.086804
37	2023-07-08	4	4	\N	\N		2023-07-08 09:51:10.249958	2023-07-08 09:51:10.249958
38	2023-07-19	5	5	\N	\N		2023-07-19 15:47:38.860788	2023-07-19 15:47:38.860788
39	2023-07-19	5	5	\N	\N		2023-07-19 15:48:16.63459	2023-07-19 15:48:16.63459
40	2023-07-19	5	5	\N	\N		2023-07-19 15:50:11.696657	2023-07-19 15:50:11.696657
41	2023-07-19	5	5	\N	\N		2023-07-19 15:52:40.294182	2023-07-19 15:52:40.294182
42	2023-07-19	5	5	\N	\N		2023-07-19 15:56:20.063166	2023-07-19 15:56:20.063166
43	2023-07-19	5	5	\N	\N		2023-07-19 15:56:54.756278	2023-07-19 15:56:54.756278
44	2023-07-19	5	5	\N	\N		2023-07-19 15:57:01.726583	2023-07-19 15:57:01.726583
45	2023-07-19	5	5	\N	\N		2023-07-19 15:58:02.399891	2023-07-19 15:58:02.399891
46	2023-07-19	5	5	\N	\N		2023-07-19 15:58:43.159102	2023-07-19 15:58:43.159102
47	2023-07-19	5	5	\N	\N		2023-07-19 15:59:45.951315	2023-07-19 15:59:45.951315
48	2023-07-19	5	5	\N	\N		2023-07-19 16:03:07.525859	2023-07-19 16:03:07.525859
\.


--
-- Data for Name: purchase_unit_prices; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.purchase_unit_prices (id, supplier_id, material_id, supplier_material_code, unit_price, list_price, unit_id, created_at, updated_at) FROM stdin;
2	4	1	<手入力用>	1000.00	\N	2	2023-06-08 18:09:48.060093	2023-06-08 18:09:48.060093
5	2	3	ZN1002	150.00	\N	2	2023-07-01 17:05:05.059739	2023-07-01 17:05:05.059739
3	3	1	<手入力用>	200.00	\N	2	2023-06-10 11:42:18.053544	2023-07-04 13:30:33.866245
4	2	2	\N	90.00	\N	2	2023-06-12 17:50:26.59913	2023-07-05 08:21:52.433859
9	5	2	\N	0.00	\N	2	2023-07-07 17:26:56.302119	2023-07-07 17:26:56.302119
6	4	2	ZN1001	100.00	\N	2	2023-07-05 13:56:20.617415	2023-07-11 18:13:12.397164
10	4	3	ZN1002	\N	\N	1	2023-07-19 15:21:03.135705	2023-07-19 15:21:03.135705
\.


--
-- Data for Name: quatation_material_headers; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.quatation_material_headers (id, quotation_code, requested_date, construction_datum_id, supplier_master_id, responsible, email, delivery_place_flag, notes_1, notes_2, notes_3, quotation_header_origin_id, total_quotation_price_1, total_quotation_price_2, total_quotation_price_3, total_order_price_1, total_order_price_2, total_order_price_3, supplier_id_1, supplier_id_2, supplier_id_3, supplier_responsible_id_1, supplier_responsible_id_2, supplier_responsible_id_3, quotation_email_flag_1, quotation_email_flag_2, quotation_email_flag_3, order_email_flag_1, order_email_flag_2, order_email_flag_3, all_bid_flag_1, all_bid_flag_2, all_bid_flag_3, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: quotation_detail_large_classifications; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.quotation_detail_large_classifications (id, quotation_header_id, quotation_items_division_id, working_large_item_id, working_specific_middle_item_id, working_large_item_name, working_large_item_short_name, working_middle_item_category_id, working_middle_item_category_id_call, working_middle_item_subcategory_id, working_middle_item_subcategory_id_call, working_large_specification, line_number, quantity, execution_quantity, working_unit_id, working_unit_name, working_unit_price, quote_price, execution_unit_price, execution_price, labor_productivity_unit, labor_productivity_unit_total, last_line_number, remarks, construction_type, piping_wiring_flag, equipment_mounting_flag, labor_cost_flag, created_at, updated_at) FROM stdin;
12	2	1	2	\N	配線Ａテスト	1	2	\N	\N	\N		1	1.00	1.00	2	箇所	100	180	80	130	0.000	0.000	3		0	\N	\N	\N	2023-06-17 16:36:26.063225	2023-06-17 16:43:30.817611
20	7	1	1	1	電気設備工事	1	2	2	\N	\N		1	1.00	1.00	3	式	500000	500000	400000	400000	\N	\N	\N		0	\N	\N	\N	2023-07-12 17:23:24.517331	2023-07-13 14:20:23.542266
21	7	1	1	\N	諸経費	1	2	1	\N	\N		2	1.00	1.00	3	式	50000	50000	30000	30000	\N	\N	\N		0	\N	\N	\N	2023-07-12 17:23:50.692217	2023-07-13 14:20:23.567359
22	7	1	6	\N	test3	6	1	1	\N	\N		4	1.00	1.00	3	式	100	100	80	80	\N	\N	\N		0	\N	\N	\N	2023-07-19 17:08:10.213194	2023-07-19 17:08:10.213194
25	8	1	6	\N	配線3	6	1	1	\N	\N		3	1.00	1.00	3	式	100	100	80	80	\N	\N	\N		0	\N	\N	\N	2023-07-19 17:14:03.842313	2023-07-19 17:14:03.842313
23	8	1	6	\N	配線１	6	1	1	\N	\N		1	1.00	1.00	3	式	80	80	50	50	0.800	0.800	\N		0	\N	\N	\N	2023-07-19 17:13:30.899229	2023-07-19 18:11:22.855437
24	8	1	6	\N	配線2	6	1	1	\N	\N		2	1.00	1.00	3	式	100	100	80	80	0.800	0.800	\N		0	\N	\N	\N	2023-07-19 17:13:45.35775	2023-07-19 18:19:03.009068
\.


--
-- Data for Name: quotation_detail_middle_classifications; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.quotation_detail_middle_classifications (id, quotation_header_id, quotation_detail_large_classification_id, quotation_items_division_id, working_middle_item_id, working_specific_middle_item_id, working_middle_item_name, working_middle_item_short_name, working_middle_item_category_id, working_middle_item_category_id_call, working_middle_item_subcategory_id, working_middle_item_subcategory_id_call, line_number, working_middle_specification, quantity, execution_quantity, working_unit_id, working_unit_name, working_unit_price, quote_price, execution_unit_price, execution_price, material_id, quotation_material_name, material_unit_price, labor_unit_price, labor_productivity_unit, labor_productivity_unit_total, material_quantity, accessory_cost, material_cost_total, labor_cost_total, other_cost, remarks, construction_type, piping_wiring_flag, equipment_mounting_flag, labor_cost_flag, created_at, updated_at) FROM stdin;
2	2	12	1	2	\N	配線Ａ	1	2	\N	\N	\N	1		1	1	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-17 16:37:37.181217	2023-06-17 16:37:37.181217
3	2	12	1	2	\N	配線B	1	2	\N	\N	\N	2		1	1	2	箇所	80	80	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-17 16:38:13.12804	2023-06-17 16:38:13.12804
4	2	12	1	1	\N	小計	1	1	\N	\N	\N	3		1	1	1	<手入力>	\N	180	\N	130	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N		1	0	0	0	2023-06-17 16:43:30.291048	2023-06-17 16:43:30.291048
\.


--
-- Data for Name: quotation_headers; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.quotation_headers (id, quotation_code, invoice_code, delivery_slip_code, quotation_header_origin_id, quotation_date, construction_datum_id, construction_name, customer_id, customer_name, honorific_id, responsible1, responsible2, post, address, house_number, address2, tel, fax, construction_period, construction_period_date1, construction_period_date2, construction_post, construction_place, construction_house_number, construction_place2, trading_method, effective_period, quote_price, execution_amount, net_amount, last_line_number, category_saved_flag, category_saved_id, subcategory_saved_id, invoice_period_start_date, invoice_period_end_date, fixed_flag, not_sum_flag, created_at, updated_at) FROM stdin;
7	2023070101			\N	2023-07-01	2	Aサンプル工事	2	株式会社サンプル得意先A	0	試験太郎		〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N	〒955-0013	新潟県三条市井栗	1丁目				550100	430080	\N	4	1	1	\N	\N	\N	0	0	2023-07-12 14:32:53.108023	2023-07-19 17:08:10.330501
2	2023070102			\N	2023-07-01	2	Bサンプル工事	2	株式会社サンプル得意先A	0	試験太郎		〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N							180000	130000	\N	1	1	\N	\N	\N	\N	0	0	2023-05-23 10:28:33.542066	2023-07-12 16:43:45.255528
8	2023071901			\N	\N	2	Aサンプル工事	2	株式会社サンプル得意先A	0	試験太郎		〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N	〒955-0013	新潟県三条市井栗	1丁目				280	210	\N	3	1	1	\N	\N	\N	0	0	2023-07-19 17:13:06.968599	2023-07-19 18:19:03.060435
\.


--
-- Data for Name: quotation_material_details; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.quotation_material_details (id, quotation_material_header_id, material_id, material_code, material_name, maker_id, maker_name, quantity, unit_master_id, list_price, quotation_unit_price_1, quotation_unit_price_2, quotation_unit_price_3, quotation_price_1, quotation_price_2, quotation_price_3, bid_flag_1, bid_flag_2, bid_flag_3, mail_sent_flag, quotation_email_flag_1, quotation_email_flag_2, quotation_email_flag_3, order_email_flag_1, order_email_flag_2, order_email_flag_3, sequential_id, created_at, updated_at) FROM stdin;
14	1	2	ZN1001	ZN10011	2	パーナ	10	2	200	300	\N	\N	3000	\N	\N	1	0	0	\N	1	0	0	1	0	0	1	2023-07-06 10:39:05.95063	2023-07-06 10:39:05.95063
15	2	3	ZN1002	サンプル２	2	パーナ	3	2	151	\N	\N	\N	\N	\N	\N	0	0	0	\N	0	0	0	0	0	0	1	2023-07-08 11:29:45.556173	2023-07-08 11:29:45.556173
16	2	4	ZN1003	サンプル３	2	パーナ	1	2	150	\N	\N	\N	\N	\N	\N	0	0	0	\N	0	0	0	0	0	0	2	2023-07-08 11:29:45.575576	2023-07-08 11:29:45.575576
107	3	4	ZN1003	サンプル３	2	パーナ	1	2	150	50	\N	\N	50	\N	\N	1	0	0	\N	1	0	0	1	0	0	1	2023-07-08 15:43:30.239868	2023-07-08 15:43:30.239868
108	3	3	ZN1002	サンプル２	2	パーナ	3	2	151	100	\N	\N	300	\N	\N	1	0	0	\N	1	0	0	1	0	0	2	2023-07-08 15:43:30.254277	2023-07-08 15:43:30.254277
\.


--
-- Data for Name: quotation_material_headers; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.quotation_material_headers (id, quotation_code, requested_date, construction_datum_id, supplier_master_id, responsible, email, delivery_place_flag, notes_1, notes_2, notes_3, quotation_header_origin_id, total_quotation_price_1, total_quotation_price_2, total_quotation_price_3, total_order_price_1, total_order_price_2, total_order_price_3, supplier_id_1, supplier_id_2, supplier_id_3, supplier_responsible_id_1, supplier_responsible_id_2, supplier_responsible_id_3, quotation_email_flag_1, quotation_email_flag_2, quotation_email_flag_3, order_email_flag_1, order_email_flag_2, order_email_flag_3, all_bid_flag_1, all_bid_flag_2, all_bid_flag_3, created_at, updated_at) FROM stdin;
1	2023062401	2023-06-24	2	2	9	9	\N		\N	\N	\N	3000	0	0	3000	0	0	2	\N	\N	0	\N	\N	1	0	0	1	0	0	\N	\N	\N	2023-06-24 14:19:04.722708	2023-07-06 10:33:14.339991
2	2023070801	2023-07-08	2	4	12	12	\N	\N	\N	\N	\N	0	0	0	0	0	0	4	\N	\N	\N	\N	\N	0	0	0	0	0	0	\N	\N	\N	2023-07-08 11:29:45.535711	2023-07-08 11:29:45.535711
3	2023070801	2023-07-08	2	4	12	12	\N		\N	\N	\N	350	0	0	350	0	0	4	\N	\N	\N	\N	\N	1	0	0	1	0	0	\N	\N	\N	2023-07-08 11:29:59.684794	2023-07-08 14:37:28.498659
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.schema_migrations (version) FROM stdin;
20230511051352
20230511055924
20230511062850
20230511064304
20230511070022
20230511085053
20230511090504
20230511091812
20230511235451
20230512000655
20230512001930
20230512002752
20230512005401
20230512014743
20230512020204
20230512024053
20230512025843
20230512043758
20230512052648
20230512054712
20230512055615
20230512063900
20230512072558
20230512073738
20230512090242
20230512091531
20230512233141
20230513072625
20230515085944
20230515090258
20230515091837
20230515094651
20230516092557
20230520085506
20230522091904
20230522093240
20230523081613
20230523090236
20230523092003
20230523094728
20230525000149
20230525002446
20230530085641
20230603044917
20230603054415
20230603072720
20230603081626
20230606075612
20230606093400
20230607002223
20230607013047
20230607024432
20230607025419
20230608070258
20230609024606
20230609054753
20230610004605
20230613022637
20230613065851
20230616070017
20230620004420
20230623053053
20230624024333
20230630071729
20230701001330
20230713041035
20230713041500
20230714011515
20230714013849
20230719035954
20230719040151
\.


--
-- Data for Name: sites; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.sites (id, name, post, address, house_number, address2, created_at, updated_at) FROM stdin;
13	ああ					2023-07-11 17:30:21.489034	2023-07-11 17:30:21.489034
14	いい					2023-07-11 17:30:29.692977	2023-07-11 17:30:29.692977
15	うう					2023-07-11 17:30:38.565242	2023-07-11 17:30:38.565242
16	ええ					2023-07-11 17:30:47.911254	2023-07-11 17:30:47.911254
\.


--
-- Data for Name: staffs; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.staffs (id, staff_name, furigana, affiliation_id, hourly_wage, daily_pay, supplier_master_id, created_at, updated_at) FROM stdin;
2	外注太郎	がいちゅうたろう	\N	\N	16000	4	2023-06-09 13:36:11.365907	2023-06-09 13:48:53.696212
3	外注次郎	がいちゅうじろう	\N	\N	15000	3	2023-06-12 12:00:30.185146	2023-06-12 12:01:00.806658
4	外注三郎	がいちゅうさぶろう	\N	\N	13000	3	2023-06-12 14:22:57.107736	2023-06-12 14:23:11.272328
1	サンプル太郎	サンプル　タロウ	\N	\N	10000	\N	2023-06-09 11:56:56.514446	2023-07-06 17:26:25.150586
\.


--
-- Data for Name: stocktakes; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.stocktakes (id, stocktake_date, material_master_id, inventory_id, physical_quantity, unit_price, physical_amount, book_quantity, book_amount, inventory_update_flag, created_at, updated_at) FROM stdin;
2	2023-07-05	\N	\N	10.00	150.00	1500	\N	\N	\N	2023-07-05 08:55:34.98468	2023-07-05 08:55:34.98468
1	2023-07-04	2	1	8.00	50.00	400	10.00	500	1	2023-07-04 14:57:44.8391	2023-07-20 08:55:46.360629
\.


--
-- Data for Name: supplier_masters; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.supplier_masters (id, supplier_name, tel_main, fax_main, email_main, responsible1, email1, responsible2, email2, responsible3, email3, responsible_cc, email_cc, search_character, outsourcing_flag, post, address, bank_name, bank_branch_name, account_type, account_number, holder, responsible_title, responsible_name, created_at, updated_at) FROM stdin;
1	-				\N	\N	\N	\N	\N	\N				0					\N		\N	\N	\N	2023-06-10 09:58:33.646385	2023-06-10 09:59:27.201608
3	外注サンプル電気	1111-22-3333			\N	\N	\N	\N	\N	\N				1	〒955-0024	新潟県三条市柳沢１丁目	テスト銀行	サンプル支店	0	1234567	オヤカタジロウ	\N	親方次郎	2023-06-10 10:04:29.476662	2023-06-10 16:24:20.882484
2	自社				\N	\N	\N	\N	\N	\N				0					\N			\N		2023-06-10 10:00:35.557301	2023-07-05 13:15:27.235292
4	株式会社サンプルA				\N	\N	\N	\N	\N	\N				0					\N			\N		2023-07-01 16:06:38.324542	2023-07-05 13:15:40.266144
5	株式会社サンプルB				\N	\N	\N	\N	\N	\N				0					\N			\N		2023-07-01 16:07:26.891414	2023-07-05 13:16:23.217328
\.


--
-- Data for Name: supplier_responsibles; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.supplier_responsibles (id, supplier_master_id, responsible_name, responsible_email, created_at, updated_at) FROM stdin;
8	1			2023-06-10 09:58:33.796309	2023-06-10 09:58:33.796309
9	2			2023-06-10 10:00:35.900299	2023-06-10 10:00:35.900299
10	3			2023-06-10 10:04:29.623045	2023-06-10 10:04:29.623045
11	2			2023-06-23 17:13:02.186522	2023-06-23 17:13:02.186522
13	5			2023-07-01 16:07:26.899536	2023-07-01 16:07:26.899536
12	4	山田		2023-07-01 16:06:38.342221	2023-07-07 16:43:53.414662
\.


--
-- Data for Name: unit_masters; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.unit_masters (id, unit_name, created_at, updated_at) FROM stdin;
1	-	2023-05-12 09:21:19.086178	2023-05-12 09:21:19.086178
2	個	2023-05-12 09:21:38.222261	2023-05-12 09:21:38.222261
4	ｍ	2023-07-13 15:28:40.109366	2023-07-13 15:28:40.109366
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.users (id, name, email, password_digest, created_at, updated_at) FROM stdin;
6	admin		$2a$12$9pU46QyHPUVLvEYw.0obO.BVp7F3/NdiqegV/5LyDhP0/e3MFlpwO	2023-07-15 09:12:02.562051	2023-07-15 09:12:02.562051
5	adusu	adusu-info@eos.ocn.ne.jp	$2a$12$AB1X7gUPyhqwdNktGdsZXuRes2wrTNPKZrrQxM383a22Rk6WkxU7y	2023-07-01 13:51:28.778385	2023-07-15 09:19:58.84932
\.


--
-- Data for Name: working_categories; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_categories (id, category_name, seq, created_at, updated_at) FROM stdin;
1	未選択	1	2023-05-25 08:35:58.604409	2023-07-12 18:00:08.779847
2	配線	2	2023-06-16 11:36:37.602856	2023-07-12 18:00:08.800233
\.


--
-- Data for Name: working_middle_items; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_middle_items (id, working_middle_item_name, working_middle_item_short_name, working_middle_item_category_id, working_subcategory_id, working_middle_specification, working_unit_id, working_unit_name, working_unit_price, execution_unit_price, material_id, working_material_name, execution_material_unit_price, material_unit_price, execution_labor_unit_price, labor_unit_price, labor_unit_price_standard, labor_productivity_unit, labor_productivity_unit_total, material_quantity, accessory_cost, material_cost_total, labor_cost_total, other_cost, seq, created_at, updated_at) FROM stdin;
6	<手入力>1111		1	\N		1	<手入力>	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-19 14:59:44.571929	2023-07-19 15:00:30.503133
8	<手入力>1111(コピー)		1	\N		1	<手入力>	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-19 15:02:55.817299	2023-07-19 15:02:55.817299
\.


--
-- Data for Name: working_safety_matters; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_safety_matters (id, working_safety_matter_name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: working_small_items; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_small_items (id, working_middle_item_id, working_small_item_id, working_small_item_code, working_small_item_name, rate, unit_price, quantity, material_price, maker_master_id, unit_master_id, labor_productivity_unit, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: working_specific_middle_items; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_specific_middle_items (id, quotation_header_id, delivery_slip_header_id, working_middle_item_name, working_middle_item_short_name, working_middle_item_category_id, working_subcategory_id, working_middle_specification, working_unit_id, working_unit_name, working_unit_price, execution_unit_price, material_id, working_material_name, execution_material_unit_price, material_unit_price, execution_labor_unit_price, labor_unit_price, labor_unit_price_standard, labor_productivity_unit, labor_productivity_unit_total, material_cost_total, seq, created_at, updated_at) FROM stdin;
1	7	\N	配線Ａ		2	\N		2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-13 13:29:00.84258	2023-07-13 13:29:00.84258
\.


--
-- Data for Name: working_specific_small_items; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_specific_small_items (id, working_specific_middle_item_id, working_small_item_id, working_small_item_code, working_small_item_name, unit_price, rate, quantity, material_price, maker_master_id, unit_master_id, labor_productivity_unit, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: working_subcategories; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_subcategories (id, working_category_id, name, seq, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: working_times; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_times (id, employment_status_id, working_time_start_time, working_time_end_time, overtime_start_time, overtime_end_time, overtime_early_start_time, overtime_early_end_time, overtime_midnight_start_time, overtime_midnight_end_time, break_time_1_start_time, break_time_1_end_time, break_time_2_start_time, break_time_2_end_time, break_time_3_start_time, break_time_3_end_time, created_at, updated_at) FROM stdin;
2	\N	08:00:00	17:30:00	18:00:00	22:00:00	05:00:00	08:00:00	22:00:00	05:00:00	10:00:00	10:30:00	12:00:00	13:00:00	15:00:00	15:30:00	2023-07-03 08:43:36.179898	2023-07-03 08:44:01.266386
\.


--
-- Data for Name: working_units; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_units (id, working_unit_name, seq, created_at, updated_at) FROM stdin;
1	<手入力>	1	2023-05-25 08:26:05.653064	2023-05-25 08:26:05.918459
2	箇所	2	2023-06-01 07:53:21.888929	2023-06-01 07:53:23.960956
3	式	\N	2023-07-01 17:39:39.970896	2023-07-01 17:39:39.970896
\.


--
-- Name: affiliations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.affiliations_id_seq', 6, true);


--
-- Name: business_holidays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.business_holidays_id_seq', 1, false);


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, true);


--
-- Name: constants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.constants_id_seq', 17, true);


--
-- Name: construction_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.construction_attachments_id_seq', 1, false);


--
-- Name: construction_costs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.construction_costs_id_seq', 7, true);


--
-- Name: construction_daily_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.construction_daily_reports_id_seq', 5, true);


--
-- Name: construction_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.construction_data_id_seq', 6, true);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.contacts_id_seq', 14, true);


--
-- Name: customer_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.customer_masters_id_seq', 9, true);


--
-- Name: delivery_slip_detail_large_classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.delivery_slip_detail_large_classifications_id_seq', 90, true);


--
-- Name: delivery_slip_detail_middle_classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.delivery_slip_detail_middle_classifications_id_seq', 73, true);


--
-- Name: delivery_slip_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.delivery_slip_headers_id_seq', 2, true);


--
-- Name: inventories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.inventories_id_seq', 7, true);


--
-- Name: inventory_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.inventory_categories_id_seq', 2, true);


--
-- Name: inventory_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.inventory_histories_id_seq', 18, true);


--
-- Name: invoice_detail_large_classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.invoice_detail_large_classifications_id_seq', 15, true);


--
-- Name: invoice_detail_middle_classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.invoice_detail_middle_classifications_id_seq', 7, true);


--
-- Name: invoice_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.invoice_headers_id_seq', 4, true);


--
-- Name: maker_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.maker_masters_id_seq', 5, true);


--
-- Name: material_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.material_categories_id_seq', 4, true);


--
-- Name: material_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.material_masters_id_seq', 12, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.orders_id_seq', 114, true);


--
-- Name: outsourcing_costs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.outsourcing_costs_id_seq', 7, true);


--
-- Name: purchase_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.purchase_data_id_seq', 31, true);


--
-- Name: purchase_divisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.purchase_divisions_id_seq', 12, true);


--
-- Name: purchase_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.purchase_headers_id_seq', 6, true);


--
-- Name: purchase_order_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.purchase_order_data_id_seq', 7, true);


--
-- Name: purchase_order_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.purchase_order_histories_id_seq', 48, true);


--
-- Name: purchase_unit_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.purchase_unit_prices_id_seq', 10, true);


--
-- Name: quatation_material_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.quatation_material_headers_id_seq', 1, false);


--
-- Name: quotation_detail_large_classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.quotation_detail_large_classifications_id_seq', 25, true);


--
-- Name: quotation_detail_middle_classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.quotation_detail_middle_classifications_id_seq', 10, true);


--
-- Name: quotation_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.quotation_headers_id_seq', 8, true);


--
-- Name: quotation_material_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.quotation_material_details_id_seq', 108, true);


--
-- Name: quotation_material_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.quotation_material_headers_id_seq', 3, true);


--
-- Name: sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.sites_id_seq', 16, true);


--
-- Name: staffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.staffs_id_seq', 5, true);


--
-- Name: stocktakes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.stocktakes_id_seq', 2, true);


--
-- Name: supplier_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.supplier_masters_id_seq', 6, true);


--
-- Name: supplier_responsibles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.supplier_responsibles_id_seq', 14, true);


--
-- Name: unit_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.unit_masters_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: working_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_categories_id_seq', 3, true);


--
-- Name: working_middle_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_middle_items_id_seq', 8, true);


--
-- Name: working_safety_matters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_safety_matters_id_seq', 1, false);


--
-- Name: working_small_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_small_items_id_seq', 1, false);


--
-- Name: working_specific_middle_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_specific_middle_items_id_seq', 1, true);


--
-- Name: working_specific_small_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_specific_small_items_id_seq', 1, false);


--
-- Name: working_subcategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_subcategories_id_seq', 1, true);


--
-- Name: working_times_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_times_id_seq', 2, true);


--
-- Name: working_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_units_id_seq', 3, true);


--
-- Name: affiliations affiliations_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.affiliations
    ADD CONSTRAINT affiliations_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: business_holidays business_holidays_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.business_holidays
    ADD CONSTRAINT business_holidays_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: constants constants_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.constants
    ADD CONSTRAINT constants_pkey PRIMARY KEY (id);


--
-- Name: construction_attachments construction_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.construction_attachments
    ADD CONSTRAINT construction_attachments_pkey PRIMARY KEY (id);


--
-- Name: construction_costs construction_costs_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.construction_costs
    ADD CONSTRAINT construction_costs_pkey PRIMARY KEY (id);


--
-- Name: construction_daily_reports construction_daily_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.construction_daily_reports
    ADD CONSTRAINT construction_daily_reports_pkey PRIMARY KEY (id);


--
-- Name: construction_data construction_data_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.construction_data
    ADD CONSTRAINT construction_data_pkey PRIMARY KEY (id);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: customer_masters customer_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.customer_masters
    ADD CONSTRAINT customer_masters_pkey PRIMARY KEY (id);


--
-- Name: delivery_slip_detail_large_classifications delivery_slip_detail_large_classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.delivery_slip_detail_large_classifications
    ADD CONSTRAINT delivery_slip_detail_large_classifications_pkey PRIMARY KEY (id);


--
-- Name: delivery_slip_detail_middle_classifications delivery_slip_detail_middle_classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.delivery_slip_detail_middle_classifications
    ADD CONSTRAINT delivery_slip_detail_middle_classifications_pkey PRIMARY KEY (id);


--
-- Name: delivery_slip_headers delivery_slip_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.delivery_slip_headers
    ADD CONSTRAINT delivery_slip_headers_pkey PRIMARY KEY (id);


--
-- Name: inventories inventories_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.inventories
    ADD CONSTRAINT inventories_pkey PRIMARY KEY (id);


--
-- Name: inventory_categories inventory_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.inventory_categories
    ADD CONSTRAINT inventory_categories_pkey PRIMARY KEY (id);


--
-- Name: inventory_histories inventory_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.inventory_histories
    ADD CONSTRAINT inventory_histories_pkey PRIMARY KEY (id);


--
-- Name: invoice_detail_large_classifications invoice_detail_large_classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.invoice_detail_large_classifications
    ADD CONSTRAINT invoice_detail_large_classifications_pkey PRIMARY KEY (id);


--
-- Name: invoice_detail_middle_classifications invoice_detail_middle_classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.invoice_detail_middle_classifications
    ADD CONSTRAINT invoice_detail_middle_classifications_pkey PRIMARY KEY (id);


--
-- Name: invoice_headers invoice_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.invoice_headers
    ADD CONSTRAINT invoice_headers_pkey PRIMARY KEY (id);


--
-- Name: maker_masters maker_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.maker_masters
    ADD CONSTRAINT maker_masters_pkey PRIMARY KEY (id);


--
-- Name: material_categories material_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.material_categories
    ADD CONSTRAINT material_categories_pkey PRIMARY KEY (id);


--
-- Name: material_masters material_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.material_masters
    ADD CONSTRAINT material_masters_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: outsourcing_costs outsourcing_costs_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.outsourcing_costs
    ADD CONSTRAINT outsourcing_costs_pkey PRIMARY KEY (id);


--
-- Name: purchase_data purchase_data_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.purchase_data
    ADD CONSTRAINT purchase_data_pkey PRIMARY KEY (id);


--
-- Name: purchase_divisions purchase_divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.purchase_divisions
    ADD CONSTRAINT purchase_divisions_pkey PRIMARY KEY (id);


--
-- Name: purchase_headers purchase_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.purchase_headers
    ADD CONSTRAINT purchase_headers_pkey PRIMARY KEY (id);


--
-- Name: purchase_order_data purchase_order_data_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.purchase_order_data
    ADD CONSTRAINT purchase_order_data_pkey PRIMARY KEY (id);


--
-- Name: purchase_order_histories purchase_order_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.purchase_order_histories
    ADD CONSTRAINT purchase_order_histories_pkey PRIMARY KEY (id);


--
-- Name: purchase_unit_prices purchase_unit_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.purchase_unit_prices
    ADD CONSTRAINT purchase_unit_prices_pkey PRIMARY KEY (id);


--
-- Name: quatation_material_headers quatation_material_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.quatation_material_headers
    ADD CONSTRAINT quatation_material_headers_pkey PRIMARY KEY (id);


--
-- Name: quotation_detail_large_classifications quotation_detail_large_classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.quotation_detail_large_classifications
    ADD CONSTRAINT quotation_detail_large_classifications_pkey PRIMARY KEY (id);


--
-- Name: quotation_detail_middle_classifications quotation_detail_middle_classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.quotation_detail_middle_classifications
    ADD CONSTRAINT quotation_detail_middle_classifications_pkey PRIMARY KEY (id);


--
-- Name: quotation_headers quotation_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.quotation_headers
    ADD CONSTRAINT quotation_headers_pkey PRIMARY KEY (id);


--
-- Name: quotation_material_details quotation_material_details_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.quotation_material_details
    ADD CONSTRAINT quotation_material_details_pkey PRIMARY KEY (id);


--
-- Name: quotation_material_headers quotation_material_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.quotation_material_headers
    ADD CONSTRAINT quotation_material_headers_pkey PRIMARY KEY (id);


--
-- Name: sites sites_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.sites
    ADD CONSTRAINT sites_pkey PRIMARY KEY (id);


--
-- Name: staffs staffs_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.staffs
    ADD CONSTRAINT staffs_pkey PRIMARY KEY (id);


--
-- Name: stocktakes stocktakes_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.stocktakes
    ADD CONSTRAINT stocktakes_pkey PRIMARY KEY (id);


--
-- Name: supplier_masters supplier_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.supplier_masters
    ADD CONSTRAINT supplier_masters_pkey PRIMARY KEY (id);


--
-- Name: supplier_responsibles supplier_responsibles_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.supplier_responsibles
    ADD CONSTRAINT supplier_responsibles_pkey PRIMARY KEY (id);


--
-- Name: unit_masters unit_masters_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.unit_masters
    ADD CONSTRAINT unit_masters_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: working_categories working_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_categories
    ADD CONSTRAINT working_categories_pkey PRIMARY KEY (id);


--
-- Name: working_middle_items working_middle_items_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_middle_items
    ADD CONSTRAINT working_middle_items_pkey PRIMARY KEY (id);


--
-- Name: working_safety_matters working_safety_matters_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_safety_matters
    ADD CONSTRAINT working_safety_matters_pkey PRIMARY KEY (id);


--
-- Name: working_small_items working_small_items_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_small_items
    ADD CONSTRAINT working_small_items_pkey PRIMARY KEY (id);


--
-- Name: working_specific_middle_items working_specific_middle_items_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_specific_middle_items
    ADD CONSTRAINT working_specific_middle_items_pkey PRIMARY KEY (id);


--
-- Name: working_specific_small_items working_specific_small_items_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_specific_small_items
    ADD CONSTRAINT working_specific_small_items_pkey PRIMARY KEY (id);


--
-- Name: working_subcategories working_subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_subcategories
    ADD CONSTRAINT working_subcategories_pkey PRIMARY KEY (id);


--
-- Name: working_times working_times_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_times
    ADD CONSTRAINT working_times_pkey PRIMARY KEY (id);


--
-- Name: working_units working_units_pkey; Type: CONSTRAINT; Schema: public; Owner: adusu
--

ALTER TABLE ONLY public.working_units
    ADD CONSTRAINT working_units_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: adusu
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

