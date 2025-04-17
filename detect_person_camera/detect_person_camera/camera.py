import pymysql
import os
import cv2
import face_recognition
from DBConnection import Database
# Initialize database connection
db = Database()

busid=  "9"
# Queries to fetch criminals and missing persons
qry = "SELECT * FROM `myapp_user` "
people = db.select(qry)
def getdistance(lat11,lon11,lat21,lon21):

    lat1=str(lat11)
    lat2=str(lat21)
    lon1=str(lon11)
    lon2=str(lon21)



    qry="SELECT 6371 * ACOS(COS(RADIANS("+lat1+")) * COS(RADIANS("+lat2+")) * COS(RADIANS("+lon2+") - RADIANS("+lon1+")) + SIN(RADIANS("+lat1+")) * SIN(RADIANS("+lat2+")) ) AS distance_in_km"

    res=db.selectOne(qry)
    print(res,"kms")
    return  int(res['distance_in_km'])


def getfair(rt1,rt2):

    qry="SELECT `fair` FROM `myapp_fair` WHERE `ROUTE_POINT1_id`='"+str(rt1)+"' AND `ROUTE_POINT2_id`='"+str(rt2)+"'"
    db=Database()
    res=db.selectOne(qry)

    if res is not None:
        return float(res['fair'])
    else:
        return 20

def getcurrentstopofbus(busid):

    qry="SELECT `latitude`,`longtiude` FROM `myapp_location` WHERE `VEHICLE_id`='"+busid+"'"
    print(qry)
    res=db.selectOne(qry)

    print(res,"==============================")

    lat1= float(res['latitude'])
    lon1= float(res['longtiude'])



    qry="SELECT `myapp_route_point`.* FROM `myapp_route_point` WHERE `ROUTE_id` IN (SELECT  `ROUTE_id` FROM `myapp_vehicle` WHERE `id`='"+str(busid)+"')"

    resa=db.select(qry)

    rtid=[]
    dist=[]


    for i in resa:

        lat2=float(i['latitude'])
        lon2=float(i['longitude'])

        dista=getdistance(lat1,lon1,lat2,lon2)

        rtid.append(str(i['id']))
        dist.append(dista)


    for i in range(0,len(dist)):

        for j in range(0,len(dist)):


            if dist[i] > dist[j]:


                temp= dist[i]
                dist[i]= dist[j]
                dist[j]= temp

                temp = rtid[i]
                rtid[i] = rtid[j]
                rtid[j] = temp

    return rtid[0]

# Lists to store known face encodings and associated IDs/names
images = []
ids = []
names = []


# Function to process image and get face encoding
def process_image(photo_path):
    try:
        img = face_recognition.load_image_file(photo_path)
        face_encoding = face_recognition.face_encodings(img)[0]
        return face_encoding
    except Exception as e:
        print(f"Error processing image {photo_path}: {e}")
        return None

# Process criminals' photos
for c in people:
    s = c["photo"]
    s = s.replace("/media/user/", "")
    # Ensure the path is correct, handle spaces properly
    full_path = f"C:\\Users\\hp\\Downloads\\automaticbillingsystem (2)\\automaticbillingsystem\\media\\user\\{s}"
    print(f"Processing  photo: {full_path}")
    if os.path.exists(full_path):
        face_encoding = process_image(full_path)
        if face_encoding is not None:
            images.append(face_encoding)
            ids.append(c['id'])
            names.append(c['uname'])
    else:
        print(f"File not found: {full_path}")


# Start video capture
vid = cv2.VideoCapture(0)

