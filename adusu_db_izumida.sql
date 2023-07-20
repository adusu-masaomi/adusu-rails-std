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
    id integer NOT NULL,
    working_middle_item_name character varying,
    working_middle_item_short_name character varying,
    working_middle_item_category_id integer,
    working_subcategory_id integer,
    working_middle_specification character varying,
    working_unit_id integer,
    working_unit_name character varying,
    working_unit_price numeric(11,2),
    execution_unit_price integer,
    material_id integer,
    working_material_name character varying,
    execution_material_unit_price numeric(11,2),
    material_unit_price numeric(11,2),
    execution_labor_unit_price numeric(11,2),
    labor_unit_price numeric(11,2),
    labor_unit_price_standard integer,
    labor_productivity_unit numeric(11,4),
    labor_productivity_unit_total numeric(11,4),
    material_quantity integer,
    accessory_cost integer,
    material_cost_total integer,
    labor_cost_total integer,
    other_cost integer,
    seq integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.working_middle_items OWNER TO adusu;

--
-- Name: working_middle_items_id_seq; Type: SEQUENCE; Schema: public; Owner: adusu
--

CREATE SEQUENCE public.working_middle_items_id_seq
    AS integer
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
1	工事部	2023-05-11 15:06:55.807397	2023-05-11 15:06:55.807397
2	2	2023-07-03 11:32:32.895594	2023-07-03 11:32:32.895594
3	3	2023-07-03 11:32:40.4242	2023-07-03 11:32:40.4242
4	4	2023-07-03 11:32:47.079301	2023-07-03 11:32:47.079301
5	5	2023-07-03 11:32:56.9219	2023-07-03 11:32:56.9219
6	6	2023-07-03 11:33:14.867105	2023-07-03 11:33:14.867105
7	7	2023-07-18 14:19:59.964223	2023-07-18 14:19:59.964223
8	8	2023-07-18 14:20:09.930899	2023-07-18 14:20:09.930899
9	9	2023-07-18 14:20:17.457445	2023-07-18 14:20:17.457445
10	10	2023-07-18 14:20:26.137933	2023-07-18 14:20:26.137933
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-07-13 13:35:14.136123	2023-07-13 13:35:14.136123
\.


--
-- Data for Name: business_holidays; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.business_holidays (id, working_date, holiday_flag, created_at, updated_at) FROM stdin;
1	2023-07-06	1	2023-07-06 11:55:08.216475	2023-07-06 11:55:08.216475
2	2023-07-07	1	2023-07-07 09:11:13.329428	2023-07-07 09:11:13.329428
\.


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.companies (id, name, representative_title, representative_name, post, address, house_number, address2, tel, fax, email, invoice_number, estimate_material_cost_rate, estimate_execution_labor_cost, estimate_labor_cost, responsible_order, responsible_estimate, responsible_invoice, responsible_delivery, bank_name_1, bank_branch_name_1, account_type_1, account_number_1, holder_1, bank_name_2, bank_branch_name_2, account_type_2, account_number_2, holder_2, bank_name_3, bank_branch_name_3, account_type_3, account_number_3, holder_3, created_at, updated_at) FROM stdin;
1	株式会社デモサンプル	代表取締役	デモ太郎	〒163-8001	東京都新宿区西新宿2-8-1	\N		9999-88-7777	8888-77-6666			1.35000000000000009	10000	15000	サンプル太郎	\N	\N	\N	アールバンク銀行	ペーペー支店	0	8888888	カ)サンプル	さんさん信用金庫	本店	0	7777777	カ）サンプル	ＵＦＯ銀行	東京中央支店	0	1234567	カ　サンプル	2023-07-18 13:07:26.532194	2023-07-18 13:07:26.532194
\.


--
-- Data for Name: constants; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.constants (id, purchase_order_last_header_code, created_at, updated_at) FROM stdin;
1	A2311	2023-06-24 16:07:13.752305	2023-07-19 10:26:01.181057
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
2	2	0	\N	\N	\N	0	\N		\N	2023-05-23 10:19:25.62166	2023-05-23 10:19:25.62166
3	3	0	\N	\N	\N	0	\N		\N	2023-06-24 16:51:56.536284	2023-06-24 16:51:56.536284
4	4	0	\N	\N	\N	0	\N		\N	2023-07-03 14:30:17.488771	2023-07-03 14:30:17.488771
5	5	0	\N	\N	\N	0	\N		\N	2023-07-03 14:30:35.498454	2023-07-03 14:30:35.498454
6	\N	\N	\N	\N	\N	\N	\N		\N	2023-07-03 14:38:02.46019	2023-07-03 14:38:02.46019
7	6	0	\N	\N	\N	0	\N		\N	2023-07-18 15:09:42.905691	2023-07-18 15:09:42.905691
8	7	0	\N	\N	\N	0	\N		\N	2023-07-18 15:10:07.768903	2023-07-18 15:10:07.768903
9	8	0	\N	\N	\N	0	\N		\N	2023-07-18 15:10:23.538992	2023-07-18 15:10:23.538992
10	9	0	\N	\N	\N	0	\N		\N	2023-07-18 15:10:50.520112	2023-07-18 15:10:50.520112
11	10	0	\N	\N	\N	0	\N		\N	2023-07-18 15:10:59.469288	2023-07-18 15:10:59.469288
12	11	0	\N	\N	\N	0	\N		\N	2023-07-18 15:11:14.0789	2023-07-18 15:11:14.0789
\.


--
-- Data for Name: construction_daily_reports; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.construction_daily_reports (id, working_date, construction_datum_id, staff_id, start_time_1, end_time_1, start_time_2, end_time_2, working_times, man_month, labor_cost, working_details, is_one_day_work, is_no_break_time_1, is_no_break_time_2, is_no_break_time_3, created_at, updated_at) FROM stdin;
1	2023-06-23	2	1	08:00:00	17:00:00	00:00:00	00:00:00	27000	1.0	11332	配線等	0	0	0	0	2023-06-23 14:52:56.140775	2023-07-01 11:49:53.525165
2	2023-07-03	5	1	00:00:00	00:00:00	00:00:00	00:00:00	4	\N	0	aa	0	0	0	0	2023-07-03 14:32:32.901459	2023-07-03 14:32:32.901459
3	2023-07-02	4	3	00:00:00	00:00:00	00:00:00	00:00:00	1	-1.0	\N	bb	0	0	0	0	2023-07-03 14:36:26.750429	2023-07-03 14:36:26.750429
4	2023-07-02	3	3	00:00:00	00:00:00	00:00:00	00:00:00	2	2.0	2	cc	0	0	0	0	2023-07-03 14:37:02.782279	2023-07-03 14:37:02.782279
5	2023-07-03	2	4	00:00:00	00:00:00	00:00:00	00:00:00	4	4.0	3	dd	0	0	0	0	2023-07-03 14:37:31.168708	2023-07-03 14:37:31.168708
6	2023-07-18	9	2	00:00:00	00:00:00	00:00:00	00:00:00	2	\N	0	qas	0	0	0	0	2023-07-18 15:12:01.983568	2023-07-18 15:12:01.983568
7	2023-07-18	9	6	00:00:00	00:00:00	00:00:00	00:00:00	6	\N	0	cxxx	0	0	0	0	2023-07-18 15:12:27.551396	2023-07-18 15:12:27.551396
8	2023-07-18	9	8	00:00:00	00:00:00	00:00:00	00:00:00	6	\N	0	xsdcx	0	0	0	0	2023-07-18 15:12:53.039235	2023-07-18 15:12:53.039235
9	2023-07-03	11	7	00:00:00	00:00:00	00:00:00	00:00:00	2	-2.0	0	fcvvcv	0	0	0	0	2023-07-18 15:13:26.400423	2023-07-18 15:13:26.400423
10	2023-07-18	8	11	00:00:00	00:00:00	00:00:00	00:00:00	2	2.0	0	cvbhh	0	0	0	0	2023-07-18 15:14:09.387207	2023-07-18 15:14:09.387207
\.


