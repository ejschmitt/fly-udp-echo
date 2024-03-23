ARG DEBIAN_VERSION=bullseye-20240130-slim

ARG RUNNER_IMAGE="debian:${DEBIAN_VERSION}"

FROM ${RUNNER_IMAGE}

RUN apt-get update -y && \
  apt-get install -y tcpdump ncat \
  && apt-get clean && rm -f /var/lib/apt/lists/*_*


CMD ["ncat", "-e", "/bin/cat", "-k", "-u", "-l", "fly-global-services", "1235"]
