-------------- Práctica de SQL de David Robles López -------------                                                                                                  
                                                                                                                                                                    
-- Creamos el esquema                                                                                                                                               
create schema keepcoches authorization mlxsqopt;                                                                                                                    
                                                                                                                                                                    
-- Creamos tabla coche                                                                                                                                              
                                                                                                                                                                    
create table keepcoches.coche(                                                                                                                                      
	idcoche varchar(20) not null, 	--PK                                                                                                                            
	idmodelo varchar(20) not null,  --FK                                                                                                                            
	idcolor varchar(20) not null,   --FK                                                                                                                            
	matricula varchar(20) not null,                                                                                                                                 
	numero_km varchar(20) not null,                                                                                                                                 
	fecha_compra date not null,                                                                                                                                     
	fecha_baja date null,                                                                                                                                           
	poliza varchar(20) not null     --FK                                                                                                                            
);                                                                                                                                                                  
                                                                                                                                                                    
alter table keepcoches.coche                                                                                                                                        
add constraint coche_PK primary key(idcoche);                                                                                                                       
                                                                                                                                                                    
                                                                                                                                                                    
--Creamos tabla modelo                                                                                                                                              
create table keepcoches.modelo(                                                                                                                                     
	idmodelo varchar(20) not null, ---PK                                                                                                                            
	idmarca varchar(20) not null, -- FK (marca)                                                                                                                     
	nombre_modelo varchar(200) not null                                                                                                                             
);                                                                                                                                                                  
                                                                                                                                                                    
                                                                                                                                                                    
alter table keepcoches.modelo                                                                                                                                       
add constraint modelo_PK primary key(idmodelo);                                                                                                                     
                                                                                                                                                                    
--Creamos tabla color                                                                                                                                               
create table keepcoches.color(                                                                                                                                      
	idcolor varchar(20) not null, --PK                                                                                                                              
	nombre_color varchar(200) not null                                                                                                                              
);                                                                                                                                                                  
                                                                                                                                                                    
alter table keepcoches.color                                                                                                                                        
add constraint color_PK primary key(idcolor);                                                                                                                       
                                                                                                                                                                    
                                                                                                                                                                    
--Creamos tabla marca                                                                                                                                               
create table keepcoches.marca(                                                                                                                                      
	idmarca varchar(20) not null, --PK                                                                                                                              
	idgrupo_empresarial varchar(20) not null, --FK(idgrupo_empresarial)                                                                                             
	nombre_marca varchar(200) not null                                                                                                                              
);                                                                                                                                                                  
                                                                                                                                                                    
alter table keepcoches.marca                                                                                                                                        
add constraint marca_PK primary key(idmarca);                                                                                                                       
                                                                                                                                                                    
--Creamos tabla grupo empresarial                                                                                                                                   
create table keepcoches.grupoEmpresarial(                                                                                                                           
	idgrupo_empresarial varchar(20) not null, --PK                                                                                                                  
	nombre_grupo varchar(200) not null                                                                                                                              
);                                                                                                                                                                  
                                                                                                                                                                    
                                                                                                                                                                    
alter table keepcoches.grupoEmpresarial                                                                                                                             
add constraint grupoEmpresarial_PK primary key(idgrupo_empresarial);                                                                                                
                                                                                                                                                                    
                                                                                                                                                                    
--Creamos tabla revisiones                                                                                                                                          
create table keepcoches.revisiones(                                                                                                                                 
	idrevisiones varchar(20) not null, --PK                                                                                                                         
	idcoche varchar(20) not null, 	   --FK(idcoche)                                                                                                                
	fecha_revision date not null,                                                                                                                                   
	km varchar(20) not null,                                                                                                                                        
	importe numeric(12,5) not null,                                                                                                                                 
	moneda varchar(20) not null --FK(idmoneda)                                                                                                                      
);                                                                                                                                                                  
                                                                                                                                                                    
alter table keepcoches.revisiones                                                                                                                                   
add constraint revisiones_PK primary key(idrevisiones);                                                                                                             
                                                                                                                                                                    
                                                                                                                                                                    
--Creamos tabla moneda                                                                                                                                              
create table keepcoches.moneda(                                                                                                                                     
	idmoneda varchar(20) not null, --PK                                                                                                                             
	nombre_moneda varchar(200) null                                                                                                                                 
);                                                                                                                                                                  
                                                                                                                                                                    
