
FROM openjdk:17-slim AS build


WORKDIR /app


RUN apt-get update && apt-get install -y git


RUN git clone https://github.com/Torus211/ShellOnJava.git .


RUN javac Shell.java


FROM openjdk:17-slim


WORKDIR /app


COPY --from=build /app/Shell.class .


ENTRYPOINT ["java", "Shell"]

