## Créer la table et charger les données

```sql
create or replace table publishers (
    publisher VARCHAR NOT NULL PRIMARY KEY,
    shortname VARCHAR NOT NULL UNIQUE,
    iso_alpha_2 VARCHAR(2) NOT NULL CHECK (iso_alpha_2 = 'NC' or iso_alpha_2 = 'FR'),
    iso_alpha_3 VARCHAR(3) NOT NULL CHECK (iso_alpha_3 = 'NCL' or iso_alpha_3 = 'FRA'),
    code_officiel_geographique_insee INTEGER NOT NULL,
    siren VARCHAR(9) check (siren is null or length(siren) = 9) UNIQUE,
    siret VARCHAR(14) check (siret is null or length(siret) = 14) UNIQUE,
    rid7 VARCHAR(7) check (rid7 is null or length(rid7) = 7) UNIQUE,
    www_url VARCHAR UNIQUE,
    handle_twitter VARCHAR(15) UNIQUE,
    handle_facebook VARCHAR(50) UNIQUE,
    handle_instagram VARCHAR(30) UNIQUE,
    url_linkedin VARCHAR UNIQUE,
    handle_youtube VARCHAR(20) UNIQUE,
    handle_github VARCHAR(39) UNIQUE,
    handle_dockerhub VARCHAR(10) UNIQUE,
    handle_kaggle VARCHAR(10) UNIQUE
);

insert into publishers
select *
from
    read_csv_auto('https://raw.githubusercontent.com/adriens/odata-data-gouv-nc/main/data/publishers.csv');

```

# Requêter

```sql
select * from publishers;

```

```sql
SELECT publisher,
    shortname,
    siren
from publishers
where
    iso_alpha_2= 'FR';

```
