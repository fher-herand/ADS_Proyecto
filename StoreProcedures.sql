
create Procedure getActividades2
as
Select a.id_actividad,a.titulo,a.descripcion,a.fh_publicacion,a.valor,a.fh_entrega,t.nombre as "tipoActividad",c.nombre as "carrera",ng.nombre as "Grado"
from Actividad a, tipoactividad t, grado_materia as gm, grado as g, materia as m, maestro as ma, carrera as c, numerogrado AS ng
where a.tipoactividad_id=t.id_tipo AND a.gradomateria_id=gm.id_gradomateria AND gm.materia_id =m.id_materia AND gm.Maestro_Registro=ma.registro AND gm.grado_id=g.id_grado and g.carrera_id=c.id_carrera AND g.numerogrado_id=ng.id_numerogrado
order by a.id_actividad desc



create procedure CrearActividad(@titulo varchar(70),@descripcion varchar(150),@publicacion datetime, @valor float, @entrega datetime, @tipoActividad integer, @grado integer)
as 
insert into actividad values(@titulo,@descripcion,@publicacion,@valor,@entrega,@tipoActividad,@grado)
insert into publicacion (titulo,fh_publicacion,referencia_actividad,id_gradoMateria,tipo) select top 1 @titulo,@publicacion, id_actividad,@grado,1 from Actividad order by id_actividad desc



Create procedure eliminarActividad(@actividad integer)
as
delete from actividad where id_actividad=@actividad;
delete from publicacion where referencia_actividad=@actividad;


Create Procedure calificarTarea(@entrega integer, @nota float,@alumno integer,@actividad integer,@nombreTarea varchar(70))
as
update entrega
set nota=@nota
where id_entrega=@entrega;
insert into notificacion values('Te han calificado '+@nombreTarea,'Tu nota obtenida es '+@nota,GETDATE(),@alumno,@actividad)


	
Create Procedure InsertarMaestro(@nombre varchar(70),@telefono integer,@direccion varchar(150),@email varchar(45),@fecha_nac date,@pass varchar(20),@dpi bigint)
as 
Insert into Maestro values(@nombre,@telefono,@direccion,@email,@fecha_nac,@pass,@dpi);



Create Procedure InsertarAlumno(@nombre varchar(70),@telefono integer,@telefonoTutor integer,@direccion varchar(150),@email varchar(45),@fecha_nac date,@pass varchar(20),@part varchar(45))
as 
Insert into Alumno values(@nombre,@telefono,@telefonoTutor,@direccion,@email,@fecha_nac,@part,@pass,NULL);



Create Procedure crearMateria(@nombre varchar(70))
as
insert into Materia values (@nombre)



Create Procedure crearCarrera(@nombre varchar(70))
as
insert into carrera values (@nombre)




Create Procedure eliminarMaestro(@registro integer)
as
Delete from maestro
where registro=@registro



Create Procedure eliminarAlumno(@carnet integer)
as
Delete from alumno
where carnet=@carnet


Create Procedure getCarreras
as
Select * from carrera

