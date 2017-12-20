FROM ubuntu:latest
MAINTAINER Arthur Gilly "ag15@sanger.ac.uk"

RUN apt-get update

RUN apt-get install -y apt-utils python python-pip python3 nano wget iputils-ping git yum gcc gfortran libc6 libc-bin libc-dev-bin make libblas-dev liblapack-dev libatlas-base-dev libatlas-dev curl zlib1g zlib1g-dev libbz2-1.0 libbz2-dev libbz2-ocaml libbz2-ocaml-dev liblzma-dev lzma lzma-dev

RUN apt-get install -y r-base
RUN R -e 'install.packages("shiny", repos="https://cran.rstudio.com/")'
RUN apt-get install -y gdebi-core
RUN wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.6.875-amd64.deb
RUN gdebi -n shiny-server-1.5.6.875-amd64.deb
RUN usermod -G root shiny
RUN R -e 'install.packages("rmarkdown", repos="https://cran.rstudio.com/")'
RUN R -e 'install.packages(c("ggplot2", "shinyjs", "data.table", "RColorBrewer"), repos="https://cran.rstudio.com/")'

WORKDIR /home
