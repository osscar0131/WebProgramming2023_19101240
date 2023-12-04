//모듈
const fs = require('fs');
const path = require('path');
const mysql = require('mysql');
const express = require('express');
const session = require('express-session');
const bodyParser = require('body-parser');
const ejs = require('ejs')

//MySQL서버에 연결.
var connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'osscar0131',
	password : '19101240',
	database : '19101240_web_project'
});

//서버객체 생성
const app = express();
app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));

app.use(express.static(`${__dirname}/public`)); //static. 기본적으로 public폴더 내에서 필요한 파일들 검색

app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());




const main_page = fs.readFileSync(__dirname + "/public/Main.html", "utf8")

app.get('/', function(request, response) { //기본 디렉토리. 첫 로그인시 여기로.
	connection.query("SELECT modid, title, upload_date, last_update FROM mods;", function(error, results, fields) {
		if(error) throw error;
		else {
			var page = ejs.render(main_page, { //글 목록을 쿼리로 불러와서, ejs 구현
				data : results
			});
		}
		response.send(page);
	});
});


app.get('/login', function(request, response) {
	response.sendFile(path.join(__dirname + '/public/login.html'));
});



app.post('/login', function(request, response) {
	var id = request.body.ID;
	var password = request.body.Password;
	if (id && password) {
		connection.query('SELECT * FROM user WHERE id = ? AND password = ?', [id, password], function(error, results, fields) {
			if (error) throw error;
			if (results.length > 0) {
				request.session.loggedin = true;
				request.session.uid = results.uid;
				response.redirect('/');
			} else {
				console.log("ID/Password match not found.")
				response.sendFile(path.join(__dirname + '/public/loginerror.html'));
			}
		});
	} else {
		console.log('Password or ID not selected.');
		response.sendFile(path.join(__dirname + '/public/login.html'));
	}
});










//서버 실행, 콘솔창에 실행결과 출력
app.listen(52273, () => {
	console.log('Server running at http://127.0.0.1:52273');
});