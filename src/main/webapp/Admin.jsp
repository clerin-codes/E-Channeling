<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Panel - E-Channelling System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.12), 0 4px 8px rgba(0,0,0,0.06);
        }
        .btn-custom {
            background-color: #4e73df;
            border-color: #4e73df;
            color: white;
            transition: all 0.3s;
        }
        .btn-custom:hover {
            background-color: #2e59d9;
            border-color: #2e59d9;
            transform: scale(1.05);
        }
        .header-bg {
            background: linear-gradient(to right, #4e73df, #224abe);
            color: white;
        }
    </style>
</head>
<body>

<header class="header-bg py-5 mb-5">
    <div class="container text-center">
        <img class="mb-4" src="images/icons8-administrative-tools-96.png" alt="Admin Tools" width="96" height="96">
        <h1 class="display-4 fw-bold">ADMIN PANEL</h1>
        <p class="lead">Manage doctors, medicines, and patients in the E-Channelling System.</p>
    </div>
</header>

<main class="container">
    <div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
        <div class="col">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <i class="fas fa-user-md fa-3x mb-3 text-primary"></i>
                    <h4 class="card-title">Doctors</h4>
                    <p class="card-text">Add new doctors to the system.</p>
                    <a href="addDoctor.jsp" class="btn btn-custom btn-lg mt-3">
                        <i class="fas fa-plus-circle me-2"></i>ADD DOCTOR
                    </a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <i class="fas fa-pills fa-3x mb-3 text-success"></i>
                    <h4 class="card-title">Medicine</h4>
                    <p class="card-text">Manage the medicine inventory.</p>
                    <a href="addMedicine.jsp" class="btn btn-custom btn-lg mt-3">
                        <i class="fas fa-plus-circle me-2"></i>ADD MEDICINE
                    </a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <i class="fas fa-user-plus fa-3x mb-3 text-info"></i>
                    <h4 class="card-title">Patients</h4>
                    <p class="card-text">Register new patients in the system.</p>
                    <a href="pRegister.jsp" class="btn btn-custom btn-lg mt-3">
                        <i class="fas fa-plus-circle me-2"></i>ADD PATIENT
                    </a>
                </div>
            </div>
        </div>
        
        
        
              <div class="col">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <i class="fas fa-user-md fa-3x mb-3 text-primary"></i>
                    <h4 class="card-title">Lab</h4>
                    <p class="card-text">Add new Lab to the system.</p>
                    <a href="addLab.jsp" class="btn btn-custom btn-lg mt-3">
                        <i class="fas fa-plus-circle me-2"></i>ADD LAB
                    </a>
                </div>
            </div>
        </div>
    </div>
</main>

<footer class="text-center mt-5 py-3 text-muted">
    <p>&copy; 2024 E-Channelling System. All rights reserved.</p>
</footer>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>