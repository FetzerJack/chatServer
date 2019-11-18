var express = require('express');
var app = express();
var server = require('http').createServer(app);
var io = require('socket.io').listen(server);
var mysql = require('mysql');
users = [];
connections = [];

//Opens Server Connection
server.listen((3000), function()
{
  console.clear();
  console.log('Opened server on', server.address());
});

//Establishes SQL Settings & Don't forget to install appropriate JDBC (Recomended is Bitnami WAMP)
var sqlConnection = mysql.createConnection({
  host     : '127.0.0.1',
  port     : '3306',
  user     : 'root',
  password : 'iamroot',
  database : 'chat_server'
});

//Establishes SQL Connection Using Established Settings
sqlConnection.connect(function(err) {
  if (!err)
    console.log("MySQL Server Connected");
  else
    console.log("MySQL Server NOT CONNECTED");
});

//Redirects User from / to /index
app.get('/',function (req, res)
{
  res.redirect('/index');
});

//Assigns Links to the URL
app.get('/index', function(req, res)
{
  res.sendFile(__dirname + '/index.html');
});
app.get('/newUser', function(req, res)
{
  res.sendFile(__dirname + '/newUser.html');
});
app.get('/adminPortal', function(req, res){
  res.sendFile(__dirname + '/adminPortal.html');
});

//On Socket Connection
io.sockets.on('connection', function(socket)
{
  connections.push(socket);

  //Disconnect User
  socket.on('disconnect', function(data)
  {
    users.splice(users.indexOf(data), 1);
    connections.splice(connections.indexOf(socket), 1);
    updateUsernames();
  });

  //Logout User
  socket.on('logout', function(data)
  {
    users.splice(users.indexOf(data), 1);
    updateUsernames();
    console.log('Socket Disconnected: %s Socket Connections', connections.length);
  });

  //Send message
  socket.on('send message', function(data)
  {
    var messageID;
    if (data != "")
    {
      var sql = "INSERT INTO `messages` (`username`, `message`) VALUES ('" + socket.username + "', '" + data + "')"; //Variables do not pass through
      sqlConnection.query(sql);

      
      sqlConnection.query('SELECT * FROM messages', function(err, rows, fields)
      {
        messageID = rows[rows.length - 1].id;
        io.sockets.emit('new message', {msg: (Date().slice(16,25) + ' -- ' + socket.username + ': ' + data), id: (messageID)});
      });
    }
  });

  //Admin Portal Login and Authorize
  socket.on('adminPortalLogin', function(data)
  {
    var adminUsername = data.username;
    var adminPassword = data.password;

    console.log(adminUsername)
    sqlConnection.query('SELECT * FROM users', function(err, rows, fields) 
    {
      var found = false;
      i = 0;
      if ((adminUsername).length >= 4 && (adminPassword).length >= 4)
      {
        while (i < rows.length)
        {
          if (adminUsername == (rows[i].username) && adminPassword == (rows[i].password) && rows[i].status == 1 && rows[i].isAdmin == 1)
            found = true;
          i++;
        }
        if (found)
        {
          io.emit('adminPortalAuthGood', adminUsername);

          /*
          sqlConnection.query('SELECT * FROM messages', function(err, rows, fields)
          {
            for (var i = 0; i < rows.length; i++)
            {
              io.emit('previousTime_Stamp', rows[i].time_stamp);
              io.emit('previousUsername', rows[i].username);
              io.emit('previousMessageID', rows[i].id);
              io.emit('previousMessage', rows[i].message);
            }
          });
          */
        }
        else if (!found)
        {
          io.emit('adminPortalAuthBad', adminUsername);
        }
      }
      else
      {
        io.emit('adminPortalAuthBad', adminUsername);
      }
    });
  });

  //User Logging In
  socket.on('username', function(data)
  {
    socket.username = data;
  });
  socket.on('password', function(data)
  {
    socket.password = data;
  });

  //Checking Login Credentials
  socket.on('auth', function(data)
  {
    sqlConnection.query('SELECT * FROM users', function(err, rows, fields) 
    {
      var found = false;
      i = 0;
      if ((socket.username).length >= 4 && (socket.password).length >= 4)
      {
        while (i < rows.length || !found)
        {
          if (socket.username == (rows[i].username) && socket.password == (rows[i].password) && rows[i].status == 1)
          {
            found = true;
            if (rows[i].isAdmin == 1)
            {
              io.emit('isAdmin', socket.username);
              console.log(socket.username + ": Admin has connected");
            }
          }
          i++;
        }
        if (found)
        {
          io.emit('authGood', socket.username);
          users.push(socket.username);

          sqlConnection.query('SELECT * FROM messages', function(err, rows, fields)
          {
            for (var i = 0; i < rows.length; i++)
            {
              io.emit('previousTime_Stamp', rows[i].time_stamp);
              io.emit('previousUsername', rows[i].username);
              io.emit('previousMessageID', rows[i].id);
              io.emit('previousMessage', rows[i].message);
            }
          });
          updateUsernames();
        }
        else
        {
          io.emit('authBad', socket.username);
        }
      }
      else
      {
        io.emit('authBad', socket.username);
      }
    });
  });

  //Adding New User to the SQL Database
  socket.on('newUsername', function(data)
  {
    var newUsername = data;
    socket.on('newPassword', function(data)
    {
      var newPassword = data;
      if (newUsername.length >= 4 && newPassword.length >= 4)
      {
        var sql = "INSERT INTO `users` (`username`, `password`) VALUES ('" + newUsername + "', '" + newPassword + "')"; //Variables do not pass through
        sqlConnection.query(sql);
        socket.emit("newUserGood", newUsername);
        newUsername = "";
        newPassword = "";
      }
      else //if (newUsername.length == 0 || newPassword.length == 0)
      {
        socket.emit("newUserError", newUsername);
        newUsername = "";
        newPassword = "";
        console.log("log");
      }
    });
  });

  //Delets message from table
  socket.on('deleteMessage', function(data){
    var sql = "DELETE FROM `messages` WHERE `messages`.`id` = "+ data +"";
    sqlConnection.query(sql);
  });

  //Updates user status
  socket.on('updateUserStatus', function(data){
    var sql = "UPDATE `users` SET `status` = '"+ data.status +"' WHERE `users`.`username` = '"+ data.username +"'";
    sqlConnection.query(sql);
  });
  //Updating Users Array
  function updateUsernames()
  {
    io.emit('get users', users);
  }
});
