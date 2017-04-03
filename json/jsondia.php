<?php
header("Access-Control-Allow-Origin: *");
include "db.php";
$data=array();

$dias = array("domingo","lunes","martes","miercoles","jueves","viernes","sabado");
//echo "Buenos d&iacute;as, hoy es ".$dias[date("w")];





$q=mysqli_query($con,"SELECT a.nombre, h.dia, s.id, h.sala, estado, hora
FROM asignatura a, seccion s, horario h
WHERE a.id = h.asignatura_id and dia='".$dias[date("w")]."'
AND s.asignatura_id = a.id and s.id=h.seccion_id
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