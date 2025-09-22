ARG hip_version
ARG ubuntu_version
FROM ghcr.io/llnl/radiuss:gcc-13-ubuntu-${ubuntu_version}

ARG hip_version
ENV hip_version=$hip_version

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN \
    sudo mkdir --parents --mode=0755 /etc/apt/keyrings \
    && wget https://repo.radeon.com/rocm/rocm.gpg.key -O - | gpg --dearmor | sudo tee /etc/apt/keyrings/rocm.gpg > /dev/null \
    && echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/rocm/apt/${hip_version} noble main" | sudo tee --append /etc/apt/sources.list.d/rocm.list \
    && echo "Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600" | sudo tee /etc/apt/preferences.d/rocm-pin-600 \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends rocm-hip-sdk${hip_version} \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && echo "/opt/rocm/lib\n/opt/rocm/lib64" >> /etc/ld.so.conf.d/rocm.conf \
    && ldconfig
    
USER radiuss

RUN echo 'export PATH=/opt/rocm-${hip_version}/bin:/opt/rocm-${hip_version}/opencl/bin:$PATH' >> ~/.bashrc

WORKDIR /home/radiuss

