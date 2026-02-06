CREATE TABLE station_zipcode (
    id bigint,
    station_id bigint,
    PRIMARY KEY (id, station_id),
    FOREIGN KEY (id) REFERENCES spatial_zipcode(id),
    FOREIGN KEY (station_id) REFERENCES station(id)
);

CREATE TABLE station (
    id bigint,
    city text,
    connect_date text,
    county text,
    disconnect_date text,
    elevation bigint,
    ground_cover text,
    hms_latitude text,
    hms_longitude text,
    is_active boolean,
    is_eto_station boolean,
    "name" text,
    regional_office text,
    siting_desc text,
    PRIMARY KEY (id)
);

CREATE TABLE spatial_zipcode (
    id bigint,
    connect_date text,
    disconnect_date text,
    is_active boolean,
    PRIMARY KEY (id)
);

CREATE TABLE data_item_record (
    _fivetran_id text,
    station_id text,
    station_zipcode_id text,
    "date" text,
    day_air_tmp_avg_qc text,
    day_air_tmp_avg_unit text,
    day_air_tmp_avg_value text,
    day_air_tmp_max_qc text,
    day_air_tmp_max_unit text,
    day_air_tmp_max_value text,
    day_air_tmp_min_qc text,
    day_air_tmp_min_unit text,
    day_air_tmp_min_value text,
    day_asce_eto_qc text,
    day_asce_eto_unit text,
    day_asce_eto_value text,
    day_dew_pnt_qc text,
    day_dew_pnt_unit text,
    day_dew_pnt_value text,
    day_precip_qc text,
    day_precip_unit text,
    day_precip_value text,
    day_rel_hum_avg_qc text,
    day_rel_hum_avg_unit text,
    day_rel_hum_avg_value text,
    day_rel_hum_max_qc text,
    day_rel_hum_max_unit text,
    day_rel_hum_max_value text,
    day_rel_hum_min_qc text,
    day_rel_hum_min_unit text,
    day_rel_hum_min_value text,
    day_soil_tmp_avg_qc text,
    day_soil_tmp_avg_unit text,
    day_soil_tmp_avg_value text,
    day_sol_rad_avg_qc text,
    day_sol_rad_avg_unit text,
    day_sol_rad_avg_value text,
    day_vap_pres_avg_qc text,
    day_vap_pres_avg_unit text,
    day_vap_pres_avg_value text,
    day_wind_run_qc text,
    day_wind_run_unit text,
    day_wind_run_value text,
    day_wind_spd_avg_qc text,
    day_wind_spd_avg_unit text,
    day_wind_spd_avg_value text,
    julian text,
    scope text,
    standard text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (station_id) REFERENCES data_item(station_id),
    FOREIGN KEY (station_zipcode_id) REFERENCES station_zipcode(id)
);

CREATE TABLE data_item (
    _fivetran_id text,
    station_id bigint,
    "name" text,
    owner text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (station_id) REFERENCES station(id)
);
