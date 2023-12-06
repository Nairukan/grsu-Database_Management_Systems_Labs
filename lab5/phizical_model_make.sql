--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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
-- Name: INT_DATA(date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."INT_DATA"(date) RETURNS integer
    LANGUAGE sql
    RETURN ((((SUBSTRING(($1)::text FROM 1 FOR 4))::integer * 366) + ((SUBSTRING(($1)::text FROM 6 FOR 2))::integer * 12)) + (SUBSTRING(($1)::text FROM 9 FOR 2))::integer);


ALTER FUNCTION public."INT_DATA"(date) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customercontacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customercontacts (
    customer_id integer NOT NULL,
    contact_information character varying(255)
);


ALTER TABLE public.customercontacts OWNER TO postgres;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    full_name character varying(255)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    full_name character varying(255),
    specialization character varying(255)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_employee_id_seq OWNER TO postgres;

--
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;


--
-- Name: parts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parts (
    part_id integer NOT NULL,
    part_name character varying(255),
    quantity_in_stock integer,
    cost numeric(10,2)
);


ALTER TABLE public.parts OWNER TO postgres;

--
-- Name: parts_part_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parts_part_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parts_part_id_seq OWNER TO postgres;

--
-- Name: parts_part_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parts_part_id_seq OWNED BY public.parts.part_id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    payment_id integer NOT NULL,
    amount numeric(10,2),
    payment_method character varying(255),
    payment_date timestamp without time zone,
    repair_id integer
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_payment_id_seq OWNER TO postgres;

--
-- Name: payments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_payment_id_seq OWNED BY public.payments.payment_id;


--
-- Name: phones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phones (
    phone_id integer NOT NULL,
    model character varying(255),
    manufacturer character varying(255),
    year_of_manufacture integer,
    serial_number character varying(255)
);


ALTER TABLE public.phones OWNER TO postgres;

--
-- Name: phones_phone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phones_phone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phones_phone_id_seq OWNER TO postgres;

--
-- Name: phones_phone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phones_phone_id_seq OWNED BY public.phones.phone_id;


--
-- Name: repair_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repair_details (
    repair_id integer,
    part_id integer
);


ALTER TABLE public.repair_details OWNER TO postgres;

--
-- Name: repairdates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repairdates (
    repair_id integer NOT NULL,
    start_date date,
    end_date date
);


ALTER TABLE public.repairdates OWNER TO postgres;

--
-- Name: repairs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repairs (
    repair_id integer NOT NULL,
    phone_id integer,
    service_id integer,
    status_id integer,
    customer_id integer,
    employee_id integer
);


ALTER TABLE public.repairs OWNER TO postgres;

--
-- Name: repairs_repair_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repairs_repair_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repairs_repair_id_seq OWNER TO postgres;

--
-- Name: repairs_repair_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repairs_repair_id_seq OWNED BY public.repairs.repair_id;


--
-- Name: repairstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repairstatus (
    status_id integer NOT NULL,
    status_description character varying(255)
);


ALTER TABLE public.repairstatus OWNER TO postgres;

--
-- Name: repairstatus_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repairstatus_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repairstatus_status_id_seq OWNER TO postgres;

--
-- Name: repairstatus_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repairstatus_status_id_seq OWNED BY public.repairstatus.status_id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    rating integer,
    comments text,
    repair_id integer
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_review_id_seq OWNER TO postgres;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    service_id integer NOT NULL,
    service_type character varying(255)
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_service_id_seq OWNER TO postgres;

--
-- Name: services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;


--
-- Name: technicial_specialist; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.technicial_specialist AS
 SELECT employees.employee_id,
    employees.full_name,
    employees.specialization
   FROM public.employees
  WHERE ((employees.specialization)::text = 'Technician'::text);


ALTER TABLE public.technicial_specialist OWNER TO postgres;

--
-- Name: workdescriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workdescriptions (
    repair_id integer NOT NULL,
    description text
);


ALTER TABLE public.workdescriptions OWNER TO postgres;

--
-- Name: technicial_table; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.technicial_table AS
 SELECT repairdates.start_date,
    repairdates.end_date,
    technicial_specialist.full_name,
    workdescriptions.description,
    parts.part_name,
    phones.manufacturer,
    phones.model,
    phones.year_of_manufacture,
    phones.serial_number
   FROM ((((((public.repairs
     JOIN public.technicial_specialist ON ((repairs.employee_id = technicial_specialist.employee_id)))
     JOIN public.workdescriptions ON ((workdescriptions.repair_id = repairs.repair_id)))
     JOIN public.phones ON ((phones.phone_id = repairs.phone_id)))
     JOIN public.repairdates ON ((repairdates.repair_id = repairs.repair_id)))
     JOIN public.repair_details ON ((repair_details.repair_id = repairs.repair_id)))
     JOIN public.parts ON ((repair_details.part_id = parts.part_id)))
  ORDER BY (public."INT_DATA"(repairdates.end_date)) DESC, phones.serial_number;


ALTER TABLE public.technicial_table OWNER TO postgres;

--
-- Name: userbaseview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.userbaseview AS
 SELECT customers.full_name,
    customercontacts.contact_information,
    phones.model,
    phones.manufacturer,
    phones.serial_number,
    services.service_type,
    repairstatus.status_description
   FROM (((((public.repairs
     JOIN public.customers ON ((customers.customer_id = repairs.customer_id)))
     JOIN public.customercontacts ON ((customers.customer_id = customercontacts.customer_id)))
     JOIN public.phones ON ((phones.phone_id = repairs.phone_id)))
     JOIN public.services ON ((services.service_id = repairs.service_id)))
     JOIN public.repairstatus ON ((repairstatus.status_id = repairs.status_id)))
  ORDER BY customers.customer_id;


ALTER TABLE public.userbaseview OWNER TO postgres;

--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: employees employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);


