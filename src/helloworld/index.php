<?php
require __DIR__ . '/vendor/autoload.php';

Flight::route('/', function () {
    
    echo "Test";

});

Flight::route('/kooi', function () {
    try {

    $dotenv = Dotenv\Dotenv::create('/var/www/html/');
    $dotenv->load();
    
    echo "Koois";

    $serverName = getenv('MYSQL_SERVER');
    $userName = getenv('MYSQL_USER');
    $password = getenv('MYSQL_PASSWORD');
    $dbName = getenv('MYSQL_DATABASE');
    
    
    $db = new MysqliDb ($serverName, $userName, $password, $dbName);
    $details = $db->getOne('users');
    echo"<pre>";print_r($details);
    #echo"<pre>";print_r($db);
    echo $userName.'-'.$password.'-'.$serverName.'-'.$dbName;
    } catch(Exception $e){
	    echo $e->getMessage();
    }

});

Flight::start();
