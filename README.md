## Homework #1:  📘✏️  Diary Prototype

<p align="center">Docker | 🐳</p>
<p align="center">image '<b>diary</b>' [<b>alpine:3.13.5</b>] (size: <b>17 MB</b>)</p>

##  Getting Started

### Requirements

#### Docker
   
    sudo apt update
    sudo apt docker.io
    
### Installation

    curl -L https://codeload.github.com/niki75jr/nx_bootcamp_nix_diary/tar.gz/refs/tags/v0.1.2-docker-alpine | tar xz
    cd nx_bootcamp_nix_diary-0.1.2-docker-alpine
    docker build . -t diary

### Launch

     docker run --rm -it diary

### Commands

`diary`  - launch the app in an interactive mode\
`diary -a` - create a record\
`diary -s` - display all available statistics\
`diary -d` - delete the directory with records (**not available**)\
`diary -f` - delete the directory with records and source files (**not available**)
