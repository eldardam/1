# Установка базового образа ubuntu 16:04

FROM tomcat:9

# Обновление системы, установка jdk, maven,tomcat 9, git

RUN apt-get update && apt-get install default-jdk -y && apt-get install maven -y && apt-get install git -y

# Клонирование образа boxfuse-sample-java-war-hello

RUN cd / && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

# Процесс сборки

RUN cd /boxfuse-sample-java-war-hello/ && mvn package && cd /boxfuse-sample-java-war-hello/target/

# Копирование для дальнейшего запуска

RUN cp hello-1.0.war /usr/local/tomcat

# Проброс порта 8080

EXPOSE 8080

# Запуск команды вместе с контейнером

CMD ["catalina.sh", "run"]