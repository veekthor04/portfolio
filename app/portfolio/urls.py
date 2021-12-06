from django.urls import path
from django.views.decorators.cache import cache_page

from portfolio.views import HomePageView

urlpatterns = [
    path("", cache_page(60*60)(HomePageView.as_view()), name="home-page")
]
