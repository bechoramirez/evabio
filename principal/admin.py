from django.contrib import admin

from .models import Genero,TipoTarjeta,Cheque,Test,TestParametros,Evaluacion,Cliente,Antropometria

admin.site.register(Genero)
admin.site.register(TipoTarjeta)
admin.site.register(Cheque)
admin.site.register(Test)
admin.site.register(TestParametros)
admin.site.register(Evaluacion)
admin.site.register(Cliente)
admin.site.register(Antropometria)