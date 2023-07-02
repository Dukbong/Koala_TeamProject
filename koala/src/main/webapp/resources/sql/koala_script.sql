-------------------------------------------------DROP TABLE
DROP TABLE BLOCK_IP;            --불법사용자차단 //
DROP TABLE QNA_SELECT;          --QnA댓글채택 //지수
DROP TABLE LIKED;               --좋아요/싫어요 //
DROP TABLE BOARD_ATTACHMENT;    --게시글첨부파일 //
DROP TABLE ATTENDANCE;          --출석체크
DROP TABLE FOLLOW;              --팔로우 //병국
DROP TABLE SUPPORTERS;          --서포터즈 // 현성
DROP TABLE MEMBER_IMAGE;        --유저프로필  //병국
DROP TABLE BULLETIN_BOARD;      --자유게시판 //
DROP TABLE ERROR_BOARD;         --오류게시판  //설희
DROP TABLE CREATE_SETTING;      --설정게시판 //
DROP TABLE REPLY;               --댓글  //설희
DROP TABLE BOARD;               --게시판  //설희
DROP TABLE MEMBER;              --회원 //병국

-------------------------------------------------DROP/CREATE SEQUENCE
--회원번호
DROP SEQUENCE SEQ_UNO;
CREATE SEQUENCE SEQ_UNO NOCACHE;
--회원프로필
DROP SEQUENCE SEQ_PFNO;       
CREATE SEQUENCE SEQ_PFNO NOCACHE;
--게시글
DROP SEQUENCE SEQ_BNO; 
CREATE SEQUENCE SEQ_BNO NOCACHE;
--게시글첨부파일
DROP SEQUENCE SEQ_FNO; 
CREATE SEQUENCE SEQ_FNO NOCACHE;
--댓글
DROP SEQUENCE SEQ_RNO; 
CREATE SEQUENCE SEQ_RNO NOCACHE;
--설정게시판
DROP SEQUENCE SEQ_SET; 
CREATE SEQUENCE SEQ_SET NOCACHE;

-------------------------------------------------MEMBER TABLE
CREATE TABLE MEMBER(
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) NOT NULL UNIQUE,
    USER_PWD VARCHAR2(100) NOT NULL,
    NICKNAME VARCHAR2(30) NOT NULL UNIQUE,
    EMAIL VARCHAR2(30) NOT NULL,
    INTRODUCE VARCHAR2(300),
    USER_LEVEL NUMBER DEFAULT 1 NOT NULL,
    POINT NUMBER DEFAULT 0 NOT NULL,
    TYPE NUMBER DEFAULT 1 NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    DELETE_DATE DATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN MEMBER.USER_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.USER_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.USER_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.NICKNAME IS '닉네임';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.INTRODUCE IS '소개글';
COMMENT ON COLUMN MEMBER.USER_LEVEL IS '회원등급';
COMMENT ON COLUMN MEMBER.POINT IS '누적포인트';
COMMENT ON COLUMN MEMBER.TYPE IS '1.일반회원 2.어드민';
COMMENT ON COLUMN MEMBER.CREATE_DATE IS '회원가입일';
COMMENT ON COLUMN MEMBER.DELETE_DATE IS '회원탈퇴일';
COMMENT ON COLUMN MEMBER.STATUS IS '상태값(Y/N)';

INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'admin', '1234', '관리자', 'admin@gmail.com', 1, 10000, 2, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'user01', '1111', '김유저', 'sdfaso12iwntw@gmail.com', 1, 100, 1, SYSDATE,'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'cheon', '1234', '천국', '1000baam@gmail.com', 2, 39393, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'jang', '1234', '장성', 'jangseong12321@gmail.com', 4, 310000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'han', '1234', '한수', 'hansu02023@gmail.com', 5, 501000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'choi', '1234', '최범', 'choibumbum@gmail.com', 3, 100000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'park', '1234', '박희', 'parkhee131322@gmail.com', 6, 1000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'Eo', '1234', 'javaMaster', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');

INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'asdf', '1234', 'adfgafdg', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'qwe', '1234', 'areagr', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'gfsd', '1234', 'aergrag', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'nhgj', '1234', 'argargd', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'rtui', '1234', 'adsfasdf', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'otyukyg', '1234', 'asdgvbz', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'jeymegh', '1234', 'asdf1', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'erthffdfdfd', '1234', 'asdf12', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'fdggfdgfd', '1234', 'asdf54', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'athhtae', '1234', 'gbxnb', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'f,iikhyst', '1234', 'fdbyh', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'hrstht', '1234', 'erwtyw', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'htrhtr', '1234', 'wreytre', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'htreerqhtr', '1234', 'aaaa', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');
INSERT INTO MEMBER(USER_NO,USER_ID,USER_PWD,NICKNAME,EMAIL,USER_LEVEL,POINT,TYPE,CREATE_DATE,STATUS)
VALUES (SEQ_UNO.NEXTVAL, 'hsdftrhtr', '1234', 'wreaaaytre', 'eoeoeoeo131@gmail.com', 6, 5000000, 1, SYSDATE, 'Y');

-------------------------------------------------MEMBER_IMAGE TABLE
CREATE TABLE MEMBER_IMAGE( 
    PROFILE_NO NUMBER PRIMARY KEY,
    REF_UNO NUMBER NOT NULL,
    ORIGIN_NAME VARCHAR2(255) NOT NULL,
    CHANGE_NAME VARCHAR2(255) NOT NULL,
    FILE_PATH VARCHAR2(1000) NOT NULL,
    CONSTRAINT FK_USERNO FOREIGN KEY(REF_UNO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN MEMBER_IMAGE.PROFILE_NO IS '프로필번호';
COMMENT ON COLUMN MEMBER_IMAGE.REF_UNO IS '참조 회원 번호';
COMMENT ON COLUMN MEMBER_IMAGE.ORIGIN_NAME IS '원본 파일명';
COMMENT ON COLUMN MEMBER_IMAGE.CHANGE_NAME IS '변경된 파일명';
COMMENT ON COLUMN MEMBER_IMAGE.FILE_PATH IS '파일 경로';



-------------------------------------------------FOLLOW TABLE
CREATE TABLE FOLLOW(
    FROM_USER NUMBER ,
    TO_USER NUMBER,
    PRIMARY KEY (FROM_USER, TO_USER),
    FOREIGN KEY (FROM_USER) REFERENCES MEMBER (USER_NO) ON DELETE CASCADE,
    FOREIGN KEY (TO_USER) REFERENCES MEMBER (USER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN FOLLOW.FROM_USER IS '팔로우 건사람';
COMMENT ON COLUMN FOLLOW.TO_USER IS '팔로우 받은 사람';

INSERT INTO FOLLOW
VALUES(2, 8);
INSERT INTO FOLLOW
VALUES(3, 8);
INSERT INTO FOLLOW
VALUES(4, 8);
INSERT INTO FOLLOW
VALUES(5, 8);
INSERT INTO FOLLOW
VALUES(6, 8);
INSERT INTO FOLLOW
VALUES(7, 8);

-------------------------------------------------SUPPORTERS TABLE (수정 06-16)
-- 수정 내용 : 서포터즈 commit 내역으로 잔디 만들기 위함
CREATE TABLE SUPPORTERS(
    REF_UNO NUMBER,
    GITHUB_ID VARCHAR2(100) NOT NULL,
    CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    REPO_URL VARCHAR2(100) DEFAULT '',
    CONSTRAINT FK_SU FOREIGN KEY(REF_UNO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN SUPPORTERS.REF_UNO IS '참조 회원 번호';
COMMENT ON COLUMN SUPPORTERS.GITHUB_ID IS 'GitHub 아이디';
COMMENT ON COLUMN SUPPORTERS.CREATE_DATE IS '서포터즈 생성일';
COMMENT ON COLUMN SUPPORTERS.REPO_URL IS '서포터즈 레포';



INSERT INTO SUPPORTERS VALUES (1, 'seolheee', SYSDATE, DEFAULT);
INSERT INTO SUPPORTERS VALUES (2, 'mongkevin', SYSDATE, DEFAULT);
INSERT INTO SUPPORTERS VALUES (4, 'Dukbong', SYSDATE, DEFAULT);
INSERT INTO SUPPORTERS VALUES (6, 'madplay', SYSDATE, DEFAULT);

-------------------------------------------------BOARD TABLE
CREATE TABLE BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    CATEGORY VARCHAR2(1) NOT NULL CHECK(CATEGORY IN('B','E','Q')),
    BOARD_WRITER NUMBER NOT NULL,
    TITLE VARCHAR2(1000) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL,
    CONTENT_CODE VARCHAR(3000) NOT NULL,
    COUNT NUMBER DEFAULT 0,
    LIKED NUMBER DEFAULT 0,
    CREATE_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE,
    NOTICE VARCHAR2(1) DEFAULT 'N' CHECK(NOTICE IN('N','Y')),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN ('Y','N')),
    FOREIGN KEY (BOARD_WRITER) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN BOARD.BOARD_NO IS '게시글번호';
COMMENT ON COLUMN BOARD.CATEGORY IS '게시판종류';
COMMENT ON COLUMN BOARD.BOARD_WRITER IS '작성자번호';
COMMENT ON COLUMN BOARD.TITLE IS '게시판제목';
COMMENT ON COLUMN BOARD.CONTENT IS '게시판내용';
COMMENT ON COLUMN BOARD.CONTENT_CODE IS '코드내용';
COMMENT ON COLUMN BOARD.COUNT IS '조회수';
COMMENT ON COLUMN BOARD.LIKED IS '좋아요수';
COMMENT ON COLUMN BOARD.CREATE_DATE IS '작성일';
COMMENT ON COLUMN BOARD.MODIFY_DATE IS '수정일';
COMMENT ON COLUMN BOARD.NOTICE IS '공지사항여부';
COMMENT ON COLUMN BOARD.STATUS IS '상태값(Y/N)';

-------------------------------------------------BOARD_ATTACHMENT TABLE
CREATE TABLE BOARD_ATTACHMENT(
  FILE_NO NUMBER PRIMARY KEY,
  REF_BNO NUMBER NOT NULL,
  ORIGIN_NAME VARCHAR2(255) NOT NULL,
  CHANGE_NAME VARCHAR2(255) NOT NULL,
  FILE_PATH VARCHAR2(1000) NOT NULL,
  UPLOAD_DATE DATE DEFAULT SYSDATE,
  DELETE_DATE DATE,
  FILE_LEVEL NUMBER,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
  FOREIGN KEY (REF_BNO) REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN BOARD_ATTACHMENT.FILE_NO IS '파일번호';
COMMENT ON COLUMN BOARD_ATTACHMENT.REF_BNO IS '참조게시글번호';
COMMENT ON COLUMN BOARD_ATTACHMENT.ORIGIN_NAME IS '원본파일명';
COMMENT ON COLUMN BOARD_ATTACHMENT.CHANGE_NAME IS '변경된파일명';
COMMENT ON COLUMN BOARD_ATTACHMENT.FILE_PATH IS '파일경로';
COMMENT ON COLUMN BOARD_ATTACHMENT.UPLOAD_DATE IS '업로드일';
COMMENT ON COLUMN BOARD_ATTACHMENT.DELETE_DATE IS '삭제일';
COMMENT ON COLUMN BOARD_ATTACHMENT.FILE_LEVEL IS '파일레벨(썸네일)';
COMMENT ON COLUMN BOARD_ATTACHMENT.STATUS IS '활성화';

-------------------------------------------------REPLY TABLE
CREATE TABLE REPLY(
  REPLY_NO NUMBER PRIMARY KEY,
  REF_BNO NUMBER NOT NULL,
  REPLY_CONTENT VARCHAR2(1000) NOT NULL,
  REPLY_WRITER NUMBER NOT NULL,
  CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
  STATUS VARCHAR2(1) DEFAULT 'W' CHECK (STATUS IN ('Y', 'N','W')),
  FOREIGN KEY (REF_BNO) REFERENCES BOARD(BOARD_NO)  ON DELETE CASCADE,
  FOREIGN KEY (REPLY_WRITER) REFERENCES MEMBER(USER_NO)  ON DELETE CASCADE
);

COMMENT ON COLUMN REPLY.REPLY_NO IS '댓글번호';
COMMENT ON COLUMN REPLY.REPLY_CONTENT IS '댓글내용';
COMMENT ON COLUMN REPLY.REF_BNO IS '참조게시글번호';
COMMENT ON COLUMN REPLY.REPLY_WRITER IS '댓글작성자아이디';
COMMENT ON COLUMN REPLY.CREATE_DATE IS '댓글작성날짜';
COMMENT ON COLUMN REPLY.STATUS IS '댓글상태값';

-------------------------------------------------BOARD 관련 더미
INSERT INTO BOARD --1번 게시글
VALUES (SEQ_BNO.NEXTVAL,'B', 1,'hello','how to print my result on console?','System.out.println()','0',NULL,SYSDATE,SYSDATE,'N','Y');
INSERT INTO BOARD_ATTACHMENT
VALUES (SEQ_FNO.NEXTVAL, SEQ_BNO.CURRVAL, '1.jpg','20230528111122223333.jpg','resources/upload_files',SYSDATE, 1,DEFAULT);
INSERT INTO BOARD_ATTACHMENT
VALUES (SEQ_FNO.NEXTVAL, SEQ_BNO.CURRVAL, '2.jpg','20230528111122223334.jpg','resources/upload_files',SYSDATE, 2,DEFAULT);
INSERT INTO REPLY
VALUES (SEQ_RNO.NEXTVAL, 1, '댓글1',  2, '20220520', DEFAULT);
INSERT INTO REPLY
VALUES (SEQ_RNO.NEXTVAL, 1, '댓글2',  2, '20230521', DEFAULT);

INSERT INTO BOARD --2번 게시글 
VALUES (SEQ_BNO.NEXTVAL,'E', '2','BYE','how to print my result on console?','System.out.println()','0',NULL,SYSDATE,SYSDATE,'N','Y');
INSERT INTO BOARD_ATTACHMENT
VALUES (SEQ_FNO.NEXTVAL, SEQ_BNO.CURRVAL, '3.jpg','20230528111122223335.jpg','resources/upload_files',SYSDATE, 1,DEFAULT);
INSERT INTO BOARD_ATTACHMENT
VALUES (SEQ_FNO.NEXTVAL, SEQ_BNO.CURRVAL, '4.jpg','20230528111122223336.jpg','resources/upload_files',SYSDATE, 2,DEFAULT);

INSERT INTO BOARD --3번 게시글 
VALUES (SEQ_BNO.NEXTVAL, 'Q','3','where are you','how to print my result on console?','System.out.println()','0',NULL,SYSDATE,SYSDATE,'Y','Y');
INSERT INTO BOARD_ATTACHMENT
VALUES (SEQ_FNO.NEXTVAL, SEQ_BNO.CURRVAL, '5.jpg','20230528111122223337.jpg','resources/upload_files',SYSDATE, 1,DEFAULT);
INSERT INTO BOARD_ATTACHMENT
VALUES (SEQ_FNO.NEXTVAL, SEQ_BNO.CURRVAL, '6.jpg','20230528111122223338.jpg','resources/upload_files',SYSDATE, 2,DEFAULT);
INSERT INTO REPLY
VALUES (SEQ_RNO.NEXTVAL, 3, '댓글3',  2, '20230521', DEFAULT);

INSERT INTO BOARD --4번 게시글  
VALUES (SEQ_BNO.NEXTVAL, 'Q','2','i believe i can fly','how to print my result on console?','System.out.println()','0',NULL,SYSDATE,SYSDATE,'Y','Y');
INSERT INTO BOARD_ATTACHMENT
VALUES (SEQ_FNO.NEXTVAL, SEQ_BNO.CURRVAL, '7.jpg','20230528111122223339.jpg','resources/upload_files',SYSDATE, 1,DEFAULT);
INSERT INTO BOARD_ATTACHMENT
VALUES (SEQ_FNO.NEXTVAL, SEQ_BNO.CURRVAL, '8.jpg','20230528111122223340.jpg','resources/upload_files',SYSDATE, 2,DEFAULT);
INSERT INTO REPLY
VALUES (SEQ_RNO.NEXTVAL,3, '댓글3', 2, '20230521', DEFAULT);

INSERT INTO BOARD --5번 게시글
VALUES (SEQ_BNO.NEXTVAL, 'Q','4','how are ya','how to print my result on console?','System.out.println()','0',NULL,SYSDATE,SYSDATE,'Y','Y');
INSERT INTO BOARD_ATTACHMENT
VALUES (SEQ_FNO.NEXTVAL, SEQ_BNO.CURRVAL, '9.jpg','20230528111122223341.jpg','resources/upload_files',SYSDATE, 1,DEFAULT);
INSERT INTO BOARD_ATTACHMENT
VALUES (SEQ_FNO.NEXTVAL, SEQ_BNO.CURRVAL, '10.jpg','20230528111122223342.jpg','resources/upload_files',SYSDATE, 2,DEFAULT);
INSERT INTO REPLY
VALUES (SEQ_RNO.NEXTVAL,4, '댓글3', 5, '20230521', DEFAULT);

-------------------------------------------------BULLETIN_BOARD TABLE
CREATE TABLE BULLETIN_BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TYPE NUMBER NOT NULL,
    FOREIGN KEY (BOARD_NO) REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN BULLETIN_BOARD.BOARD_NO IS '게시글번호';
COMMENT ON COLUMN BULLETIN_BOARD.BOARD_TYPE IS '게시글종류';

INSERT INTO BULLETIN_BOARD 
VALUES ('1', '1');
INSERT INTO BULLETIN_BOARD 
VALUES ('2', '2');

-------------------------------------------------CREATE_SETTING TABLE
CREATE TABLE CREATE_SETTING(
    SETTING_NO NUMBER UNIQUE,
    REF_UNO NUMBER NOT NULL,
    SETTING_TITLE VARCHAR2(100) NOT NULL,
    SETTING_VERSION VARCHAR2(100) DEFAULT '1.0.0' NOT NULL,
    SORT_DESCRIPTION VARCHAR2(1000) NOT NULL,
    SETTING_INFO CLOB NOT NULL,
    SETTING_CODE VARCHAR2(4000) NOT NULL,
    INPUT VARCHAR2(200),
    STATUS VARCHAR2(2) DEFAULT 'W' NOT NULL CHECK (STATUS IN ('W','Y','N')),
    CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
    PRIMARY KEY (SETTING_NO, SETTING_VERSION),
    CONSTRAINT FK_SE FOREIGN KEY(REF_UNO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE

);

COMMENT ON COLUMN CREATE_SETTING.SETTING_NO IS '세팅 번호';
COMMENT ON COLUMN CREATE_SETTING.REF_UNO IS '작성자번호';
COMMENT ON COLUMN CREATE_SETTING.SETTING_TITLE IS '세팅 제목';
COMMENT ON COLUMN CREATE_SETTING.SETTING_VERSION IS '세팅 버전';
COMMENT ON COLUMN CREATE_SETTING.SORT_DESCRIPTION IS '짧은 설명';
COMMENT ON COLUMN CREATE_SETTING.SETTING_INFO IS '세팅 설명';
COMMENT ON COLUMN CREATE_SETTING.SETTING_CODE IS '세팅코드';
COMMENT ON COLUMN CREATE_SETTING.INPUT IS '인풋요소';
COMMENT ON COLUMN CREATE_SETTING.STATUS IS '상태값';
COMMENT ON COLUMN CREATE_SETTING.CREATE_DATE IS '생성일';

INSERT INTO CREATE_SETTING VALUES (SEQ_SET.NEXTVAL, 1, 'Common dbcp', DEFAULT, 'DB 연결에 사용되는 Connection Pool을 만들어 관리 및 공유 할 수 있게 해주는 역할', '설명서||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||1||CHR(13)||CHR(10)||2||CHR(13)||CHR(10)||3||CHR(13)||CHR(10)||작성할곳||CHR(13)||CHR(10)||src/main/webapp/WEB-INF/spring/root-context.xml||CHR(13)||CHR(10)||자자자1', '<bean class="org.apache.commons.dbcp.BasicDataSource" id="dataSource">||CHR(13)||CHR(10)||<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>||CHR(13)||CHR(10)||<property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>||CHR(13)||CHR(10)||<property name="username" value="SPRING"/>||CHR(13)||CHR(10)||<property name="password" value="SPRING"/>||CHR(13)||CHR(10)||</bean>', 'input/driverClassName,url,username,password', DEFAULT, DEFAULT);
INSERT INTO CREATE_SETTING VALUES (SEQ_SET.NEXTVAL, 1, 'Mybatis', DEFAULT, 'DB1 연결에 사용되는 Connection Pool을 만들어 관리 및 공유 할 수 있게 해주는 역할', '설명서||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||1||CHR(13)||CHR(10)||2||CHR(13)||CHR(10)||3||CHR(13)||CHR(10)||작성할곳||CHR(13)||CHR(10)||src/main/webapp/WEB-INF/spring/root-context.xml||CHR(13)||CHR(10)||자자자2', '<bean class="org.apache.commons.dbcp.BasicDataSource" id="dataSource">||CHR(13)||CHR(10)||<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>||CHR(13)||CHR(10)||<property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>||CHR(13)||CHR(10)||<property name="username" value="SPRING"/>||CHR(13)||CHR(10)||<property name="password" value="SPRING"/>||CHR(13)||CHR(10)||</bean>', 'input/driverClassName,url,username,password', DEFAULT, DEFAULT);
INSERT INTO CREATE_SETTING VALUES (SEQ_SET.NEXTVAL, 2, 'CommonsMultipartResolver', DEFAULT, 'DB2 연결에 사용되는 Connection Pool을 만들어 관리 및 공유 할 수 있게 해주는 역할', '설명서||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||1||CHR(13)||CHR(10)||2||CHR(13)||CHR(10)||3||CHR(13)||CHR(10)||작성할곳||CHR(13)||CHR(10)||src/main/webapp/WEB-INF/spring/root-context.xml||CHR(13)||CHR(10)||자자자3', '<bean class="org.apache.commons.dbcp.BasicDataSource" id="dataSource">||CHR(13)||CHR(10)||<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>||CHR(13)||CHR(10)||<property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>||CHR(13)||CHR(10)||<property name="username" value="SPRING"/>||CHR(13)||CHR(10)||<property name="password" value="SPRING"/>||CHR(13)||CHR(10)||</bean>', 'input/defaultEncoding,maxUploadSize,maxInMemorySize', DEFAULT, DEFAULT);
INSERT INTO CREATE_SETTING VALUES (SEQ_SET.NEXTVAL, 4, 'springSecurity', DEFAULT, 'DB3 연결에 사용되는 Connection Pool을 만들어 관리 및 공유 할 수 있게 해주는 역할', '설명서||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||1||CHR(13)||CHR(10)||2||CHR(13)||CHR(10)||3||CHR(13)||CHR(10)||작성할곳||CHR(13)||CHR(10)||src/main/webapp/WEB-INF/spring/root-context.xml||CHR(13)||CHR(10)||자자자4', '<bean class="org.apache.commons.dbcp.BasicDataSource" id="dataSource">||CHR(13)||CHR(10)||<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>||CHR(13)||CHR(10)||<property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>||CHR(13)||CHR(10)||<property name="username" value="SPRING"/>||CHR(13)||CHR(10)||<property name="password" value="SPRING"/>||CHR(13)||CHR(10)||</bean>', 'input/driverClassName,url,username,password', DEFAULT, DEFAULT);
INSERT INTO CREATE_SETTING VALUES (SEQ_SET.NEXTVAL, 6, 'Filter', DEFAULT, 'DB4 연결에 사용되는 Connection Pool을 만들어 관리 및 공유 할 수 있게 해주는 역할', '설명서||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||1||CHR(13)||CHR(10)||2||CHR(13)||CHR(10)||3||CHR(13)||CHR(10)||작성할곳||CHR(13)||CHR(10)||src/main/webapp/WEB-INF/spring/root-context.xml||CHR(13)||CHR(10)||자자자', '<bean class="org.apache.commons.dbcp.BasicDataSource" id="dataSource">||CHR(13)||CHR(10)||<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>||CHR(13)||CHR(10)||<property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>||CHR(13)||CHR(10)||<property name="username" value="SPRING"/>||CHR(13)||CHR(10)||<property name="password" value="SPRING"/>||CHR(13)||CHR(10)||</bean>', '', DEFAULT, DEFAULT);
INSERT INTO CREATE_SETTING VALUES (SEQ_SET.NEXTVAL, 1, 'AOP', DEFAULT, 'DB7 연결에 사용되는 Connection Pool을 만들어 관리 및 공유 할 수 있게 해주는 역할', '설명서||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||1||CHR(13)||CHR(10)||2||CHR(13)||CHR(10)||3||CHR(13)||CHR(10)||작성할곳||CHR(13)||CHR(10)||src/main/webapp/WEB-INF/spring/root-context.xml||CHR(13)||CHR(10)||자자자9', '<bean class="org.apache.commons.dbcp.BasicDataSource" id="dataSource">||CHR(13)||CHR(10)||<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>||CHR(13)||CHR(10)||<property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>||CHR(13)||CHR(10)||<property name="username" value="SPRING"/>||CHR(13)||CHR(10)||<property name="password" value="SPRING"/>||CHR(13)||CHR(10)||</bean>', '', DEFAULT, DEFAULT);
INSERT INTO CREATE_SETTING VALUES (SEQ_SET.NEXTVAL, 2, 'WebSocket', DEFAULT, 'DB8 연결에 사용되는 Connection Pool을 만들어 관리 및 공유 할 수 있게 해주는 역할', '설명서||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||1||CHR(13)||CHR(10)||2||CHR(13)||CHR(10)||3||CHR(13)||CHR(10)||작성할곳||CHR(13)||CHR(10)||src/main/webapp/WEB-INF/spring/root-context.xml||CHR(13)||CHR(10)||자자자7', '<bean class="org.apache.commons.dbcp.BasicDataSource" id="dataSource">||CHR(13)||CHR(10)||<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>||CHR(13)||CHR(10)||<property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>||CHR(13)||CHR(10)||<property name="username" value="SPRING"/>||CHR(13)||CHR(10)||<property name="password" value="SPRING"/>||CHR(13)||CHR(10)||</bean>', '', DEFAULT, DEFAULT);
INSERT INTO CREATE_SETTING VALUES (SEQ_SET.NEXTVAL, 1, 'Schedule', DEFAULT, 'DB9 연결에 사용되는 Connection Pool을 만들어 관리 및 공유 할 수 있게 해주는 역할', '설명서||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||어쩌구 저쩌구||CHR(13)||CHR(10)||1||CHR(13)||CHR(10)||2||CHR(13)||CHR(10)||3||CHR(13)||CHR(10)||작성할곳||CHR(13)||CHR(10)||src/main/webapp/WEB-INF/spring/root-context.xml||CHR(13)||CHR(10)||자자자8', '<bean class="org.apache.commons.dbcp.BasicDataSource" id="dataSource">||CHR(13)||CHR(10)||<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>||CHR(13)||CHR(10)||<property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>||CHR(13)||CHR(10)||<property name="username" value="SPRING"/>||CHR(13)||CHR(10)||<property name="password" value="SPRING"/>||CHR(13)||CHR(10)||</bean>', '', DEFAULT, DEFAULT);

-------------------------------------------------ERROR_BOARD TABLE
CREATE TABLE ERROR_BOARD(
    REF_BNO NUMBER NOT NULL,
    REF_SNO NUMBER NOT NULL,
    SOLVED VARCHAR2(1) DEFAULT 'N' NOT NULL CHECK(SOLVED IN('N','Y')),
    ERROR_TYPE VARCHAR(1) DEFAULT 'N' NOT NULL CHECK(ERROR_TYPE IN('N','U','S')),
    MODIFIED_CODE VARCHAR2(4000),
    MODIFIED_INFO CLOB,
    CONSTRAINT FK_BNO FOREIGN KEY(REF_BNO) REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE,
    CONSTRAINT FK_SNO FOREIGN KEY(REF_SNO) REFERENCES CREATE_SETTING(SETTING_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN ERROR_BOARD.REF_BNO IS '참조게시글번호';
COMMENT ON COLUMN ERROR_BOARD.REF_SNO IS '참조세팅번호';
COMMENT ON COLUMN ERROR_BOARD.SOLVED IS '해결여부';
COMMENT ON COLUMN ERROR_BOARD.ERROR_TYPE IS '오류타입';
COMMENT ON COLUMN ERROR_BOARD.MODIFIED_CODE IS '수정한코드';
COMMENT ON COLUMN ERROR_BOARD.MODIFIED_INFO IS '수정한설명서';

INSERT INTO ERROR_BOARD VALUES(1,1,'N','N','수정한코드','수정한설명서');
INSERT INTO ERROR_BOARD VALUES(2,1,'N','U','수정한코드', NULL);
INSERT INTO ERROR_BOARD VALUES(3,6,'N','U','수정한코드', NULL);
INSERT INTO ERROR_BOARD VALUES(4,6,'Y','S', NULL,'수정한설명서');
INSERT INTO ERROR_BOARD VALUES(5,3,'Y','S',NULL,'수정한설명서');
--INSERT INTO ERROR_BOARD VALUES(3,3,'C','W',NULL,NULL);
--INSERT INTO ERROR_BOARD VALUES(3,4,'Y','W',NULL,NULL);
--INSERT INTO ERROR_BOARD VALUES(4,4,'Y','W','수정한코드','수정한설명서');
--INSERT INTO ERROR_BOARD VALUES(4,5,'Y','W', NULL,'수정한설명서');
--INSERT INTO ERROR_BOARD VALUES(4,5,'Y','W','수정한코드', NULL);

-------------------------------------------------ATTENDANCE TABLE
CREATE TABLE ATTENDANCE(
    ATT_DATE VARCHAR2(30) NOT NULL,
    REF_UNO NUMBER NOT NULL,
    ATT_LEVEL NUMBER NOT NULL,
    CONSTRAINT FK_UNO FOREIGN KEY(REF_UNO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
    CONSTRAINT PK_ATTENDANCE PRIMARY KEY(ATT_DATE,REF_UNO)
);

COMMENT ON COLUMN ATTENDANCE.ATT_DATE IS '해당날짜';
COMMENT ON COLUMN ATTENDANCE.REF_UNO IS '참조회원번호';
COMMENT ON COLUMN ATTENDANCE.ATT_LEVEL IS '참여도(3단계)';

INSERT INTO ATTENDANCE VALUES('2023-01-01',1,1);
INSERT INTO ATTENDANCE VALUES('2023-01-02',1,3);
INSERT INTO ATTENDANCE VALUES('2023-01-07',1,3);
INSERT INTO ATTENDANCE VALUES('2023-01-08',1,2);
INSERT INTO ATTENDANCE VALUES('2023-01-09',1,2);
INSERT INTO ATTENDANCE VALUES('2023-01-10',1,1);
INSERT INTO ATTENDANCE VALUES('2023-01-11',1,3);
INSERT INTO ATTENDANCE VALUES('2023-01-25',1,1);
INSERT INTO ATTENDANCE VALUES('2023-01-26',1,2);
INSERT INTO ATTENDANCE VALUES('2023-02-01',1,3);

-------------------------------------------------LIKED TABLE
CREATE TABLE LIKED(
    REF_UNO NUMBER DEFAULT 99999 NOT NULL,
    REF_BNO NUMBER NOT NULL,
    LIKED_TYPE NUMBER NOT NULL,
    CONSTRAINT FK_UNO2 FOREIGN KEY(REF_UNO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
    CONSTRAINT FK_BNO2 FOREIGN KEY(REF_BNO) REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE,
    CONSTRAINT PK_LIKED PRIMARY KEY(REF_UNO,REF_BNO)
);

COMMENT ON COLUMN LIKED.REF_UNO IS '참조회원번호';
COMMENT ON COLUMN LIKED.REF_BNO IS '참조게시글번호';
COMMENT ON COLUMN LIKED.LIKED_TYPE IS '좋아요/싫어요';

INSERT INTO LIKED VALUES(1,1,1);
INSERT INTO LIKED VALUES(1,2,1);
INSERT INTO LIKED VALUES(1,3,1);
INSERT INTO LIKED VALUES(1,4,2);
INSERT INTO LIKED VALUES(2,1,2);
INSERT INTO LIKED VALUES(2,2,2);
INSERT INTO LIKED VALUES(2,3,2);
INSERT INTO LIKED VALUES(2,4,1);

-------------------------------------------------QNA_SELECT TABLE
CREATE TABLE QNA_SELECT (
  REPLY_NO NUMBER,
  REF_BNO NUMBER,
  REPLY_SELECT VARCHAR2(1) DEFAULT 'N' CHECK (REPLY_SELECT IN ('Y', 'N')),
  PRIMARY KEY (REPLY_NO, REF_BNO),
  FOREIGN KEY (REPLY_NO) REFERENCES REPLY(REPLY_NO) ON DELETE CASCADE,
  FOREIGN KEY (REF_BNO)REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN QNA_SELECT.REPLY_NO IS '댓글번호';
COMMENT ON COLUMN QNA_SELECT.REF_BNO IS '참조게시글번호';
COMMENT ON COLUMN QNA_SELECT.REPLY_SELECT IS '채택';

INSERT INTO QNA_SELECT
VALUES (3,3,'N');
INSERT INTO QNA_SELECT
VALUES (4,4,'N');

-------------------------------------------------BLOCK_IP TABLE
CREATE TABLE BLOCK_IP(
    IP VARCHAR2(100) PRIMARY KEY,
    COUNT NUMBER DEFAULT 1 NOT NULL,
    STATUS VARCHAR2(2) DEFAULT 'N' NOT NULL CHECK(STATUS IN ('Y','N'))
);

COMMENT ON COLUMN BLOCK_IP.COUNT IS '부정 접근';
COMMENT ON COLUMN BLOCK_IP.STATUS IS '상태값';

INSERT INTO BLOCK_IP VALUES ('192.150.68.27',1,'N');
INSERT INTO BLOCK_IP VALUES ('198.165.72.21',4,'N');
INSERT INTO BLOCK_IP VALUES ('191.120.66.25',5,'Y');
INSERT INTO BLOCK_IP VALUES ('190.168.62.11',3,'N');
INSERT INTO BLOCK_IP VALUES ('123.187.66.15',2,'N');
INSERT INTO BLOCK_IP VALUES ('134.153.62.18',2,'N');
INSERT INTO BLOCK_IP VALUES ('152.151.63.14',4,'N');
INSERT INTO BLOCK_IP VALUES ('125.143.66.35',5,'N');
INSERT INTO BLOCK_IP VALUES ('173.174.61.69',1,'N');
INSERT INTO BLOCK_IP VALUES ('182.193.62.36',5,'Y');


COMMIT;

-----트리거(ip 차단 횟수 5회시 자동으로 상태값 변경)
CREATE OR REPLACE TRIGGER BLOCKIP_TRG
BEFORE UPDATE ON BLOCK_IP
FOR EACH ROW
DECLARE
    BEGIN
    IF(:NEW.COUNT = 5) THEN
        :NEW.STATUS := 'Y';
    END IF;
END;