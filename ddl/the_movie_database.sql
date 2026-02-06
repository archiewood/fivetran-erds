CREATE TABLE tv_series_video (
    id text,
    tv_series_id text,
    iso_3166_1 text,
    iso_639_1 text,
    "key" text,
    "name" text,
    official text,
    published_at text,
    site text,
    "size" text,
    "type" text,
    PRIMARY KEY (id, tv_series_id),
    FOREIGN KEY (tv_series_id) REFERENCES tv_series(id)
);

CREATE TABLE tv_series_language (
    "index" text,
    tv_series_id text,
    languages text,
    PRIMARY KEY ("index", tv_series_id),
    FOREIGN KEY (tv_series_id) REFERENCES tv_series(id)
);

CREATE TABLE tv_series_created_by (
    id text,
    tv_series_id text,
    credit_id text,
    gender text,
    "name" text,
    original_name text,
    profile_path text,
    PRIMARY KEY (id, tv_series_id),
    FOREIGN KEY (tv_series_id) REFERENCES tv_series(id)
);

CREATE TABLE tv_series_genre (
    id text,
    tv_series_id text,
    "name" text,
    PRIMARY KEY (id, tv_series_id),
    FOREIGN KEY (tv_series_id) REFERENCES tv_series(id)
);

CREATE TABLE tv_series_network (
    id text,
    tv_series_id text,
    logo_path text,
    "name" text,
    origin_country text,
    PRIMARY KEY (id, tv_series_id),
    FOREIGN KEY (tv_series_id) REFERENCES tv_series(id)
);

CREATE TABLE tv_series_production_company (
    id text,
    tv_series_id text,
    logo_path text,
    "name" text,
    origin_country text,
    PRIMARY KEY (id, tv_series_id),
    FOREIGN KEY (tv_series_id) REFERENCES tv_series(id)
);

CREATE TABLE tv_series_production_country (
    "index" text,
    tv_series_id text,
    iso_3166_1 text,
    "name" text,
    PRIMARY KEY ("index", tv_series_id),
    FOREIGN KEY (tv_series_id) REFERENCES tv_series(id)
);

CREATE TABLE tv_series_season (
    id text,
    tv_series_id text,
    air_date text,
    episode_count text,
    "name" text,
    overview text,
    poster_path text,
    season_number text,
    vote_average text,
    PRIMARY KEY (id, tv_series_id),
    FOREIGN KEY (tv_series_id) REFERENCES tv_series(id)
);

CREATE TABLE tv_series_spoken_language (
    "index" text,
    tv_series_id text,
    english_name text,
    iso_639_1 text,
    "name" text,
    PRIMARY KEY ("index", tv_series_id),
    FOREIGN KEY (tv_series_id) REFERENCES tv_series(id)
);

CREATE TABLE tv_series (
    id text,
    adult text,
    backdrop_path text,
    episode_run_time jsonb,
    first_air_date text,
    homepage text,
    in_production text,
    last_air_date text,
    last_episode_to_air_date text,
    last_episode_to_air_episode_number text,
    last_episode_to_air_episode_type text,
    last_episode_to_air_id text,
    last_episode_to_air_name text,
    last_episode_to_air_overview text,
    last_episode_to_air_production_code text,
    last_episode_to_air_runtime text,
    last_episode_to_air_season_number text,
    last_episode_to_air_show_id text,
    last_episode_to_air_still_path text,
    last_episode_to_air_vote_average text,
    last_episode_to_air_vote_count text,
    "name" text,
    next_episode_to_air text,
    number_of_episodes text,
    number_of_seasons text,
    origin_country jsonb,
    original_language text,
    original_name text,
    overview text,
    popularity text,
    poster_path text,
    "status" text,
    tagline text,
    "type" text,
    vote_average text,
    vote_count text,
    PRIMARY KEY (id)
);

CREATE TABLE movie_video (
    id text,
    movie_id text,
    iso_3166_1 text,
    iso_639_1 text,
    "key" text,
    "name" text,
    official text,
    published_at text,
    site text,
    "size" text,
    "type" text,
    PRIMARY KEY (id, movie_id),
    FOREIGN KEY (movie_id) REFERENCES movie(id)
);

CREATE TABLE movie_genre (
    id text,
    movie_id text,
    "name" text,
    PRIMARY KEY (id, movie_id),
    FOREIGN KEY (movie_id) REFERENCES movie(id)
);

CREATE TABLE movie_production_company (
    id text,
    movie_id text,
    logo_path text,
    "name" text,
    origin_country text,
    PRIMARY KEY (id, movie_id),
    FOREIGN KEY (movie_id) REFERENCES movie(id)
);

CREATE TABLE movie_production_country (
    "index" text,
    movie_id text,
    iso_3166_1 text,
    "name" text,
    PRIMARY KEY ("index", movie_id),
    FOREIGN KEY (movie_id) REFERENCES movie(id)
);

CREATE TABLE movie_spoken_language (
    "index" text,
    movie_id text,
    english_name text,
    iso_639_1 text,
    "name" text,
    PRIMARY KEY ("index", movie_id),
    FOREIGN KEY (movie_id) REFERENCES movie(id)
);

CREATE TABLE movie (
    id text,
    adult text,
    backdrop_path text,
    belongs_to_collection_backdrop_path text,
    belongs_to_collection_id text,
    belongs_to_collection_name text,
    belongs_to_collection_poster_path text,
    budget text,
    homepage text,
    imdb_id text,
    origin_country jsonb,
    original_language text,
    original_title text,
    overview text,
    popularity text,
    poster_path text,
    release_date text,
    revenue text,
    runtime text,
    "status" text,
    tagline text,
    title text,
    video text,
    vote_average text,
    vote_count text,
    PRIMARY KEY (id)
);
