## Homework #1:  📘✏️  Diary Prototype

<p align="center">This is a simple implementation of the <b>diary </b>in a shell.</p>

##  Getting Started
   
### Installation

    curl -L https://github.com/niki75jr/nx_bootcamp_nix_diary/archive/refs/tags/v0.1.1.tar.gz | tar xz
    cd nx_bootcamp_nix_diary-0.1.1
    ./install.sh

<p>or use <b>docker-image</b> (<b>17 MB</b>), more details in branch &quot;<a href="https://github.com/niki75jr/nx_bootcamp_nix_diary/tree/Docker-Alpine" target="_blank"><b>Docker-Alpine</b></a>&quot;</p>
    
### Usage

To start the application, run the command "**diary**", the application will start in interactive mode. Next, select the desired menu item.

After installation, the configuration file "**${HOME}/. diaryNXBC/. config**" will be created, where you can change:
1. Home directory of diary records
2. The directory for backups
3. The directory for templates
4. Author's name
5. Default Editor

You can also change the values interactively.

#### Menu

![Menu list](https://i.imgur.com/mAvWXUn.jpg)

### Commands

`diary`  - launch the app in an interactive mode\
`diary -a` - create a record\
`diary -s` - display all available statistics\
`diary -d` - delete the directory with records\
`diary -f` - delete the directory with records and source files
