FROM python:3.9.4

WORKDIR /work

ENV TZ Asia/Shanghai
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN pip install scrapy==2.4.1 pymongo==3.11.3 scrapyd==1.2.1 scrapydweb==1.4.0

COPY ./start.sh /work
RUN mkdir /work/scrapydweb
RUN mkdir /work/scrapyd
RUN mkdir /work/scrapyd/logs

COPY ./data/scrapyd/scrapyd.conf /work/scrapyd
COPY ./data/scrapydweb/scrapydweb_settings_v10.py /work/scrapydweb

VOLUME /work/scrapydweb /work/scrapyd

EXPOSE 6800
EXPOSE 5000

CMD ["bash", "/work/start.sh"]