alter table keepcoches.moneda                                                                                                                                       
add constraint moneda_PK primary key(idmoneda);                                                                                                                     
                                                                                                                                                                    
                                                                                                                                                                    
                                                                                                                                                                    
--Creamos tabla poliza coche                                                                                                                                        
create table keepcoches.poliza_coche(                                                                                                                               
	idpoliza varchar(20) not null, --PK                                                                                                                             
	idcompania_aseguradora varchar(200) not null, --FK(empresa_aseguradora)                                                                                         
	numero_poliza varchar(20) not null                                                                                                                              
);                                                                                                                                                                  
                                                                                                                                                                    
alter table keepcoches.poliza_coche                                                                                                                                 
add constraint poliza_coche_PK primary key(idpoliza);                                                                                                               
                                                                                                                                                                    
                                                                                                                                                                    
--Creamos tabla empresa aseguradora                                                                                                                                 
create table keepcoches.empresa_aseguradora(                                                                                                                        
	idcompania_aseguradora varchar(20) not null, --PK                                                                                                               
	compania_aseguradora varchar(200) null                                                                                                                          
);                                                                                                                                                                  
                                                                                                                                                                    
alter table keepcoches.empresa_aseguradora                                                                                                                          
add constraint empresa_aseguradora_PK primary key(idcompania_aseguradora);                                                                                          
                                                                                                                                                                    
                                                                                                                                                                    
                                                                                                                                                                    
-------------------------------------------                                                                                                                         
--FK                                                                                                                                                                
                                                                                                                                                                    
alter table keepcoches.coche                                                                                                                                        
add constraint coche_modelo_FK foreign key(idmodelo)                                                                                                                
references keepcoches.modelo(idmodelo);                                                                                                                             
                                                                                                                                                                    
alter table keepcoches.coche                                                                                                                                        
add constraint coche_color_FK foreign key(idcolor)                                                                                                                  
references keepcoches.color(idcolor);                                                                                                                               
                                                                                                                                                                    
alter table keepcoches.coche                                                                                                                                        
add constraint coche_poliza_FK foreign key(poliza)                                                                                                                  
references keepcoches.poliza_coche(idpoliza);                                                                                                                       
                                                                                                                                                                    
                                                                                                                                                                    
alter table keepcoches.poliza_coche                                                                                                                                 
add constraint poliza_coche_empresa_aseguradora_FK foreign key(idcompania_aseguradora)                                                                              
references keepcoches.empresa_aseguradora(idcompania_aseguradora);                                                                                                  
                                                                                                                                                                    
alter table keepcoches.modelo                                                                                                                                       
add constraint modelo_marca_FK foreign key(idmarca)                                                                                                                 
references keepcoches.marca(idmarca);                                                                                                                               
                                                                                                                                                                    
alter table keepcoches.marca                                                                                                                                        
add constraint marca_grupoEmpresarial_FK foreign key(idgrupo_empresarial)                                                                                           
references keepcoches.grupoEmpresarial(idgrupo_empresarial);                                                                                                        
                                                                                                                                                                    
alter table keepcoches.revisiones                                                                                                                                   
add constraint revisiones_coche_FK foreign key(idcoche)                                                                                                             
references keepcoches.coche(idcoche);                                                                                                                               
                                                                                                                                                                    
alter table keepcoches.revisiones                                                                                                                                   
add constraint revisiones_moneda_FK foreign key(moneda)                                                                                                             
references keepcoches.moneda(idmoneda);                                                                                                                             
                                                                                                                                                                    
                                                                                                                                                                    
----Insertamos los datos                                                                                                                                            
                                                                                                                                                                    
--Color                                                                                                                                                             
                                                                                                                                                                    
insert into keepcoches.color                                                                                                                                        
(idcolor, nombre_color)                                                                                                                                             
values ('001', 'Azul');                                                                                                                                             
                                                                                                                                                                    
