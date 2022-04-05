DROP DATABASE IF EXISTS ploggingCommunity;
CREATE DATABASE ploggingCommunity;
USE ploggingCommunity;

CREATE TABLE `member`
(
    memberId INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '회원 인덱스',
    infoOrigin VARCHAR(10) NOT NULL COMMENT '계정 연동 경로',
    email VARCHAR(100) NOT NULL COMMENT '연동된 계정의 이메일',
    nickname VARCHAR(30) NOT NULL COMMENT '연동된 계정의 닉네임',
    gender CHAR(6) NOT NULL COMMENT '연동된 계정의 성별',
    ageRange CHAR(10) NOT NULL COMMENT '연동된 계정의 연령대',
    regDate DATETIME NOT NULL DEFAULT NOW() COMMENT '회원 생성일',
    delDate DATETIME COMMENT '회원 탈퇴일',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '회원 탈퇴 상태(미탈퇴=0, 탈퇴=1)'
);

CREATE TABLE history
(
    historyId INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '히스토리 인덱스',
    memberId INT(10) UNSIGNED NOT NULL COMMENT '작성자 인덱스',
    pDate DATETIME NOT NULL DEFAULT NOW() COMMENT '플로깅 진행일',
    pPolygon POLYGON NOT NULL COMMENT '플로깅 구역 좌표',  
    content TEXT NOT NULL COMMENT '진행 내용',
    difficulty TINYINT(1) UNSIGNED NOT NULL COMMENT '난이도(5점 만점)',
    regDate DATETIME NOT NULL DEFAULT NOW() COMMENT '히스토리 생성일',
    updDate DATETIME NOT NULL DEFAULT NOW() COMMENT '히스토리 수정일',
    delDate DATETIME COMMENT '히스토리 삭제일',
    delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '히스토리 삭제 상태(미삭제=0, 삭제=1)',
    FOREIGN KEY (memberId) REFERENCES `member` (memberId)
);