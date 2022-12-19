-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2022 at 03:05 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ytbclone`
--
CREATE DATABASE IF NOT EXISTS `ytbclone` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ytbclone`;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL,
  `video_id` int(4) NOT NULL,
  `comment` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `video_id`, `comment`) VALUES
(1, 1, 1, 'Test Comment'),
(2, 1, 1, 'Spamming'),
(3, 2, 1, 'Hello!'),
(4, 3, 2, 'Nice video'),
(5, 1, 2, 'Test test'),
(6, 4, 2, 'Hello'),
(7, 3, 2, 'Hey'),
(8, 1, 2, 'asfasf'),
(9, 1, 9, 'Chào bạn'),
(10, 1, 5, 'Test'),
(11, 1, 5, 'Bình luận lại'),
(12, 1, 5, 'Test'),
(13, 10, 10, 'First'),
(14, 10, 10, 'Thử chức năng Reload comment'),
(15, 8, 9, '5 ngày trước'),
(16, 8, 9, 'Test comment'),
(17, 1, 12, 'aaa');

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE `like` (
  `id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL,
  `video_id` int(4) NOT NULL,
  `like` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL,
  `name` varchar(100) NOT NULL,
  `privacy` tinyint(1) NOT NULL,
  `update_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `playlist_detail`
--

CREATE TABLE `playlist_detail` (
  `id` int(4) NOT NULL,
  `playlist_id` int(4) NOT NULL,
  `video_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(4) NOT NULL,
  `name` varchar(30) NOT NULL,
  `video_size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `video_size`) VALUES
(1, 'admin', 0),
(2, 'user', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(4) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(1, 'Âm nhạc'),
(2, 'Trò chơi'),
(3, 'Tin tức'),
(4, 'Thể thao'),
(5, 'Hoạt hình'),
(6, 'Toán học'),
(7, 'Thủ công'),
(8, 'Du lịch'),
(9, 'Bóng đá'),
(10, 'Nấu ăn'),
(11, 'Thiên nhiên'),
(12, 'Hoạt họa'),
(13, 'Vlog'),
(14, 'Diễn thuyết'),
(15, 'Hướng dẫn');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(4) NOT NULL,
  `name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(80) NOT NULL,
  `profile_image` varchar(100) NOT NULL,
  `role_id` int(4) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`, `profile_image`, `role_id`, `status`) VALUES
(1, 'Nhân', 'admin', 'admin@gmail.com', '$2y$10$0P8Y8D0BDFeWnUfhW3r4Fu6fuLlCMxlYh7Aq8nNVID/XzyDD1Kq9i', '/uploads/avatars/1.png', 1, 0),
(2, 'user1', 'user1', 'user1@gmail.com', '$2y$10$0P8Y8D0BDFeWnUfhW3r4Fu6fuLlCMxlYh7Aq8nNVID/XzyDD1Kq9i', '/uploads/avatars/2.png', 2, 1),
(3, 'user2', 'user2', 'user2@gmail.com', '$2y$10$0P8Y8D0BDFeWnUfhW3r4Fu6fuLlCMxlYh7Aq8nNVID/XzyDD1Kq9i', '/uploads/avatars/3.png', 2, 0),
(4, 'user3', 'user3', 'user3@gmail.com', '$2y$10$0P8Y8D0BDFeWnUfhW3r4Fu6fuLlCMxlYh7Aq8nNVID/XzyDD1Kq9i', '/uploads/avatars/4.png', 2, 0),
(5, 'user4', 'user4', 'user4@gmail.com', '$2y$10$0P8Y8D0BDFeWnUfhW3r4Fu6fuLlCMxlYh7Aq8nNVID/XzyDD1Kq9i', '/uploads/avatars/5.png', 2, 0),
(6, 'user5', 'user5', 'user5@gmail.com', '$2y$10$0P8Y8D0BDFeWnUfhW3r4Fu6fuLlCMxlYh7Aq8nNVID/XzyDD1Kq9i', '/uploads/avatars/6.png', 2, 0),
(7, 'user6', 'user6', 'user6@gmail.com', '$2y$10$0P8Y8D0BDFeWnUfhW3r4Fu6fuLlCMxlYh7Aq8nNVID/XzyDD1Kq9i', '/uploads/avatars/7.png', 2, 0),
(8, 'user7', 'user7', 'user7@gmail.com', '$2y$10$0P8Y8D0BDFeWnUfhW3r4Fu6fuLlCMxlYh7Aq8nNVID/XzyDD1Kq9i', '/uploads/avatars/8.png', 2, 0),
(9, 'user8', 'user8', 'user8@gmail.com', '$2y$10$0P8Y8D0BDFeWnUfhW3r4Fu6fuLlCMxlYh7Aq8nNVID/XzyDD1Kq9i', '/uploads/avatars/9.png', 2, 0),
(10, 'user10', 'user10', 'user10@gmail.com', '$2y$10$0P8Y8D0BDFeWnUfhW3r4Fu6fuLlCMxlYh7Aq8nNVID/XzyDD1Kq9i', '/uploads/avatars/10.png', 2, 0),
(11, 'HelloWorld', 'HelloWorld', 'Test@gmail.com', '$2y$10$kgNOv2r/lM4zWr4kXjCu7e7zQuHt8iBi7WnI/gfHNsGVAl5zTtViS', '/uploads/avatars/default.PNG', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(4) NOT NULL,
  `user_id` int(4) NOT NULL,
  `tag_id` int(4) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `upload_date` datetime NOT NULL DEFAULT current_timestamp(),
  `like` int(11) NOT NULL DEFAULT 0,
  `view` int(11) NOT NULL DEFAULT 0,
  `privacy` tinyint(1) NOT NULL,
  `length` varchar(10) NOT NULL,
  `thumbnail` varchar(200) NOT NULL,
  `path` varchar(200) NOT NULL,
  `feature` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `user_id`, `tag_id`, `title`, `description`, `upload_date`, `like`, `view`, `privacy`, `length`, `thumbnail`, `path`, `feature`) VALUES
(1, 1, 3, 'Video 1', 'Video để test.', '2022-12-08 12:10:12', 0, 71, 0, '0:06', '/uploads/thumbnails/1.PNG', '/uploads/videos/1.mp4', 1),
(2, 3, 3, 'Video 2', 'Video hai để test.', '2022-12-07 23:10:12', 0, 51, 0, '0:11', '/uploads/thumbnails/2.PNG', '/uploads/videos/2.mp4', 1),
(3, 11, 1, 'Đây là video', 'Đây là mô tả', '2022-02-10 13:10:12', 0, 1235, 0, '0:15', '/uploads/thumbnails/3.PNG', '/uploads/videos/3.mp4', 1),
(4, 1, 2, 'Hello World', 'Chào', '2022-05-20 06:15:30', 0, 41045, 0, '0:06', '/uploads/thumbnails/4.PNG', '/uploads/videos/4.mp4', 1),
(5, 3, 4, 'Không phải video', 'Không có gì ở đây', '2021-12-09 18:42:52', 0, 14200022, 0, '0:06', '/uploads/thumbnails/5.PNG', '/uploads/videos/5.mp4', 1),
(6, 2, 5, '???', '?', '2020-07-12 08:09:10', 0, 1002110126, 0, '0:06', '/uploads/thumbnails/6.PNG', '/uploads/videos/6.mp4', 1),
(7, 8, 6, 'Bắt đầu với sản phẩm', 'Mô tả video.', '2022-12-12 20:14:32', 0, 51125, 0, '0:06', '/uploads/thumbnails/7.PNG', '/uploads/videos/7.mp4', 1),
(8, 2, 7, 'Đại học Tôn Đức Thắng', 'Tương tự như cách suy nghĩ của con người sẽ phản ứng lại khi tiếp nhận các tác nhân kích thích từ bên ngoài.', '2022-12-13 16:09:21', 0, 12, 1, '0:06', '/uploads/thumbnails/8.PNG', '/uploads/videos/8.mp4', 0),
(9, 5, 8, 'Tập giấy dán ghi nhớ', 'Tôi thích nghĩ lớn. Nếu đằng nào bạn cũng phải nghĩ, vậy thì hãy nghĩ lớn.', '2022-12-12 07:15:52', 0, 19, 0, '0:06', '/uploads/thumbnails/9.PNG', '/uploads/videos/9.mp4', 1),
(10, 7, 9, 'Mắt mèo', 'Chúng ta không có cơ hội làm quá nhiều điều nên hãy chắc chắn rằng mọi thứ chúng ta làm đều phải thật sự tuyệt vời. Bởi vì đây là cuộc đời của chúng ta.', '2022-12-16 15:15:52', 0, 9, 0, '0:06', '/uploads/thumbnails/10.PNG', '/uploads/videos/10.mp4', 1),
(11, 1, 4, 'Test Upload', 'Đây là video công khai', '2015-06-18 10:20:16', 0, 4102910, 0, '0:05', '/uploads/thumbnails/default.PNG', '/uploads/videos/11.mp4', 1),
(12, 1, 14, 'aaaa', 'fasasdsa', '2022-12-18 16:27:52', 0, 14, 0, '0:28', '/uploads/thumbnails/default.PNG', '/uploads/videos/12.mp4', 1),
(13, 1, 14, 'Uplaod', 'uplaod', '2022-11-18 20:01:05', 0, 1241, 0, '1:59', '/uploads/thumbnails/4.PNG', '/uploads/videos/13.m4v', 1),
(14, 1, 14, 'More video', 'Test Test', '2022-12-18 20:01:41', 0, 0, 1, '0:05', '/uploads/thumbnails/default.PNG', '/uploads/videos/14.mp4', 0),
(15, 8, 14, 'Spam Video', 'spaming', '2022-12-18 20:02:35', 0, 0, 0, '0:06', '/uploads/thumbnails/default.PNG', '/uploads/videos/15.mp4', 0),
(16, 8, 14, 'Những câu nói truyền cảm hứng từ những người thành công', 'Những người thành công không chỉ truyền cảm hứng về triết lý kinh doanh, phát triển sự nghiệp mà còn là những thông điệp tích cực về cuộc sống và giá trị nhân sinh.', '2022-12-18 20:03:34', 0, 0, 0, '0:14', '/uploads/thumbnails/default.PNG', '/uploads/videos/16.mp4', 1),
(17, 2, 6, 'Nhà Xuất Bản Giáo Dục Việt Nam', 'Hãy gọi tên người sáng chế vĩ đại nhất', '2017-04-30 01:23:35', 0, 1512423, 0, '0:06', '/uploads/thumbnails/6.PNG', '/uploads/videos/15.mp4', 1),
(18, 2, 7, 'Tả cảnh hai bên bờ', 'Nêu cảm nghĩ của em về cảnh đó', '2016-04-06 03:00:53', 0, 1512423, 0, '0:06', '/uploads/thumbnails/1.PNG', '/uploads/videos/16.mp4', 1),
(19, 2, 8, 'văn miêu tả cảnh sông nước', 'Phe nào chuyền được 6 chuyền là thắng. Phe thua phải cõng phe thắng chạy dọc con sông suốt từ bến tắm đến tận gốc đa', '2022-10-13 01:48:05', 0, 1123141, 0, '0:06', '/uploads/thumbnails/3.PNG', '/uploads/videos/17.mp4', 1),
(20, 2, 9, 'đẹp bởi có con sông chảy qua làng', 'Quanh năm cần mẫn, dòng sông chở nặng phù sa bồi đắp cho ruộng lúa. Buổi sớm tinh mơ, dòng nước mờ mờ phẳng lặng chảy. Giữa trưa, mặt sông nhấp nhô ánh bạc lẫn màu xanh nước biếc. Chiều tà, dòng nước trở thành màu khói trong, hơi tối âm âm', '2022-12-13 13:48:45', 0, 414141123, 0, '0:06', '/uploads/thumbnails/4.PNG', '/uploads/videos/18.mp4', 1),
(21, 3, 10, 'Hai bên bờ sông, nhà cửa lô nhô', 'Dưới chân cầu, nơi con sông đổ ra biển là cầu Cá. Thuyền đi biển sơn hai màu xanh đỏ, đậu san sát gần một mỏm đá nối lên như hòn non bộ', '2017-04-30 01:23:35', 0, 1512423, 0, '0:06', '/uploads/thumbnails/8.PNG', '/uploads/videos/19.mp4', 1),
(22, 3, 11, 'Sáng sớm nhìn ra bờ sông', 'Nắng sớm mai lấp lóa như dát vàng mặt nước. Dòng sông vẫn cuồn cuộn chảy đỏ sậm phù sa, mang nặng nghĩa tình của con sông đối với người và đất miền Tây', '2022-11-04 07:47:07', 0, 1512423, 0, '0:06', '/uploads/thumbnails/1.PNG', '/uploads/videos/20.mp4', 1),
(23, 3, 12, 'Những buổi sáng đẹp trời', 'Những ngày nghỉ học, em được chị hai cho đi theo. Thuyền đi trong sương sớm, ngồi trên thuyền, các bà các chị không ngớt lời trò chuyện', '2022-11-05 07:47:07', 0, 1512423, 0, '0:06', '/uploads/thumbnails/4.PNG', '/uploads/videos/21.mp4', 1),
(24, 4, 13, 'Dòng sông vang lên tiếng người cười nói', 'Những tiếng hò, tiêng hát vang lên như gọi mặt trời thức dậy. Những ngày không đi chợ cùng chị, em lại cùng các bạn đi cào hến, dậm trai ở ven sông', '2022-11-25 11:30:38', 0, 25852, 0, '0:06', '/uploads/thumbnails/1.PNG', '/uploads/videos/19.mp4', 1),
(25, 4, 14, 'đoạn văn miêu tả cảnh sông nước', 'Mỗi sớm mai, mặt sông phẳng lặng như gương. Dòng sông giống hệt dải lụa mềm mại trải dài tít tắp', '2022-12-10 06:07:49', 0, 124224, 0, '0:06', '/uploads/thumbnails/default.PNG', '/uploads/videos/20.mp4', 1),
(26, 4, 15, 'Nàng tiên Ốc', 'Tuổi cao, ốm yếu, sống một mình, hàng ngày mò cua bắt ốc sống qua ngày', '2022-11-25 06:33:09', 0, 3117, 0, '0:06', '/uploads/thumbnails/4.PNG', '/uploads/videos/21.mp4', 1),
(27, 4, 2, 'Xin con đừng đi', 'Cô gái biết ơn bà lão đã cứu mạng mình lại cảm thương số phận của bà nên đã đồng ý ở lại cùng bà', '2022-11-03 12:35:14', 0, 62670, 0, '0:06', '/uploads/thumbnails/1.PNG', '/uploads/videos/22.mp4', 1),
(28, 4, 2, 'Hội Của Người Lạc Việt Thời Hùng Vương', 'Viết Một Đoạn Văn Ngắn Nói Về Cuộc Sống Ăn Ở Sinh Hoạt Lễ Hội Của Người Lạc Việt Thời Hùng Vương, đón đọc mẫu văn sau để trau dồi thêm cho mình kiến thức hay.', '2022-12-11 01:20:30', 0, 101929, 0, '0:06', '/uploads/thumbnails/5.PNG', '/uploads/videos/23.mp4', 1),
(29, 5, 3, 'Dưới thời Hùng Vương', 'người Lạc Việt đã có những nét đặc trưng riêng về cuộc sống ăn, ở, sinh hoạt lễ hội. Thông qua các hiện vật của người xưa để lại', '2022-10-20 10:49:34', 0, 108693420, 0, '0:06', '/uploads/thumbnails/9.PNG', '/uploads/videos/24.mp4', 1),
(30, 5, 4, 'Sở thích của tôi là nghe nhạc', 'Tôi thích xem những bộ phim sitcom của Mỹ như How I met your mother, Once upon a time, Sabrina', '2022-08-25 01:35:48', 0, 6044, 0, '0:06', '/uploads/thumbnails/2.PNG', '/uploads/videos/25.mp4', 1),
(31, 5, 5, 'Sự bó buộc của xã hội phong kiến', 'sự tàn ác của những thế lực đen tối đã khiến cho cuộc đời của họ đầy những chông gai, sóng gió', '2022-08-05 06:34:59', 0, 12, 0, '0:06', '/uploads/thumbnails/5.PNG', '/uploads/videos/26.mp4', 1),
(32, 6, 6, 'HEllo', 'asdfsw', '2022-09-23 13:54:56', 0, 5467, 0, '0:06', '/uploads/thumbnails/10.PNG', '/uploads/videos/27.mp4', 1),
(33, 6, 7, 'More video', 'Bad tuber', '2022-03-05 05:07:08', 0, 12308, 0, '0:06', '/uploads/thumbnails/1.PNG', '/uploads/videos/28.mp4', 1),
(34, 6, 8, 'hello everyone', 'chungus', '2022-06-11 23:17:51', 0, 402952, 0, '0:06', '/uploads/thumbnails/4.PNG', '/uploads/videos/29.mp4', 1),
(35, 6, 9, 'what is this', 'new vid', '2022-06-16 14:04:42', 0, 758544, 0, '0:06', '/uploads/thumbnails/5.PNG', '/uploads/videos/30.mp4', 1),
(36, 7, 10, 'Tình mẫu thứ vô cùng đáng trân trọng', 'Chúng ta sinh ra sẽ thật may mắn và hạnh phúc nếu được sống trong sự yêu thương của những người thân', '2017-04-30 01:23:35', 0, 5939, 0, '0:06', '/uploads/thumbnails/10.PNG', '/uploads/videos/31.mp4', 1),
(37, 7, 11, 'Và trên hành trình trưởng thành từ những bước đi nhỏ bé đầu', 'Quả là, con dù lớn vẫn là con của mẹ – vẫn bé bỏng đối với mẹ và cần được che chở. Nhờ có tình mẫu tử mà con người có', '2011-04-30 01:23:35', 0, 1241, 0, '0:06', '/uploads/thumbnails/9.PNG', '/uploads/videos/32.mp4', 1),
(38, 7, 12, 'Đoạn Văn Tả Ngôi Trường', 'Ngôi trường của em đang học là ngôi trường nằm ở ngoại thành thành phố mang tên Bác, em yêu quý trường của em và em đến đây để học hằng ngày.', '2022-04-30 01:23:35', 0, 414123, 0, '0:06', '/uploads/thumbnails/8.PNG', '/uploads/videos/33.mp4', 1),
(39, 8, 13, 'Ba mẹ em nói là đi', 'học con phải ngoan và làm theo lời cô giáo dặn', '2022-12-10 04:32:58', 0, 1241211, 0, '0:06', '/uploads/thumbnails/7.PNG', '/uploads/videos/34.mp4', 1),
(40, 9, 14, 'Đại dịch COVID-19 đã và đang tiếp tục là một thách thức đặc biệt không chỉ với riêng Việt Nam', 'sự vào cuộc quyết liệt, không', '2022-05-16 13:11:21', 0, 1099052, 0, '0:06', '/uploads/thumbnails/5.PNG', '/uploads/videos/35.mp4', 1),
(41, 9, 15, 'Nhưng chính trong thời điểm này', 'Hằng ngày, em đến trường bằng chiếc xe đạp cũ của mẹ cho', '2022-01-15 08:32:16', 0, 54438, 0, '0:06', '/uploads/thumbnails/4.PNG', '/uploads/videos/36.mp4', 1),
(42, 9, 1, 'Yên xe được thay mới nên rất êm', 'Xe còn có giỏ phía trước để em đựng cặp khi đi học. Xích xe quay đều kêu rè rè nhưng xe đạp rất nhẹ', '2022-03-19 18:38:18', 0, 554526, 0, '0:06', '/uploads/thumbnails/3.PNG', '/uploads/videos/37.mp4', 1),
(43, 9, 2, 'Văn Tả Đồ Vật', 'Các bạn của em đều thích chiếc xe đạp này. Em rất tự hào đã tự mình đến trường bằng xe đạp, không phiền bố mẹ phải đưa đón', '2022-04-23 13:09:34', 0, 5529023, 0, '0:06', '/uploads/thumbnails/2.PNG', '/uploads/videos/38.mp4', 1),
(44, 10, 3, 'Ngôi trường của em đang học có nhiều bóng', 'Khi mùa thu về', '2022-07-03 16:30:34', 0, 796730, 0, '0:06', '/uploads/thumbnails/2.PNG', '/uploads/videos/39.mp4', 1),
(45, 10, 4, 'Phía xa ngoài cánh đồng', 'Không khí mùa thu khiến cho con người cảm thấy thật dễ chịu, nhẹ nhàng. Không dừng lại ở đó, mùa thu còn có những kí ức đẹp đẽ của tuổi thơ tôi', '2022-10-10 04:26:56', 0, 8145474, 0, '0:06', '/uploads/thumbnails/3.PNG', '/uploads/videos/40.mp4', 1),
(46, 10, 5, 'Đó là đêm trăng Trung thu', 'Tình mẫu thứ vô cùng đáng trân trọng', '2022-11-09 01:41:38', 0, 3990961, 0, '0:06', '/uploads/thumbnails/4.PNG', '/uploads/videos/41.mp4', 1),
(47, 10, 6, 'Chúng ta sinh ra sẽ thật may mắn và hạnh phúc nếu được sống trong sự yêu thương của những người thân', 'Và trên hành trình trưởng thành từ những bước đi nhỏ bé đầu tiên đến những', '2022-03-28 09:52:00', 0, 461, 0, '0:06', '/uploads/thumbnails/5.PNG', '/uploads/videos/42.mp4', 1),
(48, 11, 10, 'Khi chúng ta mắc sai lầm', 'Ngôi trường của em đang học là ngôi trường nằm ở ngoại thành thành phố mang tên Bác, em yêu quý trường của em và em đến đây để học hằng ngày', '2022-02-13 06:38:18', 0, 231, 0, '0:06', '/uploads/thumbnails/6.PNG', '/uploads/videos/43.mp4', 1),
(49, 11, 12, 'Ở sân trường được thầy cô', 'Ba mẹ em nói là đi học con phải ngoan', '2022-01-25 09:08:21', 0, 215, 0, '0:06', '/uploads/thumbnails/4.PNG', '/uploads/videos/44.mp4', 1),
(50, 11, 11, 'Đại dịch COVID-19 đã và đang tiếp tục', 'Đại dịch COVID-19 đã và đang đe dọa nghiêm trọng an toàn và sức khỏe', '2022-05-26 04:53:39', 0, 121, 0, '0:06', '/uploads/thumbnails/2.PNG', '/uploads/videos/45.mp4', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Indexes for table `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_video_id` (`user_id`,`video_id`) USING BTREE,
  ADD KEY `video_id` (`video_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `playlist_detail`
--
ALTER TABLE `playlist_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `playlist_video_id` (`playlist_id`,`video_id`) USING BTREE,
  ADD KEY `video_id` (`video_id`),
  ADD KEY `playlist_id` (`playlist_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `like`
--
ALTER TABLE `like`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `playlist_detail`
--
ALTER TABLE `playlist_detail`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`);

--
-- Constraints for table `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `like_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `like_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`);

--
-- Constraints for table `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `playlist_detail`
--
ALTER TABLE `playlist_detail`
  ADD CONSTRAINT `playlist_detail_ibfk_1` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`),
  ADD CONSTRAINT `playlist_detail_ibfk_2` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `video_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
