curl -LO https://github.com/oras-project/oras/releases/download/v0.12.0/oras_0.12.0_linux_amd64.tar.gz
mkdir -p oras-install
tar -zxf oras_0.12.0_*.tar.gz -C oras-install/
mv oras-install/oras .
rm -rf oras_0.12.0_*.tar.gz oras-install/
mkdir -p db
./oras pull ghcr.io/aquasecurity/trivy-db:2 -a \
    && tar -xzvf db.tar.gz  -C ./db \
    && rm db.tar.gz

mkdir -p java-db
./oras pull ghcr.io/aquasecurity/trivy-java-db:1 -a \
    && tar -xzvf javadb.tar.gz -C ./java-db \
    && rm javadb.tar.gz
 