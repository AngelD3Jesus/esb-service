# Etapa 1: Construir el proyecto
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Ejecutar el proyecto
FROM openjdk:17
WORKDIR /app

# Limitar uso de memoria en el contenedor
ENV JAVA_OPTS="-Xmx256m -Xms128m"

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
