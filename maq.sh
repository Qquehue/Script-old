#!/bin/bash
echo "Vamos atualizar sua maquina, se aparecer uma tela roxa selecione os espacos utilizando as setas para direcionamento e espaco para marcar (selecione todos os campos), aperte enter para confirmar)"
sudo apt update && sudo apt upgrade -y
sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y
#//////////////////////////JAVA/////////////////////////////////////
VERSION="$(java -version 2>&1 | grep version | cut -d'"' -f2)"
if [ "${VERSION}" ];
then
echo "Cliente possui java instalado: ${VERSION}"
sleep 2
else
echo "Cliente nao possui java instalado"
sleep2
echo "gostaria de instalar o java? (s/n)"
read inst
if [ \"$inst\" == \"s\" ];
then
sudo apt install default-jre -y
fi
fi

git clone https://github.com/Qquehue/arquivos-sh.git
#////////////////////////////DOCKER//////////////////////////////////
echo "instalando docker..."

sudo apt install docker.io -y
  sudo systemctl start docker
  sudo systemctl enable docker

docker build -t dockerfile .
docker run -d -p 3306:3306 --name ctc -e MYSQL_ROOT_PASSWORD=urubu100 -e MYSQL_DATABASE=ctc dockerfile
exit

cd arquivos-sh
sudo chmod 777 tJava.sh
sudo chmod 777 tNode.sh
echo "Voce esta aqui:"
pwd
echo "Digite o proximo script para execucao da aplicacao (bash tJava.sh)"