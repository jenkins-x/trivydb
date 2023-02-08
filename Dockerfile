FROM ubuntu:22.04 as builder
WORKDIR /source
COPY ./download_trivydbv2.sh .
RUN apt update && apt install -y wget curl && bash download_trivydbv2.sh


FROM alpine:3.15.0
WORKDIR /trivydb/
COPY --from=builder /source/trivy.db .
COPY --from=builder /source/java-db/trivy-java.db ./java-db/
COPY --from=builder /source/java-db/metadata.json ./java-db/
COPY --from=builder /source/metadata.json .
CMD ["sh"]
