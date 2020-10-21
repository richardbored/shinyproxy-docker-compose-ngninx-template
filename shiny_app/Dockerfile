FROM ubuntu:20.04

HEALTHCHECK CMD curl --fail http://localhost:3838/ || exit 1

RUN apt-get update && apt-get install -y \
  sudo

RUN sudo apt-get install tzdata -y

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
  wget \
  r-base-core \
  r-recommended \
  r-base

# RUN sudo apt-get install software-properties-common -y
# RUN sudo apt-get update -y
# RUN sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'
# RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
# RUN sudo apt update
# RUN sudo apt install r-base r-base-core r-recommended r-base-dev -y

# Copy app content into container
COPY app /shiny_app/app
COPY packrat/init.R /shiny_app/packrat/init.R
COPY packrat/packrat.lock /shiny_app/packrat/packrat.lock
COPY scripts /shiny_app/scripts
COPY .Rprofile /shiny_app/.Rprofile
WORKDIR /shiny_app/
RUN R -e 'install.packages(c("packrat"), repos = "http://cran.us.r-project.org")'
RUN R -e 'packrat::init()'
RUN R -e 'packrat::restore()'

# Expose port
EXPOSE 3838

# Launch app
CMD ["R", "-e", "options(shiny.autoreload = TRUE); shiny::runApp('./app' ,host='0.0.0.0', port=3838)"]