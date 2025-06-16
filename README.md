
# 🚍 Automated Fare Collection System for Public Transportation

This project presents an **automated fare collection system** designed to modernize public transportation. It utilizes onboard cameras and GPS data to automatically detect, track, and charge passengers based on the distance traveled—eliminating the need for manual fare collection, minimizing human error, and enhancing operational efficiency.

---

## 🎯 Key Features

- 🔁 **Automated Fare Collection**: No need for conductors—fares are computed and charged automatically.
- 📷 **Camera-based Passenger Detection**: Cameras capture boarding and exit points.
- 🧠 **Face Recognition**: Identifies passengers using facial detection; prompts new users to register.
- 📍 **GPS Tracking**: Determines boarding and exit locations using real-time latitude and longitude.
- 💰 **Distance-based Billing**: Calculates fare based on journey length.
- 🏦 **Wallet Integration**: Fare is deducted directly from a digital wallet.
- 🚫 **Fraud Prevention**: Reduces fare evasion and errors through automation.

---

## 🛠 How It Works

### Step 1: Start the System
- Turn on the system and activate the onboard camera.

### Step 2: Detect and Identify Passengers
- Live video is analyzed to detect passengers.
- Recognized faces are matched with IDs.
- Unrecognized passengers are prompted to register.

### Step 3: Boarding Detection
- When a passenger boards, the system records:
  - ⏰ Time of entry  
  - 📍 GPS location of entry  
  - 🆔 Passenger ID  

### Step 4: Exit Detection & Journey Tracking
- The system continuously monitors passenger presence.
- Upon exit, it records:
  - ⏰ Time of exit  
  - 📍 GPS location of exit  

### Step 5: Calculate Fare
- Determines distance between boarding and exit points using GPS coordinates.
- Computes total fare based on distance.

### Step 6: Deduct Payment
- Verifies the passenger's wallet balance.
- Deducts the calculated fare.
- Sends low-balance alerts if needed.
- Updates wallet and trip records.

### Step 7: Update System
- Saves complete journey information to the database.

---

## 💻 System Requirements

### 🧱 Hardware Requirements

| Component        | Specification           |
|------------------|-------------------------|
| **Processor**    | Intel Core i3 or above  |
| **Memory (RAM)** | 8 GB                    |
| **Storage**      | 40 GB or more           |

### 🧰 Software Requirements

| Category           | Details                        |
|--------------------|--------------------------------|
| **Operating System** | Windows 8 or higher          |
| **IDE**            | Android Studio, PyCharm        |
| **Front-End**      | HTML, CSS, JavaScript          |
| **Back-End**       | MySQL                          |
| **Languages**      | Python, Flutter                |

---

## 📂 Project Structure

```
automaticbilling/
├── main.py                   # Main application logic
├── camera_module.py          # Camera and face detection functionality
├── gps_module.py             # GPS coordinate processing
├── wallet_module.py          # Wallet handling logic
├── database/                 # Database schema and storage
├── utils/                    # Helper functions
├── requirements.txt          # Required libraries
└── README.md                 # Project documentation
```

---

## 🧪 Dependencies

Install all required Python packages using the following:

### 📦 `requirements.txt`

```
click==8.0.4
colorama==0.4.5
dlib==19.24.6
face-recognition==1.3.0
face-recognition-models==0.3.0
importlib-metadata==4.8.3
mysql-connector==2.2.9
numpy==1.19.5
opencv-python==4.4.0
Pillow==8.4.0
PyMySQL==1.0.2
setuptools==28.8.0
typing-extensions==4.1.1
zipp==3.6.0
```

To install, run:
```bash
pip install -r requirements.txt
```

---

## 🚀 Technologies Used

- **Python** – core logic and backend
- **OpenCV** – video capture and image processing
- **dlib + face-recognition** – for face detection & recognition
- **GPS module/APIs** – for location-based tracking
- **MySQL** – backend database
- **HTML/CSS/JavaScript** – optional frontend
- **Flutter** – mobile interface (optional extension)

---

## ✅ Benefits

- Reduces operational cost
- Prevents fare evasion
- Enhances commuter experience
- Improves data collection and analysis
- Supports future scalability with mobile apps or dashboards

---

## 📌 Future Improvements

- Add NFC/QR Code support for manual override
- Real-time passenger app using Flutter
- Admin dashboard with analytics
- Cloud sync and reporting
- Voice announcements or digital ticket confirmation

---

## Result Screenshots

WEB APP SCREENSHOT(ADMIN,MANAGER)

