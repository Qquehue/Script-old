#!/bin/bash
#Iniciando a configuracao padrao
echo "Gostaria de cdefinir uma senha novar para usurario ubuntu? (recomendado caso não tenha feito anteriormente) - s/n"
read inst
if [ \"$inst\" == \"s\" ];
then
echo "Criando senha de usuario Ubuntu..."
sleep 2
echo "Digite sua senha:"
sudo passwd ubuntu
fi
echo "Vamos atualizar sua maquina, se aparecer uma tela roxa selecione os espacos utilizando as setas para direcionamento e espaco para marcar (selecione todos os campos), aperte enter para confirmar)"
sleep 3
sudo apt update && apt upgrade -y
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
docker --version
if [ $? -eq 0 ];
then
echo "docker instalado"
echo "tem o banco de dados ctc criado? (s/n)"
read inst
if [ \"$inst\" == \"n\" ];
then
sudo systemctl start Docker
sudo systemctl enable Docker
cd ~/Instalador-primario-CTC/bd-mysql
sudo docker-compose up -d 

sudo docker exec -it $(sudo docker ps -aqf "name=ContainerBD") mysql -u root -p -B -N -e "

USE ctc;

CREATE TABLE Linha ( idLinha INT PRIMARY KEY AUTO_INCREMENT,nomeLinha VARCHAR(45),situacaoLinha CHAR(10));

CREATE TABLE Estacao(idEstacao INT PRIMARY KEY AUTO_INCREMENT,nomeEstacao VARCHAR(45),situacaoEstacao CHAR(10),fkLinha INT,FOREIGN KEY (fkLinha) REFERENCES Linha(idLinha));

CREATE TABLE Maquina(idMaquina INT PRIMARY KEY AUTO_INCREMENT,modeloCPU VARCHAR(45),totalMemoria DOUBLE,totalDisco DOUBLE,dataCadastro DATETIME,fkEstacao INT,FOREIGN KEY (fkEstacao) REFERENCES Estacao(idEstacao));

CREATE TABLE UsoMaquina(idUso INT PRIMARY KEY AUTO_INCREMENT,temperaturaCPU DOUBLE,usoCPU DOUBLE,usoMemoria DOUBLE,upTime DATETIME,fkMaquina INT,FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina));

CREATE TABLE Cargo(idCargo INT PRIMARY KEY AUTO_INCREMENT,nomeCargo VARCHAR(45));

CREATE TABLE Funcionario(idFuncionario INT PRIMARY KEY AUTO_INCREMENT,nomeFuncionario VARCHAR(45),CPF CHAR(11),telefone CHAR(15),email VARCHAR(45),senha VARCHAR(45),fkLinha INT,FOREIGN KEY (fkLinha) REFERENCES Linha(idLinha),fkCargo INT,FOREIGN KEY (fkCargo) REFERENCES Cargo(idCargo));"

exit
exit

fi
else
echo "docker nao instalado"
echo "instalando docker..."
sudo apt install docker.io

sudo systemctl start Docker
sudo systemctl enable Docker

cd ~/Instalador-CTC/bd-mysql
sudo docker-compose up -d 

sudo docker exec -it $(sudo docker ps -aqf "name=ContainerBD") mysql -u root -p -B -N -e "

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
chmod 777 tJava.sh
chmod 777 tNode.sh
echo "Digite o proximo script para execucao da aplicacao (bash tJava.sh)"