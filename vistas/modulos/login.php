<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Login Animado</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Animate.css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Iconos Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <style>
    body {
      background: linear-gradient(to right, #6a11cb, #2575fc);
      height: 100vh;
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .login-box {
      background: #fff;
      border-radius: 20px;
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
      max-width: 900px;
      width: 100%;
      height: 500px;
      overflow: hidden;
      display: flex;
      animation: fadeIn 1.2s ease-in-out;
    }

    .login-left {
      flex: 1;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }

    .centered-img {
      max-width: 80%;
      max-height: 80%;
      object-fit: contain;
      border-radius: 10px;
      animation: bounceIn 1.5s ease-in-out;
    }

    .login-right {
      flex: 1;
      padding: 50px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      animation: fadeInRight 1.5s ease-in-out;
    }

    .login-right h3 {
      font-weight: bold;
      text-align: center;
      color: #333;
      font-size: 2.5rem; /* Aumentar tamaño del título */
    }

    .text-muted {
      font-size: 1.2rem; /* Aumentar tamaño del mensaje */
    }

    .form-label {
      font-weight: 600;
      color: #444;
      font-size: 1.2rem; /* Aumentar tamaño de las etiquetas */
    }

    .form-control {
      border-radius: 12px;
      padding: 14px;
      font-size: 1.2rem; /* Aumentar tamaño de los campos de formulario */
      box-shadow: 0 0 5px rgba(0,0,0,0.05);
    }

    .btn-custom {
      background-color: #6a11cb;
      color: #fff;
      border-radius: 12px;
      transition: all 0.3s ease-in-out;
      font-size: 1.3rem; /* Aumentar tamaño del botón */
    }

    .btn-custom:hover {
      background-color: #4e0ec7;
      transform: scale(1.05);
    }

    .toggle-password {
      position: absolute;
      right: 15px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      color: #aaa;
      font-size: 1.5rem; /* Tamaño ajustado para el ícono */
      transition: all 0.3s ease-in-out;
    }

    .toggle-password:hover {
      color: #6a11cb; /* Cambio de color al pasar el ratón */
    }

    .password-container {
      position: relative;
    }

    @media (max-width: 768px) {
      .login-box {
        flex-direction: column;
        height: auto;
      }

      .login-left {
        height: 250px;
      }

      .login-right {
        padding: 30px;
      }
    }

    @keyframes bounceIn {
      0% {
        transform: scale(0);
      }
      60% {
        transform: scale(1.2);
      }
      100% {
        transform: scale(1);
      }
    }

  </style>
</head>
<body>

  <div class="login-box animate__animated animate__fadeInDown">
    <div class="login-left">
      <img src="vistas/img/plantilla/beta2.jpg" class="img-fluid centered-img" alt="Imagen Login">
    </div>
    <div class="login-right animate__animated animate__fadeInRight">

      <h3 class="animate__animated animate__bounceInDown mb-3">¡Bienvenido!</h3>
      <p class="text-center text-muted mb-4">Inicia sesión para continuar</p>

      <form method="post">
        <div class="mb-3">
          <label for="usuario" class="form-label">Usuario</label>
          <input type="text" class="form-control" id="usuario" name="ingUsuario" placeholder="Usuario" required>
        </div>

        <div class="mb-3 password-container">
          <label for="password" class="form-label">Contraseña</label>
          <input type="password" class="form-control" id="password" name="ingPassword" placeholder="Contraseña" required>
          <i class="bi bi-eye-slash toggle-password" id="togglePassword"></i>
        </div>

        <button type="submit" class="btn btn-custom w-100 animate__animated animate__pulse">Iniciar Sesión</button>

        <?php
          $login = new ControladorUsuarios();
          $login -> ctrIngresoUsuario();
        ?>
      </form>

    </div>
  </div>

  <script>
    $(document).ready(function () {
      $('#togglePassword').on('click', function () {
        const passwordField = $('#password');
        const type = passwordField.attr('type') === 'password' ? 'text' : 'password';
        passwordField.attr('type', type);
        $(this).toggleClass('bi-eye bi-eye-slash');
      });
    });
  </script>
</body>
</html>
