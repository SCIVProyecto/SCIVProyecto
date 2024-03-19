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