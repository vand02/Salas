<?php
header("Access-Control-Allow-Origin: *");
include "db.php";
$data=array();
$q=mysqli_query($con,"SELECT fecha, hora, informacion, seccion_id, nombre FROM (informacion LEFT JOIN asignatura ON informacion.asignatura_id=asignatura.id) order  by  informacion.id DESC
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