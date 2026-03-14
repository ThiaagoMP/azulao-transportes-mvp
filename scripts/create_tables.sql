CREATE TABLE if not exists "users"
(
    id_user     SERIAL       NOT NULL PRIMARY KEY,
    email       VARCHAR(100) NOT NULL UNIQUE,
    password    BYTEA        NOT NULL,
    name        VARCHAR(100) NOT NULL,
    last_access TIMESTAMP    NOT NULL,
    created_at  TIMESTAMP    NOT null DEFAULT now(),
    updated_at  TIMESTAMP    NULL,
    deleted_at  TIMESTAMP    NULL
);

CREATE TABLE if not exists "fuel_type"
(
    id_fuel_type SERIAL      NOT NULL PRIMARY KEY,
    name         VARCHAR(20) NOT NULL UNIQUE,
    abbreviation VARCHAR(5)  NULL unique,
    created_at   TIMESTAMP   NOT null DEFAULT now(),
    updated_at   timestamp   null,
    deleted_at   TIMESTAMP   NULL
);

CREATE TABLE if not exists "color"
(
    id_color    SERIAL      NOT NULL PRIMARY KEY,
    color_name  VARCHAR(30) NOT NULL UNIQUE,
    red_color   INTEGER     NOT null check (red_color > 0 and red_color <= 255),
    green_color INTEGER     NOT null check (green_color > 0 and green_color <= 255),
    blue_color  INTEGER     NOT null check (blue_color > 0 and blue_color <= 255),
    created_at  TIMESTAMP   NOT null DEFAULT now(),
    updated_at  timestamp   null,
    deleted_at  TIMESTAMP   NULL
);

CREATE TABLE if not exists "state"
(
    id_state   SERIAL      NOT NULL PRIMARY KEY,
    name       VARCHAR(50) NOT NULL UNIQUE,
    acronym    VARCHAR(5)  NOT NULL UNIQUE,
    created_at TIMESTAMP   NOT null DEFAULT now(),
    updated_at timestamp   null,
    deleted_at TIMESTAMP   NULL
);

CREATE TABLE if not exists "city"
(
    id_city    SERIAL      NOT NULL PRIMARY KEY,
    id_state   INTEGER     NOT NULL,
    name       VARCHAR(60) NOT NULL,
    created_at TIMESTAMP   NOT null default now(),
    updated_at timestamp   null,
    deleted_at TIMESTAMP   NULL,
    FOREIGN KEY ("id_state") REFERENCES "state" ("id_state")
);

CREATE TABLE if not exists "phone"
(
    id_phone     SERIAL      NOT NULL PRIMARY KEY,
    id_user      INTEGER     NOT NULL,
    country_code VARCHAR(5)  NOT NULL DEFAULT 55,
    area_code    VARCHAR(3)  NOT NULL,
    number       VARCHAR(15) NOT NULL,
    is_main      BOOLEAN     NOT NULL DEFAULT TRUE,
    active       BOOLEAN     NOT NULL DEFAULT TRUE,
    created_at   TIMESTAMP   NOT null default now(),
    updated_at   TIMESTAMP   NULL,
    deleted_at   TIMESTAMP   NULL,
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user")
);

CREATE TABLE if not exists "travel_customer"
(
    id_travel_customer SERIAL       NOT NULL PRIMARY KEY,
    id_user            INTEGER      NOT NULL,
    name               VARCHAR(50)  NOT NULL,
    document           VARCHAR(30)  NOT NULL,
    email              VARCHAR(100) NOT NULL,
    active             BOOLEAN      NOT NULL,
    created_at         TIMESTAMP    NOT null default now(),
    updated_at         TIMESTAMP    NULL,
    deleted_at         TIMESTAMP    NULL,
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user")
);

