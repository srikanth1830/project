<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MYIRCTC Registration</title>
    <style>
        /* 1. Reset and base setup */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            position: relative;
        }

        /* 2. Automated faded watermark background */
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background-image: url('images/train-bg.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            opacity: 0.15; /* Makes your normal image look like a watermark */
        }

        /* 3. Form container card */
        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
            margin: 20px;
            box-sizing: border-box;
        }

        /* 4. Circular Profile Photo Section */
        .profile-wrapper {
            text-align: center;
            margin-bottom: 15px;
        }
        .profile-img {
            width: 110px;
            height: 110px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #007bff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }

        /* 5. Typography styling */
        h1 { 
            font-size: 22px; 
            margin-bottom: 5px; 
            text-align: center;
            color: #333;
        }
        p {
            text-align: center;
            color: #666;
            margin-top: 0;
            margin-bottom: 20px;
        }

        /* 6. Form fields styling */
        label {
            font-weight: bold;
            display: block;
            margin-top: 12px;
            color: #444;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        /* 7. Submit Button styling */
        button[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 15px;
            transition: background 0.2s;
        }
        button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- Profile photo at the very top -->
        <div class="profile-wrapper">
            <img src="images/my-profile.png" alt="Profile Photo" class="profile-img">
        </div>

        <h1>Welcome to MYIRCTC website developed by Saidemy!!</h1>
        <p>Provide below information to book a train ticket!!<br>Please fill in this form</p>
        <hr>

        <form action="action_page.php">
            <label for="name"><b>Name</b></label>
            <input type="text" placeholder="Enter Name" name="name" id="name" required>

            <label for="email"><b>Email</b></label>
            <input type="text" placeholder="Enter Email" name="email" id="email" required>

            <label for="aadhar"><b>Aadhar Number</b></label>
            <input type="text" placeholder="Enter Aadhar Number" name="aadhar" id="aadhar" required>

            <label for="mother"><b>Mother Name</b></label>
            <input type="text" placeholder="Mother Name" name="mother" id="mother" required>

            <label for="father"><b>father Name</b></label>
            <input type="text" placeholder="Father Name" name="father" id="father" required>

            <label for="pancard"><b>pan card</b></label>
            <input type="text" placeholder="pan card" name="pancard" id="pancard" required>

            <label for="votercard"><b>voter card</b></label>
            <input type="text" placeholder="voter card" name="votercard" id="votercard" required>

            <label for="brothername"><b>brother name</b></label>
            <input type="text" placeholder="brother name" name="brothername" id="brothername" required>

            <label for="RamseyBolton"><b>Ramsey Bolton</b></label>
            <input type="text" placeholder="Ramsey Bolton" name="RamseyBolton" id="RamseyBolton" required>
            
            <hr>
            <button type="submit">Submit Registration</button>
        </form>
    </div>

</body>
</html>
