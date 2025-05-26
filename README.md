# Taller de Normalización de Base de Datos 📚



## Gestión de Entrenamientos y Eventos Deportivos 🏃🏻‍♂️

Un club de fútbol amateur desea implementar una aplicación de gestión integral para organizar sus actividades de entrenamiento y sus eventos deportivos tanto internos como amistosos contra otros equipos. El sistema debe permitir registrar las distintas sedes y complejos deportivos donde se llevan a cabo sesiones de entrenamiento, así como planificar programas de preparación física y técnica orientados a diferentes categorías de jugadores. Cada programa de entrenamiento incluirá un calendario de sesiones, objetivos específicos y seguimiento individual de métricas de rendimiento.

Paralelamente, el club organiza torneos y partidos amistosos que requieren coordinar la disponibilidad de jugadores, árbitros y comisarios, además de gestionar patrocinios y voluntarios colaboradores. Para ello, la base de datos deberá reflejar la programación de encuentros, la asignación de personal, las acciones tomadas ante incidencias durante los partidos y los recursos necesarios (equipamiento y mantenimiento de canchas). Será necesario manejar información sobre participantes, fechas, ubicaciones y estados de cada evento, de modo que se puedan generar reportes de asistencia y estadísticas de desempeño.

Dado el alto grado de interdependencia entre atletas, programas de entrenamiento, eventos y patrocinios, se contemplará el uso de tablas intermedias para representar relaciones muchos a muchos (por ejemplo, jugadores inscritos en varios programas o eventos patrocinados por diversas entidades). Estas tablas auxiliares garantizarán la integridad referencial y facilitarán la aplicación de las reglas de negocio.

![Club](./image.png)
### Rúbrica

| Criterio                                      | 0 pts (Insuficiente)                              | 50 pts (Aceptable)                                           | 100 pts (Excelente)                                          | Ponderación |
| --------------------------------------------- | ------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ----------- |
| **Identificación de Entidades y Atributos**   | Faltan entidades clave o atributos esenciales.    | Incluye la mayoría de las entidades, pero omite alguno de los atributos relevantes. | Todas las entidades principales y secundarias están presentes con atributos adecuados y tipos de datos coherentes. | 35 %        |
| **Definición de Relaciones y Cardinalidades** | Relaciones incompletas o cardinalidades erróneas. | Relaciones definidas, pero con alguna cardinalidad o clave foránea mal planteada. | Relaciones correctas con cardinalidades adecuadas (1–N, N–M) y claves foráneas claras. | 20 %        |
| **Normalización mínima en 3FN**               | Datos repetidos y dependencias no clave.          | Eliminadas redundancias simples, pero persisten dependencias parciales. | Cumple estrictamente 3FN: cada atributo depende solo de la PK de su tabla, sin redundancias. | 20 %        |
| **Diagrama ER en StarUML**                    | Ausente o ilegible.                               | Diagrama correcto pero con notación inconsistente o poco claro. | Diagrama limpio, legible, notación estándar UML, exportación a imagen y archivo de proyecto. | 25 %        |

## Gestión de Inventario 📒

Una empresa dedicada a la distribución y venta de insumos industriales necesita un sistema de gestión de inventario (Kardex) que permita controlar de manera precisa el flujo de sus productos dentro y fuera de sus almacenes. El sistema registrará diferentes categorías de productos, agrupándolos según su tipo y manteniendo información adicional en tablas auxiliares para describir cada artículo con el nivel de detalle necesario. Además, será posible enriquecer cada registro de producto con descripciones extensas o especificaciones técnicas sin duplicar información.

Por otro lado, los movimientos de stock deberán reflejar tanto las entradas (por compras o devoluciones de terceros) como las salidas (ventas, traslados o ajustes por inventario), clasificándose a su vez por tipo de operación. Cada movimiento estará vinculado a un tercero—que puede ser un proveedor o un cliente—y podrá componerse de varias líneas de detalle donde se especifiquen los productos involucrados, las cantidades y los valores unitarios. Este enfoque de “cabecera y detalle” facilita consultas históricas, la generación de reportes de costos y la trazabilidad de cada transacción.

