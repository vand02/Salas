<div  style="width:120px;">
	<table border="0" cellpadding="0" cellspacing="0" style="width:120px;height:400px">
		<tr>
			<td valign="top">
				<div class="accordion" >
						<h3>Modulos Principales</h3>
						<div id="menu">
							
							<?php if($permiso=="all"){?>
							<p><a href="#" c="index.php?/usuario_controller/cargaModulo">Usuario</a></p>
							<p><a href="#" c="index.php?/carrera_controller/cargaModulo">Carrera</a></p>
							<p><a href="#" c="index.php?/profesor_controller/cargaModulo">Profesor</a></p>
							<p><a href="#" c="index.php?/asignatura_controller/cargaModulo">Asignatura</a></p>
							<p><a href="#" c="index.php?/seccion_controller/cargaModulo">Seccion</a></p>
							<?php } ?>
							<p><a href="#" c="index.php?/informacion_controller/cargaModulo">Informacion</a></p>
							<p><a href="#" c="index.php?/horario_controller/cargaModulo">Horario</a></p>
							<p><a href="#" c="index.php?/suspender_controller/cargaModulo">Suspender</a></p>
						</div>
						
						
				</div>
				<!-- FIN MENU CASCADA -->
			</td>
		</tr>
	</table>
</div>

