

create table users(
    user_id char(36) not null primary key,
    email varchar(100) not null,
    password_salt char(64) not null,
    password_hash char(256) not null,
    is_active boolean not null
);