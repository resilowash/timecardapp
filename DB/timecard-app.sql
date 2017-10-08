/*
create database Timecard;
  \c Timecard
  */
  create schema ta

    create table Portfolio(
      PortfolioID serial not null primary key,
      PortfolioCode varchar(20) unique,
      PortfolioDescription text
    )

    create table ProjectType(
      ProjectTypeID serial not null primary key,
      ProjectTypeName varchar(100)
    )

    create table Project(
      ProjectID serial not null primary key,
      ProjectCode varchar(20) unique,
      ProjectDescription text,
      PortfolioID int not null references Portfolio(PortfolioID),
      ProjectTypeID int not null references ProjectType(ProjectTypeID)
    )

    create table Person(
      PersonID serial not null primary key,
      UserName varchar(30) not null unique,
      Email varchar(200) not null unique,
      FirstName varchar(100) not null,
      LastName varchar(100) not null,
      Salt varchar(100) not null,
      PW varchar(250) not null
    )

    create table Timecard(
      TimecardID serial not null primary key,
      PersonID int not null references Person(PersonID),
      PeriodEndDate date not null
    )

    create table TimecardEntry(
      TimecardID int not null references timecard(TimecardID),
      ProjectID int not null references project(ProjectID),
      Hours decimal,
      primary key (TimeCardID, ProjectID)
    );
