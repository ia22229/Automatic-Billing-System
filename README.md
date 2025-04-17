
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

## 📧 Contact

For queries, feedback, or collaboration:
- Open an issue on this repository
- Email : ia9400265514@gmail.com

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).
