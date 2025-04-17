"""automaticbillingsystem URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include

from automaticbillingsystem import settings
from myapp import views

urlpatterns = [
    path('admin_login/', views.admin_login),
    path('post_admin_login/', views.post_admin_login),
    path('admin_home/', views.admin_home),
    path('admin_change_pw/', views.admin_change_pw),
    path('post_admin_change_pw/', views.post_admin_change_pw),
    path('admin_add_route/', views.admin_add_route),
    path('post_admin_add_route/', views.post_admin_add_route),
    path('admin_view_route/', views.admin_view_route),
    path('post_admin_view_route/', views.post_admin_view_route),
    path('route_edit/<id>', views.route_edit),
    path('post_route_edit/', views.post_route_edit),
    path('route_delete/<id>', views.route_delete),
    path('Add_vehicle/', views.Add_vehicle),
    path('Add_vehicle_post/', views.Add_vehicle_post),
    path('edit_vehicle/<id>', views.edit_vehicle),
    path('edit_vehicle_post/', views.edit_vehicle_post),
    path('view_vehicle/', views.view_vehicle),
    path('delete_vehicle/<id>', views.delete_vehicle),
    path('route_point_add/', views.route_point_add),
    path('route_point_add_post/', views.route_point_add_post),
    path('route_point_edit/<id>', views.route_point_edit),
    path('route_point_edit_post/', views.route_point_edit_post),
    path('view_routepoint/', views.view_routepoint),
    path('delete_routepoint/<id>', views.delete_routepoint),
    path('add_fair/', views.add_fair),
    path('add_fair_post/', views.add_fair_post),
    path('edit_fair/<id>', views.edit_fair),
    path('edit_fair_post/', views.edit_fair_post),
    path('view_fair/', views.view_fair),
    path('delete_fair/<id>', views.delete_fair),
    path('user_login_post/', views.user_login_post),
    path('signup_post/', views.signup_post),
    path('edit_user_profile/', views.edit_user_profile),
    path('view_user_profile/', views.view_user_profile),
    path('logout/', views.logout),
    path('ViewWalletPage_report/', views.ViewWalletPage_report),
    path('flutt_send_payment/', views.flutt_send_payment),
    path('view_booking_details/', views.view_booking_details),
    path('view_booking_details/', views.view_booking_details),
    path('view_payment/', views.view_payment),
    path('updatelocation/', views.updatelocation),

    path('admin_view_booking_details/', views.admin_view_booking_details),
    path('admin_view_booking_details_post/', views.admin_view_booking_details_post),

    path('admin_view_payment_details/', views.admin_view_payment_details),
    path('admin_view_payment_details_post/', views.admin_view_payment_details_post),
]