CREATE TABLE if not exists "driver"
(
    id_driver           SERIAL         NOT NULL PRIMARY KEY,
    id_user             INTEGER        NOT NULL,
    name                VARCHAR(100)   NOT NULL,
    cpf                 VARCHAR(11)    NOT NULL unique check (length(cpf) = 11),
    rg                  VARCHAR(20)    NOT NULL UNIQUE,
    birth_date          DATE           null,
    email               VARCHAR(100)   NOT NULL UNIQUE,
    license_number      VARCHAR(20)    NOT NULL UNIQUE,
    license_category    CHAR(2)        NOT NULL,
    license_expiration  DATE           NOT NULL,
    driver_salary       NUMERIC(12, 2) null check (driver_salary > 0),
    driver_type         TEXT           NOT NULL DEFAULT 'CLT',
    salary_date_payment DATE           NULL,
    status              TEXT           NOT NULL DEFAULT 'Ativo',
    active              BOOLEAN        NOT NULL,
    created_at          TIMESTAMP      NOT null default now(),
    updated_at          TIMESTAMP      NULL,
    deleted_at          TIMESTAMP      NULL,
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user")
);

CREATE TABLE if not exists "vehicle"
(
    id_vehicle               SERIAL         NOT NULL PRIMARY KEY,
    id_user                  INTEGER        NOT NULL,
    id_color                 INTEGER        NOT NULL,
    id_fueltype              INTEGER        NOT NULL,
    model                    VARCHAR(60)    NOT NULL,
    year_manufacture         SMALLINT       NOT null check (EXTRACT(YEAR FROM now()) >= year_manufacture),
    license_plate            VARCHAR(10)    NOT NULL,
    truck_body_volume        INTEGER        NOT NULL check (truck_body_volume > 0),
    average_fuel_consumption NUMERIC(12, 2) null check (average_fuel_consumption > 0),
    passengers               INTEGER        NOT null check (passengers > 0),
    renavam                  VARCHAR(20)    NOT NULL,
    chassis                  VARCHAR(20)    NOT NULL,
    gross_weight_tons        SMALLINT       NOT null check (gross_weight_tons > 0),
    number_of_axles          SMALLINT       NOT null check (number_of_axles > 0),
    fuel_tank_capacity       SMALLINT       NOT null check (fuel_tank_capacity > 0),
    capacity_kg              SMALLINT       NOT null check (capacity_kg > 0),
    status                   TEXT           NOT NULL DEFAULT 'active',
    license_expiration       DATE           NULL,
    insurance_expiration     DATE           NULL,
    inspection_expiration    DATE           NULL,
    antt_registration        VARCHAR(20)    NULL,
    sold_value               NUMERIC(12, 2) null check (sold_value > 0),
    current_odometer         INTEGER        NOT null check (current_odometer > 0),
    trip_limit               INTEGER        NOT NULL,
    created_at               TIMESTAMP      NOT null default now(),
    updated_at               TIMESTAMP      NULL,
    deleted_at               TIMESTAMP      NULL,
    FOREIGN KEY ("id_fueltype") REFERENCES "fuel_type" ("id_fuel_type"),
    FOREIGN KEY ("id_color") REFERENCES "color" ("id_color"),
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user")
);



CREATE TABLE if not exists "address"
(
    id_address SERIAL       NOT NULL PRIMARY KEY UNIQUE,
    id_city    INTEGER      NOT NULL,
    address    VARCHAR(100) NOT NULL,
    number     varchar(20)  NULL,
    complement VARCHAR(50)  NULL,
    is_main    BOOLEAN      NOT NULL,
    created_at TIMESTAMP    NOT NULL default now(),
    updated_at TIMESTAMP    NULL,
    deleted_at TIMESTAMP    NULL,
    FOREIGN KEY ("id_city") REFERENCES "city" ("id_city")
);

CREATE TABLE if not exists "driver_phone"
(
    id_driver_phone SERIAL    NOT NULL PRIMARY KEY,
    id_driver       INTEGER   NOT NULL,
    id_phone        INTEGER   NOT NULL,
    created_at      TIMESTAMP NOT NULL default now(),
    updated_at      timestamp null,
    deleted_at      TIMESTAMP NULL,
    FOREIGN KEY ("id_driver") REFERENCES "driver" ("id_driver"),
    FOREIGN KEY ("id_phone") REFERENCES "phone" ("id_phone")
);

