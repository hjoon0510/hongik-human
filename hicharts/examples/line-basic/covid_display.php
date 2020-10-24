<?php
$mysql_host = 'localhost';
$mysql_user = 'root';
$mysql_pass = 'raspberry';
$mysql_db   = 'sbdb';

// MySQL 데이터베이스에 접속한다. 
$db_conn = mysqli_connect($mysql_host, $mysql_user, $mysql_pass, $mysql_db);

// charset 설정
mysqli_query($db_conn, "set names utf8");

// ###################################매탄공원-내등록일을 기준으로 하여 내림차순으로 정보를 추출한다. 
$query="SELECT * FROM `covid_sd` WHERE site='매탄공원' AND location='공연장' ORDER BY time DESC limit 12 ";
echo "<br>";
echo "[DEBUG] MySQL Query:<br>";
echo "<font color=red>$query</font>";
echo "<br>";

$stmt = mysqli_prepare($db_conn, $query);
$exec = mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

$str_time="";
$str_violator_mt="";
while ($row = mysqli_fetch_assoc($result)) {
  echo("[DEBUG] ".$row['time'].": ".$row['violation']."<br>");
  $str_time .="'".$row['time']."',";
  $str_violator_mt .="".$row['violation'].",";
}


$result = mysqli_query($db_conn, $query);

// ###################################매여울공원-내등록일을 기준으로 하여 내림차순으로 정보를 추출한다. 
$query="SELECT * FROM `covid_sd` WHERE site='매여울공원'  ORDER BY time DESC limit 12 ";
echo "<br>";
echo "[DEBUG] MySQL Query:<br>";
echo "<font color=red>$query</font>";
echo "<br>";

$stmt = mysqli_prepare($db_conn, $query);
$exec = mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

$str_time="";
$str_violator_myy="";
while ($row = mysqli_fetch_assoc($result)) {
  echo("[DEBUG] ".$row['time'].": ".$row['violation']."<br>");
  $str_time .="'".$row['time']."',";
  $str_violator_myy .="".$row['violation'].",";
}


$result = mysqli_query($db_conn, $query);


// ###################################영통공원-내등록일을 기준으로 하여 내림차순으로 정보를 추출한다. 
$query="SELECT * FROM `covid_sd` WHERE site='영통공원'  ORDER BY time DESC limit 12 ";
echo "<br>";
echo "[DEBUG] MySQL Query:<br>";
echo "<font color=red>$query</font>";
echo "<br>";

$stmt = mysqli_prepare($db_conn, $query);
$exec = mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

$str_time="";
$str_violator_yt="";
while ($row = mysqli_fetch_assoc($result)) {
  echo("[DEBUG] ".$row['time'].": ".$row['violation']."<br>");
  $str_time .="'".$row['time']."',";
  $str_violator_yt .="".$row['violation'].",";
}


$result = mysqli_query($db_conn, $query);

mysqli_close($db_conn);

?> 

<!DOCTYPE HTML>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Highcharts Example</title>

		<style type="text/css">
#container {
	min-width: 310px;
	max-width: 800px;
	height: 400px;
	margin: 0 auto
}
		</style>
	</head>
	<body>
<script src="../../code/highcharts.js"></script>
<script src="../../code/modules/series-label.js"></script>
<script src="../../code/modules/exporting.js"></script>
<script src="../../code/modules/export-data.js"></script>

<div id="container"></div>



		<script type="text/javascript">
Highcharts.chart('container', {

    title: {
        text: 'Social Distancing violation'
    },

    subtitle: {
    text: 'Developer: Hyunjoon Lim, Junho Won'
    },

    xAxis: {
        categories: [<?php echo $str_time ?>]
    },
    yAxis: {
        title: {
            text: 'The number of violater'
        }
    },

    plotOptions: {
        line: {
            dataLabels: {
	    enabled: true
            },
	    enableMouseTracking: false
        }
    },

    series: [{
        name: '매탄공원-공연장',
	data: [<?php echo $str_violator_mt ?>]
    }, {
        name: '매여울공원',
	data: [<?php echo $str_violator_myy ?>]
    }, {
        name: '영통공원',
        data: [<?php echo $str_violator_yt ?>]
    }],

    responsive: {
        rules: [{
            condition: {
                maxWidth: 500
            },
            chartOptions: {
                legend: {
                    layout: 'horizontal',
                    align: 'center',
                    verticalAlign: 'bottom'
                }
            }
        }]
    }

});
		</script>
	</body>
</html>