insert into keepcoches.color                                                                                                                                        
(idcolor, nombre_color)                                                                                                                                             
values ('002', 'Rojo');                                                                                                                                             
                                                                                                                                                                    
insert into keepcoches.color                                                                                                                                        
(idcolor, nombre_color)                                                                                                                                             
values ('003', 'Verde');                                                                                                                                            
                                                                                                                                                                    
insert into keepcoches.color                                                                                                                                        
(idcolor, nombre_color)                                                                                                                                             
values ('004', 'Plata');                                                                                                                                            
                                                                                                                                                                    
insert into keepcoches.color                                                                                                                                        
(idcolor, nombre_color)                                                                                                                                             
values ('005', 'Blanco');                                                                                                                                           
                                                                                                                                                                    
                                                                                                                                                                    
insert into keepcoches.color                                                                                                                                        
(idcolor, nombre_color)                                                                                                                                             
values ('006', 'Negro');                                                                                                                                            
                                                                                                                                                                    
                                                                                                                                                                    
                                                                                                                                                                    
-- Grupo empresarial                                                                                                                                                
                                                                                                                                                                    
insert into keepcoches.grupoempresarial                                                                                                                             
(idgrupo_empresarial, nombre_grupo )                                                                                                                                
values ('001', 'BMW Group');                                                                                                                                        
                                                                                                                                                                    
insert into keepcoches.grupoempresarial                                                                                                                             
(idgrupo_empresarial, nombre_grupo )                                                                                                                                
values ('002', 'Volkswagen');                                                                                                                                       
                                                                                                                                                                    
insert into keepcoches.grupoempresarial                                                                                                                             
(idgrupo_empresarial, nombre_grupo )                                                                                                                                
values ('003', 'Renault Nissan');                                                                                                                                   
                                                                                                                                                                    
insert into keepcoches.grupoempresarial                                                                                                                             
(idgrupo_empresarial, nombre_grupo )                                                                                                                                
values ('004', 'Honda');                                                                                                                                            
                                                                                                                                                                    
insert into keepcoches.grupoempresarial                                                                                                                             
(idgrupo_empresarial, nombre_grupo )                                                                                                                                
values ('005', 'PSA');                                                                                                                                              
                                                                                                                                                                    
                                                                                                                                                                    
--Marca                                                                                                                                                             
                                                                                                                                                                    
insert into keepcoches.marca                                                                                                                                        
(idmarca, idgrupo_empresarial,nombre_marca )                                                                                                                        
values ('001', '001', 'BMW');                                                                                                                                       
                                                                                                                                                                    
insert into keepcoches.marca                                                                                                                                        
(idmarca, idgrupo_empresarial,nombre_marca )                                                                                                                        
values ('002', '001', 'Mini');                                                                                                                                      
                                                                                                                                                                    
insert into keepcoches.marca                                                                                                                                        
(idmarca, idgrupo_empresarial,nombre_marca )                                                                                                                        
values ('003', '002', 'Audi');                                                                                                                                      
                                                                                                                                                                    
insert into keepcoches.marca                                                                                                                                        
(idmarca, idgrupo_empresarial,nombre_marca )                                                                                                                        
values ('004', '002', 'Seat');                                                                                                                                      
                                                                                                                                                                    
insert into keepcoches.marca                                                                                                                                        
(idmarca, idgrupo_empresarial,nombre_marca )                                                                                                                        
values ('005', '003', 'Renault');                                                                                                                                   
                                                                                                                                                                    
insert into keepcoches.marca                                                                                                                                        
(idmarca, idgrupo_empresarial,nombre_marca )                                                                                                                        
values ('006', '003', 'Nissan');                                                                                                                                    
                                                                                                                                                                    
insert into keepcoches.marca                                                                                                                                        
(idmarca, idgrupo_empresarial,nombre_marca )                                                                                                                        
values ('007', '004', 'Honda');                                                                                                                                     
                                                                                                                                                                    
insert into keepcoches.marca                                                                                                                                        
(idmarca, idgrupo_empresarial,nombre_marca )                                                                                                                        
values ('008', '005', 'Citroen');                                                                                                                                   
                                                                                                                                                                    
