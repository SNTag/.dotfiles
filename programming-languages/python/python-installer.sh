#!/usr/bin/env bash
  ### python3
  ## I don't run apt `install python3` as I use pyenv to install specific versions.
#  sudo apt install python3-pyenv -y
  mkdir ~/.python-venv/
  virtualenv ~/.python-venv/common-enviroment
  activate ~/.python-venv/common-enviroment/bin/activate
  curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

  # ### julia
  # sudo apt install julia -y
  # sudo apt install julia-doc -y