--
-- Name: parts part_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parts ALTER COLUMN part_id SET DEFAULT nextval('public.parts_part_id_seq'::regclass);


--
-- Name: payments payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN payment_id SET DEFAULT nextval('public.payments_payment_id_seq'::regclass);


--
-- Name: phones phone_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones ALTER COLUMN phone_id SET DEFAULT nextval('public.phones_phone_id_seq'::regclass);


--
-- Name: repairs repair_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairs ALTER COLUMN repair_id SET DEFAULT nextval('public.repairs_repair_id_seq'::regclass);


--
-- Name: repairstatus status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairstatus ALTER COLUMN status_id SET DEFAULT nextval('public.repairstatus_status_id_seq'::regclass);


--
-- Name: reviews review_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);


--
-- Name: services service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);


--
-- Name: customercontacts customercontacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customercontacts
    ADD CONSTRAINT customercontacts_pkey PRIMARY KEY (customer_id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (part_id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- Name: phones phones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phones_pkey PRIMARY KEY (phone_id);


--
-- Name: repairdates repairdates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairdates
    ADD CONSTRAINT repairdates_pkey PRIMARY KEY (repair_id);


--
-- Name: repairs repairs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_pkey PRIMARY KEY (repair_id);


--
-- Name: repairstatus repairstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairstatus
    ADD CONSTRAINT repairstatus_pkey PRIMARY KEY (status_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- Name: workdescriptions workdescriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workdescriptions
    ADD CONSTRAINT workdescriptions_pkey PRIMARY KEY (repair_id);


--
-- Name: customercontacts customercontacts_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customercontacts
    ADD CONSTRAINT customercontacts_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: payments payments_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_fk FOREIGN KEY (repair_id) REFERENCES public.repairs(repair_id);


--
-- Name: payments payments_repair_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_repair_id_fkey FOREIGN KEY (repair_id) REFERENCES public.repairs(repair_id);


--
-- Name: repair_details repair_details_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_details
    ADD CONSTRAINT repair_details_fk1 FOREIGN KEY (repair_id) REFERENCES public.repairs(repair_id);


--
-- Name: repair_details repair_details_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_details
    ADD CONSTRAINT repair_details_fk2 FOREIGN KEY (part_id) REFERENCES public.parts(part_id);


--
-- Name: repair_details repair_details_part_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_details
    ADD CONSTRAINT repair_details_part_id_fkey FOREIGN KEY (part_id) REFERENCES public.parts(part_id);


--
-- Name: repair_details repair_details_repair_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repair_details
    ADD CONSTRAINT repair_details_repair_id_fkey FOREIGN KEY (repair_id) REFERENCES public.repairs(repair_id);


--
-- Name: repairdates repairdates_repair_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairdates
    ADD CONSTRAINT repairdates_repair_id_fkey FOREIGN KEY (repair_id) REFERENCES public.repairs(repair_id);


--
-- Name: repairs repairs_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) NOT VALID;


--
-- Name: repairs repairs_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id) NOT VALID;


--
-- Name: repairs repairs_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_fk1 FOREIGN KEY (service_id) REFERENCES public.services(service_id);


--
-- Name: repairs repairs_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_fk2 FOREIGN KEY (status_id) REFERENCES public.repairstatus(status_id);


--
-- Name: repairs repairs_phone_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_phone_id_fkey FOREIGN KEY (phone_id) REFERENCES public.phones(phone_id);


--
-- Name: repairs repairs_pk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_pk FOREIGN KEY (phone_id) REFERENCES public.phones(phone_id);


--
-- Name: repairs repairs_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(service_id);


--
-- Name: repairs repairs_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repairs
    ADD CONSTRAINT repairs_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.repairstatus(status_id);


--
-- Name: reviews reviews_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_fk FOREIGN KEY (repair_id) REFERENCES public.repairs(repair_id);


--
-- Name: reviews reviews_repair_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_repair_id_fkey FOREIGN KEY (repair_id) REFERENCES public.repairs(repair_id);


--
-- Name: workdescriptions workdescriptions_repair_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workdescriptions
    ADD CONSTRAINT workdescriptions_repair_id_fkey FOREIGN KEY (repair_id) REFERENCES public.repairs(repair_id);


--
-- Name: TABLE customercontacts; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.customercontacts TO client;


--
-- Name: TABLE customers; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.customers TO client;


--
-- Name: TABLE phones; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.phones TO client;


--
-- Name: TABLE repairdates; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.repairdates TO client;


--
-- Name: TABLE reviews; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,UPDATE ON TABLE public.reviews TO client;


--
-- Name: TABLE userbaseview; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.userbaseview TO client;


--
-- PostgreSQL database dump complete
--

