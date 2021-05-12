## Homework # 1:  📘✏️  Diary Prototype

<p align="center">This is a simple implementation of the <b>diary </b>in a shell.</p>

##  Getting Started

### Requirements

#### Unzip
   
    sudo apt update
    sudo apt install unzip
    
### Installation

    wget https://codeload.github.com/niki75jr/nx_bootcamp_nix_diary/zip/refs/heads/main
    unzip -q main
    cd nx_bootcamp_nix_diary-main
    ./install.sh
    
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

