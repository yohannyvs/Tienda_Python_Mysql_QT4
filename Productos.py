# coding=utf-8
import PyQt4
import sys  # provee la interacción con el intérprete de Python
from PyQt4 import uic  # carga archivos .ui
from PyQt4.QtSql import QSqlDatabase, QSqlQuery

base1, form1 = uic.loadUiType("Productos.ui")  # carga la interface de usuario


class products(base1, form1):
    def __init__(self, parent=None):
        super(products, self).__init__(parent)
        self.setupUi(self)

        self.btnSalir.clicked.connect(self.close)
        #self.btnAceptar.clicked.connect(self.reg_producto)

    def reg_producto(self):
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
            query.exec_("CALL TiendaVrt.InsertarProducto("+ self.txt_cod.text()+ ",'"+ self.txt_prod.text() +"', "+ self.txt_precio.text()+", "+self.txt_cant.text()+", "+ self.txt_cod_cat.text()+");")
            print("Database is OK  ")
            db.close()