insert into keepcoches.marca                                                                                                                                        
(idmarca, idgrupo_empresarial,nombre_marca )                                                                                                                        
values ('009', '005', 'Opel');                                                                                                                                      
                                                                                                                                                                    
                                                                                                                                                                    
                                                                                                                                                                    
--Modelo                                                                                                                                                            
                                                                                                                                                                    
insert into keepcoches.modelo                                                                                                                                       
(idmodelo, idmarca, nombre_modelo)                                                                                                                                  
values('001', '001','320');                                                                                                                                         
                                                                                                                                                                    
insert into keepcoches.modelo                                                                                                                                       
(idmodelo, idmarca, nombre_modelo)                                                                                                                                  
values('002', '001','Cooper');                                                                                                                                      
                                                                                                                                                                    
insert into keepcoches.modelo                                                                                                                                       
(idmodelo, idmarca, nombre_modelo)                                                                                                                                  
values('003', '002','A5');                                                                                                                                          
                                                                                                                                                                    
insert into keepcoches.modelo                                                                                                                                       
(idmodelo, idmarca, nombre_modelo)                                                                                                                                  
values('004', '002','Leon');                                                                                                                                        
                                                                                                                                                                    
insert into keepcoches.modelo                                                                                                                                       
(idmodelo, idmarca, nombre_modelo)                                                                                                                                  
values('005', '003','Megane');                                                                                                                                      
                                                                                                                                                                    
insert into keepcoches.modelo                                                                                                                                       
(idmodelo, idmarca, nombre_modelo)                                                                                                                                  
values('006', '003','Juke');                                                                                                                                        
                                                                                                                                                                    
insert into keepcoches.modelo                                                                                                                                       
(idmodelo, idmarca, nombre_modelo)                                                                                                                                  
values('007', '004','Civic');                                                                                                                                       
                                                                                                                                                                    
insert into keepcoches.modelo                                                                                                                                       
(idmodelo, idmarca, nombre_modelo)                                                                                                                                  
values('008', '005','C4');                                                                                                                                          
                                                                                                                                                                    
insert into keepcoches.modelo                                                                                                                                       
(idmodelo, idmarca, nombre_modelo)                                                                                                                                  
values('009', '005','Astra');                                                                                                                                       
                                                                                                                                                                    
insert into keepcoches.modelo                                                                                                                                       
(idmodelo, idmarca, nombre_modelo)                                                                                                                                  
values('010', '003', 'A4');                                                                                                                                         
                                                                                                                                                                    
                                                                                                                                                                    
                                                                                                                                                                    
--Moneda                                                                                                                                                            
                                                                                                                                                                    
insert into keepcoches.moneda                                                                                                                                       
(idmoneda, nombre_moneda)                                                                                                                                           
values('EUR', 'Euro');                                                                                                                                              
                                                                                                                                                                    
insert into keepcoches.moneda                                                                                                                                       
(idmoneda, nombre_moneda)                                                                                                                                           
values('USD', 'Dollar');                                                                                                                                            
                                                                                                                                                                    
                                                                                                                                                                    
--Empresa Aseguradora                                                                                                                                               
insert into keepcoches.empresa_aseguradora                                                                                                                          
(idcompania_aseguradora, compania_aseguradora )                                                                                                                     
values('001', 'MAPFRE');                                                                                                                                            
                                                                                                                                                                    
insert into keepcoches.empresa_aseguradora                                                                                                                          
(idcompania_aseguradora, compania_aseguradora )                                                                                                                     
values('002', 'AXA');                                                                                                                                               
                                                                                                                                                                    
insert into keepcoches.empresa_aseguradora                                                                                                                          
(idcompania_aseguradora, compania_aseguradora )                                                                                                                     
values('003', 'ALLIANZ');                                                                                                                                           
                                                                                                                                                                    
insert into keepcoches.empresa_aseguradora                                                                                                                          
(idcompania_aseguradora, compania_aseguradora )                                                                                                                     
values('004', 'GENERALI');                                                                                                                                          
                                                                                                                                                                    
                                                                                                                                                                    
                                                                                                                                                                    
