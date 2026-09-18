FROM maven:3.9.6-eclipse-temurin-17-alpine AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean package -DskipTests

FROM tomcat:10.1.30-jre17-alpine
WORKDIR /usr/local/tomcat
RUN rm -rf webapps/*
COPY --from=builder /app/target/*.war ./webapps/ROOT.war
RUN addgroup -S appgroup && adduser -S appuser -G appgroup \
    && chown -R appuser:appgroup /usr/local/tomcat
USER appuser
EXPOSE 8080
CMD ["catalina.sh", "run"]
