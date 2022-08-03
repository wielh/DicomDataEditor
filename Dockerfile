FROM ubuntu:18.04 
MAINTAINER wielh.erlow@gmail.com

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# copy file
COPY DicomDataEditor_20220523.jar /Program/DicomDataEditor_20220523.jar
RUN mkdir -p -v /Program/input
RUN mkdir -p -v /Program/output

# run jar file
ENTRYPOINT ["java", "-jar", "/Program/DicomDataEditor_20220523.jar"]

# command that run docker container with parameters:
# docker run -it -v host_folder:/Program/input -v  host_folder:/Program/output dicom_data_editor ${parameters}