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
  docker pull mysql:5.7
  docker run -d -p 3306:3306 --name ctc -e "MYSQL_DATABASE=ctc" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
  docker exec -it ctc bash mysql -u root -p -B -N -e"

CREATE DATABASE ctc;

USE ctc;

CREATE TABLE Linha(idLinha INT PRIMARY KEY AUTO_INCREMENT,nomeLinha VARCHAR(45),situacaoLinha CHAR(10));

CREATE TABLE Estacao(idEstacao INT PRIMARY KEY AUTO_INCREMENT,nomeEstacao VARCHAR(45),situacaoEstacao CHAR(10),fkLinha INT,FOREIGN KEY (fkLinha) REFERENCES Linha(idLinha));

CREATE TABLE Maquina(idMaquina INT PRIMARY KEY AUTO_INCREMENT,modeloCPU VARCHAR(45),totalMemoria DOUBLE,totalDisco DOUBLE,dataCadastro DATETIME,fkEstacao INT,FOREIGN KEY (fkEstacao) REFERENCES Estacao(idEstacao));

CREATE TABLE UsoMaquina(idUso INT PRIMARY KEY AUTO_INCREMENT,temperaturaCPU DOUBLE,usoCPU DOUBLE,usoMemoria DOUBLE,upTime DATETIME,fkMaquina INT,FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina));

CREATE TABLE Cargo(idCargo INT PRIMARY KEY AUTO_INCREMENT,nomeCargo VARCHAR(45));

CREATE TABLE Funcionario(idFuncionario INT PRIMARY KEY AUTO_INCREMENT,nomeFuncionario VARCHAR(45),CPF CHAR(11),telefone CHAR(15),email VARCHAR(45),senha VARCHAR(45),fkLinha INT,FOREIGN KEY (fkLinha) REFERENCES Linha(idLinha),fkCargo INT,FOREIGN KEY (fkCargo) REFERENCES Cargo(idCargo));"

exit
exit
fi
cd arquivos-sh
sudo chmod 777 tJava.sh
sudo chmod 777 tNode.sh
echo "Voce esta aqui:"
pwd
echo "Digite o proximo script para execucao da aplicacao (bash tJava.sh)"