--
-- Data for Name: construction_data; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.construction_data (id, construction_code, construction_name, alias_name, reception_date, customer_id, personnel, site_id, construction_start_date, construction_end_date, construction_period_start, construction_period_end, post, address, house_number, address2, latitude, longitude, construction_detail, attention_matter, working_safety_matter_id, working_safety_matter_name, estimated_amount, final_amount, billing_due_date, deposit_due_date, deposit_date, quotation_header_id, delivery_slip_header_id, billed_flag, calculated_flag, order_flag, quotation_flag, created_at, updated_at) FROM stdin;
3	20230003	Cサンプル工事	Cサンプル工事	2023-06-24	5		\N	2023-06-24	2023-07-02	2023-01-01	2023-01-01					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	\N	2023-06-24 16:51:56.391937	2023-07-03 14:37:02.811105
2	20230002	Bサンプル工事	Bサンプル工事	2023-05-23	2		\N	2023-05-23	2023-07-03	2023-01-01	2023-01-01					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	1	2023-05-23 10:19:25.367732	2023-07-03 14:37:31.196072
4	20230004	4	44	2023-07-03	2		\N	2023-07-02	2023-07-02	2023-01-01	2023-01-01					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	1	2023-07-03 14:30:17.473291	2023-07-03 15:15:34.786015
1	20230001	Ａサンプル工事	Ａサンプル工事	2023-05-12	1		\N	2023-05-12	2023-05-17	2023-01-01	2023-01-01					\N	\N	配線工事		\N		\N	\N	\N	\N	\N	\N	\N	0	0	0	1	2023-05-12 15:43:51.040247	2023-07-06 14:41:20.494936
5	20230005	5	55	2023-07-03	5		\N	2023-07-03	2023-07-03	2023-01-01	2023-01-01					\N	\N			1		\N	\N	\N	\N	\N	\N	\N	0	0	0	1	2023-07-03 14:30:35.476926	2023-07-13 15:04:36.264271
6	20230006	5	5	2023-07-18	5		\N	2023-07-18	2000-01-01	2023-01-01	2023-01-01					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6	\N	0	0	0	\N	2023-07-18 15:09:42.868265	2023-07-18 15:09:42.923644
8	20230008	4	4	2023-07-18	2		\N	2023-07-18	2023-07-18	2023-01-01	2023-01-01					\N	\N	\N	\N	\N	\N	-2	\N	\N	\N	\N	8	\N	0	0	0	\N	2023-07-18 15:10:23.522801	2023-07-18 15:14:09.409828
10	20230010	dd	aaa	2023-07-18	8		\N	2023-07-18	2000-01-01	2023-01-01	2023-01-01					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	0	0	0	1	2023-07-18 15:10:59.454871	2023-07-18 15:28:05.865621
11	20230011	5	5	2023-07-18	5		\N	2023-07-03	2023-07-03	2023-01-01	2023-01-01					\N	\N	\N	\N	\N	\N	4	\N	\N	\N	\N	7	\N	0	0	0	1	2023-07-18 15:11:14.058744	2023-07-18 15:28:48.865924
9	20230009	dd	aaa	2023-07-18	8		\N	2023-07-18	2023-07-18	2023-01-01	2023-01-01					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	0	0	0	1	2023-07-18 15:10:50.499921	2023-07-18 15:29:51.402494
7	20230007		bgb	2023-07-18	6		\N	2023-07-18	2000-01-01	2023-01-01	2023-01-01					\N	\N	\N	\N	\N	\N	-2	2	\N	\N	\N	9	\N	0	0	0	\N	2023-07-18 15:10:07.742971	2023-07-19 11:41:04.30883
\.


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.contacts (id, name, search_character, company_name, affiliation, department, post, address, tel, fax, email, url, partner_division_id, created_at, updated_at) FROM stdin;
1			株式会社サンプル得意先Ａ	\N	\N	〒955-0013	新潟県三条市東三条	0120-11-1111			\N	1	2023-05-11 17:53:57.155652	2023-05-11 17:53:57.155652
2			株式会社サンプル得意先B	\N	\N	〒955-0013	新潟県三条市東三条	0120-11-1111			\N	1	2023-05-23 10:19:50.04715	2023-05-23 10:19:50.04715
3			株式会社サンプル得意先C	\N	\N	〒955-0013	新潟県三条市東三条	0120-11-1111			\N	1	2023-06-07 13:36:09.096025	2023-06-07 13:36:09.096025
4			株式会社サンプル得意先Ｄ	\N	\N	〒955-0013	新潟県三条市東三条	0120-11-1111			\N	1	2023-06-07 13:36:27.755897	2023-06-07 13:36:27.755897
5	5											0	2023-07-03 11:35:57.694457	2023-07-03 11:35:57.694457
6	6											0	2023-07-03 11:36:06.871205	2023-07-03 11:36:06.871205
\.


--
-- Data for Name: customer_masters; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.customer_masters (id, customer_name, search_character, post, address, house_number, address2, tel_main, fax_main, email_main, closing_date, closing_date_division, due_date, due_date_division, honorific_id, responsible1, responsible2, contact_id, payment_bank_id, card_not_flag, contractor_flag, public_flag, created_at, updated_at) FROM stdin;
2	株式会社サンプル得意先B		〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			0	0	0	0	0			\N	1	0	0	0	2023-05-20 17:35:59.957922	2023-05-23 10:19:49.788421
5	株式会社サンプル得意先C		〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			0	0	0	0	0			\N	1	0	0	0	2023-06-03 16:03:47.02586	2023-06-07 13:36:08.899406
6	株式会社サンプル得意先Ｄ		〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			0	0	0	0	0			\N	1	0	0	0	2023-06-03 16:06:19.405301	2023-06-07 13:36:27.701337
1	株式会社サンプル得意先Ａ		〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			0	0	0	0	\N			1	1	0	1	0	2023-05-11 17:54:04.139601	2023-06-13 08:44:11.646471
8	株式会社サンプル得意先Ａ	\N	〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	0	\N	0	\N	0			\N	\N	\N	\N	\N	2023-06-23 16:10:13.603308	2023-06-23 16:10:13.603308
9	株式会社サンプル得意先Ａ	\N	〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	0	\N	0	\N	0			\N	\N	\N	\N	\N	2023-07-03 15:13:39.575935	2023-07-03 15:13:39.575935
10	株式会社サンプル得意先Ａ	\N	〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	0	\N	0	\N	0			\N	\N	\N	\N	\N	2023-07-03 15:15:16.685642	2023-07-03 15:15:16.685642
11	株式会社サンプル得意先Ａ	\N	〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	0	\N	0	\N	0			\N	\N	\N	\N	\N	2023-07-03 15:40:18.617033	2023-07-03 15:40:18.617033
12	株式会社サンプル得意先Ａ	\N	〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	0	\N	0	\N	0			\N	\N	\N	\N	\N	2023-07-03 15:40:51.506943	2023-07-03 15:40:51.506943
13	株式会社サンプル得意先Ａ	\N	〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	0	\N	0	\N	0			\N	\N	\N	\N	\N	2023-07-03 15:41:07.981017	2023-07-03 15:41:07.981017
41	jcn									0	0	0	0	\N			\N	\N	\N	0	\N	2023-07-19 14:21:16.291663	2023-07-19 14:21:16.291663
\.


--
-- Data for Name: delivery_slip_detail_large_classifications; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.delivery_slip_detail_large_classifications (id, delivery_slip_header_id, delivery_slip_items_division_id, working_large_item_id, working_specific_middle_item_id, working_large_item_name, working_large_item_short_name, working_middle_item_category_id, working_middle_item_category_id_call, working_middle_item_subcategory_id, working_middle_item_subcategory_id_call, working_large_specification, line_number, quantity, execution_quantity, working_unit_id, working_unit_name, working_unit_price, delivery_slip_price, execution_unit_price, execution_price, labor_productivity_unit, labor_productivity_unit_total, last_line_number, remarks, construction_type, piping_wiring_flag, equipment_mounting_flag, labor_cost_flag, created_at, updated_at) FROM stdin;
91	1	1	1	\N	配線テスト２	1	1	1	\N	\N		1	1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N		0	0	0	0	2023-07-19 14:16:26.526062	2023-07-19 14:16:26.526062
92	1	\N	1	\N	配線テスト３	1	1	\N	\N	\N		2	1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N		0	\N	\N	\N	2023-07-19 14:16:26.544686	2023-07-19 14:16:26.544686
93	1	1	1	\N	配線テスト１	1	1	1	\N	\N		3	1.00	1.00	2	箇所	100	200	80	160	0.000	0.000	2		0	0	0	0	2023-07-19 14:16:26.559523	2023-07-20 09:58:04.157951
94	13	1	1	\N		1	1	\N	\N	\N		1	1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N		0	\N	\N	\N	2023-07-20 10:44:42.177939	2023-07-20 10:44:42.177939
95	13	1	1	\N		1	1	\N	\N	\N		2	1.00	1.00	1	<手入力>	100	200	80	160	0.000	0.000	2		0	\N	\N	\N	2023-07-20 10:44:52.238002	2023-07-20 10:45:18.63659
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
75	1	93	\N	1	\N	2	1	1	\N	\N	\N	2		1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	\N	\N	\N	2023-07-20 09:58:04.063818	2023-07-20 09:58:39.308013
74	1	93	\N	1	\N	1	1	1	\N	\N	\N	1		1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	\N	\N	\N	2023-07-20 09:57:44.777669	2023-07-20 09:58:47.162129
76	13	95	\N	1	\N		1	1	\N	\N	\N	1		1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	\N	\N	\N	2023-07-20 10:45:05.193997	2023-07-20 10:45:05.193997
77	13	95	\N	1	\N		1	1	\N	\N	\N	2		1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	\N	\N	\N	2023-07-20 10:45:18.533956	2023-07-20 10:45:18.533956
\.


--
-- Data for Name: delivery_slip_headers; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.delivery_slip_headers (id, delivery_slip_code, quotation_code, invoice_code, delivery_slip_header_origin_id, delivery_slip_date, construction_datum_id, construction_name, customer_id, customer_name, honorific_id, responsible1, responsible2, post, address, house_number, address2, tel, fax, construction_period, construction_period_date1, construction_period_date2, construction_post, construction_place, construction_house_number, construction_place2, delivery_amount, execution_amount, last_line_number, category_saved_flag, category_saved_id, subcategory_saved_id, fixed_flag, final_return_division, created_at, updated_at) FROM stdin;
1	2023010101			\N	2023-01-01	1	Ａサンプル工事	4	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					300	240	1	1	\N	\N	0	0	2023-06-03 11:03:13.418812	2023-06-19 14:23:48.648715
3	2			\N	\N	\N		16	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					\N	\N	\N	\N	\N	\N	0	0	2023-07-03 15:48:52.084208	2023-07-03 15:48:52.084208
4	3			\N	\N	\N		17	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					\N	\N	\N	\N	\N	\N	0	0	2023-07-03 15:49:03.006005	2023-07-03 15:49:03.006005
5	4			\N	\N	\N		18	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					\N	\N	\N	\N	\N	\N	0	0	2023-07-03 15:50:49.582886	2023-07-03 15:50:49.582886
6	5			\N	\N	\N		19	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					\N	\N	\N	\N	\N	\N	0	0	2023-07-03 15:51:01.021787	2023-07-03 15:51:01.021787
8	7			\N	\N	\N		30	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					\N	\N	\N	\N	\N	\N	0	0	2023-07-18 15:44:02.853999	2023-07-18 15:44:02.853999
9	8			\N	\N	\N		31	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					\N	\N	\N	\N	\N	\N	0	0	2023-07-18 15:44:13.472615	2023-07-18 15:44:13.472615
10	9			\N	\N	\N		32	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					\N	\N	\N	\N	\N	\N	0	0	2023-07-18 15:44:23.321995	2023-07-18 15:44:23.321995
11	10			\N	\N	\N		33	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					\N	\N	\N	\N	\N	\N	0	0	2023-07-18 15:44:34.13585	2023-07-18 15:44:34.13585
12	12			\N	\N	\N		37	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					\N	\N	\N	\N	\N	\N	0	0	2023-07-19 10:59:15.769575	2023-07-19 10:59:15.769575
13	9999999999	\N	9999999999	\N	\N	\N		31	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	\N	\N	\N				\N	\N	2	1	\N	\N	\N	\N	2023-07-19 15:57:57.94312	2023-07-20 10:44:52.302088
\.


