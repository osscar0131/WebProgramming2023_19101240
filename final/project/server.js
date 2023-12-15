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




const main_page = fs.readFileSync(__dirname + "/public/main.html", "utf8")
const empty_page = fs.readFileSync(__dirname + "/public/empty.html", "utf8")

var image = fs.readFileSync(__dirname + "/public/default.png")
var imagename = "default.png"



app.get('/', function(request, response) { //기본 디렉토리. 첫 로그인시 여기로.
	connection.query("SELECT modid, title, upload_date, last_update FROM mods;", function(error, results, fields) {
		if(error) throw error;
		else {
			var page = ejs.render(main_page, { //글 목록을 쿼리로 불러와서, ejs 구현
				data : results
			});
		}
		return response.send(page);
		response.end();
	});
});


app.get('/login', function(request, response) {
	return response.sendFile(path.join(__dirname + '/public/login.html'));
});



app.post('/login', function(request, response) {
	var id = request.body.ID;
	var password = request.body.Password;
	if (id && password) {
		connection.query('SELECT * FROM user WHERE id = ? AND password = ?', [id, password], function(error, results, fields) {
			if (error) throw error;
			if (results.length > 0) {
				request.session.loggedin = true;
				request.session.uid = results[0].uid;
				response.redirect('/');
			} else {
				console.log("ID/Password match not found.")
				//response.sendFile(path.join(__dirname + '/public/loginerror.html'));
				response.sendFile(path.join(__dirname + '/public/login.html'));
			}
		});
	} else {
		console.log('Password or ID not selected.');
		response.redirect('/login');
	}
});

app.get('/register', function(request, response) {
	response.sendFile(path.join(__dirname + '/public/register.html'));
});

app.post('/register', function(request, response) {
	var id = request.body.ID;
	var password = request.body.Password;
	var password2 = request.body.Password2;
	if (id && password && password2) {
		connection.query('SELECT uid FROM user WHERE id = ?', [id], function(error, results, fields) {
			if (error) throw error;
			if(results.length > 0) {
				console.log('Already existing id. Please try another one.');
				response.redirect('/register');
				return;
			}
			else {
				console.log('No matching id. Start register...');
				if(password != password2) {
					console.log('Password mismatch. Please double check your password.');
					response.redirect('/register');
					return;
				}
				else {
					connection.query("INSERT INTO user (id, password) VALUES (?, ?);", [id, password],
						function(error, data) {
							if(error)
								console.log(error);
							else {
								console.log(data);
								console.log('register complete.')
								response.redirect("/login");
								response.end();
							}
						});
				}
			}
		});
	}
	else {
		console.log('Invalid user information. Please check and try again.');
		response.redirect('/register');
		response.end();
	}
});

app.get('/logout', function(request, response) {
	request.session.loggedin = false;
	request.session.uid = null;
	console.log('Log out successful.');
	response.redirect('/');
	response.end();
});



app.get('/insert', function(request, response) {
	if(request.session.loggedin) {
		fs.readFile(__dirname + '/private/insert.html', 'utf8', function (error, data) {
        	connection.query("SELECT gunid, name, type from guns;", function(error, results, fields) {
            	if (error) throw error;
            	response.send(ejs.render(data, {
                	data: results
            	}));
            	response.end();
        	});
    	});
	}
	else {
		console.log('You must log in to write new mods.');
		response.redirect('/');
		return;
	}
});

app.post('/insert', function (request, response) {
	var modding = request.body;
	var server_time = new Date();
	var upload_date = server_time.toISOString().slice(0,-4);

	console.log(modding);


	connection.query("INSERT INTO mods (title, upload_date, last_update, writer_uid, gun_name, image, weight, ergonomics, accuracy, vertical_recoil, muzzle_velocity, horizontal_recoil, sighting_range, magazine_size, price, flea_market, description) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
		[modding.title, upload_date, upload_date, request.session.uid, modding.gun_name, modding.image, modding.weight, modding.ergonomics, modding.accuracy, modding.vertical_recoil, modding.muzzle_velocity, modding.horizontal_recoil, modding.sighting_range, modding.magazine_size, modding.price, modding.flea_dependant[0], modding.description],
		function(error, data) {
			if (error) throw error;
			console.log("Insert new page received from : " + request.session.uid);
			console.log(data);
			return response.redirect('/');
		});
	response.end();
});

