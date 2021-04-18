# Venv Wrapper

Shell-functions replicating the virtualenvwrapper for the Python Venv module.

`.venv` directories are kept in project folder.

Comes with four commands:

``` bash
$ venv
# Activates venv for current directory or asks weather to create .venv subdir if it does not exist
$ activate
# Activates venv for current directory
$ mkvenv
# Creates .venv directory
$ rmvenv
# Removes venv if currently under $PROJECTSHOME. Asks for confirmation first if not.
$ workon
# Navigates to project if project exists, also activates venv.
```

# Installation

These functions depend on the `$PROJECTSHOME` environment variable being set.
Save this file in $HOME and source it from your shells RC file like so:

``` bash
export PROJECTSHOME="$HOME/projects"
source ~/venvwrapper.sh
```
