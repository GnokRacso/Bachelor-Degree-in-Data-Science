INSERT INTO Branch VALUES (1001, '123 Jalan Besar',    'KL',        53100, 03-41234567, 60000);
INSERT INTO Branch VALUES (1002, '10 Jalan Persatuan', 'PJ',        45123, 03-79812345, 65000);
INSERT INTO Branch VALUES (1003, '58-A Jalan Gasing',  'Shah Alam', 47653, 03-76409324, 48000);
INSERT INTO Branch VALUES (1004, '79 Jalan Muhibbah',  'Beranang',  41876, 03-87340564, 24000);
PROMPT 'Branch Record created'

INSERT INTO Vehicle VALUES ('ABC1234', 'Toyota', 'Prius',    2010, 'Red');
INSERT INTO Vehicle VALUES ('ADT6528', 'Hyundai', 'Sonata',  2018, 'White');
INSERT INTO Vehicle VALUES ('BHF5544', 'Perodua', 'Kelisa',  2016, 'Yellow');
INSERT INTO Vehicle VALUES ('BJX9128', 'Nissan',  'Livina',  2019, 'Gold');
INSERT INTO Vehicle VALUES ('BMW9898', 'Mazda',   'RX-8',    2009, 'Metalic Pink');
INSERT INTO Vehicle VALUES ('BRS3579', 'Honda',   'City',    2017, 'White');
INSERT INTO Vehicle VALUES ('CAP3488', 'Nissan',  'Sentra',  2010, 'Brown');
INSERT INTO Vehicle VALUES ('DAB8764', 'Honda',   'Accord',  2016, 'Blue');
INSERT INTO Vehicle VALUES ('JAC6598', 'Proton',  'Waja',    2015, 'Grey');
INSERT INTO Vehicle VALUES ('JDB8818', 'Ford',    'Mondeo',  2011, 'Yellow');
INSERT INTO Vehicle VALUES ('KAK7852', 'BMW',     '525i',    2013, 'Grey');
INSERT INTO Vehicle VALUES ('MAA8523', 'Toyota',  'Camry',   2010, 'Blue');
INSERT INTO Vehicle VALUES ('MAD6774', 'Nissan',  'Latio',   2019, 'Green');
INSERT INTO Vehicle VALUES ('NAM2539', 'Hyundai', 'Elantra', 2019, 'Red');
INSERT INTO Vehicle VALUES ('NBA9536', 'Nissan',  'Latio',   2016, 'Black');
INSERT INTO Vehicle VALUES ('PGF6924', 'Mercedes','S300',    2015, 'White');
INSERT INTO Vehicle VALUES ('WFF9684', 'Honda',   'Civic',   2011, 'Blue');
INSERT INTO Vehicle VALUES ('WHF8448', 'Proton',  'Wira',    2009, 'Black');
INSERT INTO Vehicle VALUES ('WMW8876', 'Nissan',  'Murano',  2018, 'Gold');
INSERT INTO Vehicle VALUES ('WVT8877', 'Honda',   'CR-V',    2011, 'Green');
PROMPT 'Vehicle Record created'


INSERT INTO Mechanic VALUES (1142, 'Santhiran',    '87H Jalan 123/15 Ampang',        'BE, Mechanical', 1002, 40000);
INSERT INTO Mechanic VALUES (2011, 'Lim Meng Kar', '9, Jalan Batu, Selangor',        'Diploma AE',     1004, 32000);
INSERT INTO Mechanic VALUES (2563, 'Akhbar Khan',  '123 Jalan Syed Putra Klang',     'Diploma AE',     1004, 28000);
INSERT INTO Mechanic VALUES (3622, 'Mutusamy Raj', '85, Jalan Perling, KL',          'BE, Automotive', 1001, 50000);
INSERT INTO Mechanic VALUES (3652, 'Francis',      '457 Jalan Syed Putra, Selangor', 'Diploma AE',     1003, 24000);
INSERT INTO Mechanic VALUES (4569, 'James Chua',   '56 Jalan Pelangi, KL',           'BE, Automotive', 1001, 45000);
INSERT INTO Mechanic VALUES (5233, 'Michael Jack', '88 Jalan Murni Puchong',         'Diploma AE',     1003, 28000);
INSERT INTO Mechanic VALUES (7526, 'Farid Khamis', '695 Jalan Muhibbah, KL',         'BE, Mechanical', 1002, 50000);
PROMPT 'Mechanic Record created'

