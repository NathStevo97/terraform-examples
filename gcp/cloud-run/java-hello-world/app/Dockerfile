FROM openjdk:11.0.16
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac Hello.java
CMD ["java", "Hello"]