
FROM jupyter/scipy-notebook


RUN conda install -y \
    nltk \
    pyodbc \
    pandas-datareader \
    pytables \
    tqdm \
    pivottablejs \
    pymssql \
    nose \
    theano \
    pygpu \
    geopandas \
	nbdime \
	python-decouple \
	mpld3 && \
    conda remove --quiet --yes --force qt pyqt && \
    conda clean -tipsy   
 
