FROM ubuntu:22.04 as builder
WORKDIR /source
COPY ./download_trivydbv2.sh .
RUN apt update && apt install -y wget curl && bash download_trivydbv2.sh


FROM alpine:3.15.0
WORKDIR /trivydb/
COPY --from=builder /source/db  ./db
COPY --from=builder /source/java-db  ./java-db
CMD ["sh"]
