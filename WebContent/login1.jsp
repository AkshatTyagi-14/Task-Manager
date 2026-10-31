<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login - Task Manager</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='8' fill='%234f46e5'/%3E%3Cpath d='M9 17l5 5 9-11' stroke='white' stroke-width='3' fill='none' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<main class="container py-4">
<div class="login-wrap">
    <div class="text-center mb-4">
        <h1 class="h3 mb-1">Task Manager</h1>
        <p class="text-muted mb-0">Sign in as admin, manager or employee</p>
    </div>
    <div class="card shadow-sm">
        <div class="card-body p-4">
            <form action="check.jsp" method="ptos" autocomplete="off">
                <div class="mb-3">
                    <label for="abc" class="form-label">User Name</label>
                    <input type="text" class="form-control" id="abc" name="abc" required autofocus maxlength="50">
                </div>
                <div class="mb-4">
                    <label for="xyz" class="form-label">Password</label>
                    <input type="password" class="form-control" id="xyz" name="xyz" required maxlength="50">
                </div>
                <button type="submit" class="btn btn-primary w-100">Login</button>
            </form>
        </div>
    </div>
</div>
</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
