DROP TABLE champion CASCADE CONSTRAINTS;
CREATE TABLE champion (
  champ_name     varchar2(10) not null,
  champ_role     varchar2(10) not null,
  champ_level    number(2),
  total_exp      number(5),
  max_health_points  number(4),
  max_mana_points    number(4),
  respawn_time   number(3),
  --skins          varchar2(10),
  primary key(champ_name)
);

DROP TABLE user_account CASCADE CONSTRAINTS;
CREATE TABLE user_account (
  acct_name         varchar2(20) not null,
  acct_password     varchar2(20) not null,
  acctid            number(5),
  fname             varchar2(10) not null,
  lname             varchar2(10) not null,
  email             varchar2(30),
  date_created      date,
  dob               varchar2(10) not null,
  acct_level        number(3),
  primary key(acct_name)
);

DROP TABLE skin CASCADE CONSTRAINTS;
CREATE TABLE skin (
  skin_name    varchar2(10) not null,
  primary key(skin_name)
);

--multi-val attribute
DROP TABLE champion_skins CASCADE CONSTRAINTS;
CREATE TABLE champion_skins (
  champ_name   varchar2(20) not null,
  skin_name    varchar2(10) not null,
  foreign key(champ_name) references champion(champ_name),
  foreign key(skin_name) references skin(skin_name)
);

--multi-val attribute
DROP TABLE skins_owned CASCADE CONSTRAINTS;
CREATE TABLE skins_owned (
  acct_name    varchar2(20) not null,
  skin_name    varchar2(10) not null,
  foreign key(acct_name) references user_account(acct_name),
  foreign key(skin_name) references skin(skin_name)
);

DROP TABLE ability CASCADE CONSTRAINTS;
CREATE TABLE ability (
  ability_name      varchar2(10) not null,
  --champ_name      varchar2(10) not null,
  ability_type      varchar2(10),
  ability_tier      number(1),
  function  varchar2(10),
  max_damage        number(4),
  primary key(ability_name)
  --foreign key(champ_name) references champion(champ_name)
);

--delete?
DROP TABLE champ_ability CASCADE CONSTRAINTS;
CREATE TABLE champ_ability (
  champ_name      varchar2(10) not null,
  ability_name    varchar2(10) not null,
  --primary key(ability_name),
  foreign key(champ_name) references champion(champ_name),
  foreign key(ability_name) references ability(ability_name)
);

DROP TABLE item CASCADE CONSTRAINTS;
CREATE TABLE item (
  item_name       varchar2(25) not null,
  item_type       varchar2(20),
  tier            number(1),
  primary key(item_name)
);

DROP TABLE item_stats CASCADE CONSTRAINTS;
CREATE TABLE item_stats (
  stat_name      varchar2(10) not null,
  item_name      varchar2(25) not null,
  stat_value     number(3),
  primary key(stat_name),
  foreign key(item_name) references item(item_name)
);

DROP TABLE map CASCADE CONSTRAINTS;
CREATE TABLE map (
  map_name           varchar2(10) not null,
  champ_spawn_point  varchar2(5),
  primary key(map_name)
);

DROP TABLE base CASCADE CONSTRAINTS;
CREATE TABLE base (
  team_name      varchar2(10) not null,
  map_name       varchar2(10) not null,
  base_hp        number(5),
  primary key(team_name),
  foreign key(map_name) references map(map_name)
);

DROP TABLE tower CASCADE CONSTRAINTS;
CREATE TABLE tower (
  tower_tier       number(1),
  map_name         varchar2(10) not null,
  tower_hp         number(5),
  tower_damage     number(4),
  primary key(tower_tier),
  foreign key(map_name) references map(map_name)
);

DROP TABLE lane_creep CASCADE CONSTRAINTS;
CREATE TABLE lane_creep (
  lane_name           varchar2(10) not null,
  map_name            varchar2(10) not null,
  max_lane_hp         number(4),
  lane_creep_damage   number(4),
  lane_exp            number(4),
  lane_respawn_time   number(3),
  primary key(lane_name),
  foreign key(map_name) references map(map_name)
);

DROP TABLE jungle_creep CASCADE CONSTRAINTS;
CREATE TABLE jungle_creep (
  creep_name          varchar2(10) not null,
  map_name            varchar2(10) not null,
  max_creep_hp        number(4),
  jungle_creep_damage number(4),
  jungle_exp          number(4),
  jungle_respawn_time number(3),
  primary key(creep_name),
  foreign key(map_name) references map(map_name)
);

DROP TABLE boss_creep CASCADE CONSTRAINTS;
CREATE TABLE boss_creep (
  boss_name          varchar2(10) not null,
  map_name           varchar2(10) not null,
  boss_hp            number(5),
  boss_damage        number(4),
  boss_exp           number(4),
  boss_respawn_time  number(3),
  primary key(boss_name),
  foreign key(map_name) references map(map_name)
);
  
  