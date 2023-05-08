USE delincuencia;

/*VISTA PARA ID DEL CASO ATENDIDO Y SU RESOLUCIÓN*/
CREATE OR REPLACE VIEW resueltos AS
	SELECT DISTINCT Id_Atendidos, solucion
    FROM casos_atendidos c JOIN resolucion r ON (c.Id_Resolucion = r.Id_Resolucion);
    
    SELECT *FROM resueltos;
   
/*VISTA PARA MOSTRAR LA INFORMACIÓN COMPLETA ENTRE DELITOS Y TIPO DE DELITOS*/
CREATE OR REPLACE VIEW crimenes AS
	SELECT DISTINCT Id_Delitos, Descripcion, Tipo, Clasificacion
    FROM delitos d JOIN tipo_delito t ON (d.Id_Tipo_Delito = t.Id_Tipo_Delito);

SELECT *FROM crimenes;

/*VISTA PARA REPORTES CON INFORMACIÓN DE LAS TABLAS DELITOS, TIPO_DELITO E INVESTIGADOR*/
CREATE OR REPLACE VIEW reporte AS
	SELECT DISTINCT Id_Reportes, Tipo, Clasificacion, Id_Investigador, Nombre, Apellidos
    FROM reportes r JOIN delitos d JOIN tipo_delito t JOIN investigador i ON 
    (r.ID_Delito = d.Id_Delitos AND d.Id_Tipo_Delito = t.Id_Tipo_Delito AND r.ID_INV = i.Id_Investigador);
    
SELECT *FROM reporte;

/*VISTA PARA REGISTROS, INVESTIGADOR Y MUNICIPIO */
CREATE OR REPLACE VIEW registros AS
	SELECT DISTINCT Id_Registro, Descripcion, i.Apellidos, m.Nombre
    FROM registro r JOIN municipio m JOIN investigador i ON (r.Id_Municipio = m.Id_Municipio AND r.Id_Investigador = i.Id_Investigador);
    
SELECT *FROM registros;