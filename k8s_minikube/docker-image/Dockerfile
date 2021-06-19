FROM ubuntu:latest
Label authors=jerryu version=1.0 description="hello-world flask app"
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv && apt-get clean
RUN useradd --user-group --shell /bin/bash -d /home/userflask -m -c '' --no-log-init userflask
ADD /src/* /home/userflask/src/
WORKDIR /home/userflask/src
ENV PYTHON_VENV=/home/userflask/py3userflask_venv
USER userflask
RUN python3 -m venv $PYTHON_VENV
SHELL [ "/bin/bash", "-c" ]
RUN source $PYTHON_VENV/bin/activate &&\
  pip install -U pip &&\
  pip install -r python-requirement.txt &&\
  pip cache purge
EXPOSE 8080
CMD source $PYTHON_VENV/bin/activate && python hello.py
