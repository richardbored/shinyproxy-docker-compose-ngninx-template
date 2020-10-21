# sudo apt-get update -y
# sudo apt-get install -y inotify-tools
# inotify-tools --version

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Installing watch tools for Linux"
    wget https://github.com/emcrisostomo/fswatch/releases/download/1.9.3/fswatch-1.9.3.tar.gz
    tar -zxvf fswatch-1.9.3.tar.gz
    cd fswatch-1.9.3/
    ./configure
    make
    sudo make install
    sudo ldconfig
    fswatch --version
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Installing watch tools for Mac OSX"
    if ! [ -x "$(command -v brew)" ]; then
        echo 'Error: brew is not installed.' >&2
        exit 1
    fi
    brew install fswatch
    fswatch --version
    # fswatch -o ~/path/to/watch | xargs -n1 -I{} ~/script/to/run/when/files/change.sh
fi