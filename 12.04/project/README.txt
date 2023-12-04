//install package
npm i fs
npm i mysql
npm i express
npm i express-session
npm i body-parser
npm i ejs


//MySQL-8.2.0-winx64.zip
//cmd Setup&Run

//명령 프롬프트 실행 후, 현재 위치를 /bin으로 이동
Win+R > CMD (명령 프롬프트)
D:
cd D:\osscar0131\University\고급웹프로그래밍\project\mysql-8.2.0-winx64\bin

// mysqld 설치. 이 단계까지는 실행되어 있음
mysqld --initialize-insecure --console
mysqld --install

//mysql 시작, 루트 계정 접속
start mysqld -C utf8
mysql --default-character-set=utf8 -u root -p
****   //비밀번호, default ""