Para garantizar la integridad y evitar redundancias, se utilizarán tablas intermedias en las relaciones que implican cardinalidades de muchos a muchos. Por ejemplo, al asociar múltiples productos a un solo movimiento o al enlazar los distintos tipos de producto con sus categorías, estas tablas puente asegurarán un diseño normalizado.

![Club](./image2.png)

### Rúbrica

| Criterio                                      | 0 pts (Insuficiente)                                       | 50 pts (Aceptable)                                           | 100 pts (Excelente)                                          | Ponderación |
| --------------------------------------------- | ---------------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ----------- |
| **Identificación de Entidades y Atributos**   | Omisión de tablas clave (Producto, Movimiento, Tercero).   | Tablas principales presentes, faltan detalles de algún atributo importante. | Todas las entidades, incluidas las auxiliares, con atributos y tipos de datos completos. | 30 %        |
| **Definición de Relaciones y Cardinalidades** | Relaciones incompletas; faltan tablas de detalle o puente. | Relaciones establecidas, pero alguna tabla intermedia mal definida. | Relaciones muchos-a-muchos correctamente modeladas con tablas detalle y claves foráneas exactas. | 20 %        |
| **Normalización mínima en 3FN**               | Datos repetidos y dependencias no clave.                   | Eliminadas redundancias simples, pero persisten dependencias parciales. | Cumple estrictamente 3FN: cada atributo depende solo de la PK de su tabla, sin redundancias. | 20 %        |
| **Diagrama ER en StarUML**                    | Ausente o ilegible.                                        | Diagrama correcto pero con notación inconsistente o poco claro. | Diagrama limpio, legible, notación estándar UML, exportación a imagen y archivo de proyecto. | 30 %        |

## Cine Campus 🍿

El CineCampus, una sala universitaria de cine, desea contar con una aplicación de gestión integral que centralice la información de su cartelera y de todo el universo de producciones vinculadas. El sistema debe contemplar el registro de las películas programadas, sus características principales (duración, sinopsis, año de estreno), y la procedencia de cada título según país de origen. Además, será posible categorizar cada obra por género y clasificarla en diferentes formatos de proyección, facilitando la administración de la disponibilidad de copias físicas o digitales.

Paralelamente, el CineCampus necesita manejar el catálogo de intérpretes, relacionando actores y actrices con las producciones en las que participan, así como especificar el tipo de papel que desempeñan (protagonista, secundario, extra, etc.). Para soportar estos vínculos muchos-a-muchos, se prevé el uso de tablas intermedias que permitan asignar múltiples formatos a una misma película y asociar varios intérpretes a cada título sin duplicar datos.

![Club](./image3.png)

### Rúbrica

| Criterio                                      | 0 pts (Insuficiente)                      | 50 pts (Aceptable)                                           | 100 pts (Excelente)                                          | Ponderación |
| --------------------------------------------- | ----------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ----------- |
| **Identificación de Entidades y Atributos**   | Faltan tablas de Género, Formato o País.  | Tablas principales definidas, pero atributos incompletos o mal tipados. | Película, Actor, Género, Formato, País y tablas intermedias correctamente modeladas con todos sus atributos y tipos. | 25 %        |
| **Definición de Relaciones y Cardinalidades** | No se modelan relaciones muchos-a-muchos. | Relaciones presentes, pero falta alguna tabla puente (p.ej. Película–Formato). | Todas las relaciones, incluidas las N–M, con cardinalidades claras y claves foráneas bien definidas. | 25 %        |
| **Normalización mínima en 3FN**               | Datos repetidos y dependencias no clave.  | Eliminadas redundancias simples, pero persisten dependencias parciales. | Cumple estrictamente 3FN: cada atributo depende solo de la PK de su tabla, sin redundancias. | 25 %        |
| **Diagrama ER en StarUML**                    | Ausente o ilegible.                       | Diagrama correcto pero con notación inconsistente o poco claro. | Diagrama limpio, legible, notación estándar UML, exportación a imagen y archivo de proyecto. | 25 %        |

