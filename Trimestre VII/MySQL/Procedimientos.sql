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