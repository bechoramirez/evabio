from django.db import models

class Genero(models.Model):
    nombre = models.CharField(max_length=200)

class TipoTarjeta(models.Model):
    descripcion = models.CharField(max_length=200)


class Cheque(models.Model):
    nom_banco = models.CharField(max_length=200)
    nro_cheque = models.IntegerField()
    fecha_chque = models.DateField()
    monto_cheque = models.IntegerField()
    estado_cheque = models.CharField(max_length = 200)