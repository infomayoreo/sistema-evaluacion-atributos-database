## Uso de esta proyecto

1) Se deben instalar la versión 8u321 del JRE proporcionada por Oracle

2) Instalar SQL Power Architect 

3) En SQL Power Architect ir a ```File -> Open Project```, y abrir el archivo ```sistema de evaluacion de atributos.architect``` que se encuentra en la carpeta ```sql power architect files```

## Estructura de carpetas (Generica)

```data dictionary from power architect```: donde se guarda el diccionario de datos generado desde SQL Power Architect.

```plain E-R model from power architect```: donde se guarda el pdf del modelo entidad-relación generado desde SQL Power Architect.

```sql power architect files```: donde se guarda los archivos del proyecto SQL Power Architect.

```scripts```: contiene los script SQL necesarios para crear las correspondientes tablas de la base de datos, las relaciones entre las mismas, e insertar los datos iniciales para su despliegue. También se agregan los scripts necesarios en caso actualizaciones en la estructura del modelo de datos, ó inserción de nuevos registros maestros. Los scripts se agrupan por carpetas dependiendo del tipo de base de datos. Se recomienda que los nombres de los script comiencen con el número en el orden en que deben ser ejecutados para el despliegue de la base datos.


