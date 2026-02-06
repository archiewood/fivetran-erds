CREATE TABLE rate (
    data_base text,
    data_timestamps timestamp,
    currency_code text,
    rate text,
    PRIMARY KEY (data_base, data_timestamps, currency_code),
    FOREIGN KEY (currency_code) REFERENCES currency(code)
);

CREATE TABLE historical_rate (
    historical_base text,
    historical_timestamps timestamp,
    currency_code text,
    rate text,
    PRIMARY KEY (historical_base, historical_timestamps, currency_code),
    FOREIGN KEY (currency_code) REFERENCES currency(code)
);

CREATE TABLE currency (
    code text,
    "name" text,
    PRIMARY KEY (code)
);
