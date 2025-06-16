
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

![Screenshot (333)](https://github.com/user-attachments/assets/a5f456e7-2460-417e-bad4-129008dcbd7e)
![Screenshot (332)](https://github.com/user-attachments/assets/733ac9fb-4150-45bb-b194-837c16ee37f4)
![Screenshot (331)](https://github.com/user-attachments/assets/f47a1bdb-c42a-46e3-b8d9-7162dcef879d)
![Screenshot (330)](https://github.com/user-attachments/assets/ed7f6a29-119d-4059-b6ef-8b035b048a7b)
![Screenshot (329)](https://github.com/user-attachments/assets/3e24e9d0-06db-4e93-837c-d3ed7e76a3ff)
![Screenshot (328)](https://github.com/user-attachments/assets/ec4f91ba-2822-4db2-83a0-a455b7b23622)
![Screenshot (327)](https://github.com/user-attachments/assets/3f6f250a-6d2f-4858-8e3b-87820f1eeb93)
![Screenshot (326)](https://github.com/user-attachments/assets/f6ea790a-213f-488d-acca-715f0ed32fc8)
![Screenshot (325)](https://github.com/user-attachments/assets/9a415f81-b86c-4606-926c-063aac5c0b91)
![Screenshot (324)](https://github.com/user-attachments/assets/1f1fa7c9-d957-4586-bd69-71479ccaaa7c)
![Screenshot (323)](https://github.com/user-attachments/assets/c78b002a-8d19-403c-8ade-6d14ed33cdf3)
![Screenshot (322)](https://github.com/user-attachments/assets/2f9ded5b-11b5-47c2-b488-ee7756c2311b)
![Screenshot (321)](https://github.com/user-attachments/assets/f547278f-60f7-4342-8953-ae68c4430084)
![Screenshot (320)](https://github.com/user-attachments/assets/df20284c-52f6-429f-ab0a-298b1d703113)
![Screenshot (319)](https://github.com/user-attachments/assets/8cd3536b-d782-4bcd-afaa-72fc9b793e08)
![Screenshot (318)](https://github.com/user-attachments/assets/dbb2f7ec-a879-4892-a567-28e01df068ec)
![Screenshot (317)](https://github.com/user-attachments/assets/74821821-74d9-41ce-9051-609b3c418e22)
![Screenshot (313)](https://github.com/user-attachments/assets/0e0b2545-8d90-496b-80e5-166980461571)
![Screenshot (337)](https://github.com/user-attachments/assets/77c0811f-d5c9-4389-a1e6-29a14b3b124f)
![Screenshot (336)](https://github.com/user-attachments/assets/60b4ea76-265d-4879-bfb5-2bcd752c8546)
![Screenshot (335)](https://github.com/user-attachments/assets/f64e2d51-00ff-4d81-80b0-7e91a2c13da6)
![Screenshot (334)](https://github.com/user-attachments/assets/2718f1ed-0048-44bd-9588-f78fbf4972c4)
FLUTTER APP SCREENSHOT (BUS,CLIENT)
![Screenshot_2025-03-20-14-20-52-287_com example automaticbilling](https://github.com/user-attachments/assets/7a36ea8b-8682-4c55-9a10-0de370557f1d)
![Screenshot_2025-03-20-13-56-53-085_com example automaticbilling](https://github.com/user-attachments/assets/9d756e20-1237-4940-8571-a791faada1c4)
![Screenshot_2025-03-20-13-56-46-749_com example automaticbilling](https://github.com/user-attachments/assets/559d780d-1842-4326-ac05-7743cf1029b5)
![Screenshot_2025-03-20-13-56-40-345_com example automaticbilling](https://github.com/user-attachments/assets/b631de00-1deb-4ba7-bbf6-69b8e05968c2)
![Screenshot_2025-03-20-13-56-36-955_com example automaticbilling](https://github.com/user-attachments/assets/053ba2ba-8f1c-4a56-9189-701f82596a5a)
![Screenshot_2025-03-20-13-56-26-604_com example automaticbilling](https://github.com/user-attachments/assets/09b6acab-d895-403b-b951-d1e64abb31b7)
![Screenshot_2025-03-20-13-55-50-106_com example automaticbilling](https://github.com/user-attachments/assets/d9900f81-b951-4b2f-bed8-2c00773c84a2)
![Screenshot_2025-03-20-13-55-37-350_com example automaticbilling](https://github.com/user-attachments/assets/b79c3ed4-5c88-4243-b046-e0da4d4d9356)
![Screenshot_2025-03-20-13-55-30-053_com example automaticbilling](https://github.com/user-attachments/assets/f5100473-24ac-4646-a6c1-a9ee0d4d76e5)
![Screenshot_2025-03-20-13-55-25-997_com example automaticbilling](https://github.com/user-attachments/assets/f6a3575b-c8b1-4737-b964-4df0e105e672)
![Screenshot_2025-03-20-13-55-21-893_com example automaticbilling](https://github.com/user-attachments/assets/0d233a3b-e865-4e6c-bcf2-9f03eb361f9d)
![Screenshot_2025-03-20-13-55-19-343_com example automaticbilling](https://github.com/user-attachments/assets/79bdf74a-3af5-4438-bbca-4597d119eebe)
![Screenshot_2025-03-20-13-54-19-526_com example automaticbilling](https://github.com/user-attachments/assets/9f829f1a-0aa9-44dd-8854-0bd8a6f43f10)
![Screenshot_2025-03-20-13-54-17-138_com example automaticbilling](https://github.com/user-attachments/assets/636b961d-4309-4e7a-aa73-c67e5ac62c82)
![Screenshot_2025-03-20-13-54-13-849_com example automaticbilling](https://github.com/user-attachments/assets/f535d11b-94e6-4d56-997f-81f8aaa15d02)
![Screenshot_2025-03-20-13-52-21-685_com example automaticbilling](https://github.com/user-attachments/assets/caa8e342-1b2c-456c-928a-31ceb3eca12e)


---

## 📧 Contact

For queries, feedback, or collaboration:
- Open an issue on this repository
- Email : ia9400265514@gmail.com

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).
