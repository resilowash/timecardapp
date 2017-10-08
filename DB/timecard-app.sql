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
      PortfolioID int not null,
      ProjectTypeID int not null,

      constraint fk_project_projecttype_ProjectTypeID FOREIGN KEY references ProjectType(ProjectTypeID),
      constraint fk_project_portfolio_PortfolioID FOREIGN KEY references portfolio(PortfolioID)
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
      PersonID int not null,
      PeriodEndDate date not null,

      constraint fk_timecard_person_PersonID foreign key references Person(PersonID)
    )

    create table TimecardEntry(
      TimecardID int not null,
      ProjectID int not null,
      Hours decimal,

      constraint pk_timecardentry primary key (TimeCardID, ProjectID),
      constraint fk_timecardentry_project_ProjectID foreign key references project(ProjectID),
      constraint fk_timecardentry_timecard_TimecardID foreign key references timecard(TimecardID)
    );
