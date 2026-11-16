# Control de cambios de base de datos

La estructura separa los changelogs y DDL por entorno:

- `dev/`: línea base tomada de los supporting objects de ADRI.
- `prod/`: copia de línea base preparada para reconciliación; requiere validación contra la base productiva.

Liquibase registra la ejecución real en `DATABASECHANGELOG` y protege la ejecución concurrente mediante `DATABASECHANGELOGLOCK`. Las conexiones deben suministrarse externamente mediante SQLcl/Liquibase y nunca almacenarse en estos archivos.

## Flujo recomendado

1. Ejecutar `validate` sobre el changelog del entorno.
2. Obtener y revisar `status` y, si corresponde, `update-sql`.
3. Ejecutar `update` sólo con la conexión aprobada del entorno.
4. Verificar el estado de `DATABASECHANGELOG` y los objetos inválidos.

La conexión MCP productiva disponible no pudo autenticarse durante esta revisión porque no tenía contraseña guardada.

