FROM ubuntu:14.04
MAINTAINER Magiclin "magiclin89@gmail.com"
RUN apt-get update
RUN apt-get -y install gcc g++ make automake autoconf make libc6-dev patch openssl ca-certificates libreadline6 libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libgdbm-dev libncurses5-dev libtool bison pkg-config libffi-dev imagemagick redis-server zlib1g-dev openssl openssh-server curl libedit-dev wget git-core
WORKDIR /tmp
RUN wget http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz
RUN tar -zxvf ruby-2.2.2.tar.gz
WORKDIR /tmp/ruby-2.2.2
RUN ["./configure"]
RUN make -j2
RUN make install -j2
RUN ruby -v
RUN mkdir -pv /var/data
WORKDIR /var/data
ADD ./ /var/data/personal_site
WORKDIR /var/data/personal_site
RUN mkdir -pv tmp/{pids,sockets}
RUN gem install --no-rdoc --no-ri bundler
ENV RAILS_ENV docker
RUN bundle install -V
RUN chmod 777 start.sh
ENV DB_HOST ------
ENV DB_USERNAME ------
ENV DB_PASSWORD ------
ENV REDIS_PASSWORD ------
ENV REDIS_PORT ------
ENV REDIS_HOST ------
RUN rake assets:precompile
EXPOSE 80

CMD ["sh", "/var/data/personal_site/start.sh"]
