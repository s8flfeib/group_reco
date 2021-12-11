# [stage 1: create image: interim:16.1]       # FROM nikolaik/python-nodejs:python3.8-nodejs16
# [stage 2: create image: req:16.1](ca.10min) # FROM interim:16.1
# [stage 3: create image: app:16.1]           # FROM req:16.1
FROM req:16.1

# [stage 1: create image: interim:16.1] # 
WORKDIR /home/app
RUN apt-get update -y


# [stage 2: create image: req:16.1]     # 
ARG REQTXT=requirements.venv2.baseline.txt
COPY ./$REQTXT /home/app
RUN pip install --upgrade -r $REQTXT

# [stage 3: create image: app:16.1]     # 
COPY . /home/app
COPY .env.cloud.appcontainer2dbcontainer .env
RUN npm update --force
RUN npm install
EXPOSE 4000
CMD [ "npm", "start" ]