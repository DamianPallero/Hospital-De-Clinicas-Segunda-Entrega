S.I.G.S.M. - Sistema de Gestion de Traslados de Pacientes

Proyecto Final
Programacion Full Stack
Equipo FoxWare - Polo MVD 3 MA

Sistema interno desarrollado para el Hospital de Clinicas que gestiona los traslados de pacientes dentro del circuito nacional, la documentacion clinica asociada y las encuestas de satisfaccion, cumpliendo con estandares de accesibilidad (WCAG 2.1 AA), segregacion de funciones y seguridad institucional.

INDICE

1. Descripcion
2. Modulos
3. Tecnologias
4. Requisitos
5. Instalacion
6. Uso
7. Estructura del Proyecto
8. Equipo
9. Documentacion y Base de Datos

DESCRIPCION

El S.I.G.S.M. reemplaza el sistema de registros en papel utilizado actualmente por el Hospital de Clinicas, digitalizando los procesos de:
Solicitud y asignacion de traslados de pacientes (biologicos y no biologicos).
Carga, consulta y gestion segura de documentacion clinica mediante un repositorio con encriptacion de rutas.
Gestion de recursos (vehiculos, conductores, enfermeros).
Encuestas anonimas de satisfaccion accesibles via codigos QR con sistema de versiones y bloqueo anti-reenvio.

El sistema opera exclusivamente en la intranet hospitalaria, con acceso restringido mediante un modelo de Control de Acceso Basado en Roles (RBAC) y credenciales institucionales validadas.

MODULOS

1. Modulo de Documentacion y Encuestas
Panel administrativo con RBAC estricto (Enfermeria carga, Administrador elimina).
Gateway de Archivos Seguro: Los archivos subidos se renombran con hashes de 32 caracteres, se almacenan en directorios protegidos y se sirven a traves de un proxy PHP que valida permisos y tipos MIME reales.
QR de Documento (Un solo uso): Genera un token temporal que se invalida automaticamente tras el primer escaneo.
QR de Encuestas (Versionado): Codigo estatico para impresion en paredes. El rol de IT puede invalidar versiones anteriores, generando una nueva URL y mostrando una alerta de actualizacion en el panel.
Proteccion Anti-Reenvio: Implementacion de cabeceras Cache-Control y deteccion de bfcache en JavaScript para evitar que el boton Atras del navegador permita responder la encuesta multiples veces.

2. Modulo de Traslados (Ambulancias)
Panel de gestion de solicitudes de traslado.
Formulario de alta con validacion de campos clinicos y logisticos (oxigeno, aislamiento, tipo de vehiculo).
Vista de seguimiento de estado y asignacion de recursos.

TECNOLOGIAS

Backend: PHP 8.1+ (Programacion Orientada a Objetos, PDO para consultas preparadas).
Base de Datos: MySQL 8.0 / MariaDB 10.6+.
Frontend: HTML5, JavaScript (Vanilla), Bootstrap 5.3 (Diseño mobile-first sin CSS personalizado).
Servidor Web: Apache 2.4+ (XAMPP / Entorno Linux de produccion).
Control de Versiones: Git + GitHub.
IDE: Visual Studio Code.

REQUISITOS

Antes de comenzar, asegurate de tener instalados:
XAMPP 8.2+ o entorno LAMP en Linux.
Git.
Visual Studio Code.
Navegador moderno (Chrome, Firefox o Edge).

INSTALACION

1. Clonar el repositorio
cd C:\xampp\htdocs
git clone https://github.com/tu-usuario/sigsm.git
cd sigsm

2. Configurar la Base de Datos
Inicia Apache y MySQL en XAMPP.
Accede a phpMyAdmin.
Importa los scripts DDL (estructura de tablas) y DML (datos de prueba y roles) que se encuentran disponibles en el repositorio de GitHub del proyecto.

3. Configurar la Conexion
Abre el archivo config/Database.php.
Actualiza las credenciales de tu base de datos local.

4. Permisos de Carpetas
Asegurate de que las carpetas uploads/ y temp_qr/ tengan permisos de escritura para el servidor web.
Verifica que los archivos .htaccess dentro de estas carpetas esten presentes para bloquear el acceso HTTP directo a los archivos crudos.

USO

1. Accede al portal mediante: http://localhost/sigsm/
2. Inicia sesion con las credenciales de prueba proporcionadas en el script DML.
3. Navegacion por Roles:
Enfermeria/Medico: Pueden ver y cargar documentos, pero no eliminarlos.
Administrador General: Control total (crear, editar, eliminar documentos y gestionar usuarios).
IT: Acceso exclusivo al panel de gestion de encuestas y rotacion de codigos QR.
Transporte: Redirigido automaticamente a su modulo exclusivo.
4. Generacion de QR: Desde el panel principal o el modulo de IT, genera codigos QR para documentos especificos o para el portal de encuestas.

ESTRUCTURA DEL PROYECTO

sigsm/
config/ (Database.php: Conexion PDO segura)
controllers/ (AuthController.php, DocumentoController.php, EncuestaController.php, QRController.php)
includes/ (auth_middleware.php: Validacion de sesiones, roles y tokens CSRF)
models/ (Documento.php, Encuesta.php)
views/ (login.php, documentos.php, encuestas_admin.php, qr_documentos.php, transporte.php)
encuestas/ (portal.php, tomar.php, procesar.php, gracias.php)
uploads/ (Archivos subidos, protegido por .htaccess)
temp_qr/ (Tokens de un solo uso, protegido por .htaccess)
index.php (Portal principal)
ver_documento.php (Gateway seguro de visualizacion de archivos)
ver_documento_qr.php (Gateway seguro para tokens de un solo uso)

EQUIPO

Equipo FoxWare
Desarrollado como Proyecto Final para el Polo MVD 3 MA de Programacion Full Stack.

DOCUMENTACION Y BASE DE DATOS

El script DDL (Data Definition Language) para la creacion de tablas, indices y claves foraneas, junto con el script DML (Data Manipulation Language) para la insercion de roles, usuarios de prueba, categorias y encuestas, se encuentran disponibles en el repositorio de GitHub del proyecto.
El esquema de base de datos esta diseñado para garantizar la integridad referencial y la trazabilidad de las cargas de documentos.
