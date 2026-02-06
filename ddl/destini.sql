CREATE TABLE product (
    gtin text,
    category text,
    description text,
    family text,
    "name" text,
    timestamps text,
    upc text,
    PRIMARY KEY (gtin)
);

CREATE TABLE timestamps (
    _fivetran_id text,
    timestamps text,
    PRIMARY KEY (_fivetran_id)
);
