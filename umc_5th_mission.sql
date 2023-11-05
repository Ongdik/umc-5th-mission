CREATE TABLE
    `food` (
        `id` bigint NOT NULL,
        `name` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
        `created_at` datetime(6) DEFAULT NULL,
        `updated_at` datetime(6) DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_bin;

CREATE TABLE
    `member` (
        `id` bigint NOT NULL,
        `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
        `gender` tinyint DEFAULT NULL,
        `birth` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
        `address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
        `created_at` datetime(6) DEFAULT NULL,
        `updated_at` datetime(6) DEFAULT NULL,
        `inactive_date` datetime DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_bin;

CREATE TABLE
    `member_mission` (
        `id` bigint NOT NULL,
        `member_id` bigint DEFAULT NULL,
        `mission_id` bigint DEFAULT NULL,
        `mission_status` tinyint DEFAULT NULL,
        `created_at` datetime(6) DEFAULT NULL,
        `updaete_at` datetime(6) DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `member_id` (`member_id`),
        KEY `mission_id` (`mission_id`),
        CONSTRAINT `member_mission_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
        CONSTRAINT `member_mission_ibfk_2` FOREIGN KEY (`mission_id`) REFERENCES `mission` (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_bin;

CREATE TABLE
    `member_prefer` (
        `id` bigint NOT NULL,
        `member_id` bigint DEFAULT NULL,
        `food_id` bigint DEFAULT NULL,
        `created_at` datetime(6) DEFAULT NULL,
        `updaete_at` datetime(6) DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `member_id` (`member_id`),
        KEY `food_id` (`food_id`),
        CONSTRAINT `member_prefer_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
        CONSTRAINT `member_prefer_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_bin;

CREATE TABLE
    `member_sign_up` (
        `id` bigint NOT NULL,
        `member_id` bigint DEFAULT NULL,
        `terms_id` bigint DEFAULT NULL,
        `created_at` datetime(6) DEFAULT NULL,
        `updated_at` datetime(6) DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `member_id` (`member_id`),
        KEY `terms_id` (`terms_id`),
        CONSTRAINT `member_sign_up_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
        CONSTRAINT `member_sign_up_ibfk_2` FOREIGN KEY (`terms_id`) REFERENCES `terms` (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_bin;

CREATE TABLE
    `mission` (
        `id` bigint NOT NULL,
        `store_id` bigint DEFAULT NULL,
        `reward` int DEFAULT NULL,
        `deadline` datetime DEFAULT NULL,
        `created_at` datetime(6) DEFAULT NULL,
        `updaete_at` datetime(6) DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `store_id` (`store_id`),
        CONSTRAINT `mission_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_bin;

CREATE TABLE
    `region` (
        `id` bigint NOT NULL,
        `name` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
        `created_at` datetime(6) DEFAULT NULL,
        `updated_at` datetime(6) DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_bin;

CREATE TABLE
    `review` (
        `id` bigint NOT NULL,
        `member_id` bigint DEFAULT NULL,
        `store_id` bigint DEFAULT NULL,
        `body` text COLLATE utf8mb3_bin,
        `created_at` datetime(6) DEFAULT NULL,
        `updaete_at` datetime(6) DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `member_id` (`member_id`),
        KEY `store_id` (`store_id`),
        CONSTRAINT `review_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
        CONSTRAINT `review_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_bin;

CREATE TABLE
    `store` (
        `id` bigint NOT NULL,
        `region_id` bigint DEFAULT NULL,
        `name` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
        `address` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
        `created_at` datetime(6) DEFAULT NULL,
        `updaete_at` datetime(6) DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `region_id` (`region_id`),
        CONSTRAINT `store_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_bin;

CREATE TABLE
    `terms` (
        `id` bigint NOT NULL,
        `title` varchar(50) COLLATE utf8mb3_bin DEFAULT NULL,
        `body` text COLLATE utf8mb3_bin,
        `created_at` datetime(6) DEFAULT NULL,
        `updated_at` datetime(6) DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3 COLLATE = utf8mb3_bin;