alter session set NLS_DATE_FORMAT='YYYY-MM-DD';

INSERT INTO JobDone VALUES (1001, '2019-01-08', 'ABC1234', 7526, 'General Services',            123);
INSERT INTO JobDone VALUES (1002, '2019-01-09', 'BMW9898', 7526, 'Timing Belt',                 255);
INSERT INTO JobDone VALUES (1003, '2019-01-11', 'BRS3579', 3622, 'Oil Change',                   60);
INSERT INTO JobDone VALUES (1004, '2019-01-20', 'DAB8764', 3622, 'Tyre Alignment',               50);
INSERT INTO JobDone VALUES (1005, '2019-01-20', 'JDB8818', 3652, 'Oil Change',                  128);
INSERT INTO JobDone VALUES (1006, '2019-02-21', 'PGF6924', 4569, 'Major Service',              1350);
INSERT INTO JobDone VALUES (1007, '2019-02-22', 'BJX9128', 1142, 'Scheduled Oil change',        146);
INSERT INTO JobDone VALUES (1008, '2019-02-22', 'NBA9536', 1142, 'Timing Belt',                 350);
INSERT INTO JobDone VALUES (1009, '2019-03-14', 'NAM2539', 2563, 'Wheel Alignment',              36);
INSERT INTO JobDone VALUES (1010, '2019-03-14', 'MAD6774', 2011, 'Tyre Change',                 840);
INSERT INTO JobDone VALUES (1011, '2019-04-28', 'KAK7852', 5233, 'Tune-up',                     128);
INSERT INTO JobDone VALUES (1012, '2019-04-28', 'JAC6598', 5233, 'Rear Shock Absorber',         172);
INSERT INTO JobDone VALUES (1013, '2019-04-28', 'ADT6528', 5233, 'Wheel Chamber',               140);
INSERT INTO JobDone VALUES (1014, '2019-05-12', 'BHF5544', 4569, 'Air-Cond Service',            298);
INSERT INTO JobDone VALUES (1015, '2019-05-14', 'NAM2539', 3622, 'Exhaust System',              485);
INSERT INTO JobDone VALUES (1016, '2019-06-02', 'BMW9898', 1142, 'Fuel-Injection Service',      268);
INSERT INTO JobDone VALUES (1017, '2019-06-03', 'BHF5544', 7526, 'Drive Shaft Bearing',         135);
INSERT INTO JobDone VALUES (1018, '2019-07-21', 'PGF6924', 3652, 'Power Window-Rleft',           96);
INSERT INTO JobDone VALUES (1019, '2019-07-22', 'JDB8818', 5233, 'Oil Change n Tune-up',        188);
INSERT INTO JobDone VALUES (1020, '2019-08-29', 'NBA9536', 2563, 'Engine Block Service',        418);
INSERT INTO JobDone VALUES (1021, '2019-08-30', 'JAC6598', 2011, 'Front Shock Absorber',        298);
INSERT INTO JobDone VALUES (1022, '2019-09-05', 'BMW9898', 2563, 'General Service',             158);
INSERT INTO JobDone VALUES (1023, '2019-09-12', 'BHF5544', 3652, 'Minor Overhaul',              360);
INSERT INTO JobDone VALUES (1024, '2019-09-14', 'NBA9536', 7526, 'Adjustment n Tune-up',        148);
INSERT INTO JobDone VALUES (1025, '2019-10-11', 'ABC1234', 3622, 'Tappet Adjustment',           125);
INSERT INTO JobDone VALUES (1026, '2019-10-16', 'BJX9128', 3622, 'Major Service',               425);
INSERT INTO JobDone VALUES (1027, '2019-11-19', 'CAP3488', 1142, 'Hydraulic Fluid Replacement', 115);
INSERT INTO JobDone VALUES (1028, '2019-11-26', 'DAB8764', 5233, 'Air-Cond Condenser',          550);
INSERT INTO JobDone VALUES (1029, '2019-12-12', 'MAA8523', 2563, 'Spark-plugs n Air Filter',    138);
INSERT INTO JobDone VALUES (1030, '2019-12-13', 'MAD6774', 4569, 'General Services',            123);
PROMPT 'JobDone Record created'

commit;