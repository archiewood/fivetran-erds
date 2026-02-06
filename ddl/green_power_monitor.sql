CREATE TABLE plant_parameter (
    _fivetran_id text,
    plant_id text,
    "key" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (plant_id) REFERENCES plant(id)
);

CREATE TABLE plant (
    id text,
    alarm_color text,
    alert_icon text,
    "name" text,
    unique_id text,
    PRIMARY KEY (id)
);

CREATE TABLE element (
    id text,
    parent_id text,
    plant_id text,
    "name" text,
    "type" text,
    type_string text,
    unique_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES element(id),
    FOREIGN KEY (plant_id) REFERENCES plant(id)
);

CREATE TABLE datalist_year (
    "date" text,
    data_source_id text,
    "value" text,
    PRIMARY KEY ("date"),
    FOREIGN KEY (data_source_id) REFERENCES datasource(id)
);

CREATE TABLE element_parameter (
    data_source_id text,
    element_id text,
    component_id text,
    fixed_type text,
    "name" text,
    portal_id text,
    sub_type text,
    PRIMARY KEY (data_source_id, element_id),
    FOREIGN KEY (data_source_id) REFERENCES datasource(id),
    FOREIGN KEY (element_id) REFERENCES element(id)
);

CREATE TABLE element_description (
    _fivetran_id text,
    element_id text,
    "key" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (element_id) REFERENCES element(id)
);

CREATE TABLE datasource (
    id text,
    plant_id text,
    data_source_name text,
    element_id text,
    unit text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES element(id),
    FOREIGN KEY (plant_id) REFERENCES plant(id)
);

CREATE TABLE datalist (
    "date" text,
    data_source_id text,
    "value" text,
    PRIMARY KEY ("date"),
    FOREIGN KEY (data_source_id) REFERENCES datasource(id)
);

CREATE TABLE kpi_value (
    id text,
    data_source_id text,
    plant_id text,
    fixed_type text,
    "name" text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (data_source_id) REFERENCES datasource(id),
    FOREIGN KEY (plant_id) REFERENCES plant(id)
);

CREATE TABLE datalist_month (
    "date" text,
    data_source_id text,
    "value" text,
    PRIMARY KEY ("date"),
    FOREIGN KEY (data_source_id) REFERENCES datasource(id)
);
