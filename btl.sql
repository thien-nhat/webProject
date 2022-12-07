-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2022 at 05:48 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `btl`
--
CREATE DATABASE IF NOT EXISTS `btl` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `btl`;
-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(8) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `firstName`, `lastName`, `birthday`, `address`, `phone`, `email`, `password`, `gender`, `is_admin`, `created_at`) VALUES
(2, 'Ngô', 'Nhật Thiên', '2002-02-21', 'KTX khu A, Thủ Đức, HCM', '0369359121', 'ngonhatthien2@gmail.com', '123456', 'male', 0, '2022-11-28 09:55:32'),
(3, 'Ngô', 'Nhật Thiên', '2012-11-12', '', '0', 'ngonhatthien02@gmail.com', '12345.', 'male', 1, '2022-11-28 09:55:32'),
(4, 'Ngô', 'Thiên', '0000-00-00', '', '0', 'ngonhatthien12@gmail.com', '9999', 'male', 0, '2022-11-28 14:51:59'),
(17, 'Tôi là', 'Admin', '2002-02-12', '', '0978768008', 'admin@gmail.com', '12345', 'other', 1, '2022-11-29 15:48:45'),
(18, 'Ngô', 'Nhật Thiên', '0000-00-00', '', '0', 'viaivianh@gmail.com', 'Thiennn', 'male', 1, '2022-11-30 03:39:26'),
(19, 'Nguyễn', 'Văn Jack', '1999-11-11', 'Bến Tre', '0999999999', 'jack5trieu@gmail.com', '12345', 'male', 0, '2022-11-28 09:55:32'),
(23, 'Ngô', 'Nhật Thiên', '2002-02-21', 'KTX khu A', '0369359121', 'ngothien@gmail.com', 'Thienn', 'male', 0, '2022-12-04 12:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `cmt_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `cmt_content` text NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`cmt_id`, `user_id`, `pro_id`, `cmt_content`, `created_at`) VALUES
(1, 2, 47, 'Bộ đồ này đẹp lắm nha mọi người!!!', '2022-11-30'),
(3, 2, 1, 'Quá đẹp', '2022-11-30'),
(4, 17, 1, 'Chào mọi người', '2022-12-01'),
(7, 2, 49, 'Bộ này bình thường', '2022-12-05');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pro_name` varchar(255) NOT NULL,
  `pro_price` int(11) NOT NULL,
  `pro_quantify` int(10) NOT NULL,
  `pro_size` varchar(11) NOT NULL,
  `pro_color` varchar(11) NOT NULL,
  `pro_sale` int(4) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `pro_id`, `user_id`, `pro_name`, `pro_price`, `pro_quantify`, `pro_size`, `pro_color`, `pro_sale`, `created_at`) VALUES
(18, 1, 19, 'Giày Nike Air Force 1', 400000, 2, '', '', 5, '2022-12-04'),
(19, 47, 2, 'Áo thun tay lỡ The Bad God Black Fire tee', 150000, 1, 'S', 'Xanh', 10, '2022-12-05'),
(20, 1, 2, 'Giày Nike Air Force 1', 400000, 1, 'M', 'Trắng', 5, '2022-12-05');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pro_id` int(11) NOT NULL,
  `categoryKind` varchar(10) NOT NULL,
  `pro_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `forGender` varchar(20) NOT NULL,
  `price_buy` int(11) NOT NULL,
  `price_sell` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `pro_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sell_percent` int(4) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pro_id`, `categoryKind`, `pro_name`, `forGender`, `price_buy`, `price_sell`, `image`, `pro_description`, `sell_percent`, `created_at`) VALUES
