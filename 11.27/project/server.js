//모듈
const fs = require('fs');
const path = require('path');
const mysql = require('mysql');
const express = require('express');
const session = require('express-session');
const bodyParser = require('body-parser');

//MySQL서버에 연결.
var connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'osscar0131',
	password : '19101240',
	database : '19101240_web_project'
});

//서버 생성
const app = express();
app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

app.use(express.static(`${__dirname}/public`)); //static. 기본적으로 public폴더 내에서 필요한 파일들 검색
app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());






app.get('/', function(request, response) { //기본 디렉토리. 첫 로그인시 여기로.
	response.sendFile(path.join(__dirname + '/public/Main.html'));
});










//서버 실행, 콘솔창에 실행결과 출력
app.listen(52273, () => {
	console.log('Server running at http://127.0.0.1:52273');
});