--Poliza coche                                                                                                                                                      
                                                                                                                                                                    
insert  into keepcoches.poliza_coche                                                                                                                                
(idpoliza, idcompania_aseguradora, numero_poliza)                                                                                                                   
values('001', '001', '45896522' );                                                                                                                                  
                                                                                                                                                                    
insert into keepcoches.poliza_coche                                                                                                                                 
(idpoliza,  idcompania_aseguradora, numero_poliza)                                                                                                                  
values('002', '003', '4889312' );                                                                                                                                   
                                                                                                                                                                    
insert into keepcoches.poliza_coche                                                                                                                                 
(idpoliza, idcompania_aseguradora , numero_poliza)                                                                                                                  
values('003', '004', '5597452' );                                                                                                                                   
                                                                                                                                                                    
insert into keepcoches.poliza_coche                                                                                                                                 
(idpoliza,  idcompania_aseguradora, numero_poliza)                                                                                                                  
values('004', '002', '478913213' );                                                                                                                                 
                                                                                                                                                                    
insert into keepcoches.poliza_coche                                                                                                                                 
(idpoliza, idcompania_aseguradora , numero_poliza)                                                                                                                  
values('005', '001', '4548905' );                                                                                                                                   
                                                                                                                                                                    
insert into keepcoches.poliza_coche                                                                                                                                 
(idpoliza, idcompania_aseguradora , numero_poliza)                                                                                                                  
values('006', '001', '4548905' );                                                                                                                                   
                                                                                                                                                                    
insert into keepcoches.poliza_coche                                                                                                                                 
(idpoliza, idcompania_aseguradora , numero_poliza)                                                                                                                  
values('007', '001', '4548905' );                                                                                                                                   
                                                                                                                                                                    
insert into keepcoches.poliza_coche                                                                                                                                 
(idpoliza,  idcompania_aseguradora , numero_poliza)                                                                                                                 
values('008', '001', '4548905' );                                                                                                                                   
                                                                                                                                                                    
                                                                                                                                                                    
--Coches                                                                                                                                                            
                                                                                                                                                                    
insert into keepcoches.coche                                                                                                                                        
(idcoche, idmodelo, idcolor, matricula, numero_km,  fecha_compra, poliza)                                                                                           
values('001', '001', '002', '8855BXW', 12000,  '2022-07-12', '003');                                                                                                
                                                                                                                                                                    
insert into keepcoches.coche                                                                                                                                        
(idcoche, idmodelo, idcolor, matricula, numero_km,  fecha_compra, poliza)                                                                                           
values('002', '002', '004', '1453FRS', 1754210,  '2021-10-25', '002');                                                                                              
                                                                                                                                                                    
insert into keepcoches.coche                                                                                                                                        
(idcoche, idmodelo, idcolor, matricula, numero_km,  fecha_compra, poliza)                                                                                           
values('003', '003', '006', '9840CBN', 1850,  '2022-01-19', '001');                                                                                                 
                                                                                                                                                                    
insert into keepcoches.coche                                                                                                                                        
(idcoche, idmodelo, idcolor, matricula, numero_km,  fecha_compra, poliza)                                                                                           
values('004', '004', '001', '3256LTC', 896320,  '2012-07-12', '004');                                                                                               
                                                                                                                                                                    
insert into keepcoches.coche                                                                                                                                        
(idcoche, idmodelo, idcolor, matricula, numero_km,  fecha_compra, poliza, fecha_baja)                                                                               
values('005', '005', '002', '2556GHJ', 1985000,  '2018-05-01', '001','2021-04-12' );                                                                                
                                                                                                                                                                    
insert into keepcoches.coche                                                                                                                                        
(idcoche, idmodelo, idcolor, matricula, numero_km,  fecha_compra, poliza)                                                                                           
values('006', '006', '005', '3256LTC', 896320,  '2012-07-12', '003');                                                                                               
                                                                                                                                                                    
insert into keepcoches.coche                                                                                                                                        
(idcoche, idmodelo, idcolor, matricula, numero_km,  fecha_compra, poliza)                                                                                           
values('007', '007', '002', '7770FXW', 116000,  '2021-12-12', '001');                                                                                               
                                                                                                                                                                    
