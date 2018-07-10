FROM joshendriks/walletbase

ENV WALLET_URL=https://github.com/mrqcoin/mrq/releases/download/v3.0.0.0/mirq-3.0.0-x86_64-linux-signed.tar.gz

RUN apt-get update \
    && apt-get -y install wget libzmq5 libminiupnpc10 \
	&& wget $WALLET_URL -O /tmp/wallet.tar.gz \
	&& cd /usr/local/bin \
	&& tar xvzf /tmp/wallet.tar.gz \
	&& rm /tmp/wallet.tar.gz \
	&& mkdir -p /data/.mrq

COPY mrq.conf /data/.mrq/mrq.conf
	
#rpc port & main port
EXPOSE 55622 55633

ENV HOME /data

COPY start.sh /start.sh
RUN chmod 777 /start.sh
CMD /start.sh