![Screenshot (334)](https://github.com/user-attachments/assets/67193557-8785-46b1-8fc1-6f6d005ba664)
![Screenshot (333)](https://github.com/user-attachments/assets/34f9a86d-d071-49b2-a755-bd38e51b2565)
![Screenshot (332)](https://github.com/user-attachments/assets/e7418db7-1e16-48d4-b9f9-65d32bca90d7)
![Screenshot (331)](https://github.com/user-attachments/assets/37da92b0-b6d5-417a-9253-4a4514b0de0c)
![Screenshot (330)](https://github.com/user-attachments/assets/8c3084c3-f99e-4342-9884-0ed5af8896ce)
![Screenshot (329)](https://github.com/user-attachments/assets/c1a24a78-2c36-492a-bedf-18b3cda8d93a)
![Screenshot (328)](https://github.com/user-attachments/assets/b77bd307-f7c3-40cb-9ca7-1d848f2d9ef4)
![Screenshot (327)](https://github.com/user-attachments/assets/28a82cc6-5fa3-462a-a3f7-1c88a04247d2)
![Screenshot (326)](https://github.com/user-attachments/assets/58d1f3ac-35d6-42ac-9dd9-ca0f6c6d9a7b)
![Screenshot (325)](https://github.com/user-attachments/assets/9e12c4eb-e102-47a2-8def-f06605527649)
![Screenshot (324)](https://github.com/user-attachments/assets/bcd6e728-02fb-4e86-9d80-3be9b9fc5626)
![Screenshot (323)](https://github.com/user-attachments/assets/355a7375-e70d-4a30-802f-3530de172514)
![Screenshot (321)](https://github.com/user-attachments/assets/983a1c59-0f2d-4e01-86b2-ed2968bb9dca)
![Screenshot (320)](https://github.com/user-attachments/assets/155ed5d1-ace7-41ab-82cf-165f9b5fcc5c)
![Screenshot (319)](https://github.com/user-attachments/assets/543cb591-b151-452c-ab97-e58585e45b68)
![Screenshot (318)](https://github.com/user-attachments/assets/d1018896-90f5-4849-b411-d722699b4525)
![Screenshot (317)](https://github.com/user-attachments/assets/1c2672e7-e9f5-43d0-89fc-3bc46ac9651b)
![Screenshot (313)](https://github.com/user-attachments/assets/c98eb85b-13c0-4ee8-baf8-abb23a8b6cf0)
![Screenshot (337)](https://github.com/user-attachments/assets/917c6217-da0c-4d92-9eb3-94743178ab86)
![Screenshot (336)](https://github.com/user-attachments/assets/f519190c-c884-42fc-8fe3-5609170b6c9f)
![Screenshot (335)](https://github.com/user-attachments/assets/205bc8f8-35e2-400f-a146-8f175e4e9465)


FLUTTER APP SCREENSHOT (BUS,CLIENT)

![Screenshot_2025-03-20-14-20-52-287_com example automaticbilling](https://github.com/user-attachments/assets/67cf7ac7-fe0c-4046-bbb3-e47abf8c7548)
![Screenshot_2025-03-20-13-56-53-085_com example automaticbilling](https://github.com/user-attachments/assets/68b8b313-9391-43fa-a6ca-b14efa81dca9)
![Screenshot_2025-03-20-13-56-46-749_com example automaticbilling](https://github.com/user-attachments/assets/dce11ac6-9459-441a-a02a-f7301bfe9738)
![Screenshot_2025-03-20-13-56-40-345_com example automaticbilling](https://github.com/user-attachments/assets/ad870763-6bdd-4ad5-84bc-9bfa9d9b7fbc)
![Screenshot_2025-03-20-13-56-36-955_com example automaticbilling](https://github.com/user-attachments/assets/073e99e0-a1e2-49a0-b5e8-6d3c895175eb)
![Screenshot_2025-03-20-13-56-26-604_com example automaticbilling](https://github.com/user-attachments/assets/9290aca0-2de1-4d6c-be16-6ed82bc844a3)
![Screenshot_2025-03-20-13-55-50-106_com example automaticbilling](https://github.com/user-attachments/assets/378bdebb-3e60-48aa-af03-496546457ded)
![Screenshot_2025-03-20-13-55-37-350_com example automaticbilling](https://github.com/user-attachments/assets/cb6ab7ef-398b-4dc7-bbdf-5d03b26f6fe2)
![Screenshot_2025-03-20-13-55-30-053_com example automaticbilling](https://github.com/user-attachments/assets/0fb509a2-7751-4374-8b47-6ec03c69f4d8)
![Screenshot_2025-03-20-13-55-25-997_com example automaticbilling](https://github.com/user-attachments/assets/49dfdb78-fd44-495a-a901-4575f16d2999)
![Screenshot_2025-03-20-13-55-21-893_com example automaticbilling](https://github.com/user-attachments/assets/303e0050-cc95-47e3-a737-8a787a51e9ad)
![Screenshot_2025-03-20-13-55-19-343_com example automaticbilling](https://github.com/user-attachments/assets/89feb1fc-a0d7-44d6-ae07-f02ced8d1cb7)
![Screenshot_2025-03-20-13-54-19-526_com example automaticbilling](https://github.com/user-attachments/assets/9fb8789b-fd7e-4dce-8e0a-48b24e263bc5)
![Screenshot_2025-03-20-13-54-17-138_com example automaticbilling](https://github.com/user-attachments/assets/be268980-073b-4344-a163-05271eb9c7d5)
![Screenshot_2025-03-20-13-54-13-849_com example automaticbilling](https://github.com/user-attachments/assets/d01e115a-aab7-4a81-a0d8-f096ce3ddaba)
![Screenshot_2025-03-20-13-52-21-685_com example automaticbilling](https://github.com/user-attachments/assets/1aa1ccff-abf4-4631-8e78-92d26af20d0c)


---

## 📧 Contact

For queries, feedback, or collaboration:
- Open an issue on this repository
- Email : ia9400265514@gmail.com

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).