CREATE TABLE if not exists "travel"
(
    id_travel                 SERIAL         NOT NULL PRIMARY KEY,
    id_user                   INTEGER        NOT NULL,
    id_vehicle                INTEGER        NOT NULL,
    id_travel_customer        INTEGER        NULL,
    travel_start_date         TIMESTAMP      NOT NULL,
    travel_end_date           TIMESTAMP      null check (travel_end_date > travel_start_date),
    return_empty_to_departure BOOLEAN        NOT NULL,
    total_mileage             NUMERIC(12, 2) NOT null check (total_mileage > 0),
    start_odometer            INTEGER        NOT null check (start_odometer > 0),
    end_odometer              INTEGER        null check (end_odometer > 0 and end_odometer > start_odometer),
    truckload_description     TEXT           NULL,
    truckload_weight_kg       INTEGER        null check (truckload_weight_kg > 0),
    contract_value            NUMERIC(12, 2) NOT null check (contract_value > 0),
    total_toll_cost           NUMERIC(12, 2) NOT null check (total_toll_cost > 0),
    other_expenses            NUMERIC(12, 2) NOT null check (other_expenses > 0),
    created_at                TIMESTAMP      NOT NULL default now(),
    updated_at                TIMESTAMP      NULL,
    deleted_at                TIMESTAMP      NULL,
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user"),
    FOREIGN KEY ("id_travel_customer") REFERENCES "travel_customer" ("id_travel_customer"),
    FOREIGN KEY ("id_vehicle") REFERENCES "vehicle" ("id_vehicle")
);

CREATE TABLE if not exists "vehicle_maintenance"
(
    id_vehicle_maintenance   SERIAL         NOT NULL PRIMARY KEY,
    id_user                  INTEGER        NOT NULL,
    id_vehicle               INTEGER        NOT NULL,
    maintenance_type         VARCHAR(50)    NOT NULL,
    description              TEXT           NULL,
    cost                     NUMERIC(12, 2) NOT null check (cost > 0),
    date                     DATE           NOT NULL,
    mileage                  INTEGER        NOT null check (mileage > 0),
    next_maintenance_date    DATE           null,
    next_maintenance_mileage INTEGER        null check (next_maintenance_mileage > 0),
    supplier                 VARCHAR(100)   NOT NULL,
    status                   TEXT           NOT NULL DEFAULT 'completed',
    created_at               TIMESTAMP      NOT NULL default now(),
    updated_at               TIMESTAMP      NULL,
    deleted_at               TIMESTAMP      NULL,
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user"),
    FOREIGN KEY ("id_vehicle") REFERENCES "vehicle" ("id_vehicle")
);

CREATE TABLE if not exists "user_phone"
(
    id_user_phone SERIAL    NOT NULL PRIMARY KEY,
    id_user       INTEGER   NOT NULL,
    id_phone      INTEGER   NOT NULL,
    created_at    TIMESTAMP NOT NULL default now(),
    updated_at    timestamp null,
    deleted_at    TIMESTAMP NULL,
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user"),
    FOREIGN KEY ("id_phone") REFERENCES "phone" ("id_phone")
);

CREATE TABLE if not exists "driver_address"
(
    id_driver_address SERIAL    NOT NULL PRIMARY KEY,
    id_user           INTEGER   NOT NULL,
    id_driver         INTEGER   NOT NULL,
    id_address        INTEGER   NOT NULL,
    created_at        TIMESTAMP NOT NULL default now(),
    updated_at        TIMESTAMP NULL,
    deleted_at        TIMESTAMP NULL,
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user"),
    FOREIGN KEY ("id_address") REFERENCES "address" ("id_address"),
    FOREIGN KEY ("id_driver") REFERENCES "driver" ("id_driver")
);

CREATE TABLE if not exists "user_address"
(
    id_user_address SERIAL    NOT NULL PRIMARY KEY,
    id_user         INTEGER   NOT NULL,
    id_address      INTEGER   NOT NULL,
    created_at      TIMESTAMP NOT NULL default now(),
    updated_at      TIMESTAMP NULL,
    deleted_at      TIMESTAMP NULL,
    FOREIGN KEY ("id_address") REFERENCES "address" ("id_address"),
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user")
);

