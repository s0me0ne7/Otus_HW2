DROP TABLE IF EXISTS public.clientproduct_transactions;
DROP TABLE IF EXISTS public.clientproducts;
DROP TABLE IF EXISTS public.clients;
DROP TABLE IF EXISTS public.product_type;

Drop SEQUENCE IF EXISTS public.clients_id;
Drop SEQUENCE IF EXISTS public.clientproducts_id;
Drop SEQUENCE IF EXISTS public.product_type_id;
Drop SEQUENCE IF EXISTS public.clientproduct_transactions_id;

CREATE SEQUENCE public.clients_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
	
ALTER SEQUENCE public.clients_id
    OWNER TO postgres; 

CREATE SEQUENCE public.clientproducts_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
	
ALTER SEQUENCE public.clientproducts_id
    OWNER TO postgres; 
	
CREATE SEQUENCE public.product_type_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;
	
ALTER SEQUENCE public.product_type_id
    OWNER TO postgres; 
	
CREATE SEQUENCE public.clientproduct_transactions_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
	
ALTER SEQUENCE public.clientproduct_transactions_id
    OWNER TO postgres; 	

CREATE TABLE IF NOT EXISTS public.clients
(
	id bigint NOT NULL DEFAULT nextval('clients_id'::regclass),
	email character varying(255) NOT NULL,
	first_name character varying(255) NOT NULL,
	last_name character varying(255) NOT NULL,
	second_name character varying(255),
	CONSTRAINT Clients_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;

ALTER TABLE public.clients
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.product_type
(
    id int NOT NULL DEFAULT nextval('product_type_id'::regclass),
    name character varying(255) NOT NULL,
	PRIMARY KEY (id)
)
TABLESPACE pg_default;

ALTER TABLE public.product_type
    OWNER to postgres;

ALTER TABLE public.clients
	OWNER to postgres;
	
CREATE TABLE IF NOT EXISTS public.clientproducts
(
    id bigint NOT NULL DEFAULT nextval('clientproducts_id'::regclass),
    client_id bigint NOT NULL,
    product_type_id int NOT NULL,
    PRIMARY KEY (id),
	CONSTRAINT fk_client
    	FOREIGN KEY(client_id) 
			REFERENCES clients(id),
	CONSTRAINT fk_prtype
    	FOREIGN KEY(product_type_id) 
			REFERENCES product_type(id)
)
TABLESPACE pg_default;

ALTER TABLE public.clientproducts
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS public.clientproduct_transactions
(
    id bigint NOT NULL DEFAULT nextval('clientproduct_transactions_id'::regclass),
    clientproduct_id bigint NOT NULL,
    amount numeric(20,4) NOT NULL,
    CONSTRAINT clientproduct_transactions_pkey PRIMARY KEY (id),
	CONSTRAINT fk_clientproduct
    	FOREIGN KEY(clientproduct_id) 
			REFERENCES clientproducts(id) on delete cascade
)

TABLESPACE pg_default;

ALTER TABLE public.clientproduct_transactions
    OWNER to postgres;

