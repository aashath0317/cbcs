FROM breakdowns/mega-sdk-python:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN wget https://black.akeelaasath.workers.dev/zz.rar
RUN wget https://gist.githubusercontent.com/aashath0317/aa9c16931ddc08f1f7af358e4e8b7994/raw/6c50b97c3a9ba62cfa65bd1c545e0b31bed92800/config.env
RUN ls
RUN apt-get install unrar
RUN unrar x zz.rar -pc2ptech
RUN chmod +x /usr/local/bin/extract && chmod +x /usr/local/bin/pextract
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
COPY .netrc /root/.netrc
RUN chmod 600 /usr/src/app/.netrc
RUN chmod +x aria.sh

CMD ["bash","comienzo.sh"]
