/*PROCEDIMIENTO*/

show databases;
use inventario;

select * from usuario;
delimiter //
create procedure pro_usuario()
begin select usuario_nombre,usuario_email from usuario where usuario_id>=1; end
// delimiter ;
call pro_usuario();
drop procedure if exists pro_usuario;
/*procedimientos de usuarios nombre, email*/

select * from categoria;
delimiter $$
create procedure pro_categoria()
begin select categoria_ubicacion from categoria where categoria_id>=1; end
$$ delimiter ;
call pro_categoria();
drop procedure if exists pro_categoria;
/*procedimientos de categoria ubicacion*/

select * from producto;
delimiter $$
create procedure pro_producto()
begin select producto_precio, producto_stock from producto where producto_id>=1; end
$$ delimiter ;
call pro_producto();
drop procedure if exists pro_producto;
/*procedimientos de producto precio, stock*/


select * from sub_categoria;
delimiter $$
create procedure pro_sub_categoria()
begin select sub_categoria_nombre from sub_categoria where sub_categoria_id>=1; end
$$ delimiter ;
call pro_sub_categoria();
drop procedure if exists pro_sub_categoria;
/*procedimientos de sub_categoria nombre*/

/*FUNCIONES*/
/*funciones de producto*/
select * from producto;
drop function if exists f_producto;
   delimiter //
 create function f_producto( cantidad INT)  returns varchar(20)  
 deterministic begin declare producto_codigo varchar(20) default '';  declare x int default 0;  
while x<cantidad do set producto_codigo=concat(producto_codigo,'*');    set x=x+1;   
end while;   return producto_codigo; end // delimiter ;
select producto_id,f_producto(producto_id) from producto;


drop function if exists f_tipo_producto;
delimiter //
create function f_tipo_producto(   cantidad int)   returns varchar(20) 
deterministic begin case when cantidad<5 then return 'tráfico bajo'; 
						 when cantidad>=5 and cantidad<20 then return 'tráfico medio';
						 when cantidad>=20 then	return 'tráfico alto'; end case;  end //  delimiter ;
 select producto_nombre, f_producto(producto_id), producto_stock, f_tipo_producto(producto_id) from producto;


select * from producto;
  drop function if exists f_mayor_producto;
  delimiter // 
  create function f_mayor_producto()   returns varchar(100)   deterministic begin declare vurl varchar(100);   
select producto_codigo into vurl from producto order by producto_id desc limit 1;   return vurl; end //  delimiter ;
select f_mayor_producto();


/*funciones de usuario*/

select * from usuario;
drop function if exists f_usuario;
   delimiter //
 create function f_usuario( cantidad INT)  returns varchar(20)  
 deterministic begin declare usuario_clave varchar(20) default '';  declare x int default 0;  
while x<cantidad do set usuario_clave=concat(usuario_clave,'*');    set x=x+1;   
end while;   return usuario_clave; end // delimiter ;
select usuario_id,f_usuario(usuario_id) from usuario;


drop function if exists f_tipo_usuario;
delimiter //
create function f_tipo_usuario(   cantidad int)   returns varchar(20) 
deterministic begin case when cantidad<5 then return 'tráfico bajo'; 
						 when cantidad>=5 and cantidad<20 then return 'tráfico medio';
						 when cantidad>=20 then	return 'tráfico alto'; end case;  end //  delimiter ;
 select usuario_nombre, f_usuario(usuario_id), usuario_email, f_tipo_usuario(usuario_id) from usuario;


select * from producto;
  drop function if exists f_mayor_usuario;
  delimiter // 
  create function f_mayor_usuario()   returns varchar(100)   deterministic begin declare vurl varchar(100);   
select usuario_clave into vurl from usuario order by usuario_id desc limit 1;   return vurl; end //  delimiter ;
select f_mayor_usuario();


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


/*TRIGGER PRODUCTO*/

create table update_producto( numero int auto_increment,nombre varchar(30), codigo varchar(30),
precio varchar(30), stock varchar(30),categoria varchar(30), primary key (numero));
drop table  update_producto;
delimiter //
create trigger before_producto_update before update on producto for each row begin insert into update_producto(nombre, codigo, precio, stock, categoria) 
values (old.producto_nombre,old.producto_codigo,old.producto_precio,old.producto_stock,old.categoria_id); end //delimiter ;

update producto set producto_codigo='0987' where producto_nombre='Rubor';
drop trigger if exists  before_producto_update;

select * from update_producto;
select * from producto;

 /*TRIGGER SUB_CATEGORIA*/
 
 create table datos_sub_categoria( numero int auto_increment,nombre varchar(30), ubicacion varchar(30),
categoria varchar(30), primary key (numero));
drop table  datos_sub_categoria;

delimiter //
create trigger before_subcate_update before update on sub_categoria for each row begin insert into datos_sub_categoria(nombre, ubicacion, categoria) 
values (old.sub_categoria_nombre,old.sub_categoria_ubicacion,old.categoria_id); end //delimiter ;

drop trigger if exists  before_subcate_update;

update sub_categoria set sub_categoria_ubicacion='Categoria X' where sub_categoria_nombre='Esmalte';

select * from datos_sub_categoria;
select * from sub_categoria;


DELETE FROM sub_categoria WHERE sub_categoria_nombre='Fasial';




 