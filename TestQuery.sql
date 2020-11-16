SELECT champ_name from CHAMPION 
WHERE champ_role = 'ADC' and max_health_points > 2000 ; 

SELECT MIN(date_created) as oldest, MAX(date_created) as youngest,
(MAX(date_created) - MIN(date_created))
FROM user_account;

SELECT champ_name FROM champion_skins 
WHERE skin_name ='Indigo'
order by champ_name asc;

SELECT acct_name, count(skin_name) FROM skins_owned
group by acct_name
having count(skin_name)>=2;

SELECT ability_name FROM ABILITY
where max_damage > 400 and ability_type = 'Projectile';

SELECT i.item_name, stats.stat_name, stats.stat_value FROM item i, item_stats stats
where i.item_name = stats.item_name and stats.stat_value >100
order by stats.stat_value desc;

SELECT tower_tier, tower_hp FROM tower where
tower_hp >12000;

SELECT lane_name, max_lane_hp as Creep_Name from lane_creep 
where lane_creep_damage >20 and max_lane_hp>=100;

SELECT MIN(jungle_creep_damage) as min_damage, MAX(jungle_creep_damage) as max_damage,
(MAX(jungle_creep_damage) - MIN(jungle_creep_damage))
FROM jungle_creep;

SELECT boss_name, boss_exp, boss_respawn_time FROM boss_creep
where map_name = 'HighNova' and boss_respawn_time <240;



