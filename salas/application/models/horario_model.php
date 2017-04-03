<?php  //if ( ! defined('BASEPATH')) exit('No direct script access allowed');

//if(!class_exists('CI_Model')) { class CI_Model extends Model {} }


class Horario_model extends CI_Model {//@

	function Horario_model(){
		parent::CI_Model();
		$this->load->model('Backend_model','bModel');
	}

	function grid($p,$o){
	
		//construct where clause 
		$where = "WHERE 1=1";
		
		//BLOQUE FILTRO //@
		if($o->id!='') $where.= " AND a.id LIKE '$o->id%' ";
		if($o->usuario_id!='') $where.= " AND a.usuario_id LIKE '$o->usuario_id%' ";
		if($o->asignatura_id!='') $where.= " AND a.asignatura_id LIKE '$o->asignatura_id%' ";
		if($o->seccion_id!='') $where.= " AND a.seccion_id LIKE '$o->seccion_id%' ";
		if($o->dia!='') $where.= " AND a.dia LIKE '$o->dia%' ";
		if($o->hora!='') $where.= " AND a.hora LIKE '$o->hora%' ";
		if($o->sala!='') $where.= " AND a.sala LIKE '$o->sala%' ";
		if($o->estado!='') $where.= " AND a.estado LIKE '$o->estado%' ";

		//FIN BLOQUE FILTRO
		
		//PAGINADOR
		$queryCount="SELECT COUNT(*) AS count FROM horario as a ".$where;//@
		$resultCount=$this->db->query($queryCount);
		foreach($resultCount->result() as $rsCount){	
			$count =$rsCount->count;
		}
		if( $count >0 ) { $total_pages = ceil($count/$p->limit); } else { $total_pages = 0; } 
		if ($p->page > $total_pages) $p->page=$total_pages; 
		$start = $p->limit*$p->page - $p->limit; 
		//@
		$queryData = "SELECT a.*,e.nombre as nombreUsuario,p.nombre as nombreAsignatura,s.nombre as nombreSeccion
		FROM horario as a,usuario as e,asignatura as p,seccion as s ".$where." 
		and e.id=a.usuario_id and p.id=a.asignatura_id and s.id=a.seccion_id ORDER BY $p->sidx $p->sord LIMIT $p->limit offset $start "; 
		
		$result = $this->db->query($queryData);
        if ($result->num_rows() > 0)
		{
			$i=0;
			foreach($result->result() as $rs){//@
				$response->rows[$i]['id']=$rs->id; 
				$usuario=" [".$rs->nombreUsuario."]";
				$asignatura=" [".$rs->nombreAsignatura."]";
				$asignatura=" [".$rs->nombreAsignatura."]";
				$seccion=" [".$rs->nombreSeccion."]";
				$response->rows[$i]['cell']=array($rs->id,$rs->usuario_id.$usuario,$rs->asignatura_id.$asignatura,$rs->seccion_id.$seccion,$rs->dia,$rs->hora,$rs->sala,$rs->estado);  
				$i++;
			}
			
		}
		$response->page = $p->page; 
		$response->total = $total_pages; 
		$response->records = $count; 

		return $response;
	}
	
	//INSERTA 1 TUPLA EN BD
	function insertar($o){
		
		
		
		//@
		$query=array(
		"id" => $o->id,
		"usuario_id" => $o->usuario_id,
		"asignatura_id" => $o->asignatura_id,
		"seccion_id" => $o->seccion_id,
		"dia" => $o->dia,
		"hora" => $o->hora,
		"sala" => $o->sala,
		"estado" => $o->estado
		);

		$result=$this->db->insert("horario",$query);//@
		
		if($result)
		return true;
		else
		return false;
	}
	
	
	//ACTUALIZA 1 TUPLA EN BD
	function editar($key,$o){
	
		
	
		//@
		$query=array(
		"id" => $o->id,
		"usuario_id" => $o->usuario_id,
		"asignatura_id" => $o->asignatura_id,
		"seccion_id" => $o->seccion_id,
		"dia" => $o->dia,
		"hora" => $o->hora,
		"sala" => $o->sala,
		"estado" => $o->estado
		);
		$this->db->where("id",$key);//@
		$result=$this->db->update("horario",$query);//@
		
		if($result)
	    return true;
	    else
	    return false;
	}
	
	//RETORNA TUPLA SOLICITADA**********************************
	function verEntidad($key){
		
		
        $query = "SELECT a.id,a.usuario_id,a.asignatura_id,a.seccion_id,a.dia,a.hora,a.sala,a.estado,
		e.nombre as nombreUsuario,p.nombre as nombreAsignatura,s.nombre as nombreSeccion
		FROM horario as a,usuario as e, asignatura as p, seccion as s
		WHERE a.id='$key' and p.id=a.asignatura_id and e.id=a.usuario_id and s.id=a.seccion_id";
		
		
		//$query = "SELECT * FROM atencion as a WHERE a.id='$key' ";
		
		
		//si no tiene fk el and no va y en el select se pone *
		$result=$this->db->query($query);
        
        foreach($result->result() as $rs)
		{
			$o=new stdClass();//@****************************************************+
			$o->id=$rs->id;
			$o->usuario_id=$rs->usuario_id;
			$o->usuario_id_aux=$rs->nombreUsuario;
			$o->asignatura_id=$rs->asignatura_id;
			$o->asignatura_id_aux=$rs->nombreAsignatura;
			$o->seccion_id=$rs->seccion_id;
			$o->seccion_id_aux=$rs->nombreSeccion;
			$o->dia=$rs->dia;
			$o->hora=$rs->hora;
			$o->sala=$rs->sala;
			$o->estado=$rs->estado;

		}
		return $o;
		
		
	}
	
	//ELIMINA 1 TUPLA EN BD
	function eliminar($key){
		
		$this->db->where("id",$key);//@
		$result=$this->db->delete("horario");//@
	
		if($result)
        return true;
        else
        return false;

	}
	
	
	

}

?>