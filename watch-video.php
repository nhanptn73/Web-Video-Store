<?php
session_start();
require($_SERVER['DOCUMENT_ROOT'] . "/page/db/connection.php");

require($_SERVER['DOCUMENT_ROOT'] . "/page/function/format.php");

// Quay lại trang chủ nếu request không có parameter.
if (!isset($_GET["v"])) {
    header("Location: /"); // Sử dụng link tuyệt đối tính từ root, vì vậy có dấu / đầu tiên.
} else {
    $sql = "SELECT user.id AS user_id, privacy, `path`, title, profile_image, `description`, `like`, view, upload_date, `name`
            FROM video, user WHERE video.user_id = user.id AND video.id = ?";

    $watchVideo = $conn->prepare($sql);
    $watchVideo->execute(array($_GET["v"]));

    // Lấy các video trong database ở chế độ public.
    $sql = "SELECT video.id AS video_id, thumbnail, title, `name`, view, upload_date FROM video, user 
    WHERE video.user_id = user.id AND privacy = 0";

    $videos = $conn->prepare($sql);
    $videos->execute();
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
    <link rel="icon" type="image/x-icon" href="https://www.freeiconspng.com/thumbs/youtube-logo-png/hd-youtube-logo-png-transparent-background-20.png">
    <title>YouTube</title>
    <link rel="stylesheet" href="./public/css/style3.css">
</head>

<body>
    <div id="container-youtube">
        <!-- header -->
        <?php require_once "./page/user/header.php"; ?>

        <!-- nav -->
        <?php require_once "./page/user/sidebar.php"; ?>

        <!-- container -->
        <div id="container-video">
            <div id="watch-video">
                <div id="notification-wrapper"></div>
                <div class="watch-video_grid">
                <?php
                    if ($watchVideo->rowCount() > 0) {
                        $watchVideo = $watchVideo->fetch(PDO::FETCH_ASSOC);

                        if ($watchVideo["privacy"] == 0) { // Video public.
                ?>
                    <div class="watch-video_grid-left">
                        <div class="video-play">
                            <video controls autoplay src="<?php echo $watchVideo["path"]; ?>"></video>
                        </div>
                        <div class="video-content">
                            <div class="video-content-heading">
                                <h3><?php echo $watchVideo["title"]; ?></h3>
                                <div class="video-content-infor">
                                    <a href="/profile.php?user=<?php echo $watchVideo["user_id"] ?>">
                                        <img class="image-profile" src="<?php echo $watchVideo["profile_image"]; ?>" alt="IMAGE">
                                    </a>
                                    <div class="video-content-infor_name_sub">
                                        <span><?php echo $watchVideo["name"]; ?></span>
                                        <span><!--171N người đăng ký--></span>
                                    </div>
                                </div>
                                <div class="video-content-description">
                                    <div class="video-content-description-view">
                                        <span><?php echo readable_number($watchVideo["view"]); ?> lượt xem</span>
                                        <span><?php echo time_elapse($watchVideo["upload_date"]); ?></span>
                                    </div>
                                    <p><?php echo $watchVideo["description"]; ?></p>
                                </div>
                            </div>
                        <?php 
                            // Cập nhật video view count.
                            $sql = "UPDATE video SET view = view + 1 WHERE id = ?";

                            $stmt = $conn->prepare($sql);
                            $stmt->execute(array($_GET["v"]));
                        ?>
                            <div class="reload-comment">
                        <?php
                            // Lấy comment từ cơ sở dữ liệu.
                            $sql = "SELECT comment.id as id, profile_image, `name`, comment FROM comment, user 
                                    WHERE comment.user_id = user.id AND video_id = ?
                                    ORDER BY id DESC";

                            $comments = $conn->prepare($sql);
                            $comments->execute(array($_GET["v"]));
                        ?>
                            </div>
                            <div class="video-comment">
                                <div class="video-content-comment">
                                    <div class="video-content-comment__number"><?php echo $comments->rowCount(); ?> bình luận</div>
                                    <div class="video-content-comment__post">
                                    <!-- Check session image. -->
                                    <img class="image-profile" src="<?php echo $myUser["profile_image"]; ?>" alt="IMAGE">
                                        <div class="video-content-comment__form">
                                            <input class="video-content-comment__video" type="hidden" name="video-id" value="<?php echo $_GET["v"]; ?>">
                                            <input class="video-content-comment__input" type="text" name="comment" placeholder="Viết bình luận...">
                                            <div class="video-content-comment__line"></div>
                                            <button class="btn-comment" type="submit" disabled>Bình luận</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="video-content-comment__list">
                        <?php
                            while ($comment = $comments->fetch(PDO::FETCH_ASSOC)) {
                        ?>
                                    <div class="video-content-comment__item">
                                        <img class="image-profile"src="<?php echo $comment["profile_image"]; ?>" alt="IMAGE">
                                        <div class="video-content-comment__item-heading">
                                            <div>
                                                <span><?php echo $comment["name"]; ?></span>
                                                <span></span>
                                            </div>
                                            <p><?php echo $comment["comment"]; ?></p>
                                        </div>
                                    </div>
                        <?php } ?>
                                </div>
                            </div>
                        </div>
                    </div>                       
                    <div class="watch-video_grid-right">
                        <div class="video-offer">
                            <div class="video-offer__ist">
                        <?php
                            while ($video = $videos->fetch(PDO::FETCH_ASSOC)) { 
                        ?>
                                <div class="video-offer__item">
                                    <div class="video-offer__img"> 
                                        <img class="img-offer" src="<?php echo $video["thumbnail"]; ?>" alt="">
                                    </div>
                                    <div class="video-offer__content">
                                        <h3><?php echo $video["title"]; ?></h3>
                                        <span><?php echo $video["name"]; ?></span>
                                        <span><?php echo readable_number($video["view"]) ." lượt xem " .time_elapse($video["upload_date"]); ?></span>
                                    </div>
                                </div>
                        <?php } ?>
                            </div>
                        </div>
                    </div>
                <?php
                        } else { // Video private.
                ?>
                            <div class="watch-video_grid-left">
                                <h3 class="title-form">Đây là video riêng tư</h3>
                            </div>
                            <div class="watch-video_grid-right"></div>
                <?php
                        }
                    } else {
                ?>
                        <div class="watch-video_grid-left">
                            <h3 class="title-form">Video không tồn tại</h3>
                        </div>
                        <div class="watch-video_grid-right"></div>
                <?php
                    }
                ?>
                    
                </div>
            </div>
        </div>
        <!-- footer -->
    </div>
</body>
<?php require_once "./page/user/script.php"; ?>
<script src="/public/js/users/script.js"></script>
</html>