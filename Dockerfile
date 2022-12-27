FROM python-3.10

RUN apt update && apt upgrade -y
RUN apt install python3-pip -y
RUN apt install ffmpeg -y

RUN curl -SL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs 
RUN npm i -g npm

RUN mkdir /app/
COPY /app
WORKDIR /app

RUN pip3 install --upgrade pip
COPY requirements.txt /app/
RUN pip3 install -U -r requirements.txt

COPY . /app

#set a default command

CMD python3 bot.py
