# coding=utf-8
from PyQt4.QtCore import *
from PyQt4.QtGui import *
import sys  # provee la interacción con el intérprete de Python
from PyQt4 import uic # carga archivos .ui
from PyQt4.QtSql import QSqlDatabase, QSqlQuery
import string

base1, form1 = uic.loadUiType('Registro.ui')  # carga la interface de usuario


class Reg(base1, form1):
    def __init__(self, parent=None):
        super(Reg, self).__init__(parent)
        self.setupUi(self)

        db = QSqlDatabase.addDatabase('QMYSQL')
        db.setHostName("localhost")
        db.setDatabaseName("TiendaVrt")
        db.setUserName("root")
        db.setPassword("")

        if not db.open():
            print("Could not open testdb database")
            print(db.lastError().driverText())
            print(db.lastError().databaseText())
        else:
            print("Database is OK  ")

        self.btnSalir.clicked.connect(self.close)
        self.btnAceptar.clicked.connect(self.reg_usuario)

    def reg_usuario(self):
        query = QSqlQuery()
        query.exec_("CALL InsertarCliente("+ self.txt_id.text() +",'"+ self.txt_nombre.text() +"','"+ self.txt_apellido.text()+"','"+ self.txt_direccion.text() +"'," + self.txt_telefono.text()+",'"+ self.txt_pass.text()+"');")
        QMessageBox.information(self,"", "Datos Ingresados con Exito")
        self.hide()
