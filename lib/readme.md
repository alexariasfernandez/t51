# BiciCoruña (Mejorada)
Aplicación Flutter con datos en tiempo real del sistema público de bicicletas de A Coruña (GBFS),
permitiendo consultar estaciones, visualizar estadísticas mediante gráficas y generar informes PDF. 

# Funcionalidades principales

- Consulta rápida de todas las estaciones con datos en tiempo real.
- Gestión de estación favorita para acceso rápido desde la pantalla principal.
- Visualización de estadísticas mediante dos tipos de gráficas distintas.
- Vista de detalle de estación.
- Exportación a PDF de un informe de una estación en un momento concerto.

# Enfoque y arquitectura

La aplicación sigue el patrón MVVM:

 - Model: Representa los datos obtenidos de la API GBFS.
 - ViewModel: Gestiona la lógica de negocio, estados y decisiones.
 - View: Widgets Flutter encargado de la presentación.

# Gráficas utilizadas

Gráfica A — Barras (comparativa global)
- Tipo: BarChart (fl_chart)
- Datos: Top 5 estaciones con más bicicletas disponibles.
- Sentido práctico:
  Permite saber rápidamente que estaciones tienen mayor disponibilidad,
  ayudando al usuario a decidir a cuál desplazarse.

Gráfica B — Anillo (estado de estación)
- Tipo: PieChart (fl_chart)
- Datos:
  - Bicicletas eléctricas
  - Bicicletas mecánicas
  - Puestos disponibles
- Sentido práctico:
  Ofrece una visión clara del estado interno de una estación concreta en un solo vistazo.


# ¿Renta bajar?

La aplicación incluye una lógica simple y clara:

- Sí -> Si hay al menos una bicicleta eléctrica disponible.
- Quizá -> Si hay bicicletas mecánicas pero ninguna eléctrica.
- No ->Si no hay bicicletas disponibles.


# Exportación a PDF

Incluye:
- Nombre y dirección de la estación.
- Estado actual.
- Resultado de la decisión para saber si te renta bajar o no.
- Fecha y hora de generación.
- Fecha y hora de la última actualización de los datos.

# Fuente de datos

Datos obtenidos en tiempo real desde la API GBFS de BiciCoruña:

- station_information
- station_status

# Dependencias utilizadas

- `http` – Consumo de la API REST
- `provider` – Gestión de estado (MVVM)
- `fl_chart` – Gráficas
- `shared_preferences` – Estación favorita
- `pdf` y `printing` – Generación y visualización de PDF