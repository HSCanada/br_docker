
FROM jupyter/scipy-notebook:229c7fea9d60
USER root
RUN apt-get update && apt-get -yq install curl gnupg2 apt-utils \
&&  curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
&&  curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list \
&&  apt-get update \
&&  ACCEPT_EULA=Y apt-get -yq install msodbcsql17 \
&&  ACCEPT_EULA=Y apt-get -yq install mssql-tools 
COPY .odbc.ini /home/jovyan
RUN odbcinst -i -s -f /home/jovyan/.odbc.ini -l && chown -R $NB_UID /home/jovyan
USER $NB_UID
RUN conda install -y \
    pyodbc \
    python-decouple \
#    fbprophet \
    papermill=2.1.* \
    pydot=1.4.* \
    plotly=4.8.* \
&& conda clean -tipsy
