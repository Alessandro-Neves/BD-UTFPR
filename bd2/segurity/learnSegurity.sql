-- sudo pg_createcluster 12 ale_testes
-- sudo pg_lsclusters
-- sudo -i -u postgres

-- sudo psql -p <port> -U postgres postgres

-- \l
-- \conninfo

create database whitepaper owner postgres;
create user alessandro with password 'alessandro';

-- \c whitepaper
drop table if exists products;
create table products(
    id serial primary key,
    code integer unique,
    description varchar(50)
);

-- \dt

create role whiters;
create role readers;
create role managers;

grant update,insert on products to whiters;
grant usage, select on sequence products_id_seq to whiters;

grant select on products to readers;

grant all privileges on products to managers;
grant all privileges on sequence products_id_seq to managers;
-- \du
-- \dp

grant whiters to alessandro;
revoke whiters from alessandro;
grant readers to alessandro;
revoke readers from alessandro;
grant managers to alessandro;
revoke manager from alessandro;

insert into products(code, description) values(101, 'lampada');
insert into products(code, description) values(102, 'tênis');
insert into products(code, description) values(103, 'telha');
insert into products(code, description) values(104, 'bola');
insert into products(code, description) values(105, 'mola');
insert into products(code, description) values(106, 'cubo');
insert into products(code, description) values(107, 'relógio');
insert into products(code, description) values(108, 'mola');
insert into products(code, description) values(109, 'telha');
insert into products(code, description) values(110, 'mouse');


create view tela1 as 
    select id, description
    from products
    where description <> 'restrito';


create role translater;
grant select,update on tela1 to translaters;
grant translaters to alessandro;
revoke translaters from alessandro;



revoke all privileges on products from readers;
revoke all privileges on products from whiters;
revoke all privileges on products from managers;

revoke all privileges on tela1 from translaters;


drop role readers;
drop role whiters;
drop role mangers;
drop role translaters;

drop table  if exists products cascade;
drop user if exists alessandro;

-- \c postgres 
drop database if exists whitepapers;