insert into keepcoches.coche                                                                                                                                        
(idcoche, idmodelo, idcolor, matricula, numero_km,  fecha_compra, poliza, fecha_baja)                                                                               
values('008', '008', '001', '4589LKJ', 450,  '2023-01-05', '001','2023-02-12' );                                                                                    
                                                                                                                                                                    
insert into keepcoches.coche                                                                                                                                        
(idcoche, idmodelo, idcolor, matricula, numero_km,  fecha_compra, poliza, fecha_baja)                                                                               
values('009', '009', '003', '8942DCV', 250800,   '2019-03-31', '001', '2022-12-11');                                                                                
                                                                                                                                                                    
                                                                                                                                                                    
--Revisiones                                                                                                                                                        
                                                                                                                                                                    
insert into keepcoches.revisiones                                                                                                                                   
(idrevisiones, idcoche, fecha_revision, km, importe, moneda)                                                                                                        
values('001','001', '2023-01-12', 1000, 500, 'EUR');                                                                                                                
                                                                                                                                                                    
insert into keepcoches.revisiones                                                                                                                                   
(idrevisiones, idcoche, fecha_revision, km, importe, moneda)                                                                                                        
values('002','002', '2022-06-25',  200500, 125 ,'USD');                                                                                                             
                                                                                                                                                                    
                                                                                                                                                                    
insert into keepcoches.revisiones                                                                                                                                   
(idrevisiones, idcoche, fecha_revision, km, importe, moneda)                                                                                                        
values('003','003', '2022-09-12', 4000, 200, 'EUR');                                                                                                                
                                                                                                                                                                    
insert into keepcoches.revisiones                                                                                                                                   
(idrevisiones, idcoche, fecha_revision, km, importe, moneda)                                                                                                        
values('004','004', '2016-01-12', 100000, 245, 'EUR');                                                                                                              
                                                                                                                                                                    
insert into keepcoches.revisiones                                                                                                                                   
(idrevisiones, idcoche, fecha_revision, km, importe, moneda)                                                                                                        
values('005','004', '2018-05-12', 120000, 45, 'EUR');                                                                                                               
                                                                                                                                                                    
insert into keepcoches.revisiones                                                                                                                                   
(idrevisiones, idcoche, fecha_revision, km, importe, moneda)                                                                                                        
values('006','005', '2019-07-03', 220000, 545, 'USD');                                                                                                              
                                                                                                                                                                    
insert into keepcoches.revisiones                                                                                                                                   
(idrevisiones, idcoche, fecha_revision, km, importe, moneda)                                                                                                        
values('007','005', '2022-10-29', 290000, 125, 'EUR');                                                                                                              
                                                                                                                                                                    
                                                                                                                                                                    
insert into keepcoches.revisiones                                                                                                                                   
(idrevisiones, idcoche, fecha_revision, km, importe, moneda)                                                                                                        
values('008','006', '2015-05-12', 100000, 245, 'EUR');                                                                                                              
                                                                                                                                                                    
insert into keepcoches.revisiones                                                                                                                                   
(idrevisiones, idcoche, fecha_revision, km, importe, moneda)                                                                                                        
values('009','007', '2022-05-12', 120000, 345, 'USD');                                                                                                              
                                                                                                                                                                    
insert into keepcoches.revisiones                                                                                                                                   
(idrevisiones, idcoche, fecha_revision, km, importe, moneda)                                                                                                        
values('010','008', '2023-02-12', 540, 45, 'EUR');                                                                                                                  
                                                                                                                                                                    
insert into keepcoches.revisiones                                                                                                                                   
(idrevisiones, idcoche, fecha_revision, km, importe, moneda)                                                                                                        
values('011','009', '2020-08-14', 270000, 4565, 'EUR');                                                                                                             
                                                                                                                                                                    
insert into keepcoches.revisiones                                                                                                                                   
(idrevisiones, idcoche, fecha_revision, km, importe, moneda)                                                                                                        
values('012','006', '2018-05-12', 120000, 445, 'EUR');      



                                                                                                                                                                    
-- Fin Scripts ---                                                                                                                                                  