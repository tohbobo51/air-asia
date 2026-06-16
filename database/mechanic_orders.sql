
  -- Tabel order modifikasi mekanik
  CREATE TABLE IF NOT EXISTS `mechanic_orders` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `player_name` varchar(24) DEFAULT '',
    `vehicle_model` int(11) DEFAULT 0,
    `color1` int(11) DEFAULT 0,
    `color2` int(11) DEFAULT 0,
    `paintjob` int(11) DEFAULT -1,
    `neon` int(11) DEFAULT 0,
    `price` int(11) DEFAULT 0,
    `pay_type` tinyint(1) DEFAULT 0 COMMENT '0=cash,1=bank',
    `status` tinyint(1) DEFAULT 0 COMMENT '0=pending,1=done,2=cancel',
    `mech_name` varchar(24) DEFAULT '',
    `created_at` timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  