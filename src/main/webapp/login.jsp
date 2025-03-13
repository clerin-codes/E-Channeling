<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>E-Channelling System Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <!-- Custom styles -->
    <style>
        body {
            height: 100vh;
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            font-family: 'Arial', sans-serif;
        }
        .form-signin {
            width: 100%;
            max-width: 360px;
            padding: 30px;
            margin: auto;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        }
        .form-signin img {
            filter: drop-shadow(0 0 5px rgba(0,0,0,0.2));
        }
        .form-signin h1, .form-signin h2 {
            color: #4a4a4a;
        }
        .form-floating {
            margin-bottom: 15px;
        }
        .form-control {
            border: none;
            border-bottom: 2px solid #ced4da;
            border-radius: 0;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #764ba2;
        }
        .btn-primary {
            background: linear-gradient(to right, #667eea, #764ba2);
            border: none;
            border-radius: 50px;
            padding: 10px 20px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }
        .btn-outline-secondary {
            border-radius: 50px;
            transition: all 0.3s ease;
        }
        .btn-outline-secondary:hover {
            background-color: #764ba2;
            border-color: #764ba2;
            color: white;
        }
        .checkbox label {
            color: #4a4a4a;
        }
        .alert-danger {
            background-color: #f8d7da;
            border-color: #f5c6cb;
            color: #721c24;
            border-radius: 10px;
        }
    </style>
</head>
<body class="text-center">
    <main class="form-signin">
        <form action="login" method="POST">
            <img class="mb-4" src="images/icons8-health-64.png" alt="" width="72" height="72">
            <h1 class="h3 mb-3 fw-normal">E-Channelling System</h1>
            <h2 class="h5 mb-3 fw-normal">Please sign in</h2>

            <% if(request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= request.getAttribute("errorMessage") %>
            </div>
            <% } %>

            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInput" name="uid" placeholder="Username" required>
                <label for="floatingInput"><i class="fas fa-user me-2"></i>Username</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" name="pass" placeholder="Password" required>
                <label for="floatingPassword"><i class="fas fa-lock me-2"></i>Password</label>
            </div>

            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" value="remember-me"> Remember me
                </label>
            </div>
            <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>

            <div class="mt-3">
                <a href="pRegister.jsp" class="btn btn-outline-secondary w-100 mb-2">Create New Account</a>
                <a href="Admin.jsp" class="btn btn-outline-secondary w-100">Admin Login</a>
            </div>

            <p class="mt-5 mb-3 text-muted">&copy; 2024 E-Channelling System</p>
        </form>
    </main>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>