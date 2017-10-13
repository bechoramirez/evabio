from django.db import models

class Genero(models.Model):
    nombre = models.CharField(max_length=200)
    def __str__(self):
    	return self.nombre

class TipoTarjeta(models.Model):
    descripcion = models.CharField(max_length=200)
    def __str__(self):
    	return self.descripcion

class Cheque(models.Model):
    nom_banco = models.CharField(max_length=200)
    nro_cheque = models.IntegerField()
    fecha_chque = models.DateField()
    monto_cheque = models.IntegerField()
    estado_cheque = models.CharField(max_length = 200)
    def __str__(self):
    	return '%s %s' % (self.nom_banco, self.nro_cheque)

class Test(models.Model):
    nombre_test = models.CharField(max_length=200)
    precio_test = models.CharField(max_length=200)
    def __str__(self):
    	return self.nombre_test

class TestParametros(models.Model):
	descripcion = models.CharField(max_length=100)
	valor = models.IntegerField()
	test = models.ForeignKey(
    	'Test',
		on_delete=models.CASCADE,
    )
	genero = models.CharField(max_length = 1)
	def __str__(self):
		return '%s %s' % (self.descripcion, self.genero)

class Evaluacion(models.Model):
	test_parametro = models.ForeignKey(
			'TestParametros',
			on_delete=models.CASCADE,
		)
	cliente = models.ForeignKey(
		'Cliente',
		on_delete=models.CASCADE,
		)
	test = models.ForeignKey(
		'Test',
		on_delete=models.CASCADE,
		)
	fecha_evaluacion = models.DateTimeField()
	def __str__(self):
		return '%s %s %s %s' % (self.cliente.nombre, self.cliente.apellido, self.test.nombre_test, self.fecha_evaluacion)

class Cliente(models.Model):
	nombre = models.CharField(max_length=200)
	apellido = models.CharField(max_length=200)
	fec_nac = models.DateField()
	genero = models.CharField(max_length=1)
	def __str__(self):
		return '%s %s' % (self.nombre, self.apellido)

class Antropometria(models.Model):
	fecha = models.DateField()
	cliente = models.ForeignKey(
		'Cliente',
		on_delete = models.CASCADE,
		)
	peso = models.FloatField()
	altura = models.FloatField()
	bisep = models.FloatField()
	trisep = models.FloatField()
	cuadrisep = models.FloatField()
	def __str__(self):
		return '%s %s' % (self.cliente.nombre, self.cliente.apellido)