--
-- Data for Name: inventories; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.inventories (id, warehouse_id, location_id, material_master_id, inventory_quantity, unit_master_id, inventory_amount, supplier_master_id, current_history_id, current_warehousing_date, current_quantity, current_unit_price, last_warehousing_date, last_unit_price, next_history_id_1, next_warehousing_date_1, next_quantity_1, next_unit_price_1, next_history_id_2, next_warehousing_date_2, next_quantity_2, next_unit_price_2, no_stocktake_flag, image, created_at, updated_at) FROM stdin;
1	1	1	2	10.00	2	500	2	\N	\N	10.00	50.00	\N	50.00	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	2023-06-06 17:27:38.033877	2023-06-06 17:27:38.033877
2	1	1	3	100.00	2	15000	2	\N	\N	100.00	150.00	\N	150.00	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	2023-07-03 14:12:45.354682	2023-07-03 14:12:45.354682
3	1	1	4	2.00	1	5	2	\N	\N	2.00	5.00	\N	3.00	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	2023-07-03 14:21:49.087508	2023-07-03 14:21:49.087508
6	1	1	14	2.00	3	0	3	\N	\N	2.00	4.00	\N	3.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-18 14:57:27.849272	2023-07-18 14:57:27.849272
7	1	1	14	2.00	1	-4	5	\N	\N	-3.00	-4.00	\N	2.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-18 14:58:11.030317	2023-07-18 14:58:11.030317
8	1	1	14	2.00	1	10	6	\N	\N	4.00	5.00	\N	5.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-18 14:58:31.647795	2023-07-18 14:58:31.647795
9	1	1	18	4.00	1	-8	2	\N	\N	4.00	-2.00	\N	-2.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-18 14:58:47.513344	2023-07-18 14:58:47.513344
10	1	1	18	-3.00	1	-9	3	\N	\N	-3.00	3.00	\N	3.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-18 14:59:29.13605	2023-07-18 14:59:29.13605
11	1	1	14	-2.00	1	-2	3	\N	\N	-2.00	2.00	\N	2.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-18 15:00:04.807846	2023-07-18 15:00:04.807846
13	1	1	20	3.00	1	10	4	\N	\N	8.00	12.00	\N	10.00	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-19 10:29:45.671853	2023-07-19 10:29:45.671853
\.


--
-- Data for Name: inventory_categories; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.inventory_categories (id, name, seq, created_at, updated_at) FROM stdin;
1	照明器具	\N	2023-05-12 09:30:23.79892	2023-05-12 09:33:29.617975
2	配線器具	\N	2023-05-12 09:33:44.389506	2023-05-12 09:33:44.389506
5	5	\N	2023-07-03 10:45:06.167196	2023-07-03 10:45:06.167196
6	6	\N	2023-07-03 10:45:14.830466	2023-07-03 10:45:14.830466
4	4	\N	2023-07-03 10:44:55.367665	2023-07-03 10:45:45.493236
3	3	\N	2023-07-03 10:44:47.216486	2023-07-03 10:45:59.626932
7	7	\N	2023-07-18 13:55:03.657177	2023-07-18 13:55:03.657177
8	8	\N	2023-07-18 13:55:11.56259	2023-07-18 13:55:11.56259
9	9	\N	2023-07-18 13:55:20.856074	2023-07-18 13:55:20.856074
10	10	\N	2023-07-18 13:55:29.01974	2023-07-18 13:55:29.01974
12	11	\N	2023-07-19 10:21:47.364405	2023-07-19 10:21:47.364405
\.


--
-- Data for Name: inventory_histories; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.inventory_histories (id, inventory_date, inventory_division_id, construction_datum_id, material_master_id, quantity, inventory_quantity, unit_master_id, unit_price, price, supplier_master_id, slip_code, purchase_datum_id, previous_quantity, previous_unit_price, current_quantity, current_unit_price, current_history_id, current_warehousing_date, next_quantity_1, next_unit_price_1, next_history_id_1, next_warehousing_date_1, created_at, updated_at) FROM stdin;
1	2023-07-03	0	1	2	11.00	\N	2	\N	0	2		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-03 13:26:27.037855	2023-07-03 13:45:06.66402
2	2023-07-03	0	2	1	\N	\N	2	1.00	0	6		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-03 13:53:43.508705	2023-07-03 13:53:43.508705
3	2023-07-03	0	3	1	\N	\N	2	2.00	0	4		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-03 13:54:34.507348	2023-07-03 13:54:34.507348
4	2023-07-03	0	1	1	3.00	\N	2	0.00	0	1		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-03 13:55:13.861023	2023-07-03 13:55:13.861023
5	2023-07-03	0	3	1	\N	\N	\N	4.00	0	1		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-03 13:55:40.179775	2023-07-03 13:55:40.179775
8	2023-07-18	0	1	17	5.00	\N	3	\N	0	2		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-18 16:10:58.228281	2023-07-18 16:10:58.228281
9	2023-07-19	0	2	17	7.00	\N	3	-3.00	-21	4		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-19 10:30:24.537964	2023-07-19 10:30:24.537964
10	2023-07-19	0	5	22	-10.00	\N	4	3.00	-30	3		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-19 10:30:55.848641	2023-07-19 10:30:55.848641
11	2023-07-19	0	2	14	9.00	\N	2	-5.00	-45	4		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-19 10:31:14.494073	2023-07-19 10:31:14.494073
12	2023-07-19	0	6	16	7.00	\N	4	\N	5	9		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-19 10:31:32.063563	2023-07-19 10:31:32.063563
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
16	10	1	4	pp	1	fff	1	1.00	1.00	2	箇所	\N	\N	\N	\N	\N	\N	\N	\N	6	0	\N	\N	\N	2023-07-18 15:59:32.064561	2023-07-18 15:59:51.31568
17	12	1	1	納品書No.2	1		2	1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N	\N	3	0	\N	\N	\N	2023-07-18 16:07:21.767286	2023-07-18 16:07:21.767286
18	12	1	1	納品書No.4	1		3	1.00	1.00	2	箇所	50	50	40	40	\N	\N	\N	\N	5	0	\N	\N	\N	2023-07-18 16:07:35.451289	2023-07-18 16:07:35.451289
19	14	1	1		1	1	1	1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N	\N	\N	0	\N	\N	\N	2023-07-20 09:52:05.13515	2023-07-20 09:52:05.13515
20	11	1	1	1	2		2	1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N	\N	\N	0	\N	\N	\N	2023-07-20 09:59:43.255208	2023-07-20 10:09:51.476204
15	11	1	4	aa	4		1	1.00	1.00	2	箇所	100	200	80	160	0.000	0.000	2	\N	6	0	\N	\N	\N	2023-07-18 15:57:09.716964	2023-07-20 10:12:13.524199
21	14	1	1		1		2	1.00	1.00	1	<手入力>	100	200	80	160	0.000	0.000	2	\N	\N	0	\N	\N	\N	2023-07-20 10:43:36.139525	2023-07-20 10:44:04.599848
\.


--
-- Data for Name: invoice_detail_middle_classifications; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.invoice_detail_middle_classifications (id, invoice_header_id, invoice_detail_large_classification_id, invoice_item_division_id, working_middle_item_id, working_middle_item_name, working_middle_item_short_name, line_number, working_middle_specification, quantity, execution_quantity, working_unit_id, working_unit_name, working_unit_price, invoice_price, execution_unit_price, execution_price, material_id, working_material_name, material_unit_price, labor_unit_price, labor_productivity_unit, labor_productivity_unit_total, material_quantity, accessory_cost, material_cost_total, labor_cost_total, other_cost, remarks, construction_type, piping_wiring_flag, equipment_mounting_flag, labor_cost_flag, created_at, updated_at) FROM stdin;
1	1	1	\N	1	配線テスト	1	1		1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	2023-06-06 14:10:30.007844	2023-06-06 14:10:30.007844
3	2	2	1	1	配線テスト１	1	1		1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-16 16:35:27.721612	2023-06-16 16:35:27.721612
4	2	2	\N	1	配線テスト２	1	2		1.00	1.00	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	0	0	2023-06-17 15:15:15.094377	2023-06-17 15:15:15.094377
5	2	2	\N	1	小計	1	3		1.00	1.00	2	箇所	\N	200	\N	160	\N	\N	\N	\N	\N	0.000	\N	\N	\N	\N	\N	\N	1	0	0	0	2023-06-17 15:15:36.441411	2023-06-17 15:15:36.441411
6	11	15	\N	6	qq	1	1		\N	\N	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2023-07-20 10:10:51.96364	2023-07-20 10:10:51.96364
7	11	15	\N	4	aa	4	2		100.00	80.00	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2023-07-20 10:12:13.449082	2023-07-20 10:12:43.456999
8	14	21	\N	1		1	1		1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2023-07-20 10:43:54.220217	2023-07-20 10:43:54.220217
9	14	21	\N	1		1	2		1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	2023-07-20 10:44:04.502016	2023-07-20 10:44:04.502016
\.


