# Project

This script is a little project I did to learn some bash scripting.
I really don't think it's good, but I don't have any intentions of
keep developing it further.
If you want to modify it, go ahead and fork the project.
You can also do a pull request, but it may take some time before I notice it.

## Instalation

There is an install script, but if you think you're better than that,
modify the default text editor in the project and run the following commands

```
mkdir ~/.local/share/project/
touch ~/.local/share/project/projects-locations
chmod +x project.sh
sudo mv project.sh /usr/local/bin/project
```

## commands 

```
$ project --help
Usage: project [Name] [Route] [App (optional)]
-l --list	shows list of files
-r --remove	removes file from the list
-h --help	shows this message
```
