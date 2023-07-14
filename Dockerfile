FROM maven:latest

WORKDIR /Code

COPY . /Code

ARG DB_HOST

ENV DB_HOST ${DB_HOST}

ARG DB_NAME

ENV DB_NAME ${DB_NAME}

ARG DB_USERNAME

ENV DB_USERNAME ${DB_USERNAME}

ARG DB_PASSWORD

ENV DB_PASSWORD ${DB_PASSWORD}

RUN mvn clean install -DskipTests=true

EXPOSE 8080

CMD ["java","-jar", "/Code/target/JavaWebService-1.0-SNAPSHOT.jar", "server", "/Code/config.yml"]