while True:
    ret, frame = vid.read()
    if not ret:
        print("Failed to grab frame.")
        break

    # Save frame to a temporary file for face recognition processing
    cv2.imwrite("a.jpg", frame)
    cv2.imshow('Video Frame', frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

    # Load the image from the captured frame
    captured_image = face_recognition.load_image_file("a.jpg")
    face_encodings_in_frame = face_recognition.face_encodings(captured_image)
    num_faces = len(face_encodings_in_frame)

    print(num_faces,"total faces")

    if num_faces > 0:
        for i in range(num_faces):
            # Compare captured face with known faces (criminals and missing persons)
            criminal_matches = face_recognition.compare_faces(images, face_encodings_in_frame[i], tolerance=0.45)
            missing_matches = face_recognition.compare_faces(images, face_encodings_in_frame[i], tolerance=0.45)

            for j, match in enumerate(missing_matches):
                if match:
                    print(f"Match found for missing person ID: {ids[j]}, Name: {names[j]}")


                    qry="SELECT * FROM `myapp_buscheckins` WHERE `date`=CURDATE() AND `USER_id`='"+str(ids[j])+"' AND `VEHICLE_id`='"+str(busid)+"' and  `checkoutstatus`='pending'"
                    datas=db.select(qry)

                    if len(datas)==0:

                        qry="SELECT `id` FROM `myapp_buscheckins` WHERE `USER_id`='"+str(ids[j])+"' order by id DESC"
                        resy= db.select(qry)
                        if len(resy)>0:
                            qry = "SELECT TIMESTAMPDIFF(SECOND, checkouttime,CURTIME()) as a  from myapp_buscheckins where id='" + str(
                                resy[0]['id']) + "'"
                            dts2 = db.selectOne(qry)
                            if int(dts2['a']) > 30:
                                rt1=getcurrentstopofbus(busid)
                                qry = "INSERT INTO `myapp_buscheckins` (`date`,`checkinstatus`,`checkoutstatus`,`checkintime`,`checkouttime`,`ROUTPOINT1_id`,`ROUTPOINT2_id`,`USER_id`,`VEHICLE_id`) VALUES (CURDATE(),'in','pending',CURTIME(),CURTIME(),'"+str(rt1)+"',2,'" + str(
                                    ids[j]) + "','" + str(busid) + "')"
                                db.insert(qry)
                        else:
                            rt1 = getcurrentstopofbus(busid)
                            qry = "INSERT INTO `myapp_buscheckins` (`date`,`checkinstatus`,`checkoutstatus`,`checkintime`,`checkouttime`,`ROUTPOINT1_id`,`ROUTPOINT2_id`,`USER_id`,`VEHICLE_id`) VALUES (CURDATE(),'in','pending',CURTIME(),CURTIME(),'" + str(
                                rt1) + "',2,'" + str(
                                ids[j]) + "','" + str(busid) + "')"
                            db.insert(qry)
                    else:

                        id= datas[0]['id']
                        startinroutepointid= datas[0]['ROUTPOINT1_id']

                        qry="SELECT TIMESTAMPDIFF(SECOND, checkintime,CURTIME()) as a,id,ROUTPOINT1_id  from myapp_buscheckins where id='"+str(id)+"'"
                        dts= db.selectOne(qry)
                        print(int(dts['a']))

                        if int(dts['a']) >30:
                            rt2 = getcurrentstopofbus(busid)

                            amount=getfair(startinroutepointid,rt2)
                            qry="update myapp_buscheckins set checkoutstatus='out', checkouttime=curtime(),ROUTPOINT2_id='"+str(rt2)+"' where id='"+str(id)+"'"
                            db.update(qry)
                            # qry2="SELECT * FROM `myapp_buscheckins` WHERE `id`='"+str(id)+"';"
                            # dd=db.selectOne(qry2)
                            # print(dd['ROUTPOINT1_id'])
                            # print("gjhgjjjg")
                            # print(dd['ROUTPOINT2_id'])


                            ##u need to calculate amount of distance between startinroutepointid and rt2 here

                            # amount=20

                            qry="INSERT INTO `myapp_payment` (`date`,`amount`,`status`,`USER_id`) VALUES (CURDATE(),'"+str(amount)+"','done','"+str(ids[j])+"')"
                            db.insert(qry)

                            qry="UPDATE `myapp_wallet` SET `amount` = `amount`- "+str(amount)+" WHERE `USER_id`='"+str(ids[j])+"'"
                            print(qry)

                            db.update(qry)


vid.release()
cv2.destroyAllWindows()
