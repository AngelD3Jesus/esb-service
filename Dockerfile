FROM openjdk:8-jdk-alpine
#Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

COPY target/*.jar app.jar

#Exponer el puerto en el que corre el servicio
EXPOSE 8081

ENTRYPOINT [ "java","-jar", "app.jar" ]