--
-- Data for Name: invoice_headers; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.invoice_headers (id, invoice_code, quotation_code, delivery_slip_code, invoice_date, construction_datum_id, construction_name, customer_id, customer_name, honorific_id, responsible1, responsible2, post, address, house_number, address2, tel, fax, construction_period, construction_place, construction_house_number, construction_place2, payment_period, invoice_period_start_date, invoice_period_end_date, billing_amount, execution_amount, deposit_amount, payment_method_id, commission, payment_date, labor_insurance_not_flag, last_line_number, remarks, final_return_division, deposit_complete_flag, created_at, updated_at) FROM stdin;
3	2023010101			\N	1	サンプル工事	8	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	\N	\N	\N		\N	\N	100	80	\N	0	\N	\N	0	1		0	0	2023-06-23 16:10:13.860195	2023-06-26 09:29:56.517327
4	2			\N	1		11	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	\N	\N	\N		\N	\N	\N	\N	\N	0	\N	\N	\N	\N		\N	0	2023-07-03 15:40:18.680852	2023-07-03 15:40:31.009851
5	3			\N	1		12	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	\N	\N	\N		\N	\N	\N	\N	\N	0	\N	\N	\N	\N		\N	0	2023-07-03 15:40:51.547852	2023-07-03 15:40:51.547852
6	4			\N	1		13	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	\N	\N	\N		\N	\N	\N	\N	\N	0	\N	\N	\N	\N		\N	0	2023-07-03 15:41:08.023862	2023-07-03 15:41:08.023862
8	6			\N	1		24	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	\N	\N	\N		\N	\N	\N	\N	\N	0	\N	\N	\N	\N		\N	0	2023-07-18 15:39:14.571904	2023-07-18 15:39:14.571904
9	7			\N	1		25	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	\N	\N	\N		\N	\N	\N	\N	\N	0	\N	\N	\N	\N		\N	0	2023-07-18 15:39:25.03797	2023-07-18 15:39:25.03797
10	8			\N	1		26	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	\N	\N	\N		\N	\N	0	0	\N	0	\N	\N	\N	5		\N	0	2023-07-18 15:43:09.683926	2023-07-18 16:06:45.931004
12	10			\N	1		28	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	\N	\N	\N		\N	\N	150	120	\N	0	\N	\N	\N	5		\N	0	2023-07-18 15:43:35.488954	2023-07-18 16:08:33.502377
13	11			\N	1		39	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	\N	\N	\N		\N	\N	\N	\N	\N	0	\N	\N	\N	\N		\N	0	2023-07-19 11:30:50.673101	2023-07-19 11:30:50.673101
11	9			\N	1		27	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111		\N	\N	\N	\N		\N	\N	0	0	\N	0	\N	\N	\N	5		\N	0	2023-07-18 15:43:24.638726	2023-07-20 09:59:43.344839
14	9999999999	\N	8	\N	\N		31	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111						\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	2023-07-19 14:10:10.576262	2023-07-20 10:43:36.202948
\.


--
-- Data for Name: maker_masters; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.maker_masters (id, maker_name, created_at, updated_at) FROM stdin;
1	-	2023-05-12 08:58:23.913475	2023-05-15 18:31:06.394751
2	パーナ	2023-05-15 18:30:47.147357	2023-05-15 18:31:14.130954
3	a	2023-07-03 10:14:13.652343	2023-07-03 10:14:13.652343
4	c	2023-07-03 10:14:22.141094	2023-07-03 10:14:22.141094
5	s	2023-07-03 10:14:41.686478	2023-07-03 10:14:41.686478
6	qq	2023-07-03 10:14:50.229652	2023-07-03 10:14:50.229652
7	7	2023-07-18 14:14:35.200739	2023-07-18 14:14:35.200739
8	8	2023-07-18 14:14:43.425822	2023-07-18 14:14:43.425822
9	9	2023-07-18 14:14:51.2521	2023-07-18 14:14:51.2521
10	10	2023-07-18 14:14:59.573165	2023-07-18 14:14:59.573165
12	11	2023-07-19 10:23:36.116681	2023-07-19 10:23:36.116681
\.


--
-- Data for Name: material_categories; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.material_categories (id, name, seq, created_at, updated_at) FROM stdin;
4	4	4	2023-07-03 10:41:20.630732	2023-07-03 10:46:30.07684
5	5	5	2023-07-03 10:41:30.602107	2023-07-03 10:46:39.577716
6	6	6	2023-07-03 10:41:38.517799	2023-07-03 10:46:49.650869
3	3	3	2023-07-03 10:41:09.707908	2023-07-13 11:09:08.762774
1	照明器具	1	2023-05-12 09:09:29.77533	2023-07-13 11:09:09.862918
2	配線器具	2	2023-05-12 09:10:59.504923	2023-07-13 11:09:09.873483
7	7	\N	2023-07-18 13:54:05.764859	2023-07-18 13:54:05.764859
8	8	\N	2023-07-18 13:54:15.030149	2023-07-18 13:54:15.030149
9	9	\N	2023-07-18 13:54:22.781048	2023-07-18 13:54:22.781048
10	10	\N	2023-07-18 13:54:30.899063	2023-07-18 13:54:30.899063
12	11	\N	2023-07-19 10:21:23.609969	2023-07-19 10:21:23.609969
\.


--
-- Data for Name: material_masters; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.material_masters (id, material_code, internal_code, material_name, maker_id, unit_id, list_price, list_price_quotation, standard_quantity, standard_labor_productivity_unit, standard_rate, last_unit_price, last_unit_price_update_at, inventory_category_id, material_category_id, list_price_update_at, notes, created_at, updated_at) FROM stdin;
5	aaa			2	2	\N	\N	1	\N	\N	\N	2000-01-01	3	\N	\N		2023-07-03 10:12:41.317328	2023-07-03 14:18:29.127161
14	ooo	\N		\N	\N	\N	\N	\N	\N	\N	\N	2000-01-01	\N	\N	\N		2023-07-18 13:53:12.777877	2023-07-18 13:53:12.777877
17	aaazz	\N		\N	\N	\N	\N	\N	\N	\N	\N	2000-01-01	\N	\N	\N		2023-07-18 14:03:05.133311	2023-07-18 14:03:05.133311
20	cvvvv	\N		\N	\N	\N	\N	\N	\N	\N	\N	2000-01-01	\N	\N	\N		2023-07-18 14:07:02.080957	2023-07-18 14:07:02.080957
22	adcd	\N		5	1	\N	\N	\N	\N	\N	\N	2000-01-01	\N	\N	\N		2023-07-18 14:12:34.370781	2023-07-18 14:12:34.370781
21	bff	\N		4	3	\N	\N	\N	\N	0.0000	\N	2023-07-18	\N	\N	\N		2023-07-18 14:12:20.396758	2023-07-18 14:24:56.628865
16	aeae	\N		1	\N	\N	\N	\N	\N	0.0000	\N	2023-07-18	\N	\N	\N		2023-07-18 14:01:14.620945	2023-07-18 14:26:42.684424
23	njugf	\N		3	3	\N	\N	\N	\N	\N	\N	2000-01-01	\N	\N	\N		2023-07-19 10:20:44.191258	2023-07-19 10:20:44.191258
18	kkkkk	\N		1	\N	\N	\N	\N	\N	0.0000	\N	2023-07-19	\N	\N	\N		2023-07-18 14:03:51.795561	2023-07-19 10:25:37.939132
8	kk			2	2	\N	1000	\N	\N	1.0000	1000.00	2023-07-18	6	\N	\N		2023-07-03 10:31:33.807341	2023-07-19 15:33:38.654816
2	ZN10011		ZN10011	2	2	200	200	\N	\N	0.0100	2.00	2023-07-18	2	2	\N		2023-05-15 18:29:50.831334	2023-07-19 15:34:08.32506
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.orders (id, purchase_order_history_id, material_id, material_code, material_name, maker_id, maker_name, quantity, unit_master_id, list_price, order_unit_price, order_price, material_category_id, mail_sent_flag, delivery_complete_flag, sequential_id, created_at, updated_at) FROM stdin;
1	1	2	ZN10011	ZN10011	2	\N	1	2	200	\N	\N	2	\N	\N	1	2023-06-12 17:50:27.535941	2023-06-12 17:50:27.535941
2	2	2	ZN10011	ZN10011	2	\N	1	2	200	\N	\N	2	\N	\N	1	2023-06-12 17:55:31.549748	2023-06-12 17:55:31.549748
3	3	2	ZN10011	ZN10011	2	\N	1	2	200	\N	\N	2	\N	\N	1	2023-06-12 17:56:01.284337	2023-06-12 17:56:01.284337
53	4	2	ZN10011	ZN10011	2	\N	10	2	200	0.00	0	2	\N	\N	1	2023-06-24 13:56:30.185721	2023-06-24 13:56:30.185721
54	5	2	ZN10011	ZN10011	2	パーナ	10	2	200	300.00	3000	\N	1	\N	1	2023-06-24 15:34:43.043768	2023-06-24 15:34:43.043768
\.


--
-- Data for Name: outsourcing_costs; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.outsourcing_costs (id, invoice_code, purchase_order_datum_id, construction_datum_id, staff_id, supplier_master_id, working_start_date, working_end_date, purchase_amount, supplies_expense, labor_cost, misellaneous_expense, execution_amount, billing_amount, purchase_order_amount, closing_date, source_bank_id, payment_amount, unpaid_amount, payment_due_date, payment_date, unpaid_payment_date, created_at, updated_at) FROM stdin;
1	2023051501	1	1	\N	4	\N	2023-05-15	\N	\N	0	\N	\N	1000	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-09 16:03:06.043419	2023-06-09 16:03:06.043419
2	2023060101	2	2	\N	4	\N	2023-06-01	\N	\N	14928	\N	\N	14928	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-10 08:13:00.256029	2023-06-10 08:20:56.951163
3	2023060101	2	2	\N	3	\N	2023-06-01	\N	\N	0	\N	\N	14928	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-10 11:42:18.650338	2023-06-10 11:42:18.650338
4	2023/06/24	4	1	\N	3	\N	\N	\N	\N	0	\N	\N	10000	\N	\N	\N	\N	\N	\N	\N	\N	2023-06-24 17:41:33.44206	2023-06-24 17:41:33.44206
5	\N	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-18	1	\N	\N	2023-07-18	\N	\N	2023-07-18 14:32:09.456337	2023-07-18 14:32:09.456337
7	\N	\N	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-18	1	\N	\N	2023-07-18	\N	\N	2023-07-18 14:37:16.743502	2023-07-18 14:37:16.743502
8	\N	\N	\N	4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-18	1	\N	\N	2023-07-18	\N	\N	2023-07-18 14:37:33.104209	2023-07-18 14:37:33.104209
11	\N	\N	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-18	1	\N	\N	2023-07-18	\N	\N	2023-07-18 14:44:47.488625	2023-07-18 14:44:47.488625
12	\N	\N	2	\N	\N	\N	\N	\N	\N	-3	\N	\N	\N	\N	2023-07-18	1	\N	\N	2023-07-18	\N	\N	2023-07-18 14:45:00.273025	2023-07-18 14:45:00.273025
14	\N	\N	7	3	\N	\N	\N	\N	\N	2	\N	\N	1	\N	2023-07-19	1	\N	\N	2023-07-19	\N	\N	2023-07-19 10:29:03.124008	2023-07-19 10:29:03.124008
\.


