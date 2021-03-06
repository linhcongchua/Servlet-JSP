USE [master]
GO
/****** Object:  Database [PRJ321_InClass]    Script Date: 11/17/2020 11:30:14 PM ******/
CREATE DATABASE [PRJ321_InClass]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ321_InClass', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PRJ321_InClass.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PRJ321_InClass_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PRJ321_InClass_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PRJ321_InClass] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ321_InClass].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ321_InClass] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ321_InClass] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ321_InClass] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ321_InClass] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ321_InClass] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ321_InClass] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ321_InClass] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ321_InClass] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ321_InClass] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ321_InClass] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PRJ321_InClass] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ321_InClass', N'ON'
GO
USE [PRJ321_InClass]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/17/2020 11:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[Xa] [nvarchar](50) NULL,
	[addressNo] [nvarchar](50) NULL,
	[homeNo] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[role] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/17/2020 11:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[accountid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[contentC] [nvarchar](500) NOT NULL,
	[dateC] [date] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LikeProduct]    Script Date: 11/17/2020 11:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikeProduct](
	[productID] [int] NOT NULL,
	[accountID] [int] NOT NULL,
	[dateLike] [datetime] NULL,
 CONSTRAINT [PK_LikeProduct] PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MainProduct]    Script Date: 11/17/2020 11:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productID] [int] NOT NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_MainProduct] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/17/2020 11:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[accountID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[dateBuy] [datetime] NULL,
	[orderID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/17/2020 11:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[typeID] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
	[image] [nvarchar](50) NULL,
	[salePrice] [float] NULL,
	[price] [float] NULL,
	[rate] [int] NULL,
	[sold] [int] NULL,
	[available] [bit] NULL,
	[description] [nvarchar](500) NULL,
	[ingredient] [nvarchar](500) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 11/17/2020 11:30:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[typeID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[image] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountID], [username], [password], [name], [Xa], [addressNo], [homeNo], [phone], [email], [role]) VALUES (1, N'linh', N'linh', N'Do Van Linh', N'Háº¡ Báº±ng', N'', N'Ha Bang', N'0971741127', N'linhdvhe140899@fpt.edu.com', NULL)
INSERT [dbo].[Account] ([accountID], [username], [password], [name], [Xa], [addressNo], [homeNo], [phone], [email], [role]) VALUES (2, N'ngoc', N'ngoc', N'Nguyen Thi Bich Ngoc', N'Háº¡ Báº±ng', N'duong 49', N'thuy lai', N'', N'ngoc@gmail.com', NULL)
INSERT [dbo].[Account] ([accountID], [username], [password], [name], [Xa], [addressNo], [homeNo], [phone], [email], [role]) VALUES (4, N'manh', N'manh', N'Do Manh', NULL, N'', N'', N'', N'', NULL)
INSERT [dbo].[Account] ([accountID], [username], [password], [name], [Xa], [addressNo], [homeNo], [phone], [email], [role]) VALUES (5, N'admin', N'admin', N'Administrator', NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [accountid], [productid], [contentC], [dateC]) VALUES (1, 1, 1, N'Very good bạn ơi', CAST(N'2020-11-15' AS Date))
INSERT [dbo].[Comment] ([id], [accountid], [productid], [contentC], [dateC]) VALUES (2, 1, 1, N'hello giao hang nhanh', CAST(N'2020-11-16' AS Date))
INSERT [dbo].[Comment] ([id], [accountid], [productid], [contentC], [dateC]) VALUES (3, 1, 1, N'do uong hop ly', CAST(N'2020-11-16' AS Date))
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[MainProduct] ON 

INSERT [dbo].[MainProduct] ([id], [productID], [description]) VALUES (1, 1, N'')
INSERT [dbo].[MainProduct] ([id], [productID], [description]) VALUES (2, 5, NULL)
INSERT [dbo].[MainProduct] ([id], [productID], [description]) VALUES (3, 6, NULL)
INSERT [dbo].[MainProduct] ([id], [productID], [description]) VALUES (4, 13, NULL)
INSERT [dbo].[MainProduct] ([id], [productID], [description]) VALUES (5, 15, NULL)
INSERT [dbo].[MainProduct] ([id], [productID], [description]) VALUES (6, 18, NULL)
INSERT [dbo].[MainProduct] ([id], [productID], [description]) VALUES (7, 22, NULL)
INSERT [dbo].[MainProduct] ([id], [productID], [description]) VALUES (8, 25, NULL)
INSERT [dbo].[MainProduct] ([id], [productID], [description]) VALUES (9, 34, NULL)
INSERT [dbo].[MainProduct] ([id], [productID], [description]) VALUES (10, 40, NULL)
INSERT [dbo].[MainProduct] ([id], [productID], [description]) VALUES (11, 44, NULL)
SET IDENTITY_INSERT [dbo].[MainProduct] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([accountID], [productID], [quantity], [status], [dateBuy], [orderID]) VALUES (1, 6, 5, 1, CAST(N'2020-10-29 00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Order] ([accountID], [productID], [quantity], [status], [dateBuy], [orderID]) VALUES (1, 5, 3, 1, CAST(N'2020-11-03 00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Order] ([accountID], [productID], [quantity], [status], [dateBuy], [orderID]) VALUES (1, 7, 1, 1, CAST(N'2020-11-15 00:00:00.000' AS DateTime), 47)
INSERT [dbo].[Order] ([accountID], [productID], [quantity], [status], [dateBuy], [orderID]) VALUES (1, 3, 3, 1, CAST(N'2020-11-15 00:00:00.000' AS DateTime), 48)
INSERT [dbo].[Order] ([accountID], [productID], [quantity], [status], [dateBuy], [orderID]) VALUES (1, 7, 1, 1, CAST(N'2020-11-15 00:00:00.000' AS DateTime), 51)
INSERT [dbo].[Order] ([accountID], [productID], [quantity], [status], [dateBuy], [orderID]) VALUES (1, 3, 3, 1, CAST(N'2020-11-15 00:00:00.000' AS DateTime), 52)
INSERT [dbo].[Order] ([accountID], [productID], [quantity], [status], [dateBuy], [orderID]) VALUES (1, 1, 2, 1, CAST(N'2020-11-15 00:00:00.000' AS DateTime), 53)
INSERT [dbo].[Order] ([accountID], [productID], [quantity], [status], [dateBuy], [orderID]) VALUES (1, 1, 2, 1, CAST(N'2020-11-15 00:00:00.000' AS DateTime), 54)
INSERT [dbo].[Order] ([accountID], [productID], [quantity], [status], [dateBuy], [orderID]) VALUES (1, 1, 2, 1, CAST(N'2020-11-15 00:00:00.000' AS DateTime), 56)
INSERT [dbo].[Order] ([accountID], [productID], [quantity], [status], [dateBuy], [orderID]) VALUES (1, 3, 2, 1, CAST(N'2020-11-16 00:00:00.000' AS DateTime), 67)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (1, N'Trà Chanh Xí Muội', 1, N'seller', N'trachanhximuoi.jpg', 15, 10, 90, 2000, 1, N'Nước chanh xí muội cách pha tưởng chừng như đơn giản nhưng cũng đủ để chứng tỏ sự khéo léo của mình với những ly nước chanh xí muội ngon mát sảng khoái cho gia đình và người thân rồi đấy bạn nhé. Trà chanh xí muội rất thích hợp để thưởng thức trong những ngày hè khi thời tiết oi bức, sau những giờ làm việc mệt mỏi và căng thẳng đấy ạ, nó sẽ giúp phần cho cơ thể bạn tỉnh táo và sảng khoảng hơn.', N'– 1 ly nước trà

– 1/2 trái chanh

– 3 trái xí muội

– 4 thìa đường kính')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (2, N'Trà Vải Nữ Hoàng', 1, NULL, N'travainuhoang.jpg', NULL, 20, 85, 1235, 1, N'Dâu rừng có hình dáng dễ thương, màu sắc đẹp mắt và vị chua ngọt ăn hoài không ngán đã đốn tim nhiều bạn trẻ. Không chỉ dừng lại ở mức đẹp, ngon, dâu rừng còn là loại trái cây bổ dưỡng. Trong dâu rừng chứa nhiều vitamin C – loại vitamin thần kì tăng sức đề kháng cho cơ thể và ngăn chặn quá trình lão hóa của cơ thể. Dâu rừng còn được xem là người bạn thân thiện của da. Các dưỡng chất có trong dâu tây giúp cho da luôn hồng hào, tươi trẻ. ', N'1/4 cốc si rô vải
3 cốc nước
2 đến 3 túi trà đen')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (3, N'Trà Vải Đậu Biếc', 1, NULL, N'travaidaubiec.jpg', 30, 25, 87, 899, 1, N'Ngay khi sản phẩm này ra mắt mùa tết năm 2018 mọi người đều rất thích bởi mùi thơm nhẹ nhàng của hoa nhài, mùi thơm của trái cây, và vị trà thanh của Olong, khi uống nóng và lạnh đều cho bạn cảm giác nhẹ nhàng, thư thái ạ', N'110ml nước cốt hoa đậu biếc 
 nước cốt tắc (1 trái ) nước đường')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (4, N'Trà Nhiệt Đới Gió Mùa', 1, NULL, N'trahoaquanhietdoi.jpg', NULL, 20, 85, 751, 1, N'Một ấm trà hoa quả được mix từ nhiều thành phần, tạo nên màu sắc sặc sỡ, cực kì bắt mắt, thu hút bạn từ ánh nhìn đầu tiên.

Không chỉ có mùi hương tự nhiên của các loại quả, bạn hoàn toàn có thể sử dụng thêm các loại tinh chất hoa, cánh hoa hồng, quế hoa,… để làm dậy thêm hương vị, ấm trà sẽ hấp dẫn hơn bao giờ hết.

Mách nhỏ cho bạn, có thể dùng thêm cốt trà ô long để vị trà thêm đậm đà, màu trà sẽ đẹp mắt hơn đấy!!', N'- 1/2 trái thanh long
-  1/2 trái táo
-  1/2 trái lê
- 2 trái đào
- 5-7 trái dâu tằm hoặc bất kì loại trái cây nào bạn thích
- 1 gói trà túi lọc
- 1 thìa nhỏ mật ong
- 1 thìa nhỏ đường nâu
- 1 lít nước lọc')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (5, N'Trà Đào Cam Xả', 1, NULL, N'tradaocamxa.jpg', 30, 25, 84, 1356, 1, N'Trà đào cam sả – cái tên nghe có vẻ lạ tai nhưng thực chất rất đơn giản và dễ làm. Chúng ta sẽ sử dụng cam vàng (một số địa phương gọi là cam Mỹ) chứ không sử dụng cam sành hoặc các loại cam vỏ xanh, vì như thế khi uống sẽ có vị đăng đắng, thậm chí át mất mùi thơm thoang thoảng của cam.', N'Cây sả 2 cây
 Nước 1 lít
 Trà túi lọc hương đào 6 gr
(3 túi)
 Đường 30 gr
 Cam 1 trái
 Đào ngâm')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (6, N'Cam ép', 2, NULL, N'camep.jpg', 25, 20, 88, 1582, 1, N'Nước cam ép giàu chất khoáng, flavonoid, vitamin và phytonutrient tốt cho sức khỏe. Không chỉ chứa vitamin C, nước cam ép còn có hàm lượng cao chất sắt, mangan, kẽm, a xít folic, phốt pho...', N'Cam Ta Nước Đường')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (7, N'Dứa ép', 2, NULL, N'duaep.jpg', 25, 20, 94, 956, 1, N'Tác dụng của nước ép dứa không chỉ là giải nhiệt hiệu quả mà còn có giảm cân vừa hiệu quả lại an toàn, đồng thời, bổ sung vitamin C và nhiều khoáng chất cần thiết khác cho cơ thể. Cùng tham khảo cách làm nước ép dứa giảm cân thơm ngon, bổ dưỡng, bổ sung vào thực đơn ngay nhé!', N'1/2 quả dứa tươi30ml nước đường5ml nước cốt chanh2 muỗng đường cát Đá viên')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (8, N'Chanh Dây', 2, N'new', N'chanhday.jpg', 25, 20, 94, 564, 1, N'Chanh dây có rất nhiều lợi ích cho sức khỏe và thường được chọn làm nguyên liệu cho các món bánh, món giải khát nhờ hương vị thơm, ngon, chua chua đặc trưng. Nếu bạn đang cảm thấy nóng bức trong người thì hãy chọn ngay một ly chanh dây thơm mát để giải nhiệt nhé.', N'2 trái chanh dây
2 muỗng canh đường
1/2 muỗng cà phê muối
Đá viên')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (9, N'Cam Carot', 2, N'sale', N'camcarot.jpg', 30, 25, 98, 846, 1, N'Các món sinh tố thơm ngon hấp dẫn sẽ không thể thiếu khi mùa hè đang đến, không chỉ có nhiều tác dụng tốt cho sức khỏe, nhiều món sinh tố còn phát huy công dụng làm đẹp da từ bên trong cực kỳ hiệu quả. Sinh tố cam cà rốt dưới đây là một món sinh tố đáp ứng đầy đủ các tiêu chí trên được rất nhiều chị em phụ nữ yêu thích, chỉ cần mỗi ngày 1 ly sinh tố cà rốt là bạn đã cung cấp đẩy đủ vitamin, khoáng chất cho sức khỏe và vẻ đẹp của mình rồi.

', N'1 quả cam ngon
2 củ cà rốt
10 ml nước cốt chanh
2 lát gừng mỏng
160ml Syrup chút đường
Đá viên nếu bạn muốn uống lạnh')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (10, N'Dưa Hấu ép', 2, NULL, N'duahauep.jpg', 25, 20, 89, 761, 1, N'Uống nước ép dưa hấu giúp tăng cường năng lượng, giảm đường huyết, phòng chống các bệnh mùa hè, cải thiện sức khỏe của mắt, giúp xương chắc khỏe, tốt cho da và tóc…', N'Dưa hấu
 Chanh
 Đá viên
 Siro')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (11, N'Sinh tố Bơ', 2, N'sale', N'sinhtobo.jpg', 30, 25, 96, 1560, 1, N'Sinh tố bơ rất được chị em yêu thích bởi vị béo ngậy cùng mùi thơm đặc trưng. Bên cạnh đó, bơ còn có tác dụng làm đẹp và chứa nhiều chất dinh dưỡng tốt cho sức khỏe.', N' Bơ sáp chín
 Sữa đặc
 Sữa tươi
 Nước cốt dừa
 Đường
 Đá viên')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (12, N'Sinh tố Xoài', 2, NULL, N'sinhtoxoai.jpg', 30, 25, 89, 1289, 1, N'Xoài là loại trái cây miền nhiệt đới đặc trưng. Mùa hè đến cũng là mùa thu hoạch xoài.
Mùa nào thức ấy sẽ giúp món ăn luôn tươi ngon. 
Hãy cùng tận dụng xoài chín để chế biến nhiều món ngon – sinh tố xoài là một ví dụ không thể bỏ qua. Cùng Lamaca tìm hiểu cách làm sinh tố xoài thơm mát giải nhiệt ngày hè nào', N'Xoài chín
Cam tươi
Nước cốt dừa
Trân châu khô
Đường trắng')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (13, N'Cafe Đá Xay', 3, N'new', N'cafedaxay.jpg', NULL, 30, 95, 458, 1, N'Cafe đá xay là tên gọi của thức uống dưới dạng cafe xay kèm sữa và đá, chúng được thế giới gọi chung là coffe ice blended (riêng Starbucks đã đăng ký độc quyền riêng trên thế giới các tên Frappuccino để chỉ món đồ uống cafe đá xay của hãng này).
Cafe đá xay là món đồ uống nổi bật với sự hòa quyện đầy hấp dẫn của vị đắng từ cafe, vị béo ngậy thơm ngon từ đường, sữa và kem.', N'Cafe Espresso: 50 ml
Bánh oreo nhân socola: 3 – 4 chiếc
Sữa tươi: 40ml
Sữa đặc: 50ml
Bột Frappe: 10g
Whipping cream, chocolate vụn hoặc bánh oreo vụn để trang trí
Đá viên')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (14, N'Matcha Đá Xay', 3, NULL, N'matchadaxay.jpg', 35, 30, 89, 625, 1, N'Hương vị thơm lừng mùi matcha hòa quyện với sữa tươi béo ngậy, được xay cùng với đá thành từng lớp mịn, mát lạnh. Còn gì tuyệt vời hơn khi được thưởng thức món uống này trong khi ngồi chuyện trò cùng bạn bè nhỉ? ', N'sữa tươi không đường
nước đường
sữa béo
bột matcha Nhật
cà phêĐá viên
Whipping cream và đường cát.')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (15, N'Khoai Môn Bạc Hà Đá Xay', 3, N'new', N'khoaimonbachadaxay.jpg', 35, 30, 84, 348, 1, N'Sinh tố khoai môn có vị beo béo như các loại hạt và đậu, nhưng có mùi thơm đặc trưng của khoai môn, mang đến cảm giác nhẹ nhàng và dễ chịu khi uống.', N'Bột khoai môn
Bột béo B''One
Sữa tươi không đường
Sữa đặc
Đường cát')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (17, N'Vải Đá Xay', 3, N'seller', N'vaidaxay.jpg', NULL, 30, 89, 1362, 1, N'Biến tấu món trà vải thông thường thành món trà vải đá xay là cách để bạn thay đổi khẩu vị mỗi ngày. Thức uống là sự kết hợp hài hòa giữa vị trà xanh thanh nhẹ với vải thơm, chua chua, ngọt ngọt, thêm ít đá viên mát lạnh nơi đầu lưỡi. Bên cạnh tác dụng giải khát, cách pha trà vải sẽ cho bạn một thức uống giúp thanh nhiệt, đồng thời, bổ sung vitamin và khoáng chất cho cơ thể, hỗ trợ thư giãn, giải tỏa stress', N'Syrup vải
Trà xanh
Vải ngâm
Đá viên
Lá hương thảo hoặc lá mint
')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (18, N'Mocktail Cam Đào', 4, N'seller', N'mocktailcamdao.jpg', NULL, 30, 92, 1148, 1, N'Mocktail cam đào là sự kết hợp hài hòa giữa vị chua dịu mát của cam tươi, mùi thơm của vani và sả cây cùng với đó là chút giòn dai sần sật của đào tươi rất thơm ngon. Mocktail đào cam sả thích hợp cho những buổi tiệc nhẹ, gặp gỡ bạn bè, hoặc đơn giản là một buổi trưa đầy nắng. Hương vị tươi mát của thức uống giúp bạn đánh tan mệt mỏi, đẩy tâm trạng hung phấn hơn, từ đó tận hưởng được trọn vẹn cuộc sống.', N'Cam tươi
Thơm
Đào ngâm
Đường
Vani
Sả
Đá viên.')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (19, N'Mocktail Fruit', 4, N'seller', N'mocktailfruit.jpg', 35, 30, 98, 1589, 1, N'Chỉ với một chút biến tấu trong nguyên liệu, cách làm Mocktail Cool Fruit Cochinchin Gourd của Dạy Pha Chế Á Âu sẽ mang đến cho bạn một thức uống với hương vị thơm ngon, lạ miệng. Món đồ uống từ nguyên liệu trái cây này sẽ là một lựa chọn để thay đổi khẩu vị ngày cuối tuần cho bạn và cả gia đình.', N'orange juice
lemon juice
sugar syrup
gấc syrup
cam vàng')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (20, N'Mocktail Chanh Dây', 4, N'seller', N'mocktailchanhday.jpg', 35, 30, 94, 1189, 1, N'Mocktail chanh dây thơm mát, được làm từ chanh dây tươi nên cho bạn cảm giác sảng khoái. Với phần syrup chanh dây tự làm bạn sẽ có ngay một ly Mocktail chanh dây chuẩn Bar cho buổi tiệc tùng cùng gia đình và bạn bè trong ngày cuối tuần.', N'Chanh dây
Lá bạc hà
chanh tươi
Đường cát
Nước đường
Soda không đường
Đá viên.')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (21, N'Purple Mocktail', 4, N'seller', N'purplemocktail.jpg', 35, 30, 92, 945, 1, N'Với cái tên vô cùng lãng mạn, Purple Mocktail mang đến cho người thưởng thức chút say đắm ngọt ngào nhưng cũng đầy sảng khoái. Hãy thực hiện thức uống này cho một nửa thương yêu trong mùa Valentine này nhé!', N'Syrup nho đen
Nước cốtchanh
Đường cát
Soda không đường
lá bạc hà
Đá viên.')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (22, N'Mojito Dâu', 6, NULL, N'mojitodau.jpg', NULL, 30, 88, 812, 1, N'
Mojito là loại thức uống có từ lâu đời trên thế giới. Từ khi du nhập vào Việt Nam, mojito được lòng nhiều bạn trẻ bởi cảm giác sảng khoái mà chúng mang lại, nhất là vào những ngày hè nắng nóng. Mojito dâu tây (mojito strawberry) là một trong những loại được nhiều bạn gái ưu tiên lựa chọn vì màu sắc nổi bật, hương dâu thơm thoang thoảng, vị bạc hà the mát và đặc biệt là nước có ga nhẹ, không qua ngọt.', N'soda
dâu tây tươi
syrup dâu
syrup bạc hà
nước đường
húng lủi
Đá viên.')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (24, N'Mojito Bạc Hà', 6, NULL, N'mojitobacha.jpg', NULL, 30, 92, 845, 1, N'Mojito bạc hà có vị chua dìu dịu của chanh, the mát của lá bạc hà mang lại. Tất tần tật nguyên liệu đó hòa quyện với rượu rum tạo nên cơn lốc tưới mát trong ngày hè gay gắt. Cách làm Mojito bạc hà rất phổ biến trên khắp thế giới và có rất nhiều biến tấu dựa trên sự pha trộn của nhiều nguyên liệu khác nhau.', N'Lá bạc hà
Chanh
Đường cát
Soda chanh
Đá viên')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (25, N'Mojito Việt Quất', 6, N'new', N'mojitovietquat.jpg', NULL, 30, 91, 1056, 1, N'Chỉ với một ly Mojito Việt Quất (Blueberry) mát lạnh sẽ mang đến cho người thưởng thức một tinh thần sảng khoái. Nhờ vào hương thơm mát và vị chua ngọt hấp dẫn mà Mojito việt quất là đồ uống yêu thích của nhiều người. ', N'Mojito Mint syrup.
Blueberry syrup
chanh tươi
đường cát trắng
Soda
Đá viên
Quả việt quất')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (28, N'Black Mojito', 6, N'new', N'blackmojito.jpg', NULL, 30, 87, 846, 1, N'Nhắc đến Mojito là nhắc đến cảm giác sảng khoái khó có thể nào cưỡng lại được. Mỗi ly thức uống với một màu sắc riêng nhưng đồng điệu ở chút thanh thanh của trái cây, ngọt nhẹ của Soda, thêm vài viên đá trong suốt tạo nên cảm giác mát lạnh cho người thưởng thức.

Trong đó, Mojito nho đen là khúc biến tấu cảm hứng giữa chút chua chua ngọt ngọt của syrup nho đen với vị đặc trưng đầy tươi mới của Soda dành riêng cho bạn.', N'Syrup nho đen
Soda
Nước cốt chanh
Chanh
Đường
lá bạc hà
Đá viên')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (30, N'Blue Lagoon', 5, N'Có Cồn', N'bluelagoon.jpg', NULL, 35, 89, 345, 1, N'Cocktail Blue Hawaiian với màu xanh mát của đại dương, hòa quyện cùng hương vị tinh tế của Rhum tạo nên một ly thức uống tuyệt vời. Hướng Nghiệp Á Âu sẽ hướng dẫn bạn công thức pha chế cocktail Blue Hawaiian từ rượu Blue Curacao.', N'Rượu Light Rhum
Nước cốt dừa
Rượu Blue Curacao
Nước dừa
Một ít đá viên')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (33, N'Daiquiri', 5, N'Có Cồn', N'daiquiri.jpg', 40, 35, 94, 458, 1, N'Cách làm Cocktail Daiquiri cổ điển sẽ mang đến cho bạn một món đồ uống thanh mát mà quyến rũ. Chỉ với hai thành phần chính đơn giản là Rum và nước chanh nhưng Daiquiri Cocktail dễ dàng chinh phục và biến những người sành rượu thành “fan cuồng” của mình.', N'White Rum (Havanta Club)
nước cốt chanh
nước đường
Chanh vàng')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (34, N'New Yorker', 5, N'Có Cồn', N'newyorker.jpg', 40, 35, 96, 589, 1, N'
370/5000
New York Cocktail là một thức uống cổ điển và cách pha đơn giản là thứ mà nhiều người uống sẽ thích thú. Nó tương tự như Whisky Sour, mặc dù công thức này thêm vị ngọt của grenadine để cân bằng một số vị chua. Việc lựa chọn rượu whisky là điều dễ hiểu. Ban đầu, rượu whisky pha trộn được sử dụng, nhưng ngày nay có rất nhiều lựa chọn tuyệt vời.', N'blended whiskey
lemon juice
superfine sugar
grenadine
lemon twist')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (35, N'Jager Bomb', 5, N'Có Cồn', N'jagerbomb.jpg', 40, 35, 94, 653, 1, N'Jager Bomb đang ngày càng được các bạn trẻ Việt Nam tìm đến bởi sự mới lạ giữa sự kết hợp 56 loại thảo mộc của jagermeister và nước tăng lực mà cụ thể là Red Bull. Là một trong những thức uống huyền thoại gắn liền với tên tuổi của jagermeister, Jager Bomb hoàn toàn có thể thuyết phục bạn thưởng thức chỉ với vẻ bề ngoài và hương thơm ngào ngạt của nó.', N'Jagermeister
nước tăng lực red bull')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (36, N'B52', 5, N'Có Cồn', N'b52.jpg', 40, 35, 95, 764, 1, N'Loại cocktail này có tên gọi được bắt nguồn từ kiểu máy bay ném bom tầm xa B52. Hai nhà hàng nổi tiếng là Alice ở Malibu, thuộc nước Mỹ và nhà hàng Keg Steakhouse, Canada đều đòi quyền sáng chế ra B52.

Kể từ khi ra đời năm 1977, loại cocktail đã nhanh chóng nổi tiếng trên toàn thế giới và rất được lòng những ai thích thưởng thức những loại đồ uống có cảm giác mạnh.', N'rượu Baileys Irish Cream.
rượu hương cà phê.
rượu hương cam Le Grand Marnier.')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (37, N'Margarita', 5, N'Có Cồn', N'margarita.jpg', 40, 35, 92, 461, 1, N'Margarita là loại cocktail có lịch sử lâu đời và được thế giới biết đến như một đại diện cho các món cocktail. Loại cocktail này là sự kết hợp giữa rượu Tequila với Triple Sec hoặc Cointreau hay bất cứ loại rượu nào có hương cam nào khác cùng với nước chanh tươi.', N'Tequila
Cointreau
chanh xanh
Muối tinh
Đá viên')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (38, N'Black Russian', 5, N'Có Cồn', N'blackrussian.jpg', 40, 35, 90, 621, 1, N'Khi nhắc đến White Russian Cocktail, người ta sẽ nghĩ ngay đến nước Nga. Đơn giản vì thành phần chính của thức uống này là rượu Vodka – một loại rượu mạnh nổi tiếng thế giới, được xem là niềm tự hào của người Nga. Và ở nước Nga có hẳn một bảo tàng rượu Vodka.', N'Vodka
sữa tươi
Kahlua
Đá cục')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (39, N'StrawBerry Daiquiri', 5, N'Có Cồn', N'strawberrydaiquiri.jpg', 40, 35, 89, 584, 1, N'Nếu bạn là người từng say đắm bởi mùi vị của Margarita cổ điển hẳn sẽ cảm thấy Strawberry Basil hơi nhẹ đô hơn. Tuy nhiên trong vị của rượu mạnh, mùi dâu thơm thơm, chua chua sẽ làm dịu lại vị cay, hòa quyện chút ngọt chua của chanh, vị mằn mặn của muối tôm làm lan tỏa hương vị trong khoang miệng sẽ không làm bạn thất vọng. Ly cocktail được biến tấu mới lạ hơn, sự độc đáo của nó còn nằm ở màu đỏ càng làm món nước thêm quyến rũ.', N'Tequila
Strawberry Puree
nước cốt chanh tươi
trái dâu
Lá húng quế tươi')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (40, N'Hồng Trà Sữa', 9, N'Hot', N'hongtrasua.jpg', NULL, 25, 94, 864, 1, N'Hồng trà (hay còn được gọi là trà đen) là một loại trà được lên men toàn phần trong quá trình chế biến từ lá chè tươi thành trà khô thành phẩm. Sau công đoạn làm héo lá chè, chè được cho lên men tự nhiên ở nhiệt độ môi trường. Tuỳ vào thời tiết mà thời gian lên men có thể kéo dài từ 30 - 60 phút.', N'Trà đen pha chế Chính Sơn
Sữa tươi không đường
Đường trắng
Topping hoặc trân châu')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (41, N'Trà Sữa Bạc Hà', 9, N'Hot', N'trasuabacha.jpg', NULL, 25, 90, 786, 1, N'Là một trong những thức uống giải nhiệt tốt nhất cho mùa hè, trà sữa này có nhiều công dụng hữu ích cho sức khỏe từ tinh dầu bạc hà. Theo các nghiên cứu, bạc hà (hay rau húng lủi) dồi dào chất limonene, dihydrocarvone và cineol… kích thích tuyến nước bọt giúp cho hệ tiêu hóa hoạt động hiệu quả, giảm đau bao tử. Bạc hà còn ngăn ngừa ung thư, làm đẹp da, chữa trị vết cắn côn trùng và giúp hơi thở thơm mát hơn.', N'trà đen
đường phèn
đường cát
bột sữa
syrup bạc hà
trân châu đen
Đá viên
Lá bạc hà')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (42, N'Trà Sữa Dưa Lưới', 9, N'Hot', N'trasuadualuoi.jpg', NULL, 25, 89, 658, 1, N'Trà đen khi pha có màu đỏ đậm hoặc đỏ hồng do quá trình lên men bán toàn phần. Chính màu sắc đẹp mắt này nên trà đen được nhiều người yêu thích sử dụng làm nền trà trong pha chế trà trái cây, trà macchiato. Ngoài ra, trà đen có hàm lượng cafein thấp, ít đắng, hương nồng nên khi kết hợp với các loại trái cây giúp tôn lên được mùi hương tự nhiên của chúng.', N'trà đen
melon syrup
đường nước
syrup chanh
dưa lưới tươi
Đá viên
lá mint trang trí.')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (43, N'Trà Sữa Xốt Xoài', 9, N'Hot', N'trasuasotxoai.jpg', NULL, 25, 88, 732, 1, N'Trà sữa truyền thống vốn đã thơm ngon, khi kết hợp với hương vị trái cây tươi miền nhiệt đới như xoài lại càng trở nên quyến rũ hơn. Một vị ngọt, một vị chua hòa quyện hoàn hảo giúp bạn thưởng thức hoài mà không thấy ngán, lại có thêm topping xoài tươi để nhâm nhi thì còn gì bằng.', N'Trà túi lọc
Xoài chín
Sữa tươi không đường
Sữa đặc
Syrup đường
Đá viên.')
INSERT [dbo].[Product] ([productID], [name], [typeID], [status], [image], [salePrice], [price], [rate], [sold], [available], [description], [ingredient]) VALUES (44, N'Strong Bow', 7, N'new', N'strongbow.jpg', 35, 30, 89, 166, 1, N'Strong Bow la bia hoa qua', N'')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([typeID], [name], [image], [description]) VALUES (1, N'Trà Hoa Quả', N'trahoaqua.jpg', NULL)
INSERT [dbo].[ProductType] ([typeID], [name], [image], [description]) VALUES (2, N'Sinh Tố', N'sinhto.jpg', NULL)
INSERT [dbo].[ProductType] ([typeID], [name], [image], [description]) VALUES (3, N'Đá Xay', N'daxay.jpg', NULL)
INSERT [dbo].[ProductType] ([typeID], [name], [image], [description]) VALUES (4, N'Mocktail', N'mocktail.jpg', NULL)
INSERT [dbo].[ProductType] ([typeID], [name], [image], [description]) VALUES (5, N'Cocktail', N'cocktail.jpg', NULL)
INSERT [dbo].[ProductType] ([typeID], [name], [image], [description]) VALUES (6, N'Mojito', N'mojito.jpg', NULL)
INSERT [dbo].[ProductType] ([typeID], [name], [image], [description]) VALUES (7, N'Bia', N'bia.jpg', NULL)
INSERT [dbo].[ProductType] ([typeID], [name], [image], [description]) VALUES (8, N'Sữa Chua', N'suachua.jpg', NULL)
INSERT [dbo].[ProductType] ([typeID], [name], [image], [description]) VALUES (9, N'Trà Sữa', N'trasua.jpg', NULL)
INSERT [dbo].[ProductType] ([typeID], [name], [image], [description]) VALUES (10, N'Đồ Ăn Vặt', N'doanvat.jpg', NULL)
INSERT [dbo].[ProductType] ([typeID], [name], [image], [description]) VALUES (11, N'Cafe', N'cafe.jpg', NULL)
INSERT [dbo].[ProductType] ([typeID], [name], [image], [description]) VALUES (12, N'shisha', N'shisha.jpg', N'feelhigh')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
/****** Object:  Index [Unique_mainProduct]    Script Date: 11/17/2020 11:30:14 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Unique_mainProduct] ON [dbo].[MainProduct]
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Account] FOREIGN KEY([accountid])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Account]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product] FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product]
GO
ALTER TABLE [dbo].[LikeProduct]  WITH CHECK ADD  CONSTRAINT [FK_LikeProduct_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[LikeProduct] CHECK CONSTRAINT [FK_LikeProduct_Account]
GO
ALTER TABLE [dbo].[LikeProduct]  WITH CHECK ADD  CONSTRAINT [FK_LikeProduct_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[LikeProduct] CHECK CONSTRAINT [FK_LikeProduct_Product]
GO
ALTER TABLE [dbo].[MainProduct]  WITH CHECK ADD  CONSTRAINT [FK_MainProduct_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[MainProduct] CHECK CONSTRAINT [FK_MainProduct_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([typeID])
REFERENCES [dbo].[ProductType] ([typeID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
USE [master]
GO
ALTER DATABASE [PRJ321_InClass] SET  READ_WRITE 
GO
