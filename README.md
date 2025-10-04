Descripción:
Esta aplicación de notas ha sido desarrollada en Flutter con el objetivo de permitir al usuario crear, editar y eliminar notas de manera sencilla y rápida.
El proyecto está diseñado para ser multiplataforma (Android/iOS/Web), con una arquitectura modular que facilita la escalabilidad y el mantenimiento del código.

Arquitectura:
La aplicación sigue una arquitectura en capas para separar responsabilidades:

Presentación (UI):
Pantallas y widgets en Flutter.
Manejo de estados con Provider.
Interfaz intuitiva.

Datos:
Almacenamiento local con SQLite.

Medidas de Seguridad Aplicadas:
Para proteger la información de los usuarios, se han aplicado las siguientes medidas:

Almacenamiento seguro
Uso de SQLite encriptado para proteger las notas en el dispositivo.
Claves de encriptación generadas dinámicamente.
Validación de entradas
Sanitización de datos ingresados por el usuario para prevenir inyección de código.