--
-- Data for Name: purchase_data; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.purchase_data (id, purchase_date, slip_code, purchase_order_datum_id, construction_datum_id, material_id, material_code, material_name, maker_id, maker_name, quantity, quantity2, unit_id, purchase_unit_price, purchase_unit_price2, purchase_amount, list_price, purchase_id, division_id, supplier_id, inventory_division_id, unit_price_not_update_flag, outsourcing_invoice_flag, outsourcing_payment_flag, purchase_header_id, working_end_date, closing_date, payment_due_date, payment_date, unpaid_payment_date, notes, created_at, updated_at) FROM stdin;
10	2023-06-24		4	1	1	<手入力用>	外注費	1	-	1.00	\N	\N	10000.00	\N	10000	\N	\N	\N	3	\N	0	0	\N	\N	\N	\N	\N	\N	\N		2023-06-24 17:41:33.536436	2023-06-24 17:41:33.536436
9	2023-06-24		3	2	2	ZN10011	ZN10011	2	パーナ	20.00	\N	2	100.00	\N	2000	200	\N	1	2	\N	0	0	\N	\N	\N	\N	\N	\N	\N		2023-06-24 17:31:47.609699	2023-07-01 11:51:25.239542
11	2023-07-18	3	3	2	2	ZN10011	ZN10011	2	パーナ	1.00	\N	2	100.00	\N	100	200	\N	1	2	\N	0	\N	\N	2	\N	\N	\N	\N	\N		2023-07-18 13:33:52.530935	2023-07-18 13:33:52.582824
20	2023-07-03	n	3	2	8	kk		2	パーナ	2.00	\N	1	\N	\N	0	2	\N	1	5	\N	0	0	\N	6	\N	\N	\N	\N	\N		2023-07-19 10:28:21.233811	2023-07-19 15:28:09.145875
17	2023-07-18	mvf	4	1	5	aaa	<手入力用>	1	-	4.00	\N	1	\N	\N	0	\N	\N	1	3	\N	0	\N	\N	7	\N	\N	\N	\N	\N		2023-07-18 14:25:53.986903	2023-07-19 15:32:08.618653
16	2023-07-18	n	5	5	8	kk		2	パーナ	6.00	\N	6	-1.00	\N	-6	\N	\N	1	3	\N	0	\N	\N	6	\N	\N	\N	\N	\N		2023-07-18 14:25:30.96278	2023-07-19 15:33:10.315014
15	2023-07-18	bnn	3	2	21	bff		4	c	4.00	\N	1	\N	\N	0	\N	\N	1	2	\N	0	\N	\N	5	\N	\N	\N	\N	\N		2023-07-18 14:24:56.635382	2023-07-19 15:33:26.331642
14	2023-07-18	fvv	3	2	8	kk		2	パーナ	1.00	\N	2	1000.00	\N	1000	\N	\N	1	2	\N	0	\N	\N	4	\N	\N	\N	\N	\N		2023-07-18 14:24:34.551945	2023-07-19 15:33:38.681985
13	2023-07-18	vcx	3	2	5	aaa	<手入力用>	1	-	5.00	\N	1	\N	\N	0	200	\N	1	3	\N	0	\N	\N	3	\N	\N	\N	\N	\N		2023-07-18 14:24:09.493174	2023-07-19 15:33:52.295677
12	2023-07-18		4	1	2	ZN10011	ZN10011	2	パーナ	7.00	\N	1	2.00	\N	14	200	\N	1	3	\N	0	\N	\N	\N	\N	\N	\N	\N	\N		2023-07-18 14:23:45.225435	2023-07-19 15:34:16.820658
\.


--
-- Data for Name: purchase_divisions; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.purchase_divisions (id, purchase_division_name, purchase_division_long_name, created_at, updated_at) FROM stdin;
1	仕入	仕入材料	2023-05-12 09:56:37.271065	2023-05-12 09:56:37.271065
2	2		2023-07-03 11:09:32.082613	2023-07-03 11:09:32.082613
3	3		2023-07-03 11:09:40.313497	2023-07-03 11:09:40.313497
4	4		2023-07-03 11:09:47.990299	2023-07-03 11:09:47.990299
5	5		2023-07-03 11:09:57.203383	2023-07-03 11:09:57.203383
6	6		2023-07-03 11:10:05.732118	2023-07-03 11:10:05.732118
8	8		2023-07-18 14:18:06.758918	2023-07-18 14:18:06.758918
10	10		2023-07-18 14:18:16.931703	2023-07-18 14:18:16.931703
9	9		2023-07-18 14:18:07.472686	2023-07-18 14:18:27.058273
11	7		2023-07-19 10:24:07.479787	2023-07-19 10:24:07.479787
\.


--
-- Data for Name: purchase_headers; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.purchase_headers (id, slip_code, complete_flag, created_at, updated_at) FROM stdin;
1		\N	2023-07-06 13:32:05.785402	2023-07-06 13:32:05.785402
2	3	\N	2023-07-18 13:33:52.570293	2023-07-18 13:33:52.570293
3	vcx	\N	2023-07-18 14:24:09.513898	2023-07-18 14:24:09.513898
4	fvv	\N	2023-07-18 14:24:34.589582	2023-07-18 14:24:34.589582
5	bnn	\N	2023-07-18 14:24:56.668453	2023-07-18 14:24:56.668453
6	n	\N	2023-07-18 14:25:30.995655	2023-07-18 14:25:30.995655
7	mvf	\N	2023-07-18 14:25:54.00623	2023-07-18 14:25:54.00623
8	8	\N	2023-07-18 14:30:21.365692	2023-07-18 14:30:21.365692
9	9	\N	2023-07-18 14:30:42.90961	2023-07-18 14:30:42.90961
11	11	\N	2023-07-19 10:27:26.236405	2023-07-19 10:27:26.236405
\.


--
-- Data for Name: purchase_order_data; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.purchase_order_data (id, purchase_order_code, construction_datum_id, supplier_master_id, supplier_responsible_id, alias_name, purchase_order_date, mail_sent_flag, created_at, updated_at) FROM stdin;
4	A2301	1	3	10	Ａサンプル工事	\N	0	2023-06-24 17:40:59.241689	2023-06-24 17:40:59.241689
3	A2300	2	2	9	Bサンプル工事	\N	1	2023-06-24 16:07:18.304486	2023-06-26 08:54:57.336153
5	A2302	5	3	10	55	\N	\N	2023-07-18 14:21:32.402662	2023-07-18 14:21:32.402662
6	A2303	5	4	12	55	\N	\N	2023-07-18 14:27:48.970059	2023-07-18 14:27:48.970059
7	A2304	5	6	\N	55	\N	\N	2023-07-18 14:27:59.168076	2023-07-18 14:27:59.168076
8	A2305	5	2	9	55	\N	\N	2023-07-18 14:28:15.359652	2023-07-18 14:28:15.359652
9	A2306	5	3	10	55	\N	\N	2023-07-18 14:28:26.251967	2023-07-18 14:28:26.251967
10	A2307	5	2	9	55	\N	\N	2023-07-18 14:28:39.256474	2023-07-18 14:28:39.256474
11	A2308	5	3	10	5	\N	\N	2023-07-18 14:28:49.369899	2023-07-18 14:28:49.369899
13	A2311	11	3	10	5	\N	\N	2023-07-19 10:26:35.733576	2023-07-19 10:26:35.733576
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
6	2023-07-19	3	13	\N	\N		2023-07-19 11:54:49.851986	2023-07-19 11:54:49.851986
7	2023-07-19	3	13	\N	\N		2023-07-19 11:55:12.518647	2023-07-19 11:55:12.518647
8	2023-07-19	3	13	\N	\N		2023-07-19 11:55:38.755896	2023-07-19 11:55:38.755896
9	2023-07-19	3	13	\N	\N		2023-07-19 11:56:00.145317	2023-07-19 11:56:00.145317
10	2023-07-19	3	13	\N	\N		2023-07-19 13:13:24.804601	2023-07-19 13:13:24.804601
11	2023-07-19	3	13	\N	\N		2023-07-19 15:45:42.884979	2023-07-19 15:45:42.884979
\.


