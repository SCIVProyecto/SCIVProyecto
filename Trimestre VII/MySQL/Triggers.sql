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