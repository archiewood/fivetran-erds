CREATE TABLE coupon_form_discount (
    "index" text,
    coupon_form_id text,
    distribute text,
    per_ticket text,
    "value" text,
    value_type text,
    PRIMARY KEY ("index", coupon_form_id),
    FOREIGN KEY (coupon_form_id) REFERENCES coupon_form(id)
);

CREATE TABLE coupon_form_code (
    "index" text,
    coupon_form_id text,
    code text,
    date_created text,
    redeemed text,
    PRIMARY KEY ("index", coupon_form_id),
    FOREIGN KEY (coupon_form_id) REFERENCES coupon_form(id)
);

CREATE TABLE coupon_form (
    id text,
    form_id text,
    available text,
    currency text,
    date_created text,
    date_updated text,
    "name" text,
    product_id text,
    redeemed text,
    PRIMARY KEY (id, form_id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE form (
    id text,
    date_archived text,
    date_created text,
    date_updated timestamp,
    "name" text,
    product text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE subscription (
    id text,
    customer_id text,
    form_id text,
    order_id text,
    adjustment text,
    amount text,
    category text,
    currency text,
    date_created text,
    date_last text,
    date_next text,
    date_updated timestamp,
    deductible text,
    display_id text,
    order_email text,
    payments_completed text,
    payments_remaining text,
    schedule text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (form_id) REFERENCES form(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE "transaction" (
    id text,
    customer_id text,
    form_id text,
    order_id text,
    billing_email text,
    cc_expiration text,
    currency text,
    date_created text,
    date_updated timestamp,
    deductible text,
    display_id text,
    exp_month text,
    exp_year text,
    gateway_message text,
    gateway_reference text,
    metadata text,
    order_email text,
    payment_mask text,
    payment_method text,
    payment_type text,
    source_type text,
    "status" text,
    total text,
    transaction_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (form_id) REFERENCES form(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE form_inventory (
    _fivetran_id text,
    form_id text,
    date_created text,
    date_updated text,
    "key" text,
    "name" text,
    "path" text,
    quantity text,
    sold text,
    PRIMARY KEY (_fivetran_id, form_id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE registrant_field_data (
    "index" text,
    registrant_id text,
    amount text,
    label text,
    "path" text,
    "value" text,
    PRIMARY KEY ("index", registrant_id),
    FOREIGN KEY (registrant_id) REFERENCES registrant(id)
);

CREATE TABLE registrant (
    id text,
    customer_id text,
    form_id text,
    order_id text,
    amount text,
    checked_in text,
    currency text,
    date_checked_in text,
    date_created text,
    date_updated timestamp,
    display_id text,
    form_acc_ref text,
    metadata text,
    outstanding_amount text,
    source_type text,
    "status" text,
    total text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (form_id) REFERENCES form(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE membership (
    id text,
    customer_id text,
    registrant_id text,
    auto_renew text,
    date_created text,
    date_updated timestamp,
    email text,
    expiration_date text,
    fee text,
    first_name text,
    imported_member_id text,
    last_name text,
    level_active text,
    level_allow_auto_renew text,
    level_expiration_schedule text,
    level_expiration_type text,
    level_fee text,
    level_hash text,
    level_id text,
    level_name text,
    level_next_renewal_date text,
    member_id text,
    payment_mask text,
    payment_method text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (registrant_id) REFERENCES registrant(id)
);

CREATE TABLE coupon_discount (
    "index" text,
    coupon_id text,
    "value" text,
    value_type text,
    PRIMARY KEY ("index", coupon_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id)
);

CREATE TABLE coupon_code (
    "index" text,
    coupon_id text,
    code text,
    date_created text,
    date_updated text,
    redeemed text,
    PRIMARY KEY ("index", coupon_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id)
);

CREATE TABLE coupon (
    id text,
    product_id text,
    available text,
    currency text,
    date_created text,
    date_updated text,
    "name" text,
    redeemed text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES coupon_form(product_id)
);

CREATE TABLE orders (
    id text,
    customer_id text,
    form_id text,
    billing_address_city text,
    billing_address_country text,
    billing_address_postal_code text,
    billing_address_state text,
    billing_address_street_1 text,
    billing_first_name text,
    billing_last_name text,
    billing_phone text,
    currency text,
    customer_email text,
    date_created text,
    date_updated timestamp,
    display_id text,
    form_acc_ref text,
    form_name text,
    metadata text,
    order_number text,
    "status" text,
    total text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE ticket_field_data (
    "index" text,
    ticket_id text,
    amount text,
    label text,
    "path" text,
    PRIMARY KEY ("index", ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket (
    id text,
    customer_id text,
    form_id text,
    order_id text,
    amount text,
    currency text,
    date_created text,
    date_updated timestamp,
    display_id text,
    event_date text,
    fee text,
    form_acc_ref text,
    level_key text,
    level_label text,
    order_customer_id text,
    order_email text,
    "status" text,
    total text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (form_id) REFERENCES form(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE customer (
    id text,
    amount text,
    date_created text,
    date_updated timestamp,
    display_id text,
    email text,
    PRIMARY KEY (id)
);
