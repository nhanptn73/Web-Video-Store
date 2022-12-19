<?php
session_start();
require($_SERVER['DOCUMENT_ROOT'] . "/page/db/connection.php");

require($_SERVER['DOCUMENT_ROOT'] . "/page/function/format.php");

// Kiểm tra cố parameter không, trở về trang chủ nếu không có.
if (!isset($_GET["user"])) {
    header("Location: /"); // Sử dụng link tuyệt đối tính từ root, vì vậy có dấu / đầu tiên.
} else {
    // Lấy thông tin user.
    $sql = "SELECT id, `name`, username, email, profile_image FROM user WHERE id = ?";

    $user = $conn->prepare($sql);
    $user->execute(array($_GET["user"]));
}
?>
<!DOCTYPE html>
<html lang="en">
    <link rel="stylesheet" href="/public/css/users/style.css">
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
            <img class="avatar" src="<?php echo $user["profile_image"]; ?>">
            <div class="flex-view">
                <div class="flex-item-row">
                    <h1><?php echo $user["name"]; ?></h1>
                    <p><?php echo $user["username"]; ?></p>
                    <p><?php echo $user["email"]; ?></p>
                </div>
        <?php
            if (isset($_SESSION["user"])) {
                if ($_SESSION["user"] == $_GET["user"]) {
        ?>          
                <div class="flex-item-col">
                    <form action="/edit-profile.php" method="post">
                        <input type="hidden" name="user" value="<?php echo $_GET["user"]; ?>">
                        <button type="submit">Edit profile</button>
                    </form>
                    
                    <a href="/page/user/upload.php"><button>Upload video</button></a>
                </div>
        <?php
                }
            }
        ?>
                
            </div>
        </div>
        <div id="container-video">
            <div class="container-video-list">
                <div class="container-video-type"></div>
                <div class="container-video-grid">
                    <?php 
                        // Lấy tất cả video ở chế độ công khai của người dùng.
                        $sql = "SELECT video.id AS video_id, thumbnail, `length`, profile_image, title, `name`, view, upload_date FROM video, user 
                                WHERE video.user_id = user.id AND privacy = 0 AND user.id = ?";

                        $videos = $conn->prepare($sql);
                        $videos->execute(array($_GET["user"]));
                        
                        while ($video = $videos->fetch(PDO::FETCH_ASSOC)) { 
                    ?>
                        <a href="watch-video.php?v=<?php echo $video["video_id"]; ?>" class="container-video-item">
                            <div class="container-video-img">
                                <img src="<?php echo $video["thumbnail"]; ?>" alt="IMAGE">
                                <span><?php echo $video["length"]; ?></span>
                                <div class="container-video-icon-play">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px"  class="icon icon-tabler icon-tabler-player-play" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="none">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                        <path d="M7 4v16l13 -8z"/>
                                    </svg>       
                                    <h3>Phát</h3>
                                </div>                       
                            </div>
                            <div class="container-video-content">
                                <div class="container-video-content-img">
                                    <img src="<?php echo $video["profile_image"]; ?>" alt="IMAGE">
                                </div>
                                <div class="container-video-content-title">
                                    <h3><?php echo $video["title"]; ?></h3>
                                    <div class="container-video-content-channel">
                                        <span><?php echo $video["name"]; ?></span>
                                        <span><?php echo readable_number($video["view"]); ?> lượt xem • <?php echo time_elapse($video["upload_date"]); ?></span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    <?php } ?>
                </div>
            </div>
            <?php
                } else {
            ?>      
                    <div class="container-profile">
                        <h3 class="title-form">Người dùng không tồn tại</h3>
                    </div>
            <?php } ?>
        </div>
</body>
<script src="./public/js/script.js"></script>
</html>