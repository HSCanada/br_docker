FROM bitnami/redmine:4-debian-10

RUN install_packages build-essential default-libmysqlclient-dev libpq-dev libmagickwand-dev

WORKDIR /opt/bitnami/redmine
#RUN chmod -R g+rwX /opt/bitnami
#RUN chmod -R g+rwX /opt/bitnami \
#&&  useradd -r -u 1001 -g root redmine -d /home/redmine/ -m \
#&&  chown -R 1001:1001 /opt/bitnami
#USER redmine 

# add here for depency build. 
COPY redmine_agile /opt/bitnami/redmine/plugins/redmine_agile
COPY redmine_checklists /opt/bitnami/redmine/plugins/redmine_checklists
COPY redmineup_tags /opt/bitnami/redmine/plugins/redmineup_tags  

RUN bundle config unset deployment && bundle install --no-deployment
