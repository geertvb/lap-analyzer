SET UNIQUE_CHECKS=0;
SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE='TRADITIONAL';

USE trackfreaks_eu;

-- EMPTY ALL TABLES

TRUNCATE `accommodation`;
TRUNCATE `booking`;
TRUNCATE `country`;
TRUNCATE `gpslog`;
TRUNCATE `group`;
TRUNCATE `intersection`;
TRUNCATE `organization`;
TRUNCATE `picture`;
TRUNCATE `rider`;
TRUNCATE `rider_friend`;
TRUNCATE `role`;
TRUNCATE `team`;
TRUNCATE `team_friend`;
TRUNCATE `team_rider`;
TRUNCATE `thumbnail`;
TRUNCATE `thumbsize`;
TRUNCATE `track`;
TRUNCATE `trackday`;
TRUNCATE `trackday_group`;

-- role

INSERT INTO `trackfreaks_eu`.`role` (`role`) VALUES ('admin');
INSERT INTO `trackfreaks_eu`.`role` (`role`) VALUES ('member');
INSERT INTO `trackfreaks_eu`.`role` (`role`) VALUES ('anonymous');

-- country

insert into `trackfreaks_eu`.`country` (`country_id`, `name`) values (1, 'Belgium');
insert into `trackfreaks_eu`.`country` (`country_id`, `name`) values (2, 'France');
insert into `trackfreaks_eu`.`country` (`country_id`, `name`) values (3, 'Netherlands');
insert into `trackfreaks_eu`.`country` (`country_id`, `name`) values (4, 'Germany');

-- thumbsizes

INSERT INTO `trackfreaks_eu`.`thumbsize` (`thumbsize_id`, `name`, `max_width`, `max_height`) VALUES ('1', '160 x 120', '160', '120');

-- track

INSERT INTO `trackfreaks_eu`.`track` (`track_id`, `name`, `url`, `lat`, `lng`, `country_id`, `length`) VALUES (1, 'Zolder', 'http://www.circuit-zolder.be/', 50.990591, 5.256908, 1, 4011);
INSERT INTO `trackfreaks_eu`.`track` (`track_id`, `name`, `url`, `lat`, `lng`, `country_id`, `length`) VALUES (2, 'Carole', 'http://www.circuit-carole.com/', 48.98001, 2.521616, 2, 2055);
INSERT INTO `trackfreaks_eu`.`track` (`track_id`, `name`, `url`, `lat`, `lng`, `country_id`, `length`) VALUES (3, 'Francorchamps', 'http://www.spa-francorchamps.be/', 50.438118, 5.968995, 1, 7004);
INSERT INTO `trackfreaks_eu`.`track` (`track_id`, `name`, `url`, `lat`, `lng`, `country_id`, `length`) VALUES (4, 'Assen', 'http://www.tt-assen.com/', 52.959892, 6.521881, 3, 4555);
INSERT INTO `trackfreaks_eu`.`track` (`track_id`, `name`, `url`, `lat`, `lng`, `country_id`, `length`) VALUES (5, 'Zandvoort', 'http://www.circuit-zandvoort.nl/', 52.388164, 4.545869, 3, 4180);
INSERT INTO `trackfreaks_eu`.`track` (`track_id`, `name`, `url`, `lat`, `lng`, `country_id`, `length`) VALUES (6, 'Folembray', 'http://www.circuit-de-folembray.com/', 49.545948, 3.303684, 2, 2050);
INSERT INTO `trackfreaks_eu`.`track` (`track_id`, `name`, `url`, `lat`, `lng`, `country_id`, `length`) VALUES (7, 'Croix', 'http://www.circuitdecroix.com/', 50.378719, 2.297074, 2, 1900);
INSERT INTO `trackfreaks_eu`.`track` (`track_id`, `name`, `url`, `lat`, `lng`, `country_id`, `length`) VALUES (8, 'Hockenheim', 'http://www.hockenheimring.com/', 49.328846, 8.567594, 4, 4574);
INSERT INTO `trackfreaks_eu`.`track` (`track_id`, `name`, `url`, `lat`, `lng`, `country_id`, `length`) VALUES (9, 'Nuerburgring', 'http://www.nuerburgring.de/', 50.331946, 6.942179, 4, 5148);
INSERT INTO `trackfreaks_eu`.`track` (`track_id`, `name`, `url`, `lat`, `lng`, `country_id`, `length`) VALUES (10, 'Ecuyers (Beuvardes)', 'http://www.circuitdesecuyers.com/', 49.109557, 3.507514, 2, 3600);
INSERT INTO `trackfreaks_eu`.`track` (`track_id`, `name`, `url`, `lat`, `lng`, `country_id`, `length`) VALUES (11, 'Clastres', 'http://www.circuitclastres.com/', 49.751317, 3.209013, 2, 1973);
INSERT INTO `trackfreaks_eu`.`track` (`track_id`, `name`, `url`, `lat`, `lng`, `country_id`, `length`) VALUES (12, 'Mettet', 'http://www.circuit-mettet.be/', 50.300972, 4.651587, 1, 2310);

