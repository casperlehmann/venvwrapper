alias activate=". .venv/bin/activate"
alias mkvenv="python -m venv .venv; echo .venv >> .gitignore; touch requirements.txt"

venv() {
  if [[ ! "$VIRTUAL_ENV" = "" ]];
  then
    deactivate
  fi
  if [ -d ".venv" ]
  then
    echo "Activating venv: $PWD/.venv"
    source ".venv/bin/activate"
  else
    echo "A .venv does not exist in directory (${PWD}). Create .venv? (y/n)"
    read createvenv
    if [ $createvenv = "y" ];
    then
      echo "Creating .venv"
      mkvenv
      activate
    fi
  fi
}

rmvenv() {
  if [[ ! "$VIRTUAL_ENV" = "" ]];
  then
    deactivate
  fi
  if [ -d ".venv" ]
  then
    # if in PROJECTSHOME
    case $PWD/ in
      $PROJECTSHOME/*)
        export CONFIRMATION="y";;
      *)
        echo "Currently not in $PROJECTSHOME. Are you sure you want to continue? (y/n)";
        read CONFIRMATION;;
    esac

    if [[ "$CONFIRMATION" == "y" ]];
    then
      rm -rf .venv
    fi
  else
    echo "A .venv does not exist in directory (${PWD})"
  fi
}

workon() {
  if [[ $# -eq 0 ]];
  then
      echo 'Please specify a project name'
  else
    if [ -d "$PROJECTSHOME/$1" ]
    then
      cd "$PROJECTSHOME/$1"
      venv
    else
      echo "Project does not exist"
    fi
  fi
}
