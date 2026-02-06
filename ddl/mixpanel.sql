CREATE TABLE android_device (
    device_id text,
    distinct_id text,
    PRIMARY KEY (device_id),
    FOREIGN KEY (distinct_id) REFERENCES people(distinct_id)
);

CREATE TABLE collections (
    "index" integer,
    distinct_id text,
    "value" bigint,
    PRIMARY KEY ("index", distinct_id),
    FOREIGN KEY (distinct_id) REFERENCES people(distinct_id)
);

CREATE TABLE responses (
    "index" integer,
    distinct_id text,
    "value" bigint,
    PRIMARY KEY ("index", distinct_id),
    FOREIGN KEY (distinct_id) REFERENCES people(distinct_id)
);

CREATE TABLE ios_device (
    ios_device text,
    distinct_id text,
    PRIMARY KEY (ios_device),
    FOREIGN KEY (distinct_id) REFERENCES people(distinct_id)
);

CREATE TABLE survey_collections (
    "index" integer,
    distinct_id text,
    "value" bigint,
    PRIMARY KEY ("index", distinct_id),
    FOREIGN KEY (distinct_id) REFERENCES people(distinct_id)
);

CREATE TABLE "transaction" (
    "time" timestamp,
    distinct_id text,
    amount double precision,
    payment_service text,
    payment_type text,
    promo_code text,
    purchase_date timestamp,
    subscription_type text,
    PRIMARY KEY ("time", distinct_id),
    FOREIGN KEY (distinct_id) REFERENCES people(distinct_id)
);

CREATE TABLE answer (
    question_id bigint,
    distinct_id text,
    answer boolean,
    collection_id bigint,
    question_type text,
    survey_id bigint,
    "time" timestamp,
    "value" text,
    PRIMARY KEY (question_id),
    FOREIGN KEY (distinct_id) REFERENCES people(distinct_id)
);

CREATE TABLE surveys (
    "index" integer,
    distinct_id text,
    "value" bigint,
    PRIMARY KEY ("index", distinct_id),
    FOREIGN KEY (distinct_id) REFERENCES people(distinct_id)
);

CREATE TABLE people (
    distinct_id text,
    "time" timestamp,
    PRIMARY KEY (distinct_id)
);

CREATE TABLE event (
    _fivetran_id text,
    distinct_id text,
    "name" text,
    properties jsonb,
    "time" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (distinct_id) REFERENCES people(distinct_id)
);

CREATE TABLE android_invalid_push_tokens (
    "index" integer,
    distinct_id text,
    "value" bigint,
    PRIMARY KEY ("index", distinct_id),
    FOREIGN KEY (distinct_id) REFERENCES people(distinct_id)
);

CREATE TABLE deliveries (
    "index" integer,
    distinct_id text,
    "value" bigint,
    PRIMARY KEY ("index", distinct_id),
    FOREIGN KEY (distinct_id) REFERENCES people(distinct_id)
);

CREATE TABLE journeys (
    "index" integer,
    distinct_id text,
    "value" bigint,
    PRIMARY KEY ("index", distinct_id),
    FOREIGN KEY (distinct_id) REFERENCES people(distinct_id)
);

CREATE TABLE survey_responses (
    "index" integer,
    distinct_id text,
    "value" bigint,
    PRIMARY KEY ("index", distinct_id),
    FOREIGN KEY (distinct_id) REFERENCES people(distinct_id)
);