--
-- Data for Name: purchase_unit_prices; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.purchase_unit_prices (id, supplier_id, material_id, supplier_material_code, unit_price, list_price, unit_id, created_at, updated_at) FROM stdin;
2	4	1	<手入力用>	1000.00	\N	2	2023-06-08 18:09:48.060093	2023-06-08 18:09:48.060093
4	2	2	\N	100.00	\N	2	2023-06-12 17:50:26.59913	2023-06-24 17:31:47.51379
5	1	1	<手入力用>	2.00	\N	2	2023-07-03 10:58:03.994031	2023-07-03 10:58:03.994031
6	6	1	<手入力用>	5.00	\N	2	2023-07-03 10:58:32.880024	2023-07-03 10:58:32.880024
7	3	8	kk	-1.00	\N	6	2023-07-18 14:10:47.446598	2023-07-18 14:10:47.446598
8	4	16	aeae	1.00	\N	3	2023-07-18 14:13:10.166367	2023-07-18 14:13:10.166367
10	6	16	aeae	3.00	\N	2	2023-07-18 14:13:37.619318	2023-07-18 14:13:37.619318
11	8	21	bff	2.00	\N	5	2023-07-18 14:13:52.884151	2023-07-18 14:13:52.884151
3	3	1	<手入力用>	\N	\N	1	2023-06-10 11:42:18.053544	2023-07-18 14:24:09.442388
12	3	14	ooo	\N	\N	5	2023-07-19 10:22:56.700452	2023-07-19 10:22:56.700452
9	3	5	aaa	\N	\N	1	2023-07-18 14:13:23.257054	2023-07-19 15:28:24.830778
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
17	1	1	1	\N	※入力してください※	1	\N	\N	\N	\N		1	1.00	1.00	22	式	\N	150	\N	120	0.000	0.000	3	\N	0	0	0	0	2023-06-19 15:48:07.979085	2023-06-19 15:48:08.143853
18	10	1	1	\N	配線１	1	1	2	\N	\N		1	1.00	1.00	2	箇所	100	100	80	80	0.800	0.800	\N		0	\N	\N	\N	2023-07-20 08:41:23.665354	2023-07-20 08:41:23.665354
19	10	1	1	\N	配線2	1	1	2	\N	\N		2	1.00	1.00	1	<手入力>	100	100	80	80	0.080	0.080	\N		0	\N	\N	\N	2023-07-20 09:37:44.66619	2023-07-20 09:37:44.66619
21	11	1	1	\N		1	1	\N	\N	\N		2	1.00	1.00	1	<手入力>	100	100	80	80	\N	\N	\N		0	\N	\N	\N	2023-07-20 10:17:43.427188	2023-07-20 10:17:43.427188
20	11	1	1	\N		1	1	\N	\N	\N		1	1.00	1.00	1	<手入力>	100	200	80	160	0.000	0.000	2		0	\N	\N	\N	2023-07-20 10:14:55.587126	2023-07-20 10:42:57.659418
\.


--
-- Data for Name: quotation_detail_middle_classifications; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.quotation_detail_middle_classifications (id, quotation_header_id, quotation_detail_large_classification_id, quotation_items_division_id, working_middle_item_id, working_specific_middle_item_id, working_middle_item_name, working_middle_item_short_name, working_middle_item_category_id, working_middle_item_category_id_call, working_middle_item_subcategory_id, working_middle_item_subcategory_id_call, line_number, working_middle_specification, quantity, execution_quantity, working_unit_id, working_unit_name, working_unit_price, quote_price, execution_unit_price, execution_price, material_id, quotation_material_name, material_unit_price, labor_unit_price, labor_productivity_unit, labor_productivity_unit_total, material_quantity, accessory_cost, material_cost_total, labor_cost_total, other_cost, remarks, construction_type, piping_wiring_flag, equipment_mounting_flag, labor_cost_flag, created_at, updated_at) FROM stdin;
2	2	12	1	2	\N	配線Ａ	1	2	\N	\N	\N	1		1	1	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-17 16:37:37.181217	2023-06-17 16:37:37.181217
3	2	12	1	2	\N	配線B	1	2	\N	\N	\N	2		1	1	2	箇所	80	80	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-17 16:38:13.12804	2023-06-17 16:38:13.12804
4	2	12	1	1	\N	小計	1	1	\N	\N	\N	3		1	1	1	<手入力>	\N	180	\N	130	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N		1	0	0	0	2023-06-17 16:43:30.291048	2023-06-17 16:43:30.291048
9	1	17	1	1	\N	配線	1	1	\N	\N	\N	2	配線テスト	1	1	2	箇所	100	100	80	80	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N		0	0	0	0	2023-06-19 15:48:08.063484	2023-06-19 15:48:08.063484
10	1	17	1	1	\N	配線テスト２	1	1	\N	\N	\N	3		1	1	2	箇所	50	50	40	40	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	0	0	0	2023-06-19 15:48:08.120257	2023-06-19 15:48:08.120257
11	11	20	1	4	\N	aa	1	1	\N	\N	\N	1		1	1	2	箇所	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	\N	\N	\N	2023-07-20 10:28:12.668873	2023-07-20 10:28:12.668873
12	11	20	1	1	\N		1	1	\N	\N	\N	2		1	1	1	<手入力>	100	100	80	80	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		0	\N	\N	\N	2023-07-20 10:42:57.453537	2023-07-20 10:42:57.453537
\.


--
-- Data for Name: quotation_headers; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.quotation_headers (id, quotation_code, invoice_code, delivery_slip_code, quotation_header_origin_id, quotation_date, construction_datum_id, construction_name, customer_id, customer_name, honorific_id, responsible1, responsible2, post, address, house_number, address2, tel, fax, construction_period, construction_period_date1, construction_period_date2, construction_post, construction_place, construction_house_number, construction_place2, trading_method, effective_period, quote_price, execution_amount, net_amount, last_line_number, category_saved_flag, category_saved_id, subcategory_saved_id, invoice_period_start_date, invoice_period_end_date, fixed_flag, not_sum_flag, created_at, updated_at) FROM stdin;
2	20230002			\N	\N	2	Bサンプル工事	2	株式会社サンプル得意先B	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N							180	130	\N	1	1	\N	\N	\N	\N	0	0	2023-05-23 10:28:33.542066	2023-06-17 16:38:14.960552
6	3			\N	\N	5	5	5	株式会社サンプル得意先C	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N							\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	2023-07-03 15:14:33.247716	2023-07-03 15:14:33.247716
7	333			\N	\N	5	5	5	株式会社サンプル得意先C	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N							\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	2023-07-03 15:14:51.073525	2023-07-03 15:14:51.073525
8	44			\N	\N	4	4	2	株式会社サンプル得意先B	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N							\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	2023-07-03 15:15:34.731406	2023-07-03 15:15:34.731406
9	9999999999		5	\N	\N	\N		19	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-06 14:30:06.721584	2023-07-06 14:30:06.721584
1	202300001			\N	\N	1	Ａサンプル工事	21	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N							150	120	\N	1	1	\N	\N	\N	\N	0	0	2023-05-20 17:36:00.991044	2023-07-06 16:17:10.580998
12	fff			\N	\N	9	dd	8	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					vdd	hbv	3	2	3	\N	\N	\N	\N	\N	\N	0	0	2023-07-18 15:29:51.34702	2023-07-18 15:29:51.34702
13	a			\N	\N	9	dd	8	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					jubg	vbnjh	3	2	3	\N	\N	\N	\N	\N	\N	0	0	2023-07-18 15:30:33.900166	2023-07-18 15:30:33.900166
14	9999999999		8	\N	\N	\N		31	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-19 14:10:16.348738	2023-07-19 14:10:16.348738
15	9999999999	9999999999	8	\N	\N	\N		31	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N	\N				\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-19 15:58:02.890987	2023-07-19 15:58:02.890987
10	2020042701			\N	2020-04-27	10	dd	8	株式会社サンプル得意先Ａ	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					s	s	200	160	-3	2	1	2	\N	2024-09-15	\N	0	0	2023-07-18 15:28:05.829593	2023-07-20 09:37:44.731693
11	w	ss		\N	\N	11	5	5	株式会社サンプル得意先C	0			〒955-0013	新潟県三条市東三条	1番地		0120-11-1111			\N	\N					xx	ccc	300	240	\N	2	1	\N	\N	\N	\N	0	0	2023-07-18 15:28:48.818975	2023-07-20 10:42:57.648598
\.


--
-- Data for Name: quotation_material_details; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.quotation_material_details (id, quotation_material_header_id, material_id, material_code, material_name, maker_id, maker_name, quantity, unit_master_id, list_price, quotation_unit_price_1, quotation_unit_price_2, quotation_unit_price_3, quotation_price_1, quotation_price_2, quotation_price_3, bid_flag_1, bid_flag_2, bid_flag_3, mail_sent_flag, quotation_email_flag_1, quotation_email_flag_2, quotation_email_flag_3, order_email_flag_1, order_email_flag_2, order_email_flag_3, sequential_id, created_at, updated_at) FROM stdin;
10	1	2	ZN10011	ZN10011	2	パーナ	10	2	200	300	\N	\N	3000	\N	\N	1	0	0	\N	1	0	0	1	0	0	1	2023-06-24 15:34:37.335199	2023-06-24 15:34:37.335199
\.


--
-- Data for Name: quotation_material_headers; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.quotation_material_headers (id, quotation_code, requested_date, construction_datum_id, supplier_master_id, responsible, email, delivery_place_flag, notes_1, notes_2, notes_3, quotation_header_origin_id, total_quotation_price_1, total_quotation_price_2, total_quotation_price_3, total_order_price_1, total_order_price_2, total_order_price_3, supplier_id_1, supplier_id_2, supplier_id_3, supplier_responsible_id_1, supplier_responsible_id_2, supplier_responsible_id_3, quotation_email_flag_1, quotation_email_flag_2, quotation_email_flag_3, order_email_flag_1, order_email_flag_2, order_email_flag_3, all_bid_flag_1, all_bid_flag_2, all_bid_flag_3, created_at, updated_at) FROM stdin;
1	2023062401	2023-06-24	2	2	8	8	\N		\N	\N	\N	3000	0	0	3000	0	0	2	\N	\N	0	\N	\N	1	0	0	1	0	0	\N	\N	\N	2023-06-24 14:19:04.722708	2023-06-24 15:34:37.322553
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
\.


--
-- Data for Name: sites; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.sites (id, name, post, address, house_number, address2, created_at, updated_at) FROM stdin;
3	1					2023-07-03 14:51:35.5965	2023-07-03 14:51:35.5965
4	2					2023-07-03 14:51:46.380634	2023-07-03 14:51:46.380634
5	3					2023-07-03 14:51:57.874223	2023-07-03 14:51:57.874223
6	4					2023-07-03 14:52:08.205157	2023-07-03 14:52:08.205157
7	5					2023-07-03 14:52:18.169703	2023-07-03 14:52:18.169703
8	6					2023-07-18 15:15:47.256289	2023-07-18 15:15:47.256289
9	7					2023-07-18 15:15:57.00766	2023-07-18 15:15:57.00766
10	8					2023-07-18 15:16:05.854307	2023-07-18 15:16:05.854307
11	9					2023-07-18 15:16:14.284444	2023-07-18 15:16:14.284444
12	10					2023-07-18 15:16:24.156923	2023-07-18 15:16:24.156923
\.