CREATE TABLE if not exists "travel_billing"
(
    id_travel_billing SERIAL         NOT NULL PRIMARY KEY,
    id_user           INTEGER        NOT NULL,
    id_travel         INTEGER        NOT NULL,
    issue_date        TIMESTAMP      NOT NULL,
    due_date          TIMESTAMP      NOT NULL,
    value             NUMERIC(12, 2) NOT null check (value > 0),
    status            TEXT           NOT NULL DEFAULT 'pending',
    payment_date      TIMESTAMP      NULL,
    received_value    NUMERIC(12, 2) null check (received_value > 0),
    created_at        TIMESTAMP      NOT NULL default now(),
    updated_at        TIMESTAMP      NULL,
    deleted_at        TIMESTAMP      NULL,
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user"),
    FOREIGN KEY ("id_travel") REFERENCES "travel" ("id_travel")
);

CREATE TABLE if not exists "driver_payment"
(
    id_driver_payment SERIAL         NOT NULL PRIMARY KEY,
    id_travel         INTEGER        NULL,
    id_driver         INTEGER        NOT NULL,
    id_user           INTEGER        NOT NULL,
    value             NUMERIC(12, 2) NOT null check (value > 0),
    date              DATE           NOT NULL,
    payment_type      TEXT           NOT NULL,
    created_at        TIMESTAMP      NOT NULL default now(),
    updated_at        timestamp      null,
    deleted_at        TIMESTAMP      NULL,
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user"),
    FOREIGN KEY ("id_travel") REFERENCES "travel" ("id_travel"),
    FOREIGN KEY ("id_driver") REFERENCES "driver" ("id_driver")
);

CREATE TABLE if not exists "travel_driver"
(
    id_travel_driver SERIAL    NOT NULL PRIMARY KEY,
    id_user          INTEGER   NOT NULL,
    id_travel        INTEGER   NOT NULL,
    id_driver        INTEGER   NOT NULL,
    created_at       TIMESTAMP NOT NULL default now(),
    updated_at       timestamp null,
    deleted_at       TIMESTAMP NULL,
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user"),
    FOREIGN KEY ("id_travel") REFERENCES "travel" ("id_travel"),
    FOREIGN KEY ("id_driver") REFERENCES "driver" ("id_driver")
);

CREATE TABLE if not exists "travel_truck_unloading"
(
    id_travel_truck_unloading SERIAL         NOT NULL PRIMARY KEY,
    id_user                   INTEGER        NOT NULL,
    id_address                INTEGER        NOT NULL,
    id_travel                 INTEGER        NOT NULL,
    unloading_order           SMALLINT       NOT null check (unloading_order > 0),
    expense                   NUMERIC(12, 2) null check (expense > 0),
    created_at                TIMESTAMP      NOT NULL default now(),
    updated_at                timestamp      null,
    deleted_at                TIMESTAMP      NULL,
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user"),
    FOREIGN KEY ("id_address") REFERENCES "address" ("id_address"),
    FOREIGN KEY ("id_travel") REFERENCES "travel" ("id_travel")
);

CREATE TABLE if not exists "vehicle_refueling"
(
    id_vehicle_refueling SERIAL         NOT NULL PRIMARY KEY,
    id_user              INTEGER        NOT NULL,
    id_vehicle           INTEGER        NOT NULL,
    id_fuel_type         INTEGER        NOT NULL,
    id_travel            INTEGER        NULL,
    id_driver            INTEGER        NULL,
    station              VARCHAR(100)   NULL,
    refueling_date       DATE           NULL,
    liters               NUMERIC(10, 3) NOT null check (liters > 0),
    price_per_liter      NUMERIC(10, 3) NOT null check (price_per_liter > 0),
    total_cost           NUMERIC(12, 2) NOT null check (total_cost > 0),
    odometer             INTEGER        NOT null check (odometer > 0),
    full_tank            BOOLEAN        NOT null,
    notes                TEXT           NULL,
    active               BOOLEAN        NOT NULL,
    created_at           TIMESTAMP      NOT null DEFAULT now(),
    updated_at           TIMESTAMP      NULL,
    deleted_at           TIMESTAMP      NULL,
    FOREIGN KEY ("id_user") REFERENCES "users" ("id_user"),
    FOREIGN KEY ("id_travel") REFERENCES "travel" ("id_travel"),
    FOREIGN KEY ("id_driver") REFERENCES "driver" ("id_driver"),
    FOREIGN KEY ("id_fuel_type") REFERENCES "fuel_type" ("id_fuel_type"),
    FOREIGN KEY ("id_vehicle") REFERENCES "vehicle" ("id_vehicle")
);

