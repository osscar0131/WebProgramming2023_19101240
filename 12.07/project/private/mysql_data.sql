CREATE DATABASE IF NOT EXISTS 19101240_web_project CHARACTER SET utf8 COLLATE utf8_bin;
USE 19101240_web_project;

CREATE TABLE IF NOT EXISTS user (
  uid int(12) NOT NULL AUTO_INCREMENT,
  id varchar(20) NOT NULL,
  password varchar(25) NOT NULL,
  CONSTRAINT user_PK PRIMARY KEY(uid)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO user (id, username, password, email) VALUES (1, 'test1', 'testpw1');
INSERT INTO user (username, password, email) VALUES ('test2', 'testpw2');


CREATE TABLE IF NOT EXISTS guns (
  gunid int(12) NOT NULL AUTO_INCREMENT,
  name varchar(25) NOT NULL,
  type varchar(20) NOT NULL,
  caliber varchar(25) NOT NULL,
  types_of_fire varchar(50) NOT NULL,
  fire_rate varchar(10) NOT NULL,
  effective_distance varchar(10) NOT NULL,
  CONSTRAINT guns_PK PRIMARY KEY(gunid)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--Date.prototype.toISOString > 2023-11-29T13:24:50.249Z  **UTC time
 -- image용 mediumblob, 최대 16MB
CREATE TABLE IF NOT EXISTS mods (
  modid int(12) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title varchar(255) NOT NULL,
  upload_date char(24) NOT NULL,
  last_update char(24) NOT NULL,
  writer_uid int(12) NOT NULL

  --data
  gun_name varchar(25) NOT NULL,

  image mediumblob,

  weight varchar(225),
  ergonomics varchar(225),
  accuracy varchar(225),
  vertical_recoil varchar(225),
  muzzle_velocity varchar(225),
  horizontal_recoil varchar(225),
  sighting_range varchar(225),
  magazine_size varchar(225),
  price varchar(225),
  flea_market char(5),
  
  description longtext
)



SHOW databases;
SHOW tables;

USE 19101240_web_project;

USE mysql;
SELECT host, user, plugin from user;

CREATE USER 'osscar0131'@'localhost' IDENTIFIED BY '19101240' PASSWORD EXPIRE NEVER;
GRANT ALL PRIVILEGES ON 19101240_web_project.* TO 'osscar0131'@'localhost';
ALTER USER 'osscar0131'@'localhost' IDENTIFIED WITH mysql_native_password BY '19101240';

ALTER TABLE guns ADD
ALTER TABLE guns DROP
ALTER TABLE guns CHANGE
ALTER TABLE guns MODIFY
ALTER TABLE guns RENAME

SELECT * FROM guns;
SELECT * FROM guns WHERE type='Assault Carbines';
UPDATE guns SET fire_rate='800 RPM' WHERE name='ADAR 2-15';


INSERT INTO guns (name, type, caliber, types_of_fire, fire_rate, effective_distance) VALUES

('ADAR 2-15', 'Assault Carbines', '5.56x45mm NATO', 'Single fire','800 RPM','500m'),
('RFB', 'Assault Carbines', '7.62x51mm NATO', 'Single fire','700 RPM','900m'),
('TX-15 DML', 'Assault Carbines', '5.56x45mm NATO', 'Single fire','800 RPM','500m'),
('VPO-101 "Vepr-Hunter"', 'Assault Carbines', '7.62x51mm NATO', 'Single fire','600 RPM','400m'),
('VPO-136 "Vepr-KM"', 'Assault Carbines', '7.62x39mm', 'Single fire','600 RPM','400m'),
('VPO-209', 'Assault Carbines', '.366 TKM (9.55x39)', 'Single fire','600 RPM','300m'),
('AK-545', 'Assault Carbines', '5.45x39mm', 'Single fire','650 RPM','650m'),
('AK-545 Short', 'Assault Carbines', '5.45x39mm', 'Single fire','650 RPM','650m'),
('OP-SKS', 'Assault Carbines', '7.62x39mm', 'Single fire','40 RPM','400m'),
('SKS', 'Assault Carbines', '7.62x39mm', 'Single fire','40 RPM','400m'),
('AVT-40', 'Assault Carbines', '7.62x54mmR', 'Single fire, Full auto','750 RPM','400m'),
('SVT-40', 'Assault Carbines', '7.62x54mmR', 'Single fire','50 RPM','400m');

('AS VAL', 'Assault Rifles', '9x39mm', 'Single fire, Full auto','900 RPM','400m'),
('ASh-12', 'Assault Rifles', '12.7x55mm STs-130', 'Single fire, Full auto','650 RPM','650m'),
('Mk47 Mutant', 'Assault Rifles', '7.62x39mm', 'Single fire, Full auto','650 RPM','500m'),
('M4A1', 'Assault Rifles', '5.56x45mm NATO', 'Single fire, Full auto','800 RPM','500m'),
('SA-58', 'Assault Rifles', '7.62x51mm NATO', 'Single fire, Full auto','700 RPM','900m'),
('MDR 5.56x45', 'Assault Rifles', '5.56x45mm NATO', 'Single fire, Full auto','650 RPM','500m'),
('MDR 7.62x51', 'Assault Rifles', '7.62x51mm NATO', 'Single fire, Full auto','650 RPM','500m'),
('SCAR-H', 'Assault Rifles', '7.62x51mm NATO', 'Single fire, Full auto','600 RPM','500m'),
('SCAR-L', 'Assault Rifles', '5.56x45mm NATO', 'Single fire, Full auto','650 RPM','500m'),
('HK416A5', 'Assault Rifles', '5.56x45mm NATO', 'Single fire, Full auto','850 RPM','500m'),
('G36', 'Assault Rifles', '5.56x45mm NATO', 'Single fire, Burst fire, Full auto','750 RPM','500m'),
('AK-101', 'Assault Rifles', '5.56x45mm NATO', 'Single fire, Full auto','650 RPM','650m'),
('AK-102', 'Assault Rifles', '5.56x45mm NATO', 'Single fire, Full auto','600 RPM','650m'),
('AK-103', 'Assault Rifles', '7.62x39mm', 'Single fire, Full auto','600 RPM','650m'),
('AK-104', 'Assault Rifles', '7.62x39mm', 'Single fire, Full auto','600 RPM','650m'),
('AK-105', 'Assault Rifles', '5.45x39mm', 'Single fire, Full auto','600 RPM','650m'),
('AK-12', 'Assault Rifles', '5.45x39mm', 'Single fire, Full auto, Burst fire','700 RPM','800m'),
('AK-74', 'Assault Rifles', '5.45x39mm', 'Single fire, Full auto','650 RPM','650m'),
('AK-74M', 'Assault Rifles', '5.45x39mm', 'Single fire, Full auto','650 RPM','650m'),
('AK74N', 'Assault Rifles', '5.45x39mm', 'Single fire, Full auto','650 RPM','650m'),
('AKM', 'Assault Rifles', '7.62x39mm', 'Single fire, Full auto','600 RPM','400m'),
('AKMN', 'Assault Rifles', '7.62x39mm', 'Single fire, Full auto','600 RPM','400m'),
('AKMS', 'Assault Rifles', '7.62x39mm', 'Single fire, Full auto','600 RPM','400m'),
('AKMSN', 'Assault Rifles', '7.62x39mm', 'Single fire, Full auto','600 RPM','400m'),
('AKS-74', 'Assault Rifles', '5.45x39mm', 'Single fire, Full auto','650 RPM','650m'),
('AKS-74N', 'Assault Rifles', '5.45x39mm', 'Single fire, Full auto','650 RPM','650m'),
('AKS-74U', 'Assault Rifles', '5.45x39mm', 'Single fire, Full auto','650 RPM','300m'),
('AKS-74UB', 'Assault Rifles', '5.45x39mm', 'Single fire, Full auto','650 RPM','300m'),
('AKS-74UN', 'Assault Rifles', '5.45x39mm', 'Single fire, Full auto','650 RPM','300m'),
('RD-704', 'Assault Rifles', '7.62x39mm', 'Single fire, Full auto','600 RPM','650m'),
('MCX', 'Assault Rifles', '.300 Blackout (7.62x35)', 'Single fire, Full auto','800 RPM','500m'),
('AUG A1', 'Assault Rifles', '5.56x45mm NATO', 'Single fire, Full auto','715 RPM','500m'),
('AUG A3', 'Assault Rifles', '5.56x45mm NATO', 'Single fire, Full auto','715 RPM','500m');

('AXMC', 'Bolt-action Rifles', '.338 Lapua Magnum (8.6x70)', 'Single fire','30 RPM','1000m'),
('DVL-10', 'Bolt-action Rifles', '7.62x51mm NATO', 'Single fire','30 RPM','1000m'),
('VPO-215 "Gornostay"', 'Bolt-action Rifles', '.366 TKM (9.55x39)', 'Single fire','30 RPM','1000m'),
('Mosin', 'Bolt-action Rifles', '7.62x54mmR', 'Single fire','30 RPM','1000m'),
('Mosin(Sniper)', 'Bolt-action Rifles', '7.62x54mmR', 'Single fire','30 RPM','1000m'),
('T-5000M', 'Bolt-action Rifles', '7.62x51mm NATO', 'Single fire','30 RPM','1000m'),
('M700', 'Bolt-action Rifles', '7.62x51mm NATO', 'Single fire','30 RPM','1000m'),
('SV-98', 'Bolt-action Rifles', '7.62x54mmR', 'Single fire','30 RPM','1000m');

('FN40GL', 'Grenade Launchers', '40x46mm', 'Single fire','30 RPM','50m'),
('M32A1 MSGL', 'Grenade Launchers', '40x46mm', 'Single fire','30 RPM','70m');

('PKM', 'Machine Guns', '7.62x54mmR', 'Full auto','650 RPM','750m'),
('PKP', 'Machine Guns', '7.62x54mmR', 'Full auto','650 RPM','750m'),
('RPK-16', 'Machine Guns', '5.45x39mm', 'Single fire, Full auto','650 RPM','650m');

('G28', 'Marksman Rifles', '7.62x51mm NATO', 'Single fire','700 RPM','900m'),
('SR-25', 'Marksman Rifles', '7.62x51mm NATO', 'Single fire','700 RPM','900m'),
('RSASS', 'Marksman Rifles', '7.62x51mm NATO', 'Single fire','700 RPM','900m'),
('SVDS', 'Marksman Rifles', '7.62x54mmR', 'Single fire','700 RPM','900m'),
('Mk-18 .338LM', 'Marksman Rifles', '.338 Lapua Magnum (8.6x70)', 'Single fire','30 RPM','900m'),
('M1A', 'Marksman Rifles', '7.62x51mm NATO', 'Single fire','700 RPM','700m'),
('VSS', 'Marksman Rifles', '9x39mm', 'Single fire, Full auto','900 RPM','400m');

('APB', 'Pistols', '9x18mm Makarov', 'Single fire, Full auto','750 RPM','50m'),
('APS', 'Pistols', '9x18mm Makarov', 'Single fire, Full auto','750 RPM','50m'),
('M9A3', 'Pistols', '9x19mm Parabellum', 'Single fire','30 RPM','50m'),
('CR 200DS', 'Pistols', '9x19mm Parabellum', 'Single fire, Double action','30 RPM','70m'),
('CR 50DS', 'Pistols', '.357 Magnum (9x33R)', 'Single fire, Double action','30 RPM','70m'),
('M1911A1', 'Pistols', '.45 ACP (11.43x23ACP)', 'Single fire','30 RPM','50m'),
('M45A1', 'Pistols', '.45 ACP (11.43x23ACP)', 'Single fire','30 RPM','50m'),
('Five-seveN', 'Pistols', '5.7x28mm FN', 'Single fire','30 RPM','50m'),
('Glock 17', 'Pistols', '9x19mm Parabellum', 'Single fire','30 RPM','50m'),
('Glock 18C', 'Pistols', '9x19mm Parabellum', 'Single fire, Full auto','1200 RPM','50m'),
('Glock 19X', 'Pistols', '9x19mm Parabellum', 'Single fire','30 RPM','50m'),
('USP.45', 'Pistols', '.45 ACP (11.43x23ACP)', 'Single fire','30 RPM','50m'),
('PL-15', 'Pistols', '9x19mm Parabellum', 'Single fire','30 RPM','50m'),
('PM(t)', 'Pistols', '9x18mm Makarov', 'Single fire','30 RPM','50m'),
('PM', 'Pistols', '9x18mm Makarov', 'Single fire','30 RPM','50m'),
('PB', 'Pistols', '9x18mm Makarov', 'Single fire','30 RPM','50m'),
('RSh-12', 'Pistols', '12.7x55mm STs-130', 'Single fire, Double action','30 RPM','70m'),
('P226R', 'Pistols', '9x19mm Parabellum', 'Single fire','30 RPM','50m'),
('SR-1MP', 'Pistols', '9x21mm Gyurza', 'Single fire','30 RPM','50m'),
('TT', 'Pistols', '7.62x25mm Tokarev', 'Single fire','30 RPM','50m'),
('MP-443 "Grach"', 'Pistols', '9x19mm Parabellum', 'Single fire','30 RPM','50m');

('MP9', 'SMGs', '9x19mm Parabellum', 'Single fire, Full auto','900 RPM','200m'),
('MP9-N', 'SMGs', '9x19mm Parabellum', 'Single fire, Full auto','1100 RPM','200m'),
('P90', 'SMGs', '5.7x28mm FN', 'Single fire, Full auto','900 RPM','200m'),
('MP5', 'SMGs', '9x19mm Parabellum', 'Single fire, Burst fire, Full auto','800 RPM','200m'),
('MP5K-N', 'SMGs', '9x19mm Parabellum', 'Single fire, Burst fire, Full auto','900 RPM','200m'),
('MP7A1', 'SMGs', '4.6x30mm HK', 'Single fire, Full auto','950 RPM','200m'),
('MP7A2', 'SMGs', '4.6x30mm HK', 'Single fire, Full auto','950 RPM','200m'),
('UMP 45', 'SMGs', '.45 ACP (11.43x23ACP)', 'Single fire, Full auto','600 RPM','200m'),
('PP-19-01 "Vityaz"', 'SMGs', '9x19mm Parabellum', 'Single fire, Full auto','700 RPM','200m'),
('PP-9 "Klin"', 'SMGs', '9x18mm Makarov', 'Single fire, Full auto','1000 RPM','100m'),
('PP-91 "Kedr"', 'SMGs', '9x18mm Makarov', 'Single fire, Full auto','900 RPM','100m'),
('PP-91-01 "Kedr-B"', 'SMGs', '9x18mm Makarov', 'Single fire, Full auto','900 RPM','100m'),
('PPSh-41', 'SMGs', '7.62x25mm Tokarev', 'Single fire, Full auto','1000 RPM','200m'),
('MPX', 'SMGs', '9x19mm Parabellum', 'Single fire, Full auto','850 RPM','500m'),
('SR-2M "Veresk"', 'SMGs', '9x21mm Gyurza', 'Single fire, Full auto','950 RPM','200m'),
('Saiga-9', 'SMGs', '9x19mm Parabellum', 'Single fire','650 RPM','300m'),
('STM-9', 'SMGs', '9x19mm Parabellum', 'Single fire','800 RPM','500m'),
('Vector .45', 'SMGs', '.45 ACP (11.43x23ACP)', 'Single fire, Burst fire, Full auto','1100 RPM','200m'),
('Vector 9x19', 'SMGs', '9x19mm Parabellum', 'Single fire, Burst fire, Full auto','950 RPM','200m');


('M3 Super 90', 'Shotguns', '12/70mm', 'Single fire, Semi-auto','60 RPM','70m'),
('MP-133', 'Shotguns', '12/70mm', 'Single fire','30 RPM','70m'),
('MP-153', 'Shotguns', '12/70mm', 'Single fire','40 RPM','70m'),
('MP-155', 'Shotguns', '12/70mm', 'Single fire','40 RPM','70m'),
('MP-18', 'Shotguns', '7.62x54mmR', 'Single fire','900 RPM','100m'),
('MP-43 Sawed-off', 'Shotguns', '12/70mm', 'Single fire, Double-Tap','900 RPM','100m'),
('MP-43-1C', 'Shotguns', '12/70mm', 'Single fire, Double-Tap','900 RPM','100m'),
('MTs-255-12', 'Shotguns', '12/70mm', 'Single fire, Double action','30 RPM','70m'),
('M590A1', 'Shotguns', '12/70mm', 'Single fire','30 RPM','70m'),
('M870', 'Shotguns', '12/70mm', 'Single fire','30 RPM','70m'),
('Saiga-12ga', 'Shotguns', '12/70mm', 'Single fire','40 RPM','70m'),
('KS-23M', 'Shotguns', '23x75mm', 'Single fire','30 RPM','70m'),
('TOZ-106', 'Shotguns', '20/70mm', 'Single fire','30 RPM','70m');


7.62x25mm Tokarev
9x18mm Makarov
9x19mm Parabellum
9x21mm Gyurza
.357 Magnum (9x33R)
.45 ACP (11.43x23ACP)

4.6x30mm HK
5.7x28mm FN

5.45x39mm
5.56x45mm NATO
.300 Blackout (7.62x35)
7.62x39mm
7.62x51mm NATO
7.62x54mmR
.338 Lapua Magnum (8.6x70)
9x39mm
.366 TKM (9.55x39)
12.7x55mm STs-130

12/70mm
20/70mm
23x75mm

40x46mm
40x53mm

Single fire, Burst fire, Full auto, Double action, Double-Tap, Semi-auto