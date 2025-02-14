## 첫번째 게시판 구현의 환경 설정

#### 1. 다이나믹 웹프로젝트 만들기
* 주의: web.xml 체크하기

#### 2. git 연동
* .gitignore 파일 프로젝트 폴더에 저장
   * 내용은 gitignore.io 사이트에서 작성.(windows,eclipse,java,__maven__ 입력)

#### 3. 빌드도구
* gradle 또는 maven을 주로 사용.

#### maven project 만들기
+ 프로젝트 선택 --→ 오른쪽 버튼 메뉴 Configure --→ convert to maven project --→ 다른 내용 입력 없이 Finish --→ pom.xml 생성됨
+ 빌드도구의 기능 1 : 외부 라이브러리를 관리
	+ <dependencies></dependencies> 태그안에 필요한 라이브러리 설정합니다.(디펜던시는 의존성 즉 필요한 라이브러리)
	+ pom.xml 파일이 수정되면 이클립스는 빌드를 새로 합니다. 오른쪽 아래 상태바가 진행되는 것 꼭 확인하고 완료까지 기다리세요.

+ 빌드도구의 기능 2 : 배포 파일(최종결과물-jar,war 확장자) 생성

#### pom.xml  디펜던시 추가하기
+ pom.xml 의 오류
	+ run as 에서 maven clean --→ 프로젝트 우클릭 -> maven 에서 update project
	
<code>

	<dependencies>
			<!-- https://mvnrepository.com/artifact/com.oracle.database.jdbc/ojdbc11 -->
			<dependency>
				<groupId>com.oracle.database.jdbc</groupId>
				<artifactId>ojdbc11</artifactId>
				<version>21.1.0.0</version>
			</dependency>
			<!-- https://mvnrepository.com/artifact/org.projectlombok/lombok -->
			<dependency>
				<groupId>org.projectlombok</groupId>
				<artifactId>lombok</artifactId>
				<version>1.18.22</version>
				<scope>provided</scope>
			</dependency>
			<!-- https://mvnrepository.com/artifact/org.mybatis/mybatis -->
			<dependency>
				<groupId>org.mybatis</groupId>
				<artifactId>mybatis</artifactId>
				<version>3.5.10</version>
			</dependency>
			<!-- https://mvnrepository.com/artifact/javax.servlet/jstl -->
			<dependency>
				<groupId>javax.servlet</groupId>
				<artifactId>jstl</artifactId>
				<version>1.2</version>
			</dependency>
			<!-- https://mvnrepository.com/artifact/org.slf4j/slf4j-api : 로그 라이브러리 -->
			<dependency>
			    <groupId>org.slf4j</groupId>
			    <artifactId>slf4j-api</artifactId>
			    <version>1.7.25</version>
			</dependency>
			<!-- https://mvnrepository.com/artifact/org.slf4j/slf4j-simple : 로그 라이브러리 -->
			<dependency>
			   <groupId>org.slf4j</groupId>
			   <artifactId>slf4j-simple</artifactId>
			   <version>1.7.25</version>
			</dependency>		
			<!-- https://mvnrepository.com/artifact/com.google.guava/guava : 패스워드 해시 sha256-->
			<dependency>
			    <groupId>com.google.guava</groupId>
			    <artifactId>guava</artifactId>
			    <version>30.0-jre</version>
			</dependency>
			<!-- 파일업로드 MultipartRequest 사용 -->
			<dependency>
				<groupId>servlets.com</groupId>
				<artifactId>cos</artifactId>
				<version>05Nov2002</version>
			</dependency>
		</dependencies>			
</code>

#### web.xml 
+ 웹 애플리케이션 deployment descriptor(배포 설명자)
+ 웹 애플리케이션이 요청을 처리하는 것과 관련된 동작을 정의합니다. 

	+ welcome 페이지
	+ 서블릿 설정
	+ session 타임아웃 시간
	+ 오류 처리 등

+ 	welcome 페이지 확인 : index.jsp 작성 후 프로젝트 우클릭 --→ Run as --→ Run on Server
	+ 실행되는 url 과 기본 웹페이지 확인하기

<hr>

### 데이터베이스 설계
기능 : 커뮤니티 게시판

##### 1. 테이블 생성
+ 메인글 : community 테이블
+ 댓글 : communityComments 테이블 

##### 2. 주요 sql 테스트
<hr>

### mybatis 프레임웍 

##### 1. mapper xml : 실행할 sql 정의

##### 2. configuration xml : DBCP datasource , mapper xml 설정

##### 3. mybatis SqlSession 객체 생성 메소드 정의

<hr>

※ dao와 dto 클래스 및 jsp 소스 구현 등 이후 순서는 github 프로젝트 참고하세요.
