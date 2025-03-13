<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Stylish Registration Form</title>

<!-- CSS only -->
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
crossorigin="anonymous">
</script>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

<style>
    body {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        font-family: 'Arial', sans-serif;
    }
    .card {
        border: none;
        border-radius: 15px;
        box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        overflow: hidden;
    }
    .card-body {
        background: #fff;
    }
    .form-outline {
        position: relative;
        margin-bottom: 1.5rem;
    }
    .form-control {
        border: none;
        border-bottom: 2px solid #ced4da;
        border-radius: 0;
        padding-left: 30px;
    }
    .form-control:focus {
        box-shadow: none;
        border-color: #4e73df;
    }
    .form-label {
        position: absolute;
        top: 0;
        left: 30px;
        transition: all 0.2s ease;
    }
    .form-control:focus + .form-label,
    .form-control:not(:placeholder-shown) + .form-label {
        font-size: 0.8rem;
        top: -15px;
        color: #4e73df;
    }
    .btn-primary {
        background: linear-gradient(to right, #4e73df, #224abe);
        border: none;
        border-radius: 50px;
        padding: 10px 30px;
        transition: all 0.3s ease;
    }
    .btn-primary:hover {
        transform: translateY(-3px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    }
    .fas {
        position: absolute;
        top: 10px;
        left: 5px;
        color: #4e73df;
    }
    .h1 {
        color: #4e73df;
        text-transform: uppercase;
        letter-spacing: 2px;
    }
    .img-fluid {
        transition: all 0.3s ease;
    }
    .img-fluid:hover {
        transform: scale(1.05);
    }
</style>

</head>
<body>
<section class="vh-100">
<div class="container h-100">
<div class="row d-flex justify-content-center align-items-center h-100">
<div class="col-lg-12 col-xl-11">
<div class="card text-black">
<div class="card-body p-md-5">
<div class="row justify-content-center">
<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Register</p>

<form action="preg" method="POST" class="mx-1 mx-md-4">

<div class="d-flex flex-row align-items-center mb-4">
<div class="form-outline flex-fill mb-0">
<i class="fas fa-user fa-lg me-3 fa-fw"></i>
<input name="pname" type="text" id="form3Example1c" class="form-control" placeholder=" " />
<label class="form-label" for="form3Example1c">Your Name</label>
</div>
</div>

<div class="d-flex flex-row align-items-center mb-4">
<div class="form-outline flex-fill mb-0">
<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
<input name="username" type="text" id="form3Example3c" class="form-control" placeholder=" " />
<label class="form-label" for="form3Example3c">User Name</label>
</div>
</div>

<div class="d-flex flex-row align-items-center mb-4">
<div class="form-outline flex-fill mb-0">
<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
<input name="password" type="password" id="form3Example4c" class="form-control" placeholder=" " />
<label class="form-label" for="form3Example4c">Password</label>
</div>
</div>

<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
<button type="submit" class="btn btn-primary btn-lg">Register</button>
</div>

</form>

</div>
<div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
class="img-fluid" alt="Sample image">

</div>
</div>
</div>
</div>
</div>
</div>
</div>
</section>

</body>
</html>