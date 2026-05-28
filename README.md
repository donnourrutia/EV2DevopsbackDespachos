# Backend - Microservicio de Despachos (Innovatech Chile) 🚚
Este repositorio alberga el microservicio de Despachos, responsable de la lógica logística de ITPCARGO, incluyendo la asignación de camiones, rutas y el control de los intentos de entrega.

🏗️ Arquitectura y Justificación Técnica
Diseñado para operar como una pieza independiente y escalable, este microservicio implementa:

Java Spring Boot: Framework seleccionado por su capacidad de modularización y manejo eficiente de APIs RESTful.

Base de Datos MySQL: Gestionada mediante contenedores Docker para garantizar consistencia en el desarrollo y producción.

Optimización (Multi-stage build): El Dockerfile utiliza un proceso de compilación de dos etapas, separando el entorno de construcción del entorno de ejecución, logrando imágenes ligeras, rápidas de desplegar y más seguras.

Seguridad: Implementación de un usuario no-root en el contenedor, siguiendo las mejores prácticas de seguridad para minimizar riesgos de escalada de privilegios.

💾 Persistencia de Datos
La integridad de los datos de logística es fundamental para la empresa.

Estrategia: Se utilizan Named Volumes de Docker para el almacenamiento de la base de datos MySQL.

Justificación: Elegimos Named Volumes porque ofrecen una gestión del ciclo de vida superior a los bind mounts, permitiendo que el volumen exista independientemente del contenedor, garantizando que el historial de despachos persista ante reinicios o actualizaciones del stack.

🚀 Pipeline CI/CD (GitHub Actions)
La automatización del despliegue es el pilar de nuestra estrategia DevOps:

Trigger: El pipeline se activa automáticamente con push a las ramas deploy o main.

Construcción: GitHub Actions realiza un docker build que valida la compilación del código y crea una imagen optimizada.

Publicación: La imagen es etiquetada y enviada a un registro de contenedores (ECR/DockerHub) de forma segura.

Despliegue: Se ejecuta un despliegue remoto vía SSH que actualiza la imagen en la instancia EC2, garantizando un servicio siempre disponible (Zero Downtime).

Seguridad: Todas las variables sensibles (tokens, credenciales de AWS) están protegidas mediante GitHub Repository Secrets.

🛠️ Ejecución Local
Requisitos Previos
Docker Engine y Docker Compose.

Pasos para levantar el servicio
Clona el repositorio:

Bash
git clone https://github.com/donnourrutia/EV2DevopsbackDespachos.git
cd EV2DevopsbackDespachos/Springboot-API-REST-DESPACHO
Levanta el stack (Microservicio + BD) en segundo plano:

Bash
docker-compose up -d
Verifica los logs:

Bash
docker-compose logs -f
⚙️ Principios DevOps Aplicados
Automatización: Flujo CI/CD desde el código hasta la infraestructura EC2.

Trazabilidad: Historial de commits estructurado que permite identificar qué cambios afectan a la logística de despachos.

Gestión de Entornos: Configuración desacoplada (variables de entorno) para asegurar portabilidad entre entornos de desarrollo y AWS.

Documentación: Este documento sirve como guía técnica para el mantenimiento del servicio.
