/*VISTAS*/

 CREATE VIEW vista_producto AS SELECT e.producto_id, e.producto_nombre AS producto_nombre, d.categoria_id FROM producto e JOIN categoria d ON
 e.categoria_id = d.categoria_id;
 select producto_nombre,categoria_id from vista_producto;
 drop view if exists vista_productos; 
 
 
  CREATE VIEW vista_usuario AS SELECT e.usuario_id, e.usuario_nombre AS usuario_nombre, d.producto_id FROM usuario e JOIN producto d ON
 producto_id = d.producto_id;
 select usuario_nombre,producto_id from vista_usuario;
 drop view if exists vista_usuario; 


 CREATE VIEW vista_categoria AS SELECT e.categoria_id, e.categoria_nombre AS categoria_nombre, d.usuario_id FROM categoria e JOIN usuario d ON
 usuario_id = d.usuario_id;
 select categoria_nombre,usuario_id from vista_categoria;
 drop view if exists vista_categoria; 
 
 /*TRIGGER USUARIO*/  
 
create table datos_anteriores( numero int auto_increment, nombre varchar(30),apellido varchar(30), usuario varchar(30),
 clave varchar(30), primary key (numero),email varchar(30));
 
 drop table datos_anteriores;
 
 select * from datos_anteriores;
 
 select * from usuario;
 
delimiter //
create trigger before_usuario_update before update on usuario for each row begin insert into datos_anteriores(nombre,apellido,usuario,clave,email) 
values (old.usuario_nombre,old.usuario_apellido,old.usuario_usuario, old.usuario_clave,old.usuario_email ); end //delimiter ;

update usuario set usuario_email='910154665@gmail.com' where usuario_nombre='jimmy';
 
 drop trigger if exists before_usuario_update;