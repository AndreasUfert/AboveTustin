FROM python:3.4

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

ADD https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 .
RUN tar xvf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/bin --strip-components 2 phantomjs-2.1.1-linux-x86_64/bin/phantomjs
RUN rm phantomjs-2.1.1-linux-x86_64.tar.bz2

COPY . .

CMD [ "python", "./tracker.py" ]
