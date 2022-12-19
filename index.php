<?php
	session_start();
	require($_SERVER['DOCUMENT_ROOT'] ."/page/db/connection.php");

    require($_SERVER['DOCUMENT_ROOT'] ."/page/function/format.php");

    // Lấy tag chọn video.
    if (isset($_POST["tag"])) {
        $_SESSION["tag"] = $_POST["tag"];
        die();
    }

    // Lấy tất cả chuyên mục.
    $sql = "SELECT id, `name` FROM tag";

    $tags = $conn->prepare($sql);
    $tags->execute();
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="./public/img/favicon-logo.png">
    <link rel="stylesheet" href="./public/css/style.css">
    <title>YouTube</title>
</head>
<body>
    <div id="container-youtube">
        <!-- header -->
        <?php require_once "./page/user/header.php";?>

        <!-- nav -->
        <?php require_once "./page/user/sidebar.php";?>

        <!-- container -->
        <div id="container-video">
            <div class="container-video-list">
                <div class="container-video-type">
                    <a class="container-video-type-item active">Tất cả</a>
                    <?php 
                        while ($tag = $tags->fetch(PDO::FETCH_ASSOC)) {
                            echo "<a data-id=\"" .$tag["id"] ."\"class=\"container-video-type-item\">" .$tag["name"] ."</a>";
                        } 
                    ?>
                </div>
                <div class="container-video-grid">
                    <?php 
                        // Lấy tất cả video được đề xuất và public theo chuyên mục.
                        $sql = "SELECT video.id AS video_id, thumbnail, `length`, profile_image, title, `name`, view, upload_date FROM video, user 
                                WHERE video.user_id = user.id AND (feature = 1 OR ?) AND privacy = 0 AND (tag_id = ? OR ?)";

                        $videos = $conn->prepare($sql);
                        if (isset($_SESSION["tag"])) {
                            $videos->execute(array(TRUE, $_SESSION["tag"], FALSE));
                            unset($_SESSION["tag"]);
                        } else { // Không có chuyên đề được chọn.
                            $videos->execute(array(FALSE, 0, TRUE));
                        }
                        
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
        </div>
        <!-- footer -->
    </div>
</body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $(".container-video-type-item").click(function() {
                $(".container-video-type-item").removeClass("active");
                $(this).addClass("active");
                $.post("/index.php", {tag: $(this).data("id")}, function(response) {
                    $(".container-video-grid").load("index.php .container-video-grid")
                });
            });
        });
    </script>
    <script src="./public/js/script.js"></script>
</html>