--
-- Data for Name: staffs; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.staffs (id, staff_name, furigana, affiliation_id, hourly_wage, daily_pay, supplier_master_id, created_at, updated_at) FROM stdin;
1	サンプル太郎	サンプル　タロウ	1	\N	10000	4	2023-06-09 11:56:56.514446	2023-06-09 13:42:48.242811
2	外注太郎	がいちゅうたろう	\N	\N	16000	4	2023-06-09 13:36:11.365907	2023-06-09 13:48:53.696212
3	外注次郎	がいちゅうじろう	\N	\N	15000	3	2023-06-12 12:00:30.185146	2023-06-12 12:01:00.806658
4	外注三郎	がいちゅうさぶろう	\N	\N	13000	3	2023-06-12 14:22:57.107736	2023-06-12 14:23:11.272328
5	5		\N	\N	\N	\N	2023-07-03 11:12:59.974034	2023-07-03 11:12:59.974034
6	6		\N	\N	\N	\N	2023-07-03 11:13:08.027269	2023-07-03 11:13:08.027269
7	7		\N	\N	\N	\N	2023-07-18 14:18:59.327983	2023-07-18 14:18:59.327983
8	8		\N	\N	\N	\N	2023-07-18 14:19:07.818005	2023-07-18 14:19:07.818005
9	9		\N	\N	\N	\N	2023-07-18 14:19:15.893286	2023-07-18 14:19:15.893286
10	10		\N	\N	\N	\N	2023-07-18 14:19:24.58446	2023-07-18 14:19:24.58446
11	11		\N	\N	\N	\N	2023-07-18 14:19:33.968159	2023-07-18 14:19:33.968159
\.


--
-- Data for Name: stocktakes; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.stocktakes (id, stocktake_date, material_master_id, inventory_id, physical_quantity, unit_price, physical_amount, book_quantity, book_amount, inventory_update_flag, created_at, updated_at) FROM stdin;
1	2023-07-03	2	1	\N	50.00	0	10.00	500	\N	2023-07-03 14:17:54.82085	2023-07-03 14:17:54.82085
2	2023-07-03	3	2	111.00	150.00	16650	100.00	15000	\N	2023-07-03 14:20:42.637917	2023-07-03 14:20:42.637917
3	2023-07-03	8	5	\N	30.00	0	30.00	900	\N	2023-07-03 14:23:25.779539	2023-07-03 14:23:25.779539
4	2023-07-03	4	3	\N	5.00	0	2.00	5	\N	2023-07-03 14:23:36.310434	2023-07-03 14:23:36.310434
5	2023-07-03	5	4	\N	20.00	0	10.00	200	\N	2023-07-03 14:23:45.877891	2023-07-03 14:23:45.877891
7	2023-07-18	5	\N	\N	\N	\N	\N	\N	\N	2023-07-18 15:06:12.781261	2023-07-18 15:06:12.781261
8	2023-07-18	2	1	\N	50.00	0	10.00	500	\N	2023-07-18 15:06:24.988248	2023-07-18 15:06:24.988248
9	2023-07-18	8	\N	\N	\N	\N	\N	\N	\N	2023-07-18 15:06:38.604852	2023-07-18 15:06:38.604852
10	2023-07-18	1	\N	\N	\N	\N	\N	\N	\N	2023-07-18 15:06:52.751248	2023-07-18 15:06:52.751248
11	2023-07-17	1	\N	0.00	2.00	0	\N	\N	\N	2023-07-18 15:07:24.150009	2023-07-18 15:07:24.150009
\.


--
-- Data for Name: supplier_masters; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.supplier_masters (id, supplier_name, tel_main, fax_main, email_main, responsible1, email1, responsible2, email2, responsible3, email3, responsible_cc, email_cc, search_character, outsourcing_flag, post, address, bank_name, bank_branch_name, account_type, account_number, holder, responsible_title, responsible_name, created_at, updated_at) FROM stdin;
1	-				\N	\N	\N	\N	\N	\N				0					\N		\N	\N	\N	2023-06-10 09:58:33.646385	2023-06-10 09:59:27.201608
3	外注サンプル電気	1111-22-3333			\N	\N	\N	\N	\N	\N				1	〒955-0024	新潟県三条市柳沢１丁目	テスト銀行	サンプル支店	0	1234567	オヤカタジロウ	\N	親方次郎	2023-06-10 10:04:29.476662	2023-06-10 16:24:20.882484
4	c				\N	\N	\N	\N	\N	\N				0					\N			\N		2023-07-03 10:06:47.298533	2023-07-03 10:06:47.298533
5	d				\N	\N	\N	\N	\N	\N				0					\N			\N		2023-07-03 10:06:58.556751	2023-07-03 10:06:58.556751
6	e				\N	\N	\N	\N	\N	\N				0					\N			\N		2023-07-03 10:07:10.206629	2023-07-03 10:07:10.206629
2	株式会社サンプルＡ	1111-11-1111			\N	\N	\N	\N	\N	\N				0					\N			\N		2023-06-10 10:00:35.557301	2023-07-10 13:35:17.094392
7	7				\N	\N	\N	\N	\N	\N				0					\N			\N		2023-07-18 13:47:00.043588	2023-07-18 13:47:00.043588
8	8				\N	\N	\N	\N	\N	\N				0					\N			\N		2023-07-18 13:47:08.633806	2023-07-18 13:47:08.633806
9	9				\N	\N	\N	\N	\N	\N				0					\N			\N		2023-07-18 13:47:18.898069	2023-07-18 13:47:18.898069
10	10				\N	\N	\N	\N	\N	\N				0					\N			\N		2023-07-18 13:47:28.704613	2023-07-18 13:47:28.704613
12	11				\N	\N	\N	\N	\N	\N				0					\N			\N		2023-07-19 09:08:37.037831	2023-07-19 09:08:37.037831
\.


--
-- Data for Name: supplier_responsibles; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.supplier_responsibles (id, supplier_master_id, responsible_name, responsible_email, created_at, updated_at) FROM stdin;
8	1			2023-06-10 09:58:33.796309	2023-06-10 09:58:33.796309
9	2			2023-06-10 10:00:35.900299	2023-06-10 10:00:35.900299
10	3			2023-06-10 10:04:29.623045	2023-06-10 10:04:29.623045
11	2			2023-06-23 17:13:02.186522	2023-06-23 17:13:02.186522
12	4			2023-07-03 10:06:47.312232	2023-07-03 10:06:47.312232
13	5			2023-07-03 10:06:58.563872	2023-07-03 10:06:58.563872
15	7			2023-07-18 13:47:00.050659	2023-07-18 13:47:00.050659
16	8			2023-07-18 13:47:08.642612	2023-07-18 13:47:08.642612
17	9			2023-07-18 13:47:18.912169	2023-07-18 13:47:18.912169
18	10			2023-07-18 13:47:28.711652	2023-07-18 13:47:28.711652
21	3	11		2023-07-19 10:22:15.902446	2023-07-19 10:22:15.902446
\.


--
-- Data for Name: unit_masters; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.unit_masters (id, unit_name, created_at, updated_at) FROM stdin;
1	-	2023-05-12 09:21:19.086178	2023-05-12 09:21:19.086178
2	個	2023-05-12 09:21:38.222261	2023-05-12 09:21:38.222261
3	3	2023-07-03 11:05:45.280511	2023-07-03 11:05:45.280511
4	4	2023-07-03 11:05:54.609574	2023-07-03 11:05:54.609574
5	5	2023-07-03 11:06:02.06677	2023-07-03 11:06:02.06677
6	6	2023-07-03 11:06:09.601747	2023-07-03 11:06:09.601747
7	7	2023-07-18 14:16:59.489174	2023-07-18 14:16:59.489174
8	8	2023-07-18 14:17:07.636833	2023-07-18 14:17:07.636833
9	9	2023-07-18 14:17:16.04057	2023-07-18 14:17:16.04057
10	10	2023-07-18 14:17:23.720366	2023-07-18 14:17:23.720366
11	11	2023-07-18 14:17:31.548751	2023-07-18 14:17:31.548751
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.users (id, name, email, password_digest, created_at, updated_at) FROM stdin;
5	adusu	adusu-info@eos.ocn.ne.jp	$2a$12$txtWNUkWEoNnmHkz2skkwu/8wLJpy3rp/.bgzAhAQykBhKBGVfvbC	2023-07-01 13:51:28.778385	2023-07-01 13:51:28.778385
\.


--
-- Data for Name: working_categories; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_categories (id, category_name, seq, created_at, updated_at) FROM stdin;
8	8	8	2023-07-18 11:50:26.636861	2023-07-18 15:51:10.09111
9	9	9	2023-07-18 11:50:35.324432	2023-07-18 15:51:10.098105
10	10	10	2023-07-18 11:50:43.114387	2023-07-18 15:51:10.109892
1	未選択	1	2023-05-25 08:35:58.604409	2023-07-19 13:01:53.830292
2	配線	2	2023-06-16 11:36:37.602856	2023-07-19 13:01:53.839429
3	3	3	2023-07-03 15:34:20.773153	2023-07-19 13:01:53.848643
4	4	4	2023-07-03 15:34:30.793081	2023-07-19 13:01:53.856774
5	5	5	2023-07-03 15:34:39.389314	2023-07-19 13:01:53.865804
6	6	6	2023-07-18 11:50:07.985005	2023-07-19 13:01:53.879301
7	7	7	2023-07-18 11:50:19.579246	2023-07-19 13:01:53.896376
\.


