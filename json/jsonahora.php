<?php
header("Access-Control-Allow-Origin: *");
include "db.php";
$data=array();
date_default_timezone_set('America/Santiago');
$hora= date('H:i');
//echo $hora;

$data=array();
$dias = array("domingo","lunes","martes","miercoles","jueves","viernes","sabado");

if($hora>"07:59" and $hora<"09:21"  ){
	$modulo = "08:00-09:20";
}
if($hora>"09:20" and $hora<"10:51"  ){
	$modulo = "09:30-10:50";
}
if($hora>"10:50" and $hora<"12:21"  ){
	$modulo = "11:00-12:20";
}
if($hora>"12:20" and $hora<"13:51"  ){
	$modulo = "12:30-13:50";
}
if($hora>"13:50" and $hora<"15:51"  ){
	$modulo = "14:30-15:50";
}
if($hora>"15:50" and $hora<"17:21"  ){
	$modulo = "16:00-17:20";
}
if($hora>"17:20" and $hora<"18:51"  ){
	$modulo = "17:30-18:50";
}
if($hora>"18:50" and $hora<"20:51"  ){
	$modulo = "19:00-20:20";
}
if($hora>"00:00" and $hora<"00:30"  ){
	$modulo = "22:00-00:30";
}


//echo $modulo;
//hora= '08:00-09:20'



$q=mysqli_query($con,"SELECT horario.id, dia, hora, sala, estado, nombre, horario.seccion_id
FROM (horario LEFT JOIN asignatura ON horario.asignatura_id=asignatura.id)
Where dia = '".$dias[date("w")]."' and hora= '".$modulo."'
");
while ($row=mysqli_fetch_object($q)){
 $data[]=$row;
}
echo json_encode($data);

if (isset($_SERVER['HTTP_ORIGIN'])) {  
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");  
    header('Access-Control-Allow-Credentials: true');  
    header('Access-Control-Max-Age: 86400');   
}  
  
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {  
  
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))  
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");  
  
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))  
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");  
}  
?>