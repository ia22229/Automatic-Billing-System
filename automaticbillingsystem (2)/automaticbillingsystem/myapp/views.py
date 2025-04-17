from datetime import datetime

from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
# from geopy import Location


from myapp.models import Login, Route, Vehicle, Route_point, Fair, User, Payment, Wallet, buscheckins, Location


def admin_login(request):
    return render(request,'loginindex.html')

def post_admin_login(request):
    username=request.POST['textfield']
    password=request.POST['textfield2']
    res=Login.objects.filter(username=username,password=password)
    print(res)
    if res.exists():
        lg=Login.objects.get(username=username,password=password)
        request.session['lid']=lg.id
        if lg.type=='admin':
         return HttpResponse('''<script>alert('success');window.location='/myapp/admin_home/'</script>''')
        elif lg.type=='policestation':
            return HttpResponse('''<script>alert('success');window.location='/myapp/police_home/'</script>''')
        else:
            return HttpResponse('''<script>alert('invalid username or password');window.location='/myapp/admin_login/'</script>''')

    else:
        return HttpResponse('''<script>alert('invalid username or password');window.location='/myapp/admin_login/'</script>''')

def admin_home(request):
    return render(request,"admin/adminindex.html")

def logout(request):
    request.session['lid'] = ''
    return redirect('/myapp/admin_login/')


def admin_change_pw(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert('Login Required');window.location='/myapp/admin_login/'</script>''')
    else:
        return render(request,'admin/admin_change_password.html')
def post_admin_change_pw(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert('Login Required');window.location='/myapp/admin_login/'</script>''')
    else:
        cpw = request.POST['password']
        newpw = request.POST['textfield2']
        cnp = request.POST['textfield3']
        lid = request.session['lid']
        log = Login.objects.get(id=lid)
        if log.password == cpw:
            if newpw == cnp:
                log.password = cnp
                log.save()
                return HttpResponse(
                    '''<script>alert('password changed');window.location='/myapp/admin_login/'</script>''')
            else:
                return HttpResponse('''<script>alert('invalid');window.location='/myapp/admin_change_pw/'</script>''')
        else:
            return HttpResponse('''<script>alert('invalid');window.location='/myapp/admin_change_pw/'</script>''')

def admin_add_route(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert('Login Required');window.location='/myapp/admin_login/'</script>''')
    else:
        return render(request, 'admin/admin_add_route.html')


def post_admin_add_route(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert('Login Required');window.location='/myapp/admin_login/'</script>''')
    else:
        route = request.POST['textfield']
        source = request.POST['textfield2']
        destination = request.POST['textfield3']


        robj = Route()
        if not Route.objects.filter(source=source,destination=destination).exists():
            robj.rname = route
            robj.source = source
            robj.destination = destination

            robj.save()
            return HttpResponse('''<script>alert('success');window.location='/myapp/admin_add_route/'</script>''')

        else:
            return HttpResponse('''<script>alert('route and destination already exists');window.location='/myapp/admin_add_route/'</script>''')



def admin_view_route(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert('Login Required');window.location='/myapp/admin_login/'</script>''')
    else:
        view = Route.objects.all()
        return render(request, 'admin/admin_view_route.html', {'data': view})


def post_admin_view_route(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert('Login Required');window.location='/myapp/admin_login/'</script>''')
    else:
        search = request.POST['textfield']
        var = Route.objects.filter(rname__icontains=search)
        return render(request, 'admin/admin_view_route.html', {'data': var})



def route_edit(request,id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert('Login Required');window.location='/myapp/admin_login/'</script>''')
    else:
        var = Route.objects.get(id=id)
        return render(request, 'admin/admin_route_edit.html', {'data': var})


def post_route_edit(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert('Login Required');window.location='/myapp/admin_login/'</script>''')
    else:
        id = request.POST['id']
        route = request.POST['route']
        source = request.POST['source']
        destination = request.POST['destination']


        obj = Route.objects.get(id=id)
        obj.rname = route
        obj.source = source
        obj.destination = destination
        obj.save()

        return HttpResponse('''<script>alert('success');window.location='/myapp/admin_view_route/'</script>''')


def route_delete(request,id):
    Route.objects.filter(id=id).delete()
    return HttpResponse('''<script>alert('success');window.location='/myapp/admin_view_route/'</script>''')

