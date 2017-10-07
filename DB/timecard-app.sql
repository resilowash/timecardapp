create database timecard
  create schema ta

    create table portfolio(
      portfolio-id serial not null primary key,
      portfolio-code varchar(20) unique,
      portfolio-description text
    )

    create table projecttype(
      project-type-id serial not null primary key,
      project-type-name varchar(100)
    )

    create table project(
      project-id serial not null primary key,
      project-code varchar(20) unique,
      project-description text,
      portfolio-id int not null,
      project-type-id int not null,

      constraint fk_project_projecttype_project-type-id FOREIGN KEY references projecttype(project-type-id),
      constraint fk_project_portfolio_portfolio-id FOREIGN KEY reference portfolio(portfolio-id)
    )

    create table person(
      person-id serial not null primary key,
      user-name varchar(30) not null unique,
      email varchar(200) not null unique,
      first-name varchar(100) not null,
      last-name varchar(100) not null,
      salt varchar(100) not null,
      pw varchar(250) not null
    )

    create table timecard(
      timecard-id serial not null primary key,
      person-id int not null,
      period-end-date date not null,

      constraint fk_timecard_person_personID foreign key references person(person-id)
    )

    create table timecardentry(
      timecard-id int not null,
      project-id int not null,
      hours decimal,

      constraint pk_timecardentry primary key (timecard-id, project-id),
      constraint fk_timecardentry_project_projectid foreign key references project(project-id),
      constraint fk_timecardentry_timecard_timecardid foreign key references timecard(timecard-id)
    ); 
