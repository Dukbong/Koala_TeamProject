## 사용 기술 및 개발 환경

운영체제 : Window 10 <br>
사용언어 : Java, JSP, JavaScript, jQuery, HTML5/CSS3 <br>
FramWork : Spring Framework 5.2.24 release <br>
프로젝트 관리도구 : Maven <br>
DB  : Oracle 11g <br>
Tool : STS <br>
WAS : Tomcat 9.0 <br>
Collaboration : GitHub <br>
기타사항 : Mybatis 3.5.11 <br><br>

## 프로젝트 소개

#### 프로젝트명 : 코드 알려주라 (KOALA)
#### 프로젝트 인원 : 5명
#### 프로젝트 기간 : 2023-05-10 ~ 2023-07-07
#### 개발 목표
1. 수강생을 위해 스프링의 초기 설정과 다양한 라이브러리 사용법을 쉽게 보여줄 수 있는 기능
2. 제공된 라이브러리와 설정에 에러 및 수정사항이 있다면 이를 신고 받아 업데이트하여 지속적으로 보여주는 기능
3. 수강생을 위해 팀 프로젝트 진행시 SQL문을 공동으로 작업할 수 있는 기능

## 담당 역할
#### 관리자 페이지
- 전체 회원 조회 및 서포터즈 초대
    - 검색, 페이징 처리, 등급 순 정렬
    - 일반 회원을 서포터즈로 초대 (GitHub API 활용)
-  서포터즈 회원 조회
    - DB에서 권한 제거
- 라이브러리 및 설정에 관한 신고 구분 및 수정
    - Ajax 활용
    - Transaction으로 DB 일괄 처리
- 접근 제한
    - Interceptor 활용
#### 그 외 기능
- SQL문 공동 작업 기능 [참고 : ERD Cloud]
  - WebSocket 활용
  - 자료구조 Map을 사용하여 방을 구현
  - 저장 및 다운로드 기능 구현
- 다크 / 라이트 모드
  - 쿠키를 활용
- 부적절한 접근자 차단 기능
  - Interceptor와 JavaScript를 사용하여 차단기능 구현
