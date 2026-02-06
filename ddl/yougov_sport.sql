CREATE TABLE online_press (
    "date" text,
    event_id text,
    correct_mention text,
    count text,
    date_formatted text,
    event_name text,
    exp_count text,
    gross text,
    image_mention text,
    incorrect_mention text,
    net text,
    other_mention text,
    readership text,
    PRIMARY KEY ("date", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE social_media (
    "date" text,
    event_id text,
    comments text,
    count text,
    date_formatted text,
    dislikes text,
    event_name text,
    expcount text,
    gross text,
    image_mention text,
    impression text,
    likes text,
    net text,
    other_mention text,
    shares text,
    total_engagement text,
    views text,
    PRIMARY KEY ("date", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE linear_tv (
    broadcaster_id text,
    country_id text,
    "date" text,
    event_id text,
    audience text,
    brand_exposure text,
    brand_exposure_per_hour text,
    brand_impact_score text,
    broadcaster text,
    count text,
    country text,
    dateformatted text,
    discount_percentage text,
    duration text,
    event_name text,
    gross text,
    net text,
    number_of_seconds text,
    sport_id text,
    sport_name text,
    PRIMARY KEY (broadcaster_id, country_id, "date", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE digital_streaming (
    broadcaster_id text,
    country_id text,
    "date" text,
    event_id text,
    audience text,
    brand_exposure text,
    brand_exposure_per_hour text,
    brand_impact_score text,
    broadcaster_name text,
    country_name text,
    date_formatted text,
    duration text,
    event_name text,
    gross text,
    net text,
    sport_id text,
    sport_name text,
    PRIMARY KEY (broadcaster_id, country_id, "date", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE social_media_video (
    "date" text,
    event_id text,
    brand_exposure text,
    brand_exposure_per_hour text,
    brand_impact_score text,
    comments text,
    count text,
    date_formatted text,
    dislikes text,
    duration text,
    event_name text,
    gross text,
    likes text,
    net text,
    shares text,
    total_engagement text,
    views text,
    PRIMARY KEY ("date", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);
