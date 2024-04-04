# Utilizamos una imagen base de OpenJDK para ejecutar la aplicación
FROM openjdk:11-jre-slim

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos el archivo JAR de la aplicación al contenedor
COPY target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar /app/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar

# Exponemos el puerto en el que la aplicación Spring Boot escuchará las solicitudes
EXPOSE 8083

# Comando para ejecutar la aplicación Spring Boot cuando el contenedor se inicie
CMD ["java", "-jar", "spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar"]
