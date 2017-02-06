# coding=utf-8
from PyQt4 import QtGui

import PyQt4
import sys  # provee la interacción con el intérprete de Python
from PyQt4 import uic  # carga archivos .ui
from PyQt4.QtGui import QMessageBox
from PyQt4.QtSql import QSqlDatabase, QSqlQuery, QSqlRecord
import Registro #importa el documento .py
import Productos

base, form = uic.loadUiType('login.ui')  # carga la interface de usuario


class login(base, form):
    def __init__(self, parent=None):
        super(login, self).__init__(parent)
        self.setupUi(self)

        self.r = Registro.Reg() #llama la clase que sera en el documento .py
        self.p = Productos.products()
        self.btn_registro.clicked.connect(self.r.show) #muesta la clase en un boton
        self.btn_Ingresar.clicked.connect(self.p.show)

    def con(self): # conexion a la base y ejecuta un query
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
            query = QSqlQuery()
            query.exec_("select count(*) from Cliente where IdCliente = 304810952 and Contraseña = 'progra00';")
            print("Database is OK")
            db.close()


application = PyQt4.QtGui.QApplication(sys.argv)

l = login()
l.show()

application.exec_()