def Add_vehicle(request):
    a=Route.objects.all()
    return render(request,"admin/vehicle add.html",{"data":a})

def Add_vehicle_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert('Login Required');window.location='/myapp/admin_login/'</script>''')
    else:

        vehiclename=request.POST['textfield']
        vehiclenumber=request.POST['textfield2']
        photo=request.FILES['textfield3']
        model=request.POST['textfield4']
        route=request.POST['route']

        l=Login()
        l.username=vehiclename
        import random
        pas=random.randint(000,999)
        l.password=str(pas)
        l.type='vehicle'
        l.save()


        fs = FileSystemStorage()
        date = datetime.now().strftime('%Y%m%d-%H%M%S') + ".jpg"
        fs.save(date, photo)
        path = fs.url(date)

        obj=Vehicle()
        obj.vehicle_name=vehiclename
        obj.vehicle_number=vehiclenumber
        obj.photo=path
        obj.model=model
        obj.ROUTE_id=route
        obj.LOGIN=l
        obj.save()
        return HttpResponse('''<script>alert('vehicle added');window.location='/myapp/admin_home/'</script>''')

def edit_vehicle(request,id):
    a=Route.objects.all()
    b=Vehicle.objects.get(id=id)
    return render(request,"admin/vehicle edit.html",{"data":a,"data2":b})

def edit_vehicle_post(request):
    vehiclename=request.POST['textfield']
    vehiclenumber=request.POST['textfield2']
    model=request.POST['textfield4']
    route=request.POST['route']
    id=request.POST['id']
    obj=Vehicle.objects.get(id=id)

    if 'textfield3' in request.FILES:
        photo = request.FILES['textfield3']

        fs = FileSystemStorage()
        date = datetime.now().strftime('%Y%m%d-%H%M%S') + ".jpg"
        fs.save(date, photo)
        path = fs.url(date)
        obj.photo = path


    obj.vehicle_name=vehiclename
    obj.vehicle_number=vehiclenumber
    obj.model=model
    obj.ROUTE_id=route
    obj.save()
    return HttpResponse('''<script>alert('vehicle editted');window.location='/myapp/view_vehicle/'</script>''')

def view_vehicle(request):
    res=Vehicle.objects.all()
    return render(request,"admin/vehicle view.html",{"data":res})


def delete_vehicle(request,id):
    Vehicle.objects.filter(id=id).delete()
    return HttpResponse('''<script>alert('vehicle deleted');window.location='/myapp/view_vehicle/'</script>''')

def route_point_add(request):
    e=Route.objects.all()
    return render(request,"admin/admin_add_route_point.html",{"data":e})
def route_point_add_post(request):
    route=request.POST['route']
    place=request.POST['textfield']
    latitude=request.POST['textfield2']
    longitude=request.POST['textfield4']

    obj=Route_point()
    obj.ROUTE_id=route
    obj.place=place
    obj.latitude=latitude
    obj.longitude=longitude
    obj.save()
    return HttpResponse('''<script>alert('route point added');window.location='/myapp/admin_home/'</script>''')


def route_point_edit(request,id):
    e = Route.objects.all()
    w=Route_point.objects.get(id=id)
    return render(request, "admin/admin_route_point_edit.html", {"data": e,"data2":w})


def route_point_edit_post(request):
    route = request.POST['route']
    place = request.POST['textfield']
    latitude = request.POST['textfield2']
    longitude = request.POST['textfield4']
    id=request.POST['id']


    obj = Route_point.objects.get(id=id)
    obj.ROUTE_id = route
    obj.place = place
    obj.latitude = latitude
    obj.longitude = longitude
    obj.save()
    return HttpResponse('''<script>alert('route point added');window.location='/myapp/admin_home/'</script>''')
def view_routepoint(request):
    a=Route_point.objects.all()
    return render(request,"admin/route point view.html",{"data":a})

def delete_routepoint(request,id):
    Route_point.objects.filter(id=id).delete()
    return HttpResponse('''<script>alert('route point deleted');window.location='/myapp/admin_home/'</script>''')

def add_fair(request):
    d=Route_point.objects.all()
    w=Route_point.objects.all()
    return render(request,"admin/addfair.html",{"data1":d,"data2":w})

def add_fair_post(request):
    routepoint1=request.POST['route1']
    routepoint2=request.POST['route2']
    fair=request.POST['textfield']

    obj=Fair()
    obj.ROUTE_POINT1_id=routepoint1
    obj.ROUTE_POINT2_id=routepoint2
    obj.fair=fair
    obj.save()
    return HttpResponse('''<script>alert('fair added');window.location='/myapp/admin_home/'</script>''')


def edit_fair(request,id):
    d = Route_point.objects.all()
    w = Route_point.objects.all()
    r=Fair.objects.get(id=id)
    return render(request, "admin/edit fair.html", {"data1": d, "data2": w,"data":r})


def edit_fair_post(request):
    routepoint1 = request.POST['route1']
    routepoint2 = request.POST['route2']
    fair = request.POST['textfield']
    id=request.POST['id']

    obj = Fair.objects.get(id=id)
    obj.ROUTE_POINT1_id = routepoint1
    obj.ROUTE_POINT2_id = routepoint2
    obj.fair = fair
    obj.save()
    return HttpResponse('''<script>alert('fair editted');window.location='/myapp/admin_home/'</script>''')
def view_fair(request):
    q=Fair.objects.all()
    return render(request,"admin/view fair.html",{"data":q})
def delete_fair(request,id):
    Fair.objects.filter(id=id).delete()
    return HttpResponse('''<script>alert('fair editted');window.location='/myapp/admin_home/'</script>''')


def admin_view_booking_details(request):
    a=buscheckins.objects.all()
    return render(request,'admin/view_booking_details.html',{"data":a})

def admin_view_booking_details_post(request):
    frmdate = request.POST['textfield']
    todate = request.POST['textfield2']
    a = buscheckins.objects.filter(date__range=[frmdate, todate])
    return render(request,'admin/view_booking_details.html',{"data":a})


def admin_view_payment_details(request):
    a=Payment.objects.all()
    return render(request,'admin/view_payment_details.html',{"data":a})

def admin_view_payment_details_post(request):
    frmdate = request.POST['textfield']
    todate = request.POST['textfield2']
    a = Payment.objects.filter(date__range=[frmdate, todate])
    return render(request,'admin/view_payment_details.html',{"data":a})









##################################################3

def user_login_post(request):
    uname = request.POST['uname']
    password = request.POST['password']
    lobj = Login.objects.filter(username=uname, password=password)
    if lobj.exists():
        lobjj = Login.objects.get(username=uname, password=password)
        lid = lobjj.id
        if lobjj.type == 'user':
            return JsonResponse({'status':'ok', 'lid': str(lid),'type':'user'})
        if lobjj.type == 'vehicle':
            lid = lobjj.id
            dobj = Vehicle.objects.get(LOGIN__id=lid)
            return JsonResponse({'status': 'ok', 'lid': str(lid), 'type': 'vehicle'})
        else:
            return JsonResponse({'status': 'no'})
    else:
        return JsonResponse({'status': 'no'})


def signup_post(request):
    name = request.POST['uname']
    dob = request.POST['dob']
    gender = request.POST['gender']
    phn = request.POST['phone']
    email = request.POST['email']
    place = request.POST['place']
    pin = request.POST['pin']
    post = request.POST['post']
    pw=request.POST['password']
    state=request.POST['state']
    district=request.POST['district']
    confirmpassword=request.POST['confirmpassword']
    photo = request.POST['photo']


    date = datetime.now().strftime("%Y%m%d-%H%M%S")+".jpg"

    import base64

    a = base64.b64decode(photo)

    fh = open("C:\\Users\\hp\\Downloads\\automaticbillingsystem (2)\\automaticbillingsystem\\media\\user\\" + date , "wb")

    path = "/media/user/" + date
    fh.write(a)
    fh.close()



    lobj = Login()
    lobj.username = email
    lobj.password = confirmpassword
    lobj.type = 'user'
    lobj.save()



    obj = User()
    obj.uname = name
    obj.dob = dob
    obj.gender = gender
    obj.email = email
    obj.phone = phn
    obj.photo = path
    obj.place = place
    obj.state=state
    obj.district=district
    obj.post = post
    obj.pin = pin
    obj.LOGIN = lobj
    obj.save()

    wallet = Wallet()
    wallet.USER = obj
    wallet.amount = 0
    wallet.save()
    return JsonResponse({'status': 'ok'})


def edit_user_profile(request):
    name = request.POST['name']
    email = request.POST['email']
    gender = request.POST['gender']
    phone = request.POST['phone']
    dob = request.POST['dob']
    place = request.POST['place']
    district = request.POST['district']
    pin = request.POST['pin']
    photo = request.POST['photo']
    state = request.POST['state']
    post=request.POST['post']
    lid = request.POST['lid']

    if len(photo)>5:

        import datetime
        import base64

        date = datetime.datetime.now().strftime("%Y%m%d-%H%M%S")
        a = base64.b64decode(photo)
        fh = open("C:\\Users\\hp\\Downloads\\automaticbillingsystem (2)\\automaticbillingsystem\\media\\user\\" + date, "wb")
        path = "/media/user/" + date
        fh.write(a)
        fh.close()
        drv = User.objects.get(LOGIN_id=lid)
        drv.photo = path
        drv.save()
    drv = User.objects.get(LOGIN_id=lid)
    drv.uname = name
    drv.email = email
    drv.gender = gender
    drv.phone = phone
    drv.dob = dob
    drv.place = place
    drv.district = district
    drv.pin = pin
    drv.post=post
    drv.state = state

    drv.save()

    log = Login.objects.get(id=lid)
    log.username = email
    log.save()
    return JsonResponse({"status":"ok"})


def view_user_profile(request):
    lid=request.POST['lid']
    uobj=User.objects.get(LOGIN_id=lid)

    return JsonResponse({"status": "ok",
            "uname":uobj.uname,
            "dob": uobj.dob,
            "photo": uobj.photo,
            "gender": uobj.gender,
            "place": uobj.place,
            "post": uobj.post,
            "pin": uobj.pin,
            "email": uobj.email,
            "phone": uobj.phone,
            "state": uobj.state,
            "district": uobj.district
                         })



def updatelocation(request):
    print(request.POST)
    lat = request.POST['lat']
    lon = request.POST['lon']
    did = request.POST['lid']


    ob = Location.objects.filter(VEHICLE__LOGIN_id=did)

    if ob.exists():
        ob = Location.objects.get(VEHICLE__LOGIN_id=did)
        ob.latitude = lat
        ob.longtiude = lon
        ob.date = datetime.now()
        ob.time = datetime.now().strftime("%H:%M:%S")
        ob.save()
        print("===============")
        return JsonResponse({"status": "ok"})

    else:
        ob = Location()
        ob.latitude = lat
        ob.longitude = lon
        ob.date = datetime.now()
        ob.time = datetime.now().strftime("%H:%M:%S")
        ob.VEHICLE= Vehicle.objects.get(LOGIN_id=did)

        ob.save()
        print("+++++++++++++++++")
        return JsonResponse({"status": "ok"})

def ViewWalletPage_report(request):
    lid=request.POST['lid']
    res=Wallet.objects.filter(USER__LOGIN_id=lid)
    l=[]
    for i in res:
        l.append({"id": i.id,
                  "amount":i.amount,
                         })
        return  JsonResponse({"status":"ok","data":l})



def flutt_send_payment(request):
    lid = request.POST["lid"]
    amt = request.POST["amt"]
    if Wallet.objects.filter(USER__LOGIN=lid).exists():
        d=Wallet.objects.get(USER__LOGIN=lid)
        d.amount=int(d.amount)+int(amt)
        d.save()
        return JsonResponse({"status": "ok"})
    else:
        obj=Wallet()
        obj.amount=amt
        obj.USER=User.objects.get(LOGIN=lid)
        obj.save()
        # Booking.objects.filter(id=bid).update(status="paid")
        return JsonResponse({"status": "ok"})


def view_booking_details(request):
    lid=request.POST['lid']
    res=buscheckins.objects.filter(USER__LOGIN_id=lid)
    l=[]
    for i in res:
        l.append({"id": i.id,
                  "name":i.USER.uname,
                  "vehicle":i.VEHICLE.vehicle_name,
                  "routpoint1":i.ROUTPOINT1.ROUTE.source,
                  "routpoint2":i.ROUTPOINT2.ROUTE.destination,
                  "date":i.date,
                  "checkintime":i.checkintime,
                  "checkouttime":i.checkouttime,
                         })
    return JsonResponse({"status": "ok","data":l})

def view_payment(request):
    lid=request.POST['lid']
    res=Payment.objects.filter(USER__LOGIN_id=lid)
    l=[]
    for i in res:
        l.append({"id": i.id,
                  "date":i.date,
                  "amount": i.amount,
                  "status": i.status,})

    return JsonResponse({"status": "ok","data":l})

























