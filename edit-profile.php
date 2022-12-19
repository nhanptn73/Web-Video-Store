<?php
session_start();
require($_SERVER['DOCUMENT_ROOT'] . "/page/db/connection.php");

require($_SERVER['DOCUMENT_ROOT'] . "/page/function/format.php");

// Yêu cầu đăng nhập.
if (!isset($_SESSION["user"])) {
    header("Location: /login.php");
    die();
// Chỉ cho phép chính người dùng của trang.
} else if ($_SESSION["user"] != $_POST["user"]) {
    header("Location: /profile.php?user=" .$_POST["user"]);
    die();
} else {
    // Lấy thông tin user.
    $sql = "SELECT id, `name`, username, email, profile_image FROM user WHERE id = ?";

    $user = $conn->prepare($sql);
    $user->execute(array($_POST["user"]));
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons@latest/iconfont/tabler-icons.min.css">
    <!-- Format css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="./public/img/favicon-logo.png">
    <link rel="stylesheet" href="./public/css/style.css">
    <link rel="stylesheet" href="./public/css/style1.css">
    <title>YouTube</title>
</head>

<body>
    <div id="container-youtube">
        <!-- header -->
        <?php require_once "./page/user/header.php"; ?>

        <!-- nav -->
        <?php require_once "./page/user/sidebar.php"; ?>

        <?php 
            if ($user->rowCount() > 0) {
                $user = $user->fetch(PDO::FETCH_ASSOC);
        ?>
        <!-- container -->
        <div class="container-profile">
            <img class="avatar-edit" src="<?php echo $user["profile_image"]; ?>">
            <h1 class="center-text"> Chỉnh sửa thông tin</h1>
            <form class="edit" action="/page/function/edit-profile.php">
                <table class="center-table">
                    <input id="user-id" type="hidden" name="id" value="<?php echo $_POST["user"]; ?>">
                    <tr>
                        <td>
                            <input type="text" name="name" placeholder="Name" value="<?php echo $user["name"]; ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="username" placeholder="Username" value ="<?php echo $user["username"]; ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="email" name="email" placeholder="Email" value="<?php echo $user["email"]; ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="save-btn" type="submit" value="Save">
                        </td>
                    </tr>
                </table>
            </form>
            <h1 style="color:red;" id="edit-error" class="center-text"></h1>
        </div>
        <?php } ?>
    </div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        // Request POST và xử lý response chỉnh sửa profile.
        $("form.edit").submit(function(e) {
            e.preventDefault();
            console.log($("form.edit").serialize())
            $.post("/page/function/edit-profile.php", $("form.edit").serialize(), function(response) {
                response = $.parseJSON(response);
                if (response["status"]) {
                    window.location.href = "Location: /profile.php?user=" + $("#user_id").value();
                } else {
                    $("#edit-error").text(response["message"]);
                }
            });
        });
    });
</script>
<script src="./public/js/script.js"></script>

</html>