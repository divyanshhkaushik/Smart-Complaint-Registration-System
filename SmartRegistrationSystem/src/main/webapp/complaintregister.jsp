<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Complaint</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f6f8;
            color: #34495e;
        }

        .header {
            background-color: #2c3e50;
            color: white;
            padding: 15px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .header-title {
            font-size: 1.5rem;
            font-weight: 600;
        }

        .back-btn {
            color: white;
            text-decoration: none;
            background: #3498db;
            padding: 8px 16px;
            border-radius: 5px;
            font-weight: 600;
            transition: background 0.3s;
        }

        .back-btn:hover {
            background: #2980b9;
        }

        @keyframes slideUpFade {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-container {
            max-width: 650px;
            margin: 50px auto;
            padding: 40px;
            background: white;
            border: 1px solid #ecf0f1;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            animation: slideUpFade 0.6s ease-out forwards;
        }

        .form-container h2 {
            text-align: center;
            color: #2c3e50;
            margin-top: 0;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 1.8rem;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #7f8c8d;
            font-size: 0.9rem;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            font-size: 14px;
            font-family: 'Poppins', sans-serif;
            border: 1px solid #dcdde1;
            border-radius: 6px;
            box-sizing: border-box;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #3498db;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
            outline: none;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        .hidden {
            display: none;
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            color: white;
            background-color: #3498db;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            margin-top: 10px;
        }

        button:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }

    </style>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const categoryDropdown = document.getElementById("category");
            const typeOfComplaintSection = document.getElementById("typeOfComplaintSection");
            const typeOfComplaintDropdown = document.getElementById("typeOfComplaint");
            const locationSection = document.getElementById("locationSection");
            const descriptionSection = document.getElementById("descriptionSection");

            // Predefined types of complaints for each category
            const categoryOptions = {
                Municipality: ["Garbage Collection", "Street Lights", "Road Repair"],
                Electricity: ["Power Outage", "Voltage Fluctuation", "Meter Issue"],
                Water: ["No Supply", "Water Contamination", "Low Pressure"],
            };

            // Listen for changes in the category dropdown
            categoryDropdown.addEventListener("change", function () {
                const selectedCategory = this.value;

                // Reset type of complaint dropdown
                typeOfComplaintDropdown.innerHTML = '<option value="">-- Select Type --</option>';

                if (selectedCategory && categoryOptions[selectedCategory]) {
                    // Populate type of complaint dropdown based on selected category
                    categoryOptions[selectedCategory].forEach(option => {
                        const newOption = document.createElement("option");
                        newOption.value = option;
                        newOption.textContent = option;
                        typeOfComplaintDropdown.appendChild(newOption);
                    });

                    // Show related sections
                    typeOfComplaintSection.classList.remove("hidden");
                    locationSection.classList.remove("hidden");
                    descriptionSection.classList.remove("hidden");
                } else {
                    // Hide all sections if no category is selected
                    typeOfComplaintSection.classList.add("hidden");
                    locationSection.classList.add("hidden");
                    descriptionSection.classList.add("hidden");
                }
            });
        });
    </script>
</head>
<body>
    <div class="header">
        <div class="header-title">Register Complaint</div>
        <a href="UserDashboard.jsp" class="back-btn">Back to Dashboard</a>
    </div>

    <div class="form-container">
        <h2>File a New Complaint</h2>
        <form action="complaintregisterservlet" method="POST">
    <!-- User Information -->
    <div class="form-group">
        <label for="fullName">Full Name</label>
        <input type="text" id="fullName" name="fullName" placeholder="Enter your full name" required>
    </div>

    <div class="form-group">
        <label for="phone">Phone</label>
        <input type="text" id="phone" name="phone" placeholder="Enter your phone number" required>
    </div>

    <!-- Complaint Category -->
    <div class="form-group">
        <label for="category">Complaint Category</label>
        <select id="category" name="category" required>
            <option value="">-- Select Category --</option>
            <option value="Municipality">Municipality</option>
            <option value="Electricity">Electricity</option>
            <option value="Water">Water</option>
        </select>
    </div>

    <!-- Type of Complaint -->
    <div id="typeOfComplaintSection" class="form-group hidden">
        <label for="typeOfComplaint">Type of Complaint</label>
        <select id="typeOfComplaint" name="typeOfComplaint">
            <option value="">-- Select Type --</option>
        </select>
    </div>

    <!-- Location -->
    <div id="locationSection" class="form-group hidden">
        <label for="location">Location</label>
        <input type="text" id="location" name="location" placeholder="Enter the location of the issue">
    </div>

    <!-- Description -->
    <div id="descriptionSection" class="form-group hidden">
        <label for="description">Description</label>
        <textarea id="description" name="description" placeholder="Provide additional details"></textarea>
    </div>

    <!-- Submit Button -->
    <button type="submit">Submit Complaint</button>
</form>
</div>
</body>
</html>