app.get('/delete/:id', function (request, response) {
	connection.query("SELECT writer_uid FROM mods WHERE modid=?", [request.params.id], function(error, results, fields) {
		if (error) throw error;
		var writer = results[0].writer_uid;
		if(request.session.uid != 1 && request.session.uid != writer) {
			console.log('No access to deleting this page. Must be Administerator or writer.');
			response.redirect('/');
			return;
		}
		connection.query('DELETE FROM mods WHERE modid=?', [request.params.id], function () {
			console.log('Delete successful.');
			response.redirect('/');
			response.end();
		});
	});
});

app.get('/edit/:id', function(request, response) {
	console.log('starting edit');
	connection.query("SELECT writer_uid FROM mods WHERE modid=?", [request.params.id], function(error, results, fields) {
		console.log('querystart')
		if (error) throw error;
		if(request.session.uid != 1 && request.session.uid != results[0].writer_uid) {
			console.log('No access to editing this page. Must be Administerator or writer.');
			response.redirect('/');
		}
		else {
			console.log('filesystem')
			fs.readFile(__dirname + '/private/edit.html', 'utf8', function(error, data) {
			if (error) throw error;
			connection.query("SELECT gunid, name, type from guns;", function(error, results_2, fields) {
				console.log(results_2[1])
				if(error) throw error;
				return response.send(ejs.render(data, {
					data: results_2
				}));
				return;
			});
		});
		}
	});
})

app.post('/edit/:id', function(request, response) {
	console.log('submitting edit');

	var modding = request.body;
	var server_time = new Date();
	var upload_date = server_time.toISOString().slice(0,-4);

	console.log("time = "+upload_date)
	console.log(modding);

	connection.query("UPDATE guns SET title=?, last_update=?, gun_name=?, image=?, weight=?, ergonomics=?, accuracy=?, vertical_recoil=?, muzzle_velocity=?, horizontal_recoil=?, sighting_range=?, magazine_size=?, price=?, flea_market=?, description=? WHERE modid=?",
		[modding.title, upload_date, modding.gun_name, modding.image, modding.weight, modding.ergonomics, modding.accuracy, modding.vertical_recoil, modding.muzzle_velocity, modding.horizontal_recoil, modding.sighting_range, modding.magazine_size, modding.price, modding.flea_dependant[0], modding.description, request.params.id],
		function(error, data) {
			if (error) throw error;
			console.log("Edit page received from : " + request.session.uid);
			console.log("where modid : " + request.params.id);
			console.log(data);
			response.redirect('/');
			return;
		})

})

app.post('/gundata', function(request, response) {
	var gun = request.body.gun_name;
	connection.query('SELECT caliber, types_of_fire, fire_rate, effective_distance FROM guns WHERE name = ?', [gun], function(error, results, fields) {
		if (error) throw error;
		console.log(results);
		response.send(results);
		response.end();
	});
});

app.post('/moddata', function(request, response) {
	var mod = request.body.modid;
	console.log(mod);
	connection.query('SELECT * FROM mods WHERE modid=?',[mod], function(error, results, fields) {
		if(error) throw error;
		console.log(results);
		response.send(results);
		response.end();
	});
});


app.post('/image', function(request, response) {
	console.log(request.body);
	var imagesrc = request.body.image_src;
	var imagename = request.body.image_name;

	image = fs.readFileSync(imagesrc)

	response.send(image);
	response.end();
})



//서버 실행, 콘솔창에 실행결과 출력
app.listen(52273, () => {
	console.log('Server running at http://127.0.0.1:52273');
});
