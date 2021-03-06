DROP DATABASE IF EXISTS jenkins;
CREATE DATABASE jenkins; 

CREATE TABLE jenkins.build_history (
	build_history_id INT(11) NOT NULL AUTO_INCREMENT,
	BUILD_ID     VARCHAR(100) DEFAULT NULL,
	BUILD_NUMBER VARCHAR(100) DEFAULT NULL,
	BUILD_URL    VARCHAR(400) DEFAULT NULL,
	BUILD_TAG    VARCHAR(100) DEFAULT NULL,
	DOCKER_REPO  VARCHAR(100) DEFAULT NULL,
	DOCKER_TAG   VARCHAR(100) DEFAULT NULL,
	GIT_BRANCH   VARCHAR(100) DEFAULT NULL,
	GIT_COMMIT   VARCHAR(100) DEFAULT NULL,
	GIT_URL      VARCHAR(400) DEFAULT NULL,
	JOB_NAME     VARCHAR(200) DEFAULT NULL,
	job_completed TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (build_history_id)
) ENGINE=InnoDB;

CREATE TABLE jenkins.release (
	release_id INT(11) NOT NULL AUTO_INCREMENT,
	build_history_id INT(11) DEFAULT NULL,
	BUILD_ID     VARCHAR(100) DEFAULT NULL,
	BUILD_NUMBER VARCHAR(100) DEFAULT NULL,
	BUILD_URL    VARCHAR(400) DEFAULT NULL,
	BUILD_TAG    VARCHAR(100) DEFAULT NULL,
	DOCKER_REPO  VARCHAR(100) DEFAULT NULL,
	DOCKER_TAG   VARCHAR(100) DEFAULT NULL,
	ENVIRONMENT  VARCHAR(100) DEFAULT NULL,
	JOB_NAME     VARCHAR(200) DEFAULT NULL,
	job_completed TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (release_id)
) ENGINE=InnoDB;

CREATE UNIQUE INDEX release_BUILD_TAG_IDX ON jenkins.`release` (BUILD_TAG);
CREATE UNIQUE INDEX build_history_BUILD_TAG_IDX ON jenkins.`build_history` (BUILD_TAG);

ALTER TABLE jenkins.`release` ADD CONSTRAINT release_build_history_FK FOREIGN KEY (build_history_id) REFERENCES jenkins.build_history(build_history_id);