-- organization

INSERT INTO `trackfreaks_eu`.`organization` (`organization_id`, `name`, `url`) VALUES (1, 'Aktief', 'http://www.aktief.be');
INSERT INTO `trackfreaks_eu`.`organization` (`organization_id`, `name`, `url`) VALUES (2, 'Motorsportschool Zolder', 'http://www.motorsportschool.be');
INSERT INTO `trackfreaks_eu`.`organization` (`organization_id`, `name`, `url`) VALUES (3, 'Motorsport Lifestyle', 'http://www.motorsportlifestyle.nl');
INSERT INTO `trackfreaks_eu`.`organization` (`organization_id`, `name`, `url`) VALUES (4, 'Eybis', 'http://www.eybis.com');
INSERT INTO `trackfreaks_eu`.`organization` (`organization_id`, `name`, `url`) VALUES (5, 'Trackdays', 'http://www.trackdays.be');
INSERT INTO `trackfreaks_eu`.`organization` (`organization_id`, `name`, `url`) VALUES (6, 'Meca Events', 'http://www.mecaevents.be');

-- rider

INSERT INTO `trackfreaks_eu`.`rider` (`rider_id`, `picture_id`, `username`, `password`, `role`, `firstname`, `lastname`, `email`) VALUES ('1', NULL, 'geert', 'geert', 'admin', 'Geert', 'Van Bastelaere', 'geert@trackfreaks.eu');
INSERT INTO `trackfreaks_eu`.`rider` (`rider_id`, `picture_id`, `username`, `password`, `role`, `firstname`, `lastname`, `email`) VALUES ('2', NULL, 'jochen', 'jochen', 'member', 'Jochen', 'Wylin', 'jochen@trackfreaks.eu');
INSERT INTO `trackfreaks_eu`.`rider` (`rider_id`, `picture_id`, `username`, `password`, `role`, `firstname`, `lastname`, `email`) VALUES ('3', NULL, 'danny', 'danny', 'member', 'Danny', 'Gorissen', 'danny@trackfreaks.eu');
INSERT INTO `trackfreaks_eu`.`rider` (`rider_id`, `picture_id`, `username`, `password`, `role`, `firstname`, `lastname`, `email`) VALUES ('4', NULL, 'frederic', 'frederic', 'member', 'Frederic', 'Tytgat', 'frederic@trackfreaks.eu');
INSERT INTO `trackfreaks_eu`.`rider` (`rider_id`, `picture_id`, `username`, `password`, `role`, `firstname`, `lastname`, `email`) VALUES ('5', NULL, 'koen', 'koen', 'member', 'Koen', 'Ermgodts', 'koen@trackfreaks.eu');
INSERT INTO `trackfreaks_eu`.`rider` (`rider_id`, `picture_id`, `username`, `password`, `role`, `firstname`, `lastname`, `email`) VALUES ('6', NULL, 'jerome', 'jerome', 'member', 'Jerome', 'Hordies', 'jerome@trackfreaks.eu');
INSERT INTO `trackfreaks_eu`.`rider` (`rider_id`, `picture_id`, `username`, `password`, `role`, `firstname`, `lastname`, `email`) VALUES ('7', NULL, 'nicolas', 'nicolas', 'member', 'Nicolas', 'Chalon', 'nicolas@trackfreaks.eu');
INSERT INTO `trackfreaks_eu`.`rider` (`rider_id`, `picture_id`, `username`, `password`, `role`, `firstname`, `lastname`, `email`) VALUES ('8', NULL, 'jeremy', 'jeremy', 'member', 'Jérémy', 'Brakel', 'jeremy@trackfreaks.eu');

-- team

INSERT INTO `trackfreaks_eu`.`team` (`team_id`, `name`) VALUES ('1', 'GJDF');
INSERT INTO `trackfreaks_eu`.`team` (`team_id`, `name`) VALUES ('2', 'RAT Bikes');

-- rider_friends

INSERT INTO `trackfreaks_eu`.`rider_friend` (`rider_id1`, `rider_id2`) VALUES ('6', '1');

-- team_friends

INSERT INTO `trackfreaks_eu`.`team_friend` (`rider_id`, `team_id`) VALUES ('1', '2');

-- intersection

INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (86, 2, 4, 48.978418, 2.522806, -1.6643311114799);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (91, 1, 4, 50.990169, 5.258721, 2.63846938796044);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (90, 1, 3, 50.993799, 5.26525, 2.52382205501974);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (89, 1, 2, 50.996023, 5.258549, -0.749429723524985);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (88, 1, 1, 50.991092, 5.257132, -1.01334921639278);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (87, 1, 0, 50.984817, 5.251049, -2.33430841269983);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (34, 4, 5, 52.962239, 6.523929, -0.736358296199296);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (33, 4, 4, 52.956971, 6.516648, -0.352026394053018);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (32, 4, 3, 52.953913, 6.513517, 1.67889003113247);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (31, 4, 2, 52.956516, 6.520923, 1.59880217808106);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (30, 4, 1, 52.96306, 6.528708, 2.02987247692502);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (29, 4, 0, 52.964549, 6.529712, 0.540015849356322);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (85, 2, 3, 48.982266, 2.522125, 1.16608865795128);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (84, 2, 2, 48.979731, 2.519917, -1.17229127143209);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (83, 2, 1, 48.978527, 2.520342, 0.855116844658446);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (82, 2, 0, 48.980247, 2.521127, 1.33125095879484);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (96, 7, 4, 50.378161, 2.295926, -2.43915648630853);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (95, 7, 3, 50.378038, 2.298827, 2.5435572501712);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (94, 7, 2, 50.378329, 2.298097, -0.558396120365945);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (93, 7, 1, 50.379672, 2.300462, 2.65402775563264);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (92, 7, 0, 50.379938, 2.299609, -0.430849781995299);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (45, 10, 0, 49.109477, 3.51308, -2.71993106382562);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (46, 10, 1, 49.108661, 3.50995, 0.219931160156638);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (47, 10, 2, 49.109697, 3.511394, 0.541036757278065);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (48, 10, 3, 49.107608, 3.51149, -2.42248064353087);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (49, 10, 4, 49.107712, 3.508578, 1.83761466226853);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (50, 10, 5, 49.105863, 3.510533, 3.11879802997325);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (51, 10, 6, 49.107214, 3.507824, -1.28456162686588);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (52, 6, 0, 49.548484, 3.307293, -0.689927007833956);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (53, 6, 1, 49.548631, 3.3083, 1.94648212515414);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (54, 6, 2, 49.544867, 3.303472, 2.20429745513664);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (55, 6, 3, 49.54375, 3.299934, -0.474562463101781);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (56, 3, 0, 50.445912, 5.964981, 0.512003422520457);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (57, 3, 1, 50.439936, 5.973036, 1.00665356409054);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (58, 3, 2, 50.430319, 5.976837, 1.35906114599042);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (59, 3, 3, 50.428852, 5.973372, -0.536495367265153);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (60, 3, 4, 50.433026, 5.968372, 1.91474191301825);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (61, 3, 5, 50.430093, 5.963417, 2.09853294923333);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (62, 3, 6, 50.431765, 5.960685, -0.915387828266703);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (63, 3, 7, 50.442372, 5.966758, -2.15128523171678);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (64, 8, 0, 49.333593, 8.569622, 1.14540857324959);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (65, 8, 1, 49.332088, 8.583729, 2.60495906993899);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (66, 8, 2, 49.329959, 8.575409, 1.22453380162781);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (67, 8, 3, 49.327218, 8.569855, -2.29206012087277);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (68, 8, 4, 49.327748, 8.567507, 1.08528553907792);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (69, 8, 5, 49.326474, 8.56659, -2.03554417522106);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (70, 9, 0, 50.332467, 6.941251, -1.05622622020888);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (71, 9, 1, 50.331744, 6.939959, 1.70306560972163);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (72, 9, 2, 50.32683, 6.939657, 2.64552288953592);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (73, 9, 3, 50.325022, 6.935016, -0.74167769098187);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (74, 9, 4, 50.33187, 6.938016, -2.74291510288342);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (75, 9, 5, 50.336532, 6.949268, 2.33980525292538);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (76, 5, 0, 52.390988, 4.543537, 1.94874423455869);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (77, 5, 1, 52.388123, 4.541978, -0.197704857685935);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (78, 5, 2, 52.388598, 4.548851, -0.746821885527532);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (79, 5, 3, 52.386976, 4.549573, -0.165299780119974);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (80, 5, 4, 52.386723, 4.541957, 1.38790418986119);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (81, 5, 5, 52.386558, 4.539113, -1.21082936804641);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (97, 7, 5, 50.378395, 2.293836, -0.23672373175898);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (115, 12, 4, 50.302186, 4.655221, 2.80538623699459);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (114, 12, 3, 50.299897, 4.650889, -0.17222389603929);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (113, 12, 2, 50.300388, 4.652154, 3.11970063910874);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (112, 12, 1, 50.301234, 4.654449, 2.69266620368663);
INSERT INTO `intersection` (`intersection_id`, `track_id`, `index`, `lat`, `lng`, `angle`) VALUES (111, 12, 0, 50.299614, 4.648194, -0.0789016665226871);



SET UNIQUE_CHECKS=1;
SET FOREIGN_KEY_CHECKS=1;
SET SQL_MODE='';