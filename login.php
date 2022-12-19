<?php
	session_start();
    if (isset($_SESSION["user"])) {
        header("Location: /");
        die();
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./public/css/login.css">
    <title>WebTube</title>
</head>
<body>
    <div class="container">
        <div class="title-text">
            <div class="title login">
                Đăng Nhập
            </div>
            <div class="title signup">
                Đăng Ký
            </div>
        </div>
        <div class="form-container">
            <div class="slide-controls">
                <input type="radio" name="slide" id="login" checked>
                <input type="radio" name="slide" id="signup">
                <label for="login" class="slide login">Đăng Nhập</label>
                <label for="signup" class="slide signup">Đăng Ký</label>
                <div class="slider-tab"></div>
            </div>
            <div class="form-inner">
                <!-- Form đăng nhập -->
                <form action="#" class="login">
                    <div class="field">
                        <input type="text" id="login-username" name="login-username" placeholder="Nhập UserName" required>
                    </div>
                    <div class="field">
                        <input type="password" id="login-password" name="login-password" placeholder="Mật Khẩu" required>
                    </div>
                    <div class="pass-link">
                        <a href="#">Quên Mật Khẩu?</a>
                    </div>
                    <p id="login-error" style="color:red"></p>
                    <div class="field btn">
                        <div class="btn-layer"></div>
                        <input type="submit" id="login" name="login" value="Đăng Nhập">
                    </div>
                    <div class="signup-link">
                        Chưa Có Tài Khoản? <a href=""> Đăng Ký Ngay</a>
                    </div>
                </form>
                <!-- Form đăng ký -->
                <form action="#" class="signup">
                    <div class="field">
                        <input type="text" id="signup-username" name="signup-username" placeholder="Nhập UserName" required>
                    </div>
                    <div class="field">
                        <input type="text" id="signup-email" name="signup-email" placeholder="Nhập Email" required>
                    </div>
                    <div class="field">
                        <input type="password" id="signup-password" name="signup-password" placeholder="Nhập Mật Khẩu" required>
                    </div>
                    <div class="field">
                    <input type="password" id="signup-password-x2" name="signup-password-x2" placeholder="Nhập lại Mật Khẩu" required>
                    </div>
                    <p id="signup-error" style="color:red"></p>
                    <div class="field btn">
                        <div class="btn-layer"></div>
                        <input type="submit" id="signUp" name="signup_submit" value="Đăng Ký">
                    </div>
                </form>
           </div>
        </div>
        <!-- Thông báo đăng ký thành công. -->
        <div id="result" align="center" style="color:green; font-weight: bold;"></div>
    </div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="./public/js/login.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/firebase/7.14.1-0/firebase.js"></script>
</html>