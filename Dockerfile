# Use OpenJDK as the base image
FROM openjdk:11-jre-slim

# Install necessary tools
RUN apt-get update && apt-get install -y wget

# Set the Photon version
ENV PHOTON_VERSION=0.3.5

# Create directories for Photon data
WORKDIR /photon
RUN mkdir -p /data/photon_data

# Download and set up Photon jar
RUN wget https://github.com/komoot/photon/releases/download/${PHOTON_VERSION}/photon-${PHOTON_VERSION}.jar -O photon.jar

# Expose the default Photon port
EXPOSE 2322

# Set the startup command
CMD ["java", "-jar", "photon.jar", "-data-dir", "/data/photon_data", "-listen-port", "2322", "-nominatim-import", "https://download.geofabrik.de/europe/great-britain-latest.osm.pbf"]
