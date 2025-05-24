<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Complaint</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        header {
            background-color: #a81c1c;
            color: white;
            text-align: center;
            padding: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .form-container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        textarea {
            height: 80px;
            resize: none;
        }

        .hidden {
            display: none;
        }

        button {
            width: 100%;
            background-color: #a81c1c;
            color: white;
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #8b0000;
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 15px;
            }
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
    <header>Register Your Complaint</header>

    <div class="form-container">
        <h2>Complaint Registration</h2>
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