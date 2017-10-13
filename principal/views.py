from django.shortcuts import render
from django.http import HttpResponse
from .models import Test
from django.template import loader


def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

def test(request):
	test_list = Test.objects.all()
	template = loader.get_template('principal/index.html')
	context = {
		'test_list': test_list,
	}
	return HttpResponse(template.render(context, request))