--
-- Data for Name: working_middle_items; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_middle_items (id, working_middle_item_name, working_middle_item_short_name, working_middle_item_category_id, working_subcategory_id, working_middle_specification, working_unit_id, working_unit_name, working_unit_price, execution_unit_price, material_id, working_material_name, execution_material_unit_price, material_unit_price, execution_labor_unit_price, labor_unit_price, labor_unit_price_standard, labor_productivity_unit, labor_productivity_unit_total, material_quantity, accessory_cost, material_cost_total, labor_cost_total, other_cost, seq, created_at, updated_at) FROM stdin;
1	<手入力>		1	\N		1	<手入力>	\N	\N	\N	\N	\N	\N	\N	\N	11000	\N	\N	\N	\N	\N	\N	\N	1	2023-05-25 09:27:03.352069	2023-07-13 14:07:36.394423
4	aa		1	\N		2	<手入力>	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	\N	\N	\N	\N	\N	\N	0	2023-07-04 09:47:58.695076	2023-07-19 13:01:16.74969
2	配線Ａ		2	1		2	<手入力>	\N	\N	\N	\N	\N	\N	\N	\N	11000	\N	\N	\N	\N	\N	\N	\N	2	2023-06-16 11:39:09.003994	2023-07-19 13:01:16.762518
5	aa		1	28		2	<手入力>	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	\N	\N	\N	\N	\N	\N	-1	2023-07-19 13:55:08.459506	2023-07-19 13:55:08.459506
6	qq		1	30		2	<手入力>	\N	\N	\N	\N	\N	\N	\N	\N	10000	\N	\N	\N	\N	\N	\N	\N	-2	2023-07-19 13:55:36.048772	2023-07-19 13:55:36.048772
\.


--
-- Data for Name: working_safety_matters; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_safety_matters (id, working_safety_matter_name, created_at, updated_at) FROM stdin;
1	1	2023-07-03 14:44:48.211022	2023-07-03 14:44:59.312031
2	2	2023-07-03 14:46:37.721382	2023-07-03 14:46:37.721382
3	3	2023-07-03 14:46:46.657279	2023-07-03 14:46:46.657279
4	4	2023-07-03 14:46:57.629371	2023-07-03 14:46:57.629371
5	5	2023-07-03 14:47:06.132935	2023-07-03 14:47:06.132935
7	6	2023-07-18 15:17:08.011138	2023-07-18 15:17:08.011138
8	7	2023-07-18 15:17:16.276587	2023-07-18 15:17:16.276587
9	8	2023-07-18 15:17:23.607092	2023-07-18 15:17:23.607092
10	9	2023-07-18 15:17:31.563252	2023-07-18 15:17:31.563252
11	10	2023-07-18 15:17:48.412767	2023-07-18 15:17:48.412767
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
1	\N	1	bhj		1	\N		2	<手入力>	\N	\N	\N	\N	\N	\N	1	0	10000	\N	\N	\N	1	2023-07-19 14:11:05.76494	2023-07-19 14:11:05.78759
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
15	2	1	1	2023-07-18 11:45:39.57887	2023-07-19 10:52:03.503081
20	2	6	4	2023-07-18 11:46:30.178296	2023-07-19 10:52:03.548084
21	2	7	5	2023-07-18 11:46:37.685183	2023-07-19 10:52:03.56562
22	2	8	6	2023-07-18 11:46:45.062095	2023-07-19 10:52:03.578486
23	2	9	7	2023-07-18 11:46:53.673934	2023-07-19 10:52:03.590814
24	2	10	8	2023-07-18 11:47:26.058808	2023-07-19 10:52:03.602744
19	2	5	9	2023-07-18 11:46:22.173262	2023-07-19 10:52:03.623369
27	2	10	\N	2023-07-19 10:52:13.107952	2023-07-19 10:52:13.107952
25	1		1	2023-07-18 15:37:23.849166	2023-07-19 10:58:14.441257
26	1		2	2023-07-18 15:37:44.278702	2023-07-19 10:58:14.460464
28	1		10	2023-07-19 13:55:08.433891	2023-07-19 13:55:08.433891
29	1		11	2023-07-19 13:55:31.456945	2023-07-19 13:55:31.456945
30	1		12	2023-07-19 13:55:36.023469	2023-07-19 13:55:36.023469
31	1		13	2023-07-19 13:55:48.132169	2023-07-19 13:55:48.132169
32	1		14	2023-07-19 13:55:50.422412	2023-07-19 13:55:50.422412
33	1		15	2023-07-19 13:56:10.204445	2023-07-19 13:56:10.204445
34	1		16	2023-07-19 13:56:10.808702	2023-07-19 13:56:10.808702
35	1		17	2023-07-19 13:56:11.549162	2023-07-19 13:56:11.549162
36	1		18	2023-07-19 13:56:12.211939	2023-07-19 13:56:12.211939
37	1		19	2023-07-19 13:56:12.875673	2023-07-19 13:56:12.875673
38	1		20	2023-07-19 13:56:13.58231	2023-07-19 13:56:13.58231
39	1		21	2023-07-19 13:56:14.331352	2023-07-19 13:56:14.331352
40	1		22	2023-07-19 13:56:15.081838	2023-07-19 13:56:15.081838
41	1		23	2023-07-19 13:56:15.848745	2023-07-19 13:56:15.848745
\.


--
-- Data for Name: working_times; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_times (id, employment_status_id, working_time_start_time, working_time_end_time, overtime_start_time, overtime_end_time, overtime_early_start_time, overtime_early_end_time, overtime_midnight_start_time, overtime_midnight_end_time, break_time_1_start_time, break_time_1_end_time, break_time_2_start_time, break_time_2_end_time, break_time_3_start_time, break_time_3_end_time, created_at, updated_at) FROM stdin;
1	0	08:00:00	17:30:00	18:00:00	22:00:00	05:00:00	08:00:00	22:00:00	05:00:00	10:00:00	10:30:00	12:00:00	13:00:00	15:00:00	15:30:00	2023-06-20 10:55:09.893041	2023-06-22 13:52:32.608687
\.


--
-- Data for Name: working_units; Type: TABLE DATA; Schema: public; Owner: adusu
--

COPY public.working_units (id, working_unit_name, seq, created_at, updated_at) FROM stdin;
1	<手入力>	0	2023-05-25 08:26:05.653064	2023-07-06 14:18:15.702224
2	箇所	1	2023-06-01 07:53:21.888929	2023-07-06 14:18:15.727134
3	3	2	2023-07-03 15:30:19.858227	2023-07-06 14:18:15.738807
4	4	3	2023-07-03 15:30:40.857289	2023-07-06 14:18:15.752004
5	5	4	2023-07-03 15:30:49.606281	2023-07-06 14:18:15.762789
6	5	6	2023-07-18 15:37:58.694744	2023-07-18 15:37:58.706205
7	6	7	2023-07-18 15:38:00.121941	2023-07-18 15:38:00.130408
8	8	8	2023-07-18 15:38:11.134772	2023-07-18 15:38:11.145902
9	9	9	2023-07-18 15:38:19.093522	2023-07-18 15:38:19.102032
10	10	10	2023-07-18 15:38:26.944112	2023-07-18 15:38:26.95288
\.


--
-- Name: affiliations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.affiliations_id_seq', 10, true);


--
-- Name: business_holidays_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.business_holidays_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.construction_costs_id_seq', 12, true);


--
-- Name: construction_daily_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.construction_daily_reports_id_seq', 10, true);


--
-- Name: construction_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.construction_data_id_seq', 11, true);


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.contacts_id_seq', 6, true);


--
-- Name: customer_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.customer_masters_id_seq', 41, true);


--
-- Name: delivery_slip_detail_large_classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.delivery_slip_detail_large_classifications_id_seq', 95, true);


--
-- Name: delivery_slip_detail_middle_classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.delivery_slip_detail_middle_classifications_id_seq', 77, true);


--
-- Name: delivery_slip_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.delivery_slip_headers_id_seq', 13, true);


--
-- Name: inventories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.inventories_id_seq', 13, true);


--
-- Name: inventory_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.inventory_categories_id_seq', 12, true);


--
-- Name: inventory_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.inventory_histories_id_seq', 12, true);


--
-- Name: invoice_detail_large_classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.invoice_detail_large_classifications_id_seq', 21, true);


--
-- Name: invoice_detail_middle_classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.invoice_detail_middle_classifications_id_seq', 9, true);


--
-- Name: invoice_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.invoice_headers_id_seq', 14, true);


--
-- Name: maker_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.maker_masters_id_seq', 12, true);


--
-- Name: material_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.material_categories_id_seq', 12, true);


--
-- Name: material_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.material_masters_id_seq', 23, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.orders_id_seq', 54, true);


--
-- Name: outsourcing_costs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.outsourcing_costs_id_seq', 14, true);


--
-- Name: purchase_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.purchase_data_id_seq', 20, true);


--
-- Name: purchase_divisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.purchase_divisions_id_seq', 11, true);


--
-- Name: purchase_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.purchase_headers_id_seq', 11, true);


--
-- Name: purchase_order_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.purchase_order_data_id_seq', 13, true);


--
-- Name: purchase_order_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.purchase_order_histories_id_seq', 11, true);


--
-- Name: purchase_unit_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.purchase_unit_prices_id_seq', 12, true);


--
-- Name: quatation_material_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.quatation_material_headers_id_seq', 1, false);


--
-- Name: quotation_detail_large_classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.quotation_detail_large_classifications_id_seq', 21, true);


--
-- Name: quotation_detail_middle_classifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.quotation_detail_middle_classifications_id_seq', 12, true);


--
-- Name: quotation_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.quotation_headers_id_seq', 15, true);


--
-- Name: quotation_material_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.quotation_material_details_id_seq', 10, true);


--
-- Name: quotation_material_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.quotation_material_headers_id_seq', 1, true);


--
-- Name: sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.sites_id_seq', 12, true);


--
-- Name: staffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.staffs_id_seq', 11, true);


--
-- Name: stocktakes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.stocktakes_id_seq', 11, true);


--
-- Name: supplier_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.supplier_masters_id_seq', 12, true);


--
-- Name: supplier_responsibles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.supplier_responsibles_id_seq', 21, true);


--
-- Name: unit_masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.unit_masters_id_seq', 11, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: working_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_categories_id_seq', 10, true);


--
-- Name: working_middle_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_middle_items_id_seq', 6, true);


--
-- Name: working_safety_matters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_safety_matters_id_seq', 11, true);


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

SELECT pg_catalog.setval('public.working_subcategories_id_seq', 41, true);


--
-- Name: working_times_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_times_id_seq', 1, true);


--
-- Name: working_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adusu
--

SELECT pg_catalog.setval('public.working_units_id_seq', 10, true);


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

