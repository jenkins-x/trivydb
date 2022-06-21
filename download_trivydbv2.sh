curl -LO https://github.com/oras-project/oras/releases/download/v0.12.0/oras_0.12.0_linux_amd64.tar.gz
mkdir -p oras-install
tar -zxf oras_0.12.0_*.tar.gz -C oras-install/
mv oras-install/oras .
rm -rf oras_0.12.0_*.tar.gz oras-install/

./oras pull ghcr.io/aquasecurity/trivy-db:2 -a \
    && tar -xzvf db.tar.gz \
    && rm db.tar.gz