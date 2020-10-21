install_packrat:
	R -e 'install.packages(c("packrat"), repos = "http://cran.us.r-project.org")'

setup_project:
	R -e 'packrat::init()'

packrat_status:
	R -e 'packrat::status()'

init:
	R -e 'packrat::restore()'

watch_install:
	sh ./scripts/watch_install.sh

watch:
	fswatch ./app/ui ./app/data ./app/server | (while read x; do echo updated; touch ./app/app.R; done)

start:
	R -e "options(shiny.autoreload = TRUE); shiny::runApp('./app' ,host='0.0.0.0', port=3838)"
