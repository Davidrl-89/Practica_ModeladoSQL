select keepcoches.grupoempresarial."nombre_grupo" as "Grupo empresarial",
	keepcoches.marca."idmarca" as "Marca",
	keepcoches.modelo."idmodelo" as "Modelo",
	keepcoches.color."idcolor" as "Color",
	keepcoches.coche.numero_km,
	keepcoches.empresa_aseguradora."idcompania_aseguradora" as "Aseguradora",
	keepcoches.poliza_coche."idpoliza" as "Nº de poliza",
	keepcoches.coche.fecha_compra,
	keepcoches.coche.matricula 
	
from keepcoches.coche 
inner join keepcoches.modelo 
		on keepcoches.modelo.idmodelo = keepcoches.coche.idmodelo 
inner join keepcoches.marca 
		on keepcoches.modelo.idmarca = keepcoches.marca.idmarca 
inner join keepcoches.grupoempresarial 
		on keepcoches.grupoempresarial.idgrupo_empresarial = keepcoches.marca.idgrupo_empresarial 
inner join keepcoches.color
		on keepcoches.color.idcolor = keepcoches.coche.idcolor 
inner join keepcoches.poliza_coche 
		on keepcoches.coche.poliza = keepcoches.poliza_coche.idpoliza 
inner join keepcoches.empresa_aseguradora 
		on keepcoches.poliza_coche.idcompania_aseguradora = keepcoches.empresa_aseguradora.idcompania_aseguradora 
where keepcoches.coche.fecha_baja is null;
		