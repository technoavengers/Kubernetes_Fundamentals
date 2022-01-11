FROM python:3.9.1
ADD . /python-flask
WORKDIR /python-flask
RUN pip install flask
EXPOSE 5000
ENTRYPOINT [ "python","main.py" ]