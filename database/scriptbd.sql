USE ctc;

CREATE TABLE UsoMaquina(
    idUso INT PRIMARY KEY AUTO_INCREMENT,
    temperaturaCPU DOUBLE,
    usoCPU DOUBLE,
    usoMemoria DOUBLE,
    upTime DATETIME,
    fkMaquina INT
    );