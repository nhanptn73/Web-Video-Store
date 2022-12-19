<?php
	session_start();
	require("./page/db/connection.php");
	require("./page/function/getid3/getid3.php");

    $upload_dir = "./uploads/videos/";

    // Thêm video vào cơ sở dữ liệu. 
    $sql = "INSERT INTO video(`user_id`, `tag_id`, `title`, `description`, `privacy`, `length`, `thumbnail`, `path`, `feature`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	$stmt = $conn->prepare($sql);
    // Temp?
    // tag_id = 14, thumbnail = default.PNG, feature = 0.
    $stmt->execute(array($_SESSION["user"], 14, $_POST["title"], $_POST["description"], $_POST["privacy"], '', "/uploads/thumbnails/default.PNG", $upload_dir, 0));

    $last_id = $conn->lastInsertId();

    // Đổi tên file nộp thành id.*
    $temp = explode(".", $_FILES["files"]["name"]);
    $file_path = $upload_dir .$last_id ."." .end($temp);
    move_uploaded_file($_FILES["files"]["tmp_name"],  $file_path);

    // Lấy chiều dài video.
    $getID3 = new getID3;
    $file = $getID3->analyze($file_path);

    // Cập nhật lại thông tin video trên database.
    $sql = "UPDATE video SET `length` = ?, `path` = ? WHERE id = ?";

	$stmt = $conn->prepare($sql);
    $stmt->execute(array($file['playtime_string'], substr($file_path, 1), $last_id));
?>