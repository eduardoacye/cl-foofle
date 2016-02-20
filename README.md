# Biblioteca para crear motores de búsqueda

Este repositorio contiene el código de la biblioteca `cl-foofle`. El objetivo del proyecto es generar *motores de búsqueda* para diferentes tipos de documentos.

Los pendientes a corto plazo son:
- Crear un motor de búsqueda para páginas web
    * Tener una funcionalidad equivalente a la del proyecto antecesor [máquinas de búsqueda](https://github.com/uson-ia/maquinas-busqueda)
    * Interfaz gráfica para realizar búsquedas en la base de datos

## Requisitos de instalación
El código fué escrito en Linux con SBCL utilizando las bibliotecas `drakma` y `cl-html-parse`. No he probado el código en otros sistemas ni implementaciones de Common Lisp.

```lisp
(ql:quickload :cl-foofle)
```
