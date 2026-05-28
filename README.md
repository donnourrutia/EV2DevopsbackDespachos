# Microservicio Backend - Despachos EV2 Innovatech 🚚

Este repositorio aloja el microservicio de **Despachos** para el sistema ITPCARGO. Su objetivo principal es la logística, permitiendo la asignación de camiones, registro de direcciones de entrega y el seguimiento de los intentos de entrega asociados a una orden de compra.

## 🏗️ Arquitectura y Tecnologías
Este servicio funciona como una pieza independiente dentro de nuestra arquitectura *polyrepo*, utilizando:
* **Framework:** Java Spring Boot.
* **Base de Datos:** MySQL 8.0 (Orquestada vía Docker).
* **Contenedores:** Docker y Docker Compose multi-stage.
* **CI/CD:** GitHub Actions.

## 🚀 Automatización CI/CD
Contamos con un pipeline automatizado de despliegue continuo.
1. **Activación:** El flujo se dispara tras cualquier cambio en las ramas `deploy` o `main`.
2. **Contenerización:** Se compila el código fuente y se genera una nueva imagen Docker del microservicio.
3. **Despliegue en AWS:** Mediante acciones automatizadas, el servidor EC2 descarga la nueva imagen y reinicia el contenedor de Despachos, asegurando que el Frontend siempre consuma la API más reciente.

## 🔐 Configuración y Persistencia
* **Independencia de Datos:** Este microservicio maneja su propia base de datos, aislada del servicio de Ventas.
* **CORS Habilitado:** Configurado explícitamente para recibir peticiones del Dashboard Frontend de ITPCARGO.
* **Inyección de Datos:** El archivo `data.sql` pre-carga información de despachos y logística (patentes, rutas, estados) para pruebas inmediatas en el ambiente de desarrollo.

## 🛠️ Ejecución Local

### Requisitos Previos
* Docker Engine y Docker Compose instalados en tu máquina.

### Pasos para levantar el servicio
1. Clona el repositorio y navega al directorio del proyecto:
   ```bash
   git clone [https://github.com/donnourrutia/EV2DevopsbackDespachos.git](https://github.com/donnourrutia/EV2DevopsbackDespachos.git)
   cd EV2DevopsbackDespachos/Springboot-API-REST-DESPACHO
   ```
2. Inicia los contenedores (Microservicio + BD) ejecutando:
   ```bash
   docker-compose up -d
   ```
3. Verifica los logs para asegurar que Spring Boot y MySQL se conectaron exitosamente:
   ```bash
   docker-compose logs -f
   ```
