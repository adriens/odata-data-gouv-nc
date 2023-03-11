create or replace table publishers (
    publisher VARCHAR NOT NULL PRIMARY KEY,
    shortname VARCHAR NOT NULL,
    iso_alpha_2 VARCHAR(2) NOT NULL CHECK (iso_alpha_2 = 'NC' or iso_alpha_2 = 'FR'),
    iso_alpha_3 VARCHAR(3) NOT NULL CHECK (iso_alpha_3 = 'NCL' or iso_alpha_3 = 'FRA'),
    siren VARCHAR(9) check (siren is null or length(siren) = 9),
    siret VARCHAR(14) check (siret is null or length(siret) = 14),
    rid7 VARCHAR(7) check (rid7 is null or length(rid7) = 7),
    www_url VARCHAR,
    handle_twitter VARCHAR(15),
    handle_facebook VARCHAR(50),
    handle_instagram VARCHAR(30),
    url_linkedin VARCHAR,
    handle_youtube VARCHAR(20),
    handle_github VARCHAR(39)
);

insert into publishers
select *
from
read_csv_auto('https://raw.githubusercontent.com/adriens/odata-data-gouv-nc/main/data/publishers.csv');


select *
from publishers;
