FROM ubuntu:16.04
LABEL maintainer="siv@digtlab.ru"

RUN apt-get -y update && apt-get install -y --no-install-recommends \
lsb-release \
cpio \
sudo \
wget \
clinfo \
# ocl-icd-opencl-dev \
libgl1-mesa-glx \
libgl1-mesa-dri \
python3.5 \
python3-pip \
# python3-venv \
&& rm -rf /var/lib/apt/lists/*

# Install OpenVino
# http://registrationcenter-download.intel.com/akdlm/irc_nas/14920/l_openvino_toolkit_p_2018.4.420.tgz \
RUN wget -O /tmp/openvino.tar.gz http://registrationcenter-download.intel.com/akdlm/irc_nas/14920/l_openvino_toolkit_p_2018.4.420.tgz \
&& tar -xzf /tmp/openvino.tar.gz -C /tmp \
&& rm /tmp/openvino.tar.gz \
&& cd /tmp/l_openvino* \
&& ./install_cv_sdk_dependencies.sh \
&& rm -rf /var/lib/apt/lists/* \
&& sed -i 's/^\(ACCEPT_EULA\)=.*$/\1=accept/' silent.cfg \
&& echo "Installing OpenVino..." \
&& ./install.sh -s silent.cfg \
&& rm -rf /tmp/l_openvino*

RUN cd /opt/intel/computer_vision_sdk/install_dependencies \
&& ./install_NEO_OCL_driver.sh