#!/bin/bash
## virualenv
sudo apt install python3-virtualenv
mkdir ~/.python-venv/
virtualenv ~/.python-venv/common-enviroment
activate ~/.python-venv/common-enviroment/bin/activate

sudo apt install python3-venv

## pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

## pyenv-virtualenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
pyenv virtualenv 3.5.1 my-virtual-env-3.5.1
