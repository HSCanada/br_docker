
FROM jupyter/scipy-notebook:229c7fea9d60

RUN conda install -y \
    pyodbc \
#    pymssql=2.1.* \
    python-decouple \
#    ephem \
#    pystan \
#    fbprophet \
    papermill=2.1.* \
    pydot=1.4.* \
#    jupytext=1.5.* \
    plotly=4.8.* \
&& conda clean -tipsy
#RUN conda clean -tipsy
