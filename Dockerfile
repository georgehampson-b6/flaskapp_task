FROM python

WORKDIR /app
COPY . /app


# Install requirements from file
RUN pip install -r requirements.txt


# Set the environment variable for version number
ARG VERSION
ENV APP_VERSION=$VERSION


EXPOSE 5000


# Define environment variable
ENV FLASK_APP=app.py

CMD python ./app.py