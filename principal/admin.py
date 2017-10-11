from django.contrib import admin

from .models import Genero,TipoTarjeta,Cheque

admin.site.register(Genero)
admin.site.register(TipoTarjeta)
admin.site.register(Cheque)