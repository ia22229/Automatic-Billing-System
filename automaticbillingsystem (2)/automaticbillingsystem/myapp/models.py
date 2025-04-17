from django.db import models
from datetime import  datetime
# Create your models here.
class Login(models.Model):
    username=models.CharField(max_length=300)
    password=models.CharField(max_length=300)
    type=models.CharField(max_length=300)

class Route(models.Model):
    rname=models.CharField(max_length=300)
    source=models.CharField(max_length=300)
    destination=models.CharField(max_length=300)

class Vehicle(models.Model):
    vehicle_name=models.CharField(max_length=100 )
    vehicle_number=models.CharField(max_length=100)
    photo=models.CharField(max_length=500)
    model=models.CharField(max_length=500)
    ROUTE=models.ForeignKey(Route,on_delete=models.CASCADE)
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)


class Route_point(models.Model):
    ROUTE=models.ForeignKey(Route,on_delete=models.CASCADE)
    latitude=models.CharField(max_length=300)
    longitude=models.CharField(max_length=300)
    place=models.CharField(max_length=300)

class Fair(models.Model):
    ROUTE_POINT1=models.ForeignKey(Route_point,on_delete=models.CASCADE,related_name='routepoint1',default='')
    ROUTE_POINT2=models.ForeignKey(Route_point,on_delete=models.CASCADE,related_name='routepoint2',default='')
    fair=models.CharField(max_length=100)



class User(models.Model):
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    uname=models.CharField(max_length=300)
    dob=models.DateField()
    gender=models.CharField(max_length=300)
    place=models.CharField(max_length=300)
    post=models.CharField(max_length=300)
    pin=models.CharField(max_length=300)
    email=models.CharField(max_length=300)
    phone=models.CharField(max_length=300)
    state=models.CharField(max_length=100)
    district=models.CharField(max_length=100)
    photo=models.CharField(max_length=300)

class Payment(models.Model):
     date=models.DateField()
     amount=models.CharField(max_length=100)
     status=models.CharField(max_length=100)
     USER=models.ForeignKey(User,on_delete=models.CASCADE)

class Location(models.Model):
    VEHICLE=models.ForeignKey(Vehicle,on_delete=models.CASCADE)
    latitude=models.CharField(max_length=100,default=0)
    longtiude=models.CharField(max_length=100,default=0)


class Wallet(models.Model):
    USER=models.ForeignKey(User,on_delete=models.CASCADE)
    amount=models.BigIntegerField()



class buscheckins(models.Model):
    USER=models.ForeignKey(User,on_delete=models.CASCADE)
    VEHICLE= models.ForeignKey(Vehicle,on_delete=models.CASCADE)
    ROUTPOINT1= models.ForeignKey(Route_point,on_delete=models.CASCADE,related_name="a")
    ROUTPOINT2= models.ForeignKey(Route_point,on_delete=models.CASCADE,related_name="b")
    date=models.DateField(default=datetime.now())
    checkinstatus=models.CharField(max_length=40)
    checkoutstatus=models.CharField(max_length=40)
    checkintime= models.TimeField()
    checkouttime= models.TimeField()





