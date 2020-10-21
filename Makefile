shiny_build:
	cd shinyproxy && docker build --tag shiny-app_proxy . && cd .. && cd shiny_app && docker build --tag shiny_app_docker . 