(1, 'giay', 'Giày Nike Air Force 1', 'male', 300000, 400000, '	https://giaysneakerhcm.com/wp-content/uploads/2020/03/giay-nike-air-force-1-white-replica-1-1-o-hcm-3.jpg', '	Đôi giày màu trắng là một phụ kiện phải có trong tủ đồ của các bạn trẻ. Bởi tính ứng dụng cao trong thời trang, giày trắng thường giúp chúng ta dễ phối đồ hơn và có thể mang phù hợp với bất cứ dịp nào (đi học, đi chơi, ...). 365.giay.store đảm bảo mang lại cho các bạn một đôi giày trắng vừa xinh vừa hời. Ngại gì không tậu ngay một đôi nào!!', 5, '2022-12-04'),
(15, 'giay', 'Giày thể thao nữ - giày sneaker nữ mầu trắng đế cao ST008W	', 'female', 200000, 250000, 'https://salt.tikicdn.com/cache/w1200/ts/product/c6/db/73/72599b97949a1687c076e8fa4f072997.jpg', 'Đôi giày được làm từ đế cao su cao cấp Da PU bền đẹp', 10, '2022-12-04'),
(16, 'giay', 'Giày MLB Big Ball Chunky P Boston 32SHC2111-43I Size 235	', 'male', 1000000, 1200000, 'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2021/03/giay-mlb-big-ball-chunky-p-boston-size-235-604adf7be682f-12032021102651.png', 'THÔNG TIN SẢN PHẨM Giày sneaker MLB được làm từ lớp da cao cấp với đế độn 2 lớp vô cùng êm và chắc chắn. Ảnh và video do shop tự chụp và quay 100% nên shop cam kết ảnh thật và giày nhận được đến với khách hàng sẽ giống như mẫu ảnh. 99shoes hy vọng sẽ mang đến cho khách hàng những đôi giày chất lượng nhất. Nếu khách mua làm quà tặng thì hãy nhắn tin cho shop để shop viết thiệp tặng cho người đó nha, ngoài ra còn có những món quà siêu yêu nữa ạ', 6, '2022-12-04'),
(17, 'giay', 'Giày Nike Jordan đen', 'male', 25000, 300000, 'https://cdn.tgdd.vn//News/0//bai-viet-ve-giay-4-720x426-2.jpg', '? Thông tin sản phẩm: ✔️ Chất lượng tốt nhất trong tầm giá ✔️ Form đẹp chuẩn : Màu sắc giống đến 98 °/ₒ ; ✔️ Chất liệu da + da lộn + vải mesh ✔️ Logo Mông in dập chìm. ✔️ Lưỡi gà cao dày dặn; swoosh sắc nét; Mông mũi làm đẹp ✔️ Tem QR CODE Có thể check mã 2D ✔️ Đế 2 lớp khâu chỉ đều ✔️ Full box + accessories ✔️ Mẫu này bạn mang đúng hoặc up 1 size đối với chân bè', 8, '2022-12-04'),
(18, 'giay', 'GIÀY THỂ THAO NAM TRẮNG 1', 'male', 140000, 179000, 'https://cf.shopee.vn/file/ca1b7418648a8044f737ed6879e21cb2', 'Đôi giày màu trắng là một phụ kiện phải có trong tủ đồ của các bạn trẻ. Bởi tính ứng dụng cao trong thời trang, giày trắng thường giúp chúng ta dễ phối đồ hơn và có thể mang phù hợp với bất cứ dịp nào (đi học, đi chơi, ...). 365.giay.store đảm bảo mang lại cho các bạn một đôi giày trắng vừa xinh vừa hời. Ngại gì không tậu ngay một đôi nào!! - THÔNG TIN SẢN PHẨM: + Chất liệu giày: da sần, da trơn nhẵn. + Màu: trắng + Size: từ 36 đến 43 (các bạn tham khảo thêm bảng size để chọn được một đôi giày ưng ý nhất nhé) + Chiều cao: đế cao 2,5 cm + Trọng lượng Giày : 800g - Gợi ý các dịp phù hợp để sử dụng: + Mọi hoạt động hàng ngày (đi chơi, đi học, thể dục thể thao,...) + Phối với các trang phục năng động hoặc đồ âu đều dễ dàng và tôn dáng', 10, '2022-12-04'),
(19, 'giay', 'Giày Thể Thao 1970s Cổ Cao', 'male', 250000, 285000, 'https://giaysneaker.com.vn/public/media/nhung-ly-do-nen-chon-mua-doi-giay-converse-co-cao.jpg', '? Chất liệu: da nhăn mềm mại không bám bẩn rất dễ vệ sinh. ? Đế: Đế đúc liền khối phần dưới có các đường họa tiết (chống trơn trượt) và in logo thương hiệu giày. ? Form: Form dáng chuẩn 1:1 , được gia công tỉ mỉ tạo độ hài hòa giữa phần thân và phần đế ? Giày hot trend, kiểu dáng đẹp sang chảnh dễ phối đồ có thể mang đi chơi, đi học dự tiệc , đi làm...', 5, '2022-12-04'),
(20, 'giay', 'Giày thể thao nữ phối màu đen nâu cá tính', 'female', 100000, 120000, 'https://lzd-img-global.slatic.net/g/p/2ffa3b3494e8142fd0f51687086939af.jpg_720x720q80.jpg_.webp', 'MÔ TẢ SẢN PHẨM CƠ BẢN - Chất liệu: cao su, Vải - Màu sắc: Đen, Xanh - Kích thước: 35 - 40 - Chất liệu đế: Cao su lưu hóa - Cách mang: Xỏ, Cột dây - Thời gian giao hàng dự kiến cho sản phẩm này là từ 2-3 ngày ------------------------------- MÔ TẢ SẢN PHẨM CHI TIẾT - Phần thân trên chất da mềm cao cấp đi rất êm chân, mang thoải mái đi lại cả ngày - Phần Midsole (đế giữa) lót EVA êm ái - Phần Outsole (đế ngoài) là điểm quyết định của em giày này. Đế cao su đặc có độ bám dính, chống trơn trượt, ma sát tối đa, tạo độ êm ái thoải mái nên sản phẩm hết sức tuyệt vời cho những cô nàng có tính chất công việc phải đi lại cả ngày.', 10, '2022-12-04'),
(21, 'mu', 'Nón Bucket Nam Nữ, Nón Tai Bèo Cao Cấp Form Unisex Phong Cách Cá Tính Bảo Hành 12 Tháng', 'female', 20000, 31500, 'https://cf.shopee.vn/file/db52cc9ffba0827dc23c40484987da2b_tn', 'MÔ TẢ SẢN PHẨM : - Form dáng chuẩn, chắc chắn - Thiết kế may thêu tinh tế, sắc sảo và thời trang - Kiểu dáng: phù hợp cả nam và nữ. Đa phong cách, gọn nhẹ, năng động - Mùa sử dụng: xuân, hạ, thu, đông', 28, '2022-12-04'),
(22, 'mu', 'Nón tai bèo vành rộng thoáng khí chống thấm nước thời trang cho nam nữ', 'male', 55000, 60000, 'https://cf.shopee.vn/file/3d00b8803e2667ad7dc32dea5c03b6de_tn', 'Kích thước: Có thể điều chỉnh Chất liệu: Cotton Dành cho: cặp vợ chồng nam, nữ, sinh viên, nam và nữ Yếu tố phổ biến: nhẹ Hình dạng vành mũ: vành tròn Dịp thích hợp: mua sắm, đi dạo, hoạt động thể thao, đi leo núi ngoài trời Dành cho: trung tính / nam và nữ Dịp tặng quà thích hợp: sinh nhật, ngày lễ, hội chợ thương mại, lễ kỷ niệm, quà tặng doanh nghiệp, lễ khai trương, kỷ niệm giải thưởng, kế hoạch quan hệ công chúng Đặc điểm: chống nắng, chống lão hóa, chống nắng Thiết kế vành mũ: vành rộng Mùa thích hợp: hạ, xuân, thu, đông', 10, '2022-12-04'),
(23, 'mu', 'Mũ tai bèo, mũ bucket thêu chữ thời trang mũ mùa đông mới cho nữ, hàng có sẵn', 'female', 120000, 125000, 'https://cf.shopee.vn/file/a317614b30b5a87e2de12474cdb157ca', 'Mũ tai bèo, mũ bucket thêu chữ thời trang mũ mùa đông mới cho nữ, hàng có sẵn - ➡ KÍCH THƯỚC : vành đầu 56-58 cm - ➡ CHẤT LIỆU : cotton dày dặn, thêu hạo tiết, in chữ - ➡ MÀU SẮC: Trắng, đen', 10, '2022-12-04'),
(24, 'mu', 'Mũ vành rộng, nón đi biển chống nắng có dây chất lượng cao in chữ JACQUEMUS	', 'female', 120000, 150000, 'https://cf.shopee.vn/file/51b030d0a8c14638f9cfc02654b69343', 'Mũ vành rộng, nón đi biển chống nắng có dây chất lượng cao in chữ JACQUEMUS - ➡ Chất liệu: Cotton cao cấp - ➡ Kích thước: vòng đầu 54-58cm, có dây điều chỉnh size', 10, '2022-12-04'),
(25, 'mu', 'Mũ bucket tai bèo nón cụp có vành Unisex nam nữ ulzzang chất vải kaki tốt phom đẹp kiểu chữ B vải dệt', 'female', 50000, 100000, 'https://cf.shopee.vn/file/ef35db5582185b2435c42fb284b00af1', 'HÔNG TIN SẢN PHẨM : Nón bucket vành tròn - MÀU SẮC: Nhiều Màu - Chất liệu: Cotton dày mịn, thoáng mát Nón Bucket Nón bucket vành tròn hoạ tiết thời trang nhiều màu, phong cách Ulzzang Hàn Quốc, form unisex cho nam và nữ', 15, '2022-12-04'),
(26, 'mu', 'Mũ bucket Nhung Tăm thêu chữ Promissyou vành nón tai bèo tròn nam nữ thời trang SG102', 'female', 30000, 50000, 'https://cf.shopee.vn/file/0c282b442b35386992ea2cd943b63cc9', 'Chất liệu: Nhung tăm dày mịn, thoáng mát • Chu vi nón: 56-58cm, đội thoải mái, dễ chịu • Kiểu dáng: Phù hợp cả nam và nữ. Đa phong cách, gọn nhẹ, năng động • Màu sắc: Đen, kem, hồng, nâu, xanh dương, xanh lá • Đối tượng sử dụng: người lớn và trẻ em (cả nam và nữ) • Mùa sử dụng: xuân, hạ, thu, đông • Xuất xứ: Việt Nam', 10, '2022-12-04'),
(27, 'mu', 'Mũ Bucket 1 Mặt Thêu Hình Vịt Con Đáng Yêu Chất Vải Kaki Thoáng Mát Kiểu Dáng Nón Tai Bèo Nam Nữ Thời Trang	', 'female', 20000, 30000, 'https://cf.shopee.vn/file/c6f67caf5aa8372d5ee49533f9139149', 'HÔNG TIN CHI TIẾT SẢN PHẨM NÓN TAI BÈO: ✔️ Màu sắc: ĐEN, TRẮNG ✔️ Chất vải kaki cotton dày mịn, thoáng mát ✔️ Size vòng đầu 54-57cm, chiều cao nón 9cm, vành rộng 6,5cm ✔️ Form Unisex dành cho cả nam và nữ, thiết kế kiểu nón bucket trơn đơn giản có 2 mặt dễ thay đổi màu rất tiện lợi', 2, '2022-12-04'),
(28, 'mu', 'Mũ Lưỡi Trai Nam Nữ Jussy Fashion Nón Lưỡi Trai Memorie Chất Vải Nhung Gân Nhiều Màu Đẹp Phong Cách Nón Unisex	', 'male', 30000, 45000, 'https://lzd-img-global.slatic.net/g/p/e86f6d8c8995f41a441a404ef9804957.jpg_720x720q80.jpg_.webp', 'Nón Kết Hàn Quốc Dễ Thương ra mắt với nhiều màu: Đen, Trắng, Kaki, Vàng, Đỏ, Xanh, Be ✔️ Phù hợp với bất kỳ outfit nào của các bạn gái nữ tính, đáng yêu. ✔️ Chất liệu Nón lưỡi trai memorie: Chất vải nhung gân mềm mịn, thoáng mát, thấm hút mồ hôi, không hầm bí ✔️ Thông số sản phẩm: Size vòng đầu mũ lưỡi trai nhung từ 54-58 cm. Mũ Có Khóa Inox phía sau giúp tăng/giảm size nón tùy vòng đầu của bạn. .', 0, '2022-12-04'),
(29, 'mu', 'Nón tai bèo chống nắng in hình luffy trong phim hoạt hình one piece', 'male', 40000, 50000, 'https://cf.shopee.vn/file/41161c5776c229f13a008e32b588c072_tn	', 'Mũ tai bèo chủ đề hoạt hình One Piece 100% cotton, mũ thêu chất lượng cao cho nam / mũ cho nữ, dropshipping Danh mục sản phẩm: Mũ tai bèo Chất liệu: Cotton Phương pháp dệt: satin Các yếu tố phổ biến: in Thích hợp : trung tính / nam và nữ áp dụng Nhóm tuổi: tuổi trưởng thành', 10, '2022-12-04'),
(30, 'mu', 'Nón Beret  Phong Cách Hàn Quốc Thời Trang Xuân Thu Cho Nữ', 'female', 120000, 150000, 'https://cf.shopee.vn/file/abb311452c413260d6160c6e9afb17b6_tn', 'Hoa văn: Chữ cái; Chi tiết phong cách: Thêu; Đối tượng áp dụng: Chung; Phong cách: Mũ Peaked; Vải Tên thường: Bông; Nhãn hiệu: SZSYST;', 10, '2022-12-04'),
(31, 'mu', 'mũ cối lao động hàng việt nam chất lượng cao', 'male', 60000, 100000, 'https://vn-live-01.slatic.net/p/3df11154757e894ea0ff75ec3a653633.png', '-chất dày dặn, đội mát mưa, rất bền -phù hợp cả trời nắng và mưa', 10, '2022-12-04'),
(32, 'balo', 'Balo Ulzzang Hàn Quốc Thời Trang Đi Học Đi Chơi Phối Lưới Chống Thấm', 'female', 40000, 70000, 'https://cf.shopee.vn/file/9fbddeaf66b8e9a2d49bcc36a516c0dd', '​​​​​​​THÔNG TIN SẢN PHẨM: - ️Chất liệu : Vải Polyester 600PU Chống Thấm - ️Màu sắc : Đen, trắng, hồng, xanh da trời Shop có phận loại chi tiết màu vui lòng khách chọn ạ - Kích thước 35x40cm , đựng được tài liệu size A4 lớn, thích hợp cho học sinh, sinh viên thậm chí là người trẻ trung, năng động đang đi làm.', 0, '2022-12-04'),
(33, 'balo', 'Balo Nữ Thời Trang Yuumy YBA28 Nữ Tính Nhiều Màu - Không Thấm Nước - Không Bong Tróc', 'female', 300000, 400000, 'https://cf.shopee.vn/file/sg-11134201-22090-54437uvf7uhv70', 'Chất liệu: da tổng hợp cao cấp (mềm mại, không bong tróc, không thấm nước ) Kích thước: dài 20.5cm x rộng 12cm x cao 27cm Trọng lượng: 762g Số ngăn: 4 ngăn ( 1 ngăn chính, 3 ngăn phụ ) Màu sắc: Màu Bò Đậm, Màu Bò Nhạt, Màu Nâu, Màu Đen Công dụng: balo phù hợp đi chơi, đi làm, đi shopping, đi du lịch. Bảo Hành: 1 Năm Thương hiệu: YUUMY Xuất xứ: Made in Viet Nam', 10, '2022-12-04'),
(34, 'balo', 'Balo ulzzang hàn quốc kiểu dáng mới Fumiao', 'female', 120000, 200000, 'https://cf.shopee.vn/file/9a26b95653670d14a49b768bad9d2979', 'Kích thước : 32x11x43cm Chất liệu : là vải polyester không thấm nước Đặc điểm chung của vải chống thấm nước Nhờ lớp tráng chống thấm nước này mà vải có những tính năng vượt trội như: - Ít bám bẩn, dễ vệ sinh - Không nhăn nhàu - Có khả năng cản gió - Chống thấm nước vượt trội Màu sắc : nhiều màu Phù hợp với các bạn đi học và đi du lịch', 15, '2022-12-04'),
(35, 'balo', 'Balo Thời Trang Da Mini Thắt Nơ Túi Đon Giản', 'female', 40000, 50000, 'https://salt.tikicdn.com/cache/w1200/ts/product/c0/fe/cf/ee1d9d349cf96a7b7d049557ce8910fb.jpg', 'chất liệu : bố canvas _ có 2 ngăn _ có khóa kéo và lót', 0, '2022-12-04'),
(36, 'balo', 'Balo nữ dễ thương cặp đi học đựng laptop giá rẻ ba lô du lịch thời trang vải dù', 'female', 40000, 70000, 'https://cf.shopee.vn/file/81dc3ee7852219121c2b2ed9352baab4', 'ích thước cặp đi học nữ: rộng 35cm* cao 42cm* dày 12cm. - Ba lô nữ đi học được làm từ chất liệu: vải canvas 420. - Cặp đi học có 4 màu : Đen, hồng, xanh, tím. - Style: balo nữ giá rẻ phong cách thời trang Hàn Quốc Balo nữ dễ thương không những đi học mà còn đi chơi, đi du lịch được', 10, '2022-12-04'),
(37, 'balo', 'BALO CHỐNG TRỘM PHONG CÁCH HÀN QUỐC CHO NỮ', 'female', 65000, 125000, 'https://cf.shopee.vn/file/de566fa44fe87dc3fc37e3bae5cae0ef', 'Kích thước ba lô: 31 X 34 X 14 cm Kích thước quai xách: 8cm Từ nay ra đường khỏi lo mất đồ nữa,\r\n    có em balo chống trộm này đi đâu cũng yên tâm hẳn luôn ạ', 0, '2022-12-04'),
(38, 'balo', 'Ba Lô Đi Học / Du Lịch Sức Chứa Lớn Đơn Giản Phong Cách Nhật Bản', 'male', 160000, 205000, 'https://cf.shopee.vn/file/8517a2506855bfe540a454b07c42a0e9', 'Kết cấu: canvas Những người có thể áp dụng: Chung Yếu tố phổ biến: may Tình trạng sản phẩm: Còn mới\r\n\r\nKiểu đóng: Dây kéo Kích thước máy tính: 15 feet Hiệu suất chống thấm nước: không thấm nước Chất liệu lót: polyester', 8, '2022-12-04'),
(39, 'balo', 'Balo nam nữ, Balo du lịch vải dù ulzzang đi học thời trang chống nước nhiều ngăn đựng laptop cao cấp Hàn Quốc', 'male', 149000, 200000, 'https://vn-test-11.slatic.net/p/d4cdce0f86b36879ea84bfdc59b6491e.jpg', 'Mô tả chi tiết sản phẩm: Balo Du Lịch - Balo Laptop - Balo đi học,\r\n    đi chơi,\r\n    đi phượt: - Chất liệu: Vải Polyester Vải balo cực dày dặn,\r\n    chống thấm nước - Màu sắc: 5 màu lựa chọn: Đen - Bee - Xanh lá - Xanh Dương - Đỏ - Kích thước - Cấu tạo: + Balo gồm 1 ngăn chính : 43 X 30 X 13cm - Trọng lượng 0,\r\n    5kglớn,\r\n    bên trong có ngăn để laptop riêng biệt,\r\n    chắc chắn + Bên ngoài có 1 ngăn TO và 2 ngăn nhỏ +2 Cạnh bên balo có 2 ngăn để chai nước,\r\n    để ô....,\r\n    dây rút chắc chắn + Phía sau balo có 1 ngăn túi zip cao cấp đựng đồ dùng rất tiện lợi', 5, '2022-12-04'),
(40, 'balo', 'Balo nữ nam nữ phong cách ulzzang hàn quốc unisex đi học đi chơi thời trang - Túi Cặp Xách phong cách Vện Hottrend', 'male', 200000, 249000, 'https://cf.shopee.vn/file/9cc780a2433bec22df5e132b1365a831', 'Balo Ulzzang Unisex LOCAL Brand Cá Tính Chống Nước Đựng Laptop + Balo được thiết kế phong cách hàn quốc.+ Màu sắc: Đen - Trắng - Xanh Rêu + Chất liệu vải Nylon trơn,\r\n    chất liệu này bền và sạch không bị bám dính bụi và ngoài ra còn chống nước.+ Đường may tỉ mỉ chắc chắn,\r\n    form túi rất đẹp.+ Kích thước: 29 * 13 * 42(cm).', 5, '2022-12-04'),
(41, 'balo', 'Ultra Ba Lô Siêu Nhẹ Thời Trang Dành Cho Nam', 'male', 160000, 200000, 'https://cf.shopee.vn/file/0d5e0e3a83117d961129f4f6e9fb95cb_tn', 'Thương hiệu: Locoer / Luke Kangaroo\r\nXuất xứ: Tỉnh Hà Bắc\r\nKết cấu: Oxford spun Đối tượng áp dụng: chung Các yếu tố phổ biến: mũi khâu chắc chắn\r\nPhong cách: học viện\r\nĐóng cửa: đóng zip\r\nKích thước: 15 inch Hiệu suất chống thấm nước: chống thấm nước\r\nVật liệu lót: polyester(sợi polyester)', 8, '2022-12-04'),
(42, 'balo', 'Balo nam nữ đi học phát sáng, Balo Đi Học Nam Nữ Cặp Sách Đi Học', 'male', 820000, 100000, 'https://cf.shopee.vn/file/15a45650be8e4a51b7f9ec0104894b59', 'Kích thước sản phẩm: 40cm x 30cm x 15cm. - Màu sắc : đen - Balo thời trang thiết kế có nhiều ngăn rộng rãi để được máy tính, điện thoại, máy tính bảng, cặp sách vv, có trọng lượng nhẹ, thích hợp cho việc di chuyển dễ dàng - Balo nam thời trang thiết kế thoáng khí, màu sắc hài hòa mang phong cách Hàn Quốc, phù hợp đi chơi, đi làm, đi học, hoặc đi du lịch. - Balo được may bằng chất liệu vải dù bền, đẹp không thấm nước là người bạn đồng hành lý tưởng của bạn. - Balo_nam dạ quang có dải phát quang ngoài ánh sáng độc đáo, sành điệu. - Kiểu dáng thể thao khỏe khoắn, đường may khóa kéo chắc chắn. Dây đeo lưng bản lớn, êm ái, có thể điều chỉnh cho phù hợp với từng người.', 3, '2022-12-04'),
(47, 'ao', 'Áo thun tay lỡ The Bad God Black Fire tee', 'male', 140000, 150000, 'https://cf.shopee.vn/file/3cfd35c66ef1aeb820c7461098d26f5d', 'Thông tin sản phẩm Áo thun tay lỡ The Bad God Black Fire - Chất liệu: Thun 100 % Cotton cao cấp,\r\n    thấm hút mồ hôi rất tốt,\r\n    thoáng mát,\r\n    bề mặt vải mịn,\r\n    ko xù,\r\n    ko gião - Đường may tỉ mỉ,\r\n    chắc chắn - Công dụng: mặc ở nhà,\r\n    mặc đi chơi hoặc khi vận động thể thao - Thiết kế hiện đại,\r\n    trẻ trung,\r\n    năng động.Dễ phối đồ', 10, '2022-12-04'),
(48, 'ao', 'Áo khoác crop bomber varsity The Bad God Leather G Jacket', 'male', 400000, 450000, 'https://vn-test-11.slatic.net/p/30d644905f6c1aa5bcf208855d68d3ca.jpg', 'Áo khoác BOMBER vải nỉ bông cotton,\r\n    đẹp,\r\n    không co rút,\r\n    Hình IN không bong tróc,\r\n    đặc biệt không những giúp bạn giữ ấm trong mùa lạnh mà còn có thể chống nắng,\r\n    chống gió,\r\n    chống bụi,\r\n    chống rét,\r\n    chống tia UV cực tốt,\r\n    rất tiện lợi nhé ! ! ! Form rộng Unisex cho cả nam và nữ,\r\n    Hình Shop tự chụp ? Đường may kỹ,\r\n    tinh tế,\r\n    sắc xảo.? Form chuẩn #ulzzang   #unisex Nam Nữ Couple đều mặc được.\r\n    Size: M L XL\r\nSize M: 40 - 54kg,\r\n    cao từ 1m5\r\nSize L: 55 - 64kg,\r\n    cao từ 1m66\r\nSize XL: 65 - 80kg,\r\n    cao từ 1m73', 5, '2022-12-04'),
(49, 'ao', 'Áo thun Hades Alternative tay lỡ', 'male', 100000, 130000, 'https://cf.shopee.vn/file/7f3d9f554e7633feec53bf74eef15c7e', 'Áo có thiết kế hiện đại, trẻ trung, năng động, dễ phối đồ. 2️⃣ Tự hào là chiếc áo Local Brand hàng đầu Việt Nam với sự tỉ mỉ và tinh tế trong từng đường may, mũi chỉ giúp cho sản phẩm bền chắc với thời gian lâu dài. 3️⃣ Áo được làm từ chất liệu thun cotton 65% + 35% Poly giúp vải hạn chế bị nhăn, giữ dáng tốt, thoải mái khi sử dụng. 4️⃣ Áo thun Hades Alternative tay lỡ, form rộng vải Cotton - Thời trang nam nữ Unisex Streetwear Hàn Quốc - hiện đang là mẫu áo hot trend, được rất nhiều bạn trẻ cuồng nhiệt săn đón.', 5, '2022-12-04'),
(50, 'ao', 'Áo polo nam coolmate', 'male', 190000, 220000, 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=80,format=auto/uploads/May2022/cafexanhmoi.jpg', 'Áo Polo thể thao nam Promax-S1 chiếc áo polo được thiết kế dành riêng cho bạn. Kiểu dáng Slighly Slim Fit để bạn luôn cảm thấy vừa vặn trong mọi cử động Định lượng vải chỉ 155gsm siêu nhẹ cảm giác mặc như không mặc Công nghệ xử lý hoàn thiện: Quickdry (Nhanh khô) và Wicking (thấm hút nhanh)', 5, '2022-12-04'),
(51, 'ao', 'ÁO LEN cổ tròn', 'male', 150000, 180000, 'https://salt.tikicdn.com/cache/w1200/ts/product/c3/48/9c/f7e6db4ee08b69582262ef35dc953e37.jpg', '• Áo len nam thách thức mọi thời tiết lạnh giá Với thời tiết Lạnh Giá mà mặc áo len cao cổ thì rất ấm áp và cực kỳ sang trọng và thoải mái, chất len mềm mịn, mặc đi làm hay đi chơi, đi làm văn phòng đều đẹp!!! Màu sắc cơ bản phù hợp mọi lứa tuổi , mặc cùng áo vets, áo dạ, áo da cực hợp và đẹp • Áo len nam Chất liệu tốt, mẫu mã đa dạng Len cotton 100% nhập sợi từ Nhật bản có bề mặt vải mền mịn, thoát mồ hôi, giữ ấm, nhanh tạo cảm giác vô cùng thoải mái cho người mặc và đặc biệt là không bị XÙ LÔNG. Màu sắc: có 4 màu: đen , trắng, ghi, nâu', 0, '2022-12-04'),
(52, 'ao', 'Áo Khoác Nỉ Siêu Co Giãn Dry Có Mũ Kéo Khóa Dài Tay', 'female', 370000, 400000, 'https://image.uniqlo.com/UQ/ST3/AsianCommon/imagesgoods/450693/sub/goods_450693_sub14.jpg?width=1600&impolicy=quality_75', 'Chất liệu vải thấm mồ hôi hiệu quả cao,\r\n    nhanh khô.Các chi tiết thân thiện với trẻ em.Là một', 5, '2022-12-04'),
(53, 'ao', 'Áo Khoác Hoodie Cardigan', 'female', 100000, 120000, 'https://vn-test-11.slatic.net/p/808661ea3fd879b715fa2743b76bef47.jpg', '- Áo Hoodie với họa tiết chữ C may đẹp, sắc nét làm nổi bật chiếc áo thành sản phẩm hot nhất hiện nay - Form rộng Unisex mặc rất thoải mái - Chất liệu: Nỉ bông 100% cotton cao cấp, dòng vải nỉ rất phù hợp vs mùa thu đông vải mềm, vải mịn, thoáng mát, không xù lông, vải co giãn 2 chiều giữ form. - Đường may chuẩn chỉnh, tỉ mỉ, chắc chắn. - Mặc ở nhà, mặc đi chơi hoặc khi vận động thể thao. Phù hợp khi mix đồ với nhiều loại. - Thiết kế hiện đại, trẻ trung, năng động. Dễ phối đồ.', 3, '2022-12-04'),
(54, 'ao', 'Áo sweater dày dặn AMBUSII', 'female', 140000, 160000, 'https://cf.shopee.vn/file/sg-11134201-22100-sirpjkl836hvf8', '- Màu sắc : Xám - Kích thước: M,L,XL ▪️Size M: dưới 50kg, Cao dưới 1m56 ▪️Size L: từ 50-60kg , Cao 1m57 - 1m70 ▪️Size XL: từ 60-70kg, Cao: 1m70 trở lên - Chất liệu : Nỉ bông', 0, '2022-12-04'),
(55, 'ao', 'Áo sơ mi nhung tăm ulzzang', 'female', 170000, 200000, 'https://vn-test-11.slatic.net/p/28aa51f4d8661c4390002769a7ca19e4.jpg', 'Chất gân dày dặn làm áo khoác được ạ nên các bạn nào muốn áo mỏng thì nên cân nhắc nhé.Form áo rộng dưới 70kg các bạn mang vô tư,\r\n    form dài chùm mông luôn nhé ! Thông số áo: ÁO FREESIZE - KHÔNG CÓ SIZE NHÉ Ạ.✔Dài áo 70cm ✔Rộng áo 65cm ✔Vai áo 56cm ✔Tay áo 54cm', 5, '2022-12-04'),
(56, 'ao', 'Áo sơ mi cổ trụ', 'female', 138000, 160000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo5SyQz1ui-kq3gT_TXaB0e14_6n-sEl-CNw&usqp=CAU', '✔ Chất liệu áo: vải đũi xước tơ,thoáng mát ✔ Thiết kế cổ tàu tạo điểm nhấn khác biệt so với những áo sơ mi basic bạn hay sử dụng ✔ Phù hợp với nhiều phong cách, dễ mix với các trang phục, phụ kiện khác ✔ Màu sắc:trắng,xanh than,xanh dương,cam', 5, '2022-12-04'),
(57, 'quan', 'QUẦN BIKER JEANS 4 ZIP WAX', 'male', 650000, 700000, 'https://cf.shopee.vn/file/b3f0f2a9985b77cc63847df72cea0062', 'QUẦN BIKER JEANS 4 ZIP WAX / siêu phẩm 2022 / Quần skinny jeans nam Một trong những mẫu quần được đánh giá HOT nhất 2022 chất liệu : jeans co dãn 100 % biker : chất liệu jeans co dãn được wax cứng mặt ngoài\r\nPhom dáng : Skinny giúp cải thiện chiều cao \r\nsize : 28,\r\n    29,\r\n    30,\r\n    31,\r\n    32,\r\n    33 Tặng kèm phụ kiện xích 150k cho sản phẩm.', 5, '2022-12-04'),
(58, 'quan', 'Quần jean Baggy', 'male', 130000, 150000, 'https://salt.tikicdn.com/cache/w444/ts/product/91/4e/5f/d448fc73905ea0e60013d7e50f284533.jpg', 'Kiểu Dáng: quần jean baggy dành cho nam - Mầu Sắc: Xanh Sky.- Chất liệu: jean cao cấp,\r\n    ko phai mầu - Số lượng : hàng đủ size,\r\n    xuất khẩu - gồm có đủ  size: từ size 27(42kg) - > size 36(100kg).', 0, '2022-12-04'),
(59, 'quan', 'Quần Jean Phối Khóa Dáng Slim Fit', 'male', 20000, 220000, 'https://cf.shopee.vn/file/81743173ba9bcdc3355a22f36ab31c54', '✔️ Tên sản phẩm: Quần jean bò nam ống côn phối khoá gối\r\n✔️ Xuất xứ: Việt Nam\r\n✔️ Chất liệu: Jean denim bò dày dặn,\r\n    co dãn đàn hồi tốt,\r\n    thấm hút mồ hôi tốt,\r\n    mặc cực kì ôm chân lên dáng mà lại dễ chịu,\r\n    thoải mái cho mọi hoạt động\r\n✔️ Kích cỡ: 28 / 29 / 30 / 31 / 32(\r\n        Khách cần tư vấn size chính xác thì ib cho shop chiều cao + cân nặng ạ\r\n    ) ✔️ Màu sắc: Đen ✔️ Kiểu thiết kế: Quần phối thêu khoá gối và tag mác với độ sắc nét rõ ràng,\r\n    thời trang\r\n✔️ Phối đồ: Quần jean không hề XA lạ với chúng ta bởi nó cực dễ phối với mọi loại giày,\r\n    áo và tạo được điểm nhấn nổi bật,\r\n    cá tính hơn hẳn mà không hề bị “rườm rà” hay “làm quá”', 5, '2022-12-04'),
(60, 'quan', 'Quần Jean Nam Mikenco Wash', 'male', 270000, 300000, 'https://filebroker-cdn.lazada.vn/kf/Sb03be806b7fb48fb9f9943660ff5b69eX.jpg', '✔️ Tên sản phẩm: Quần Jean bò nam ống côn phối rách vá vải nhăn gối khoá ống\r\n✔️ Xuất xứ: Việt Nam\r\n✔️ Chất liệu: Vải Jean Denim 100 % siêu dày dặn,\r\n    không nhăn không phai màu,\r\n    độ bền cao,\r\n    co giãn nhẹ và thấm hút mồ hôi tốt\r\n✔️ Kích cỡ: 28 / 29 / 30 / 31 / 32 / 34(45 - 76kg) ✔️ Màu sắc: Đen mài,\r\n    xanh,\r\n    trắng ✔️ Kiểu thiết kế: Phối rách xước,\r\n    vá vải nhăn,\r\n    khoá zip ống\r\n✔️ Phối đồ: Quần jean đã trở thành một món đồ khum thể thiếu of mỗi người bởi nó cực dễ phối với mọi loại giày,\r\n    áo và tạo lên những outfit năng động,\r\n    phá cách,\r\n    thanh lịch,\r\n    sang chảnh,\r\n    … ', 0, '2022-12-04'),
(61, 'quan', 'Quần Biker Nam', 'male', 220000, 250000, 'https://cf.shopee.vn/file/46c6ca6ff11b20d264adbd0c26ce5e28', 'Giới thiệu đến ae một siêu phẩm quần jeans biker ống côn siêu chất và thời trang cho ae: ?Bao chất liệu vải jean bò cực dày dặn,\r\n    bền đẹp,\r\n    mặc là thích luôn ?Bao thiết kế phối khoá lệch vảy sơn,\r\n    rách xước,\r\n    pha màu và tag mác cực chất và sang chảnh ?Đây là một lựa chọn hoàn hảo cho ace ?Full size 28 / 29 / 30 / 31 / 32 / ?Phù hợp đi du lịch,\r\n    dạo phố,\r\n    đi chơi,\r\n    ....và dễ dàng phối đồ như: áo sơ mi,\r\n    áo phông,\r\n    ....⚠️Cam kết sản phẩm Y hình 100 %', 5, '2022-12-04'),
(62, 'quan', 'Quần jean nữ ống loe', 'female', 220000, 250000, 'https://aaajeans.com/wp-content/uploads/2019/10/Quan-jean-nu-ong-loe-Aaa-Jeans-xanh-midnight-FLDCTRNZC_MND-1.jpg', 'Quần jean nữ với thiết kế mới thời trang hơn,\r\n    mang lại sự tự tin tối đa cho người mặc trước những người xung quanh Quần may bằng vải denim nên rất mềm,\r\n    đảm bảo thoải mái ngay cả khi di chuyển nhiều.Dáng quần jean trẻ trung rộng rãi,\r\n    túi quần lớn rất thuận tiện cho việc đựng smart phone hoặc ví cỡ bự.Màu sắc chuẩn được nhuộm kỹ giúp hạn chế tối đa việc phai màu khi sử dụng.', 5, '2022-12-04'),
(63, 'quan', 'quần ống rộng suông nữ', 'female', 80000, 100000, 'https://salt.tikicdn.com/ts/product/ab/f1/5f/e47d988721d44df4a94d526dc8b4edfa.jpg', '?chất liệu: Kaki thun có độ dày vừa phải,\r\n    thoáng mát,\r\n    co dãn nhẹ,\r\n    thoải mái,\r\n    tôn lên vóc dáng cho người mặc.?kiểu dáng : Vẫn kiểu dáng quần ống rộng là hottrend của phái nữ hiện nay,\r\n    là style mang đến sự mới lạ,\r\n    phá cách,\r\n    khiến bạn nữ thêm cá tính,\r\n    năng động và không kém phần sexy khi diện áo kiểu.....Nhưng sản phẩm này,\r\n    mang mot phong cách Hàn quốc hoàn toàn mới....Điều đáng nói là quần được tăng thêm chiều dài,\r\n    phần ống rộng rãi thoải mái hơn so vs phom dáng cũ,\r\n    phần cạp cao có thể thêm dây lưng trông chất hơn nhiều !....', 0, '2022-12-04'),
(64, 'quan', 'Quần jogger nữ', 'female', 100000, 120000, 'https://salt.tikicdn.com/cache/w1200/ts/product/96/ce/57/501ea5451f5ff9032a6d9bd0135b21f8.jpg', '* * THÔNG TIN Quần jogger nữ thể thao chun bo gấu,\r\n    chất thun nỉ lót bông dày dặn,\r\n    ống rộng dáng suông phong cách Hàn Quốc Ulzzang - Màu sắc: TRẮNG,\r\n    ĐEN,\r\n    XÁM - Chất liệu: vải Thun Nỉ cao cấp + Đường may chuẩn chỉnh,\r\n    tỉ mỉ,\r\n    chắc chắn.+ Mặc quần jogger đi chơi hoặc khi vận động thể thao.Phù hợp khi mix đồ với nhiều loại.+ Thiết kế hiện đại,\r\n    trẻ trung,\r\n    năng động.Dễ phối đồ.', 5, '2022-12-04'),
(65, 'quan', 'Quần jeans bò baggy', 'female', 120000, 150000, 'https://salt.tikicdn.com/cache/w1200/ts/product/34/8d/ff/2dfc330ba5b6f1e335adda6248fe0be4.jpg', 'Chi tiết : quần jeans nữ trơn dáng baggy ống côn cạp cao 4 túi vải không giãn chiều dài quần : 87 -90 cm cạp cạo qua rốn 30cm loại trang phục thanh lịch,\r\n    công sở phù hợp cho học sinh sinh viên hoặc dân văn phòng mặc đi học đi chơi đi làm kín đáo lịch sự ', 0, '2022-12-04'),
(66, 'quan', 'Quần Legging Dài Co Dãn', 'female', 70000, 90000, 'https://agiare.vn/wp-content/uploads/2019/01/quan-legging-uniqlo.jpg', 'Chất liệu : cotton cao cấp dày dặn,\r\n    dẻo,\r\n    co giãn 4 chiều \r\nSize: 5size S < 43kg M < 48 kg L < 52kg Xl < 56 kg 2xl < 60 kg 3XL < 63kg', 0, '2022-12-04'),
(67, 'dep', 'HAVAIANAS - Dép unisex Brasil Logo 4110850-1440', 'male', 500000, 650000, 'https://product.hstatic.net/1000284478/product/1440_4110850_1_9ba9041494cd48aa8e6d2f8d50558eb2_master.jpg', 'Chất liệu: Cao su cao cấp Kiểu dáng quai kẹp dễ dàng thao tác xỏ / tháo Thiết kế phối logo Brasil nổi bật Phong cách phóng khoáng,\r\n    hiện đại,\r\n    đa năng Đế có rãnh chống trơn trượt,\r\n    tăng độ bám IN logo thương hiệu sang trọng Sản xuất tại: Brasil Sản phẩm không bảo hành Hướng dẫn bảo quản: Xem chi tiết trên tag sản phẩm An toàn cho người sử dụng', 5, '2022-12-04'),
(68, 'dep', 'Dép Nam Bít Mũi BIGGBEN Da Bò Thật Cao Cấp DN145', 'male', 250000, 300000, 'https://salt.tikicdn.com/ts/product/a1/0b/51/22f50a75ae166defbcc6dd344326d577.jpg', 'Dép Nam với chất liệu da bò bền đẹp kết hợp đế cao su êm nhẹ chống trơn trượt giúp bạn Nam luôn thoải mái, tự tin khi đi chơi, dạo phố, đi làm nơi công sở hay đi dự tiệc.', 5, '2022-12-04'),
(69, 'dep', 'Dép nam, nữ siêu nhẹ DUWA - Hàng chính hãng - TRẮNG TK9024', 'female', 50000, 100000, 'https://salt.tikicdn.com/cache/w1200/ts/product/99/63/ea/a3ea39d327295a36394c1ec369158136.jpg', 'Đế cao 2cm đi cực đầm chân Dễ phối cùng nhiều kiểu trang phục khác nhau.Mẫu mã trẻ trung,\r\n    phù hợp xu hướng 2021 Màu sắc: Cá tính,\r\n    họa tiết bắt mắt', 5, '2022-12-04'),
(70, 'dep', 'Dép nam da bò Udany Dép quai ngang nam thời trang cá tính chuyên biệt dép', 'male', 120000, 200000, 'https://salt.tikicdn.com/cache/w1200/ts/product/92/68/eb/431a723bca2531c3247c3c3f23a21a2f.jpg', '● Loại sản phẩm: Dép nam\r\n\r\n● Xuất xứ: Việt Nam\r\n\r\n● Chất liệu: da bò\r\n\r\n● Màu sắc: đen,\r\n    nâu\r\n\r\n● Size từ : 39 -43', 0, '2022-12-04'),
(71, 'dep', 'Dép Nam Nữ Quai Dù Thời Trang, Dép Đôi Quai Ngang Chống Trơn', 'male', 150000, 200000, 'https://cf.shopee.vn/file/1ae328c82e848c70f410df66e3b7c841', 'Có độ bền cao và kiểu dáng năng động Form dép sandal ôm bảo vệ chân tốt\r\nChất liệu : quai làm bằng vải dù cao cấp có thể điều chỉnh TO nhỏ quai dép Đế được làm bằng chất liệu PU siêu nhẹ Dép đôi nam nữ mang phong cách hàn quốc.Với ưu điểm tuyệt đối có thể điều chỉnh độ TO nhỏ của dép.Đế nhẹ,\r\n    đàn hồi và ma sát tốt,\r\n    chống trơn trượt.Dễ phối cùng nhiều kiểu trang phục khác nhau.Mẫu mã trẻ trung,\r\n    phù hợp xu hướng.Sản phẩm đạt chuẩn chất phù hợp với giá tiền.Đảm bảo không bán hàng kém chất lượng.', 0, '2022-12-04'),
(72, 'dep', 'Dép chữ h nam D26 - Dép nam quai ngang cực đẹp', 'male', 150000, 200000, 'https://salt.tikicdn.com/cache/280x280/ts/product/ee/ad/7f/9b1cd4b9f41cf876bc96610067609163.jpg', '- Một đôi dép da nam đẹp là phụ kiện quan trọng giúp cho nam giới ngày nay trở nên năng động,\r\n    cá tính hơn,\r\n    giúp đôi chân thoải mái,\r\n    mát mẻ giữa mùa hè nóng bức - Thiết kế đơn giản,\r\n    hiện đại,\r\n    siêu thoáng mát cho mùa hè này giúp bạn có thể năng động để đi đến bất cứ nơi đâu và phù hợp với mọi môi trường kể cả đi làm hay đi chơi.', 5, '2022-12-04'),
(73, 'dep', 'Dép quay ngang nữ hoa cổ mùa xuân, phù hợp cho chị em đi chơi Tết', 'female', 210000, 250000, 'https://cf.shopee.vn/file/762c568bf3154365d158dcc5106a49ef', '✪ Hãng Sản Xuất: BATA ✪ Chất Liệu Upper : da thật , PU, Canvas ✪ Chất Liệu Đế: Cao su ✪ Kiểu Dáng : Giày ✪ Tình Trạng: Mới 100% Fullbox Hàng Có Sẵn. ✪SKU: 560-0538', 0, '2022-12-04'),
(74, 'dep', 'Giày Sandal Đế Bệt Dày Thời Trang Mùa Hè Dành Cho Nữ', 'female', 65000, 100000, 'https://cf.shopee.vn/file/2e2be2e39750da1d9ad86162adc56e08', 'Chất liệu mặt trên: PU\r\n\r\nChiều cao gót: gót thấp(1 cm -3 cm) Chất liệu đế: cao su\r\n\r\nCách đóng: bao chân\r\n\r\nPhong cách: Hàn Quốc\r\n\r\nPhong cách: giày La Mã\r\n\r\nSẵn có: Mùa hè 2022 Quy trình sản xuất: keo\r\n\r\nChất liệu đế: PU\r\n\r\nLoại đáy: Đáy bánh bông lan Kiểu ngón chân: hở ngón\r\n\r\nChức năng: nhẹ,\r\n    thoáng khí,\r\n    chống trượt\r\n\r\nMô hình: Đồng bằng Các yếu tố phổ biến: nơ', 5, '2022-12-04'),
(75, 'dep', 'Dép ếch, bò dép bông đi trong nhà chât liệu len bông đế eva êm ái độn 3,5-4cm', 'female', 100000, 120000, 'https://cf.shopee.vn/file/4af0a11e8e3fcd03ec0947438dd10b6d', '- Dép đi trong nhà trend 2022 - Dép nữ thời trang hình ếch và hình bò - Dép bò đáng yêu mùa đông phù hợp đi trong nhà', 0, '2022-12-04'),
(76, 'dep', 'Dép bánh mì hình trái tim dễ thương 2022(hàng loại 1, sẵn kho, đi êm chân)', 'female', 40000, 90000, 'https://cf.shopee.vn/file/bf604777d9422bdf7af3a5b5c3640a47', 'Dép được thiết kế tinh sảo hình trái tim vô cùng dễ thương và đẹp mắt. Sản phẩm được mua làm quà tặng cho bạn bè người thân thì vô cùng tuyệt vời. Dép được làm bằng chất liệu caosu non nên đi êm chân, thoải mái cho đôi chân - Dép này nếu chân dày thì nên cộng thêm size , chân ko dày thì để bình thường nha kích thước dép : 36-37 = 24cm , 38-39 = 25 , 40-41 = 26cm', 2, '2022-12-04'),
(77, 'dep', 'Dép Nữ Quai H Nhiều Màu Vân Mới', 'female', 70000, 110000, 'https://cf.shopee.vn/file/0850e5cdfbb2beaaeee99426e12ed66c', '- Chất liệu: Da tổng hợp - Kích Thước dài dép: 35 = 23cm,\r\n    36 = 23,\r\n    5cm 37 = 24cm 38 = 24,\r\n    5cm 39 = 25cm - Thiết kế đẹp mắt,\r\n    phong cách trẻ trung cho bạn gái luôn nổi bật,\r\n    thanh lịch.- Màu sắc trang nhã,\r\n    dễ phối cùng nhiều kiểu trang phục khác nhau.- Bền đẹp theo thời gian', 10, '2022-12-04');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(20) DEFAULT NULL,
  `reply` text NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `name`, `email`, `phone`, `reply`, `created_at`) VALUES
(2, 'Ngô Nhật Thiên', 'ngonhatthien2@gmail.com', 0, 'Shop tuyệt vời', '2022-12-04'),
(5, 'Nguyễn Văn Jack', 'jack5trieu@gmail.com', 999999999, 'Nên cải thiện thêm', '2022-12-05'),
(7, 'Ngô Nhật Thiên', 'ngonhatthien2@gmail.com', 369359121, 'Hiii', '2022-12-05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`cmt_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
