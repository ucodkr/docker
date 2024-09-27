# GOLANG BUILD TOOL
ARG BASE_IMAGE=debian:bullseye-slim
FROM $BASE_IMAGE

RUN apt-get update && apt-get install -y  \
    git make gzip  findutils \
    autoconf libxml2-dev zlib1g-dev libssl-dev  gpg \
    ca-certificates \
    gnupg software-properties-common \
    curl wget\
    lxc \
    iptables \
    python3 pip sshpass 
WORKDIR /app
RUN  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" &&mv kubectl /usr/local/bin &&chmod +x /usr/local/bin/kubectl && ln -s /usr/local/bin/kubectl /usr/local/bin/k8s

# rust
# RUN curl --proto '=https' \
#     --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
# ENV PATH=/root/.cargo/bin:$PATH
# RUN cargo install apple-codesign
COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/ 
COPY --from=hashicorp/terraform:latest /bin/terraform /usr/local/bin/ 
RUN ln -s  /usr/local/bin/terraform /usr/local/bin/tf
# FROM hashicorp/terraform:latest

# CMD ["sh"]