FROM nvidia/cudagl:11.4.1-devel-ubuntu20.04

WORKDIR /root/
ARG DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update 
RUN apt-get upgrade -y

RUN apt-get install -y git vim wget curl locales gnupg2 lsb-release python3-pip

# locale setting 
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

# Install ROS2
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN sh -c 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null'
RUN apt-get update
RUN apt-get install -y ros-foxy-desktop
RUN apt-get install -y ~nros-foxy-rqt* ros-foxy-gazebo-ros-pkgs
RUN apt-get install -y python3-colcon-common-extensions python3-rosdep
RUN rosdep init
RUN rosdep update
RUN mkdir -p /root/ros2_ws/src

COPY requirements.txt /root/
RUN pip install -r /root/requirements.txt
RUN pip3 install -r /root/requirements.txt
RUN rm /root/requirements.txt

RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
RUN echo "source /root/ros2_ws/install/local_setup.bash" >> ~/.bashrc
