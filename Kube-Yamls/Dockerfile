FROM docker:17.12.0-ce as static-docker-source
FROM jenkins:latest
# Set the Kubernetes version as found in the UCP Dashboard or API
#RUN k8sversion=v1.11.5
USER root
# Get the kubectl binary.
#RUN sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/$k8sversion/bin/linux/amd64/kubectl

## Make the kubectl binary executable.
#RUN sudo chmod +x ./kubectl

# Move the kubectl executable to /usr/local/bin.
#COPY sudo mv ./kubectl /usr/local/bin/kubectl
COPY --from=lachlanevenson/k8s-kubectl:v1.10.3 /usr/local/bin/kubectl /usr/local/bin/kubectl

#RUN apt-get update && apt-get install curl python bash
#ENV HOME /
#RUN curl https://sdk.cloud.google.com | bash
#ARG CLOUD_SDK_VERSION=151.0.1
#ARG SHA256SUM=26b84898bc7834664f02b713fd73c7787e62827d2d486f58314cdf1f6f6c56bb
#RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz
#RUN echo "${SHA256SUM}  google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz" > google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz.sha256
#RUN sha256sum -c google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz.sha256
#RUN tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz 
#ENV PATH /google-cloud-sdk/bin:$PATH
#RUN gcloud config set core/disable_usage_reporting true
#RUN gcloud config set component_manager/disable_update_check true
#VOLUME ["/.config"]





ARG CLOUD_SDK_VERSION=231.0.0
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION

COPY --from=static-docker-source /usr/local/bin/docker /usr/local/bin/docker
RUN apt-get -qqy update && apt-get install -qqy \
        curl \
        gcc \
        python-dev \
        python-setuptools \
        apt-transport-https \
        lsb-release \
        openssh-client \
        git \
        gnupg \
    && easy_install -U pip && \
    pip install -U crcmod   && \
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y google-cloud-sdk=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-app-engine-python=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-app-engine-python-extras=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-app-engine-java=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-app-engine-go=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-datalab=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-datastore-emulator=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-pubsub-emulator=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-bigtable-emulator=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-cbt=${CLOUD_SDK_VERSION}-0 \
        kubectl && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    gcloud --version && \
    docker --version && kubectl version --client
VOLUME ["/root/.config"]
