from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^test/$', views.test, name = 'test'),
    #url(r'^test/(?P<test>[0-9]+)/$', views.detail, name = 'detail'),
]