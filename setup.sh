#################################
# 0. Package manager - Homebrew
#################################
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

###########
# 1. Java
###########
## a. install latest version of java
brew cask install adoptopenjdk

## b. install java 1.8
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8

## c. set default java version to 1.8
echo "export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)" >> ~/.bash_profile

###############
# 2. Anaconda
###############
## a. install anaconda
brew cask install anaconda
echo "PATH=/usr/local/anaconda3/bin/:$PATH" >> ~/.bash_profile
source ~/.bash_profile

## b. create python 3.6 environment
eval "$(conda shell.bash hook)"
conda create -n python36 python=3.6

## c. Activate python version 3.6
echo 'eval "$(conda shell.bash hook)"' >> ~/.bash_profile
echo "conda activate python36" >> ~/.bash_profile

## d. Install additional python packages in python 3.6
pip install -r requirements.txt

############
# 3. Scala
############
## a. install latest version of scala
brew install scala

## b. install scala 2.12
brew install scala@2.12

## c. set default scala version to 2.12
echo 'export PATH="/usr/local/opt/scala@2.12/bin:$PATH"' >> ~/.bash_profile

#############
# 4. Docker
#############
brew cask install docker

###################
# 5. IntelliJ IDE
###################
brew cask install intellij-idea-ce

##########
# 6. GCP
##########
brew cask install google-cloud-sdk


source ~/.bash_profile
