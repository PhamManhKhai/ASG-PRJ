USE [Asignment]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[AccountID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [float] NULL,
	[note] [nvarchar](255) NULL,
	[create_date] [date] NULL,
	[shipping_id] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (1, N'khai', N'123456', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (1, N'ab', N'1', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (1, N'cd', N'1', 0, 0, 1)


SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Mặt dây ngọc')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Vòng ngọc')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Vòng hạt')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Chuỗi hạt')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (5, N'Nhẫn')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (6, N'khuyên tai')



SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 


INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (23, N'Mặt dây rồng ẩn nguyên thạch Ngọc phỉ thuý tự nhiên Jadeite loại A -NT1087', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/358/981/products/z5223218625744-86d911ac084b12c234e409f87daef460.jpg?v=1709723174690', 7000, N'Sản phẩm : Mặt dây rồng ẩn Ngọc phỉ thuý tự nhiên Jadeite loại A
Kích thước: 62.9 * 24.5 * 12 mm
Chế tác : Nghệ nhân NGỌC THIÊNG
Chất ngọc : 100% NGỌC TỰ NHIÊN MYANMAR', N'Sản phẩm : Mặt dây rồng ẩn Ngọc phỉ thuý tự nhiên Jadeite loại A
Kích thước: 62.9 * 24.5 * 12 mm
Chế tác : Nghệ nhân NGỌC THIÊNG
Chất ngọc : 100% NGỌC TỰ NHIÊN MYANMAR', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (24, N'Khuyên tai ngọc phỉ thúy mực dục Myanmar, vàng trắng 14k, kim cương thiên nhiên ', N'https://rubystone.com.vn/wp-content/uploads/2024/01/115EA8CD-CF5C-4755-9501-073E19EFE066.jpeg?v=1705148708', 5000, N'Mực dục theo tích xưa dành cho giới nhà giàu - phù hộ, lý do là với các màu ngọc khác đẹp sẽ hay bị cung hiên cho vua chúa
', N'Mực dục theo tích xưa dành cho giới nhà giàu - phù hộ, lý do là với các màu ngọc khác đẹp sẽ hay bị cung hiên cho vua chúa
', 6, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (25, N'Ngọc Phỉ Thúy - Mặt Dây- Tuổi Ngựa', N'https://ankhangchibao.com/thumbs/800x800x1/upload/product/z4845818738765d0aca2c64188942e00c1acda88321494-2826.jpg', 1600, N'Mặt dây điêu khắc hình chú ngựa - Mã đáo thành công, trên nền ngọc phỉ thúy chất trung băng màu trắng sữa, chất ngọc mịn, mướt, nam nữ đeo đều phù hợp. ', N'Mặt dây điêu khắc hình chú ngựa - Mã đáo thành công, trên nền ngọc phỉ thúy chất trung băng màu trắng sữa, chất ngọc mịn, mướt, nam nữ đeo đều phù hợp. ', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (26, N'Ngọc Phỉ Thúy Myanmar - Vô Sự Bài - Quan Công', N'https://ankhangchibao.com/thumbs/800x800x1/upload/product/1-2298.jpg', 4000, N'Hình tượng Ngài Quan Công biểu trưng cho sự khảng khái, thẳng thắn, dứt khoát, tiền hậu nhất quán, ý chí kiên cường, quyết tâm cao, luôn đứng về chính nghĩa. Nhiều vị khách nam thường sưu tầm ngài để tôn thờ, với tư duy tích cực, hướng đến điều tốt đẹp nhất. Với chất ngọc thiên nhiên, chủ nhân mang đeo hỗ trợ cân bằng khí huyết, tốt cho sức khỏe', N'Hình tượng Ngài Quan Công biểu trưng cho sự khảng khái, thẳng thắn, dứt khoát, tiền hậu nhất quán, ý chí kiên cường, quyết tâm cao, luôn đứng về chính nghĩa. Nhiều vị khách nam thường sưu tầm ngài để tôn thờ, với tư duy tích cực, hướng đến điều tốt đẹp nhất. Với chất ngọc thiên nhiên, chủ nhân mang đeo hỗ trợ cân bằng khí huyết, tốt cho sức khỏe', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (27, N'Ngọc Phỉ Thúy - Mặt Dây Chuyền - Lá Ngọc Bồ Đề', N'https://ankhangchibao.com/thumbs/800x800x1/upload/product/z48270851535967ca25ea09de2673e36fd4824db09396b-2658.jpg', 2000, N'Quà tặng lý tưởng cho các mẹ và các chị có mệnh hỏa, thổ', N'Quà tặng lý tưởng cho các mẹ và các chị có mệnh hỏa, thổ', 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (28, N'Ngọc Phỉ Thúy - Mặt Dây Chuyền - Đậu Bình An', N'https://ankhangchibao.com/thumbs/800x800x1/upload/product/z4783824535677526113ebc6b7211af46249ba72bfe4f8-9220.jpg', 3000, N'Hạt đậu Bình an này được tạc từ viên ngọc phỉ thúy với chất ngọc già, thông đèn, khởi quang, trông rất bóng mướt. Mặt dây phù hợp với mang đeo kèm dây chuyền nhỏ xinh, hạp mệnh kim, thủy', N'Hạt đậu Bình an này được tạc từ viên ngọc phỉ thúy với chất ngọc già, thông đèn, khởi quang, trông rất bóng mướt. Mặt dây phù hợp với mang đeo kèm dây chuyền nhỏ xinh, hạp mệnh kim, thủy', 1, 1)

SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (24, N'guess ', N'12345678', N'China')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_product] FOREIGN KEY([AccountID])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipping] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipping]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_Category]
GO
