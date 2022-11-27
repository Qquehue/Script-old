#!/bin/bash
echo "Vamos atualizar sua maquina, se aparecer uma tela roxa selecione os espacos utilizando as setas para direcionamento e espaco para marcar (selecione todos os campos), aperte enter para confirmar)"
sleep 5

sudo apt update && sudo apt upgrade -y
git clone https://github.com/Qquehue/arquivos-sh.git
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo "Gostaria de instalar uma interface gráfica ? (s/n)"
read inst
if [ \"$inst\" == \"s\" ];
then

sudo apt-get install xrdp lxde-core lxde tigervnc-standalone-server -y

java -version
VERSION="$(java -version 2>&1 | grep version | cut -d'"' -f2)"
if [ "${VERSION}" ];
then
echo "Cliente possui java instalado: ${VERSION}"
sleep 2
else
echo "Cliente nao possui java instalado"
sleep 2
echo "Instalando o Java..."
sleep 2
sudo apt-get install openjdk-8-jre 
echo "instalando docker..."
sleep 2
sudo apt install docker.io -y
  sudo systemctl start docker
  sudo systemctl enable docker
docker build -t dockerfile .
docker run -d -p 3306:3306 --name ctc -e MYSQL_ROOT_PASSWORD=urubu100 -e MYSQL_DATABASE=ctc dockerfile
echo "Voce esta aqui:"
pwd
guiJava(){
  cd /home/ubuntu/arquivos-sh
  sudo chmod 777 guiJava.sh
  bash guiJava.sh
}
echo "Conecte via RDP, abra o terminal e digite: guiJava"
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
fi
else
#///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
echo "Baixando aplicação versão CLI"
sleep 2
git clone https://github.com/Qquehue/CTC-LocalApp-CLI.git
echo "instalando docker..."
sleep 3
sudo apt install docker.io -y
  sudo systemctl start docker
  sudo systemctl enable docker

docker build -t dockerfile .
docker run -d -p 3306:3306 --name ctc -e MYSQL_ROOT_PASSWORD=urubu100 -e MYSQL_DATABASE=ctc dockerfile

echo "Banco ctc criado"
sleep 2
cd arquivos-sh

echo "Voce esta aqui:"
pwd
sleep 2
cliJava(){
  cd /home/ubuntu/arquivos-sh
  sudo chmod 777 cliJava.sh
  bash cliJava.sh
}
echo "Digite o seguinte comando para inciar a aplicacao: cliJava"
fi