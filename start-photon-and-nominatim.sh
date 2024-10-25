#!/bin/bash
# Start PostgreSQL
service postgresql start

# Start Nominatim's replication process or other services needed
cd /app/NominatimSrc && ./utils/update.php --init

# Start Photon
cd /app/NominatimSrc && java -jar /app/photon/photon.jar
