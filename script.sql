USE [GOTD]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Token] [nvarchar](50) NOT NULL,
	[SoDienThoai] [varchar](50) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anh]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anh](
	[Ma] [nvarchar](50) NOT NULL,
	[MaSP] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoAo]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoAo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [nvarchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatLieu]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatLieu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [nvarchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanPham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [nvarchar](50) NULL,
	[MaLoaiKH] [nvarchar](50) NULL,
	[MaThuongHieu] [nvarchar](50) NULL,
	[MaMau] [nvarchar](50) NULL,
	[MaKichCo] [nvarchar](50) NULL,
	[MaChatLieu] [nvarchar](50) NULL,
	[MaCoAo] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[GiaNhap] [money] NULL,
	[GiaBan] [money] NULL,
	[MoTa] [nvarchar](max) NULL,
	[NgayThem] [datetime] NULL,
	[NgaySua] [datetime] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [nvarchar](50) NULL,
	[MaKhachHang] [nvarchar](50) NULL,
	[DanhGia] [int] NULL,
	[BinhLuan] [nvarchar](max) NULL,
	[Ngay] [datetime] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhSachYeuThich]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachYeuThich](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [nvarchar](50) NULL,
	[MaKhachHang] [nvarchar](50) NULL,
	[Ngay] [datetime] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaChi]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaChi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](100) NULL,
	[ThanhPho] [nvarchar](100) NULL,
	[Quan] [nvarchar](100) NULL,
	[Phuong] [nvarchar](100) NULL,
	[ChiTiet] [nvarchar](100) NULL,
	[MaTaiKhoan] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [nvarchar](50) NULL,
	[MaGiamGia] [nvarchar](50) NULL,
	[SoDienThoai] [varchar](50) NULL,
	[Tinh] [nvarchar](50) NULL,
	[Huyen] [nvarchar](50) NULL,
	[Xa] [nvarchar](50) NULL,
	[DCChiTiet] [nvarchar](100) NULL,
	[NgayDatHang] [datetime] NULL,
	[TienGiam] [money] NULL,
	[PhiGiaoHang] [money] NULL,
	[TongTien] [money] NULL,
	[TrangThai] [int] NULL,
	[Thanhtoan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHangChiTiet]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHangChiTiet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaDonHang] [int] NULL,
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [nvarchar](50) NULL,
	[MaGiamGia] [nvarchar](50) NULL,
	[SoDienThoai] [varchar](50) NULL,
	[Tinh] [nvarchar](50) NULL,
	[Huyen] [nvarchar](50) NULL,
	[Xa] [nvarchar](50) NULL,
	[DCChiTiet] [nvarchar](100) NULL,
	[NgayDatHang] [datetime] NULL,
	[TienGiam] [money] NULL,
	[PhiGiaoHang] [money] NULL,
	[TongTien] [money] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHangChiTiet]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHangChiTiet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaGioHang] [int] NULL,
	[MaSanPham] [int] NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KichCo]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KichCo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [nvarchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiKhachHang]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiKhachHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [nvarchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaGiamGia]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaGiamGia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[Ma] [varchar](50) NULL,
	[SuKien] [nvarchar](50) NULL,
	[HinhThucGiam] [int] NULL,
	[NgayBatDau] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
	[GiamToiThieu] [money] NULL,
	[GiamToiDa] [money] NULL,
	[SoLuong] [int] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MauSac]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauSac](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [nvarchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [nvarchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
	[NgayTao] [datetime] NULL,
	[MoTa] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 12/10/2023 9:10:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [nvarchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'admin', N'123', N'Sin Phúc Duy', N'spduyvn@gmail.com', N'user.png', N'guGLjnQlUbd3M2zWurZVqwmKnCXStBNiAZdnj7VJgoZ22dMJUq', N'0352255034', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'duyspph21810@fpt.edu.vn', N'$2a$10$Xw12MTPhwJUNSg3Y1mW0..qF.OVWjGywHPBHsgNomTq4OzrAtGEo.', N'duyspph 2 1 8 1 0 fplhn', N'duyspph21810@fpt.edu.vn', N'user.png', N'token', NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'spduyvn@gmail.com', N'$2a$10$5XSmEMwelOWbiN513AYf.uhxsXefsatu.1a6NxCSNRKCxa3q4sDpy', N'Duy Sin', N'spduyvn@gmail.com', N'user.png', N'token', NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'user1', N'1234', N'Duyvip00', N'duy9bdz@gmail.com', N'1698867711894_0.jpg', N'kruW3AsV5KsUziXoNfGzE1nGIgHdRRewNwObnGFR6H4qt4sslR', N'0352255034', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'user3', N'1234', N'Sin Phúc Duy', N'eqweeqw@gmail.com', N'user.png', N'token', NULL, 0)
GO
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam1.png', N'SP001', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam10.jpg', N'SP006', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam11.jpg', N'SP006', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam13.png', N'SP0013', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam14.png', N'SP0014', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam16.png', N'SP0016', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam17.png', N'SP0015', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam19.png', N'SP0017', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam1a.png', N'SP001', 0)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam1b.png', N'SP001', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam1c.png', N'SP001', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam2.png', N'SP002', 0)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam21.png', N'SP0018', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam3.png', N'SP002', 0)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam5.png', N'SP003', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam6.png', N'SP004', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam7.png', N'SP004', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam8.png', N'SP008', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam9.png', N'SP005', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nu1.png', N'SP0019', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nu10.png', N'SP0012', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nu12.png', N'SP0011', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nu13.png', N'SP0010', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nu15.png', N'SP009', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nu16.png', N'SP007', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nu4.png', N'SP0021', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nu5.png', N'SP0020', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nu8.png', N'SP007', 1)
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (98, N'admin', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (101, N'admin', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (119, N'admin', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (120, N'user1', N'CUST')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[CoAo] ON 

INSERT [dbo].[CoAo] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'CA001', N'Trái tym', 1)
INSERT [dbo].[CoAo] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'CA002', N'Polo', 1)
INSERT [dbo].[CoAo] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'CA003', N'L', 1)
SET IDENTITY_INSERT [dbo].[CoAo] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatLieu] ON 

INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'CL1', N'Da Khủng Long', 1)
INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'CL2', N'Cánh đại bàng', 1)
INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (4, N'CL001', N'Lông boy phố', 0)
INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (5, N'CL002', N'Da dân tổ', 1)
INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (6, N'CL003', N'Xương động vật', 1)
SET IDENTITY_INSERT [dbo].[ChatLieu] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] ON 

INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1, N'SP001', N'LK001', N'TH001', N'M001', N'KC001', N'CL001', N'CA001', 50, 50.0000, 100000.0000, N'Mô t? chi ti?t SP001', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (2, N'SP001', N'LK002', N'TH002', N'M002', N'KC002', N'CL002', N'CA002', 30, 70.0000, 120000.0000, N'Mô t? chi ti?t SP001', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (3, N'SP002', N'LK003', N'TH003', N'M003', N'KC003', N'CL003', N'CA003', 40, 80.0000, 150000.0000, N'Mô t? chi ti?t SP002', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (4, N'SP004', N'LK003', N'TH003', N'M003', N'KC003', N'CL003', N'CA003', 10, 15.0000, 100000.0000, N'Mô t? chi ti?t SP002', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (5, N'SP003', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 12000.0000, N'Mô t? chi ti?t SP003', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (6, N'SP006', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 13000.0000, N'Mô t? chi ti?t SP006', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (7, N'SP007', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 99000.0000, N'Mô t? chi ti?t SP007', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (8, N'SP008', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 29000.0000, N'Mô t? chi ti?t SP008', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (9, N'SP009', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 110000.0000, N'Mô t? chi ti?t SP009', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (10, N'SP0010', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 34000.0000, N'Mô t? chi ti?t SP0010', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (11, N'SP0011', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 12000.0000, N'Mô t? chi ti?t SP0011', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (12, N'SP0012', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 130000.0000, N'Mô t? chi ti?t SP0012', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (13, N'SP0013', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 150000.0000, N'Mô t? chi ti?t SP0013', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (14, N'SP0014', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 160000.0000, N'Mô t? chi ti?t SP0014', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (15, N'SP0015', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 170000.0000, N'Mô t? chi ti?t SP0015', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (16, N'SP0016', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 120000.0000, N'Mô t? chi ti?t SP0016', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (17, N'SP0017', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 130000.0000, N'Mô t? chi ti?t SP0017', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (18, N'SP0018', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 120000.0000, N'Mô t? chi ti?t SP0018', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (19, N'SP0019', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 130000.0000, N'Mô t? chi ti?t SP0019', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (20, N'SP0020', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 12000.0000, N'Mô t? chi ti?t SP0020', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (21, N'SP0021', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 12000.0000, N'Mô t? chi ti?t SP0020', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhGia] ON 

INSERT [dbo].[DanhGia] ([id], [MaSanPham], [MaKhachHang], [DanhGia], [BinhLuan], [Ngay], [TrangThai]) VALUES (1, N'SP007', N'admin', 4, N'Qúa đẹp nuôn', CAST(N'2023-12-10T13:34:05.190' AS DateTime), 0)
INSERT [dbo].[DanhGia] ([id], [MaSanPham], [MaKhachHang], [DanhGia], [BinhLuan], [Ngay], [TrangThai]) VALUES (2, N'SP0013', N'admin', 2, N'Ok nha', CAST(N'2023-12-10T13:34:15.700' AS DateTime), 0)
INSERT [dbo].[DanhGia] ([id], [MaSanPham], [MaKhachHang], [DanhGia], [BinhLuan], [Ngay], [TrangThai]) VALUES (3, N'SP002', N'duyspph21810@fpt.edu.vn', 2, N'Tạm', CAST(N'2023-12-10T15:41:18.633' AS DateTime), 0)
INSERT [dbo].[DanhGia] ([id], [MaSanPham], [MaKhachHang], [DanhGia], [BinhLuan], [Ngay], [TrangThai]) VALUES (4, N'SP004', N'duyspph21810@fpt.edu.vn', 1, N'<script>alert(''test'');</script>', CAST(N'2023-12-10T15:42:17.970' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[DanhGia] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] ON 

INSERT [dbo].[DanhSachYeuThich] ([id], [MaSanPham], [MaKhachHang], [Ngay], [TrangThai]) VALUES (6, N'SP002', N'user1', CAST(N'2023-11-06T21:18:14.663' AS DateTime), 0)
INSERT [dbo].[DanhSachYeuThich] ([id], [MaSanPham], [MaKhachHang], [Ngay], [TrangThai]) VALUES (15, N'SP002', N'spduyvn@gmail.com', CAST(N'2023-11-08T22:33:45.727' AS DateTime), 0)
INSERT [dbo].[DanhSachYeuThich] ([id], [MaSanPham], [MaKhachHang], [Ngay], [TrangThai]) VALUES (18, N'SP002', N'spduyvn@gmail.com', CAST(N'2023-11-09T00:02:18.127' AS DateTime), 0)
INSERT [dbo].[DanhSachYeuThich] ([id], [MaSanPham], [MaKhachHang], [Ngay], [TrangThai]) VALUES (26, N'SP002', N'admin', CAST(N'2023-11-10T18:43:06.327' AS DateTime), 0)
INSERT [dbo].[DanhSachYeuThich] ([id], [MaSanPham], [MaKhachHang], [Ngay], [TrangThai]) VALUES (27, N'SP004', N'admin', CAST(N'2023-12-09T21:45:08.273' AS DateTime), 0)
INSERT [dbo].[DanhSachYeuThich] ([id], [MaSanPham], [MaKhachHang], [Ngay], [TrangThai]) VALUES (28, N'SP002', N'duyspph21810@fpt.edu.vn', CAST(N'2023-12-10T15:42:55.093' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] OFF
GO
SET IDENTITY_INSERT [dbo].[DiaChi] ON 

INSERT [dbo].[DiaChi] ([id], [Ten], [ThanhPho], [Quan], [Phuong], [ChiTiet], [MaTaiKhoan], [GhiChu], [TrangThai]) VALUES (1, NULL, N'Thành phố Hà Nội', N'Quận Ba Đình', N'Phường Phúc Xá', N'abv', N'admin', NULL, NULL)
INSERT [dbo].[DiaChi] ([id], [Ten], [ThanhPho], [Quan], [Phuong], [ChiTiet], [MaTaiKhoan], [GhiChu], [TrangThai]) VALUES (2, NULL, N'Thành phố Hà Nội', N'Quận Hoàn Kiếm', N'Phường Phúc Tân', N'ccc', N'admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[DiaChi] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (62, N'admin', N'', N'123', N'Thành phố Hà Nội', N'Quận Ba Đình', N'Phường Trúc Bạch', N'123', CAST(N'2023-02-09T00:00:00.000' AS DateTime), 0.0000, 0.0000, 249000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (63, N'admin', N'GG001', N'123', N'Tỉnh Bắc Ninh', N'Thành phố Bắc Ninh', N'Phường Nam Sơn', N'123', CAST(N'2023-03-09T00:00:00.000' AS DateTime), 10.0000, 10000.0000, 138990.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (64, N'admin', N'', N'123', N'Tỉnh Vĩnh Phúc', N'Thành phố Vĩnh Yên', N'Phường Liên Bảo', N'123', CAST(N'2023-02-09T00:00:00.000' AS DateTime), 0.0000, 0.0000, 12000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (65, N'admin', N'GG001', N'123123', N'Tỉnh Hà Giang', N'Thành phố Hà Giang', N'Phường Quang Trung', N'123', CAST(N'2023-01-09T00:00:00.000' AS DateTime), 10.0000, 0.0000, 33990.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (66, N'admin', N'GG002', N'123', N'Tỉnh Bắc Ninh', N'Thị xã Thuận Thành', N'Phường Ninh Xá', N'132', CAST(N'2023-12-09T11:38:58.607' AS DateTime), 20.0000, 0.0000, 149980.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (67, N'admin', N'GG002', N'0352255034', N'Thành phố Hà Nội', N'Quận Hoàn Kiếm', N'Phường Phúc Tân', N'123213', CAST(N'2022-02-09T12:03:10.437' AS DateTime), 20.0000, 0.0000, 33980.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (68, N'admin', N'GG003', N'123213213', N'Tỉnh Hải Dương', N'Thành phố Chí Linh', N'Phường An Lạc', N'duy9b', CAST(N'2023-11-09T12:09:01.840' AS DateTime), 30.0000, 0.0000, 98970.0000, 4, 1)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (69, N'admin', N'GG002', N'123', N'Tỉnh Bắc Ninh', N'Huyện Yên Phong', N'Xã Long Châu', N'1231231', CAST(N'2023-10-09T12:40:24.663' AS DateTime), 20000.0000, 0.0000, 14000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (70, N'admin', N'GG001', N'123', N'Tỉnh Hưng Yên', N'Thành phố Hưng Yên', N'Xã Phương Chiểu', N'12321312', CAST(N'2023-01-09T12:42:15.370' AS DateTime), 10000.0000, 0.0000, 19000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (71, N'admin', N'GG002', N'935225534', N'Tỉnh Vĩnh Phúc', N'Thành phố Phúc Yên', N'Phường Trưng Nhị', N'1231231', CAST(N'2023-02-09T12:45:24.503' AS DateTime), 20000.0000, 0.0000, -20000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (72, N'admin', N'GG001', N'1231231', N'Tỉnh Bắc Ninh', N'Thị xã Thuận Thành', N'Phường Ninh Xá', N'3123213', CAST(N'2023-03-09T12:45:46.813' AS DateTime), 10000.0000, 0.0000, 19000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (73, N'admin', N'GG003', N'123213213', N'Thành phố Hà Nội', N'Quận Hoàn Kiếm', N'Phường Hàng Mã', N'3333', CAST(N'2023-04-09T12:49:25.707' AS DateTime), 30000.0000, 0.0000, 28000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (74, N'admin', N'GG001', N'3232323', N'Tỉnh Bắc Ninh', N'Thành phố Bắc Ninh', N'Phường Nam Sơn', N'ddd', CAST(N'2023-05-09T12:51:11.423' AS DateTime), 10000.0000, 0.0000, 62000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (75, N'admin', N'GG001', N'23456', N'Tỉnh Bắc Giang', N'Huyện Tân Yên', N'Xã Việt Lập', N'3', CAST(N'2023-06-09T12:52:54.987' AS DateTime), 10000.0000, 0.0000, 19000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (76, N'admin', N'GG001', N'3333', N'Tỉnh Cao Bằng', N'Thành phố Cao Bằng', N'Phường Hợp Giang', N'3333', CAST(N'2023-07-09T12:55:33.417' AS DateTime), 10000.0000, 0.0000, 302000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (77, N'admin', N'GG001', N'2', N'Tỉnh Hải Dương', N'Huyện Nam Sách', N'Xã Phú Điền', N'222', CAST(N'2023-09-09T12:56:49.147' AS DateTime), 10000.0000, 0.0000, 290000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (78, N'admin', N'GG002', N'1111', N'Tỉnh Bắc Ninh', N'Huyện Yên Phong', N'Xã Tam Đa', N'1', CAST(N'2023-10-09T14:43:56.270' AS DateTime), 20000.0000, 0.0000, 80000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (79, N'duyspph21810@fpt.edu.vn', N'GG001', N'0352255034', N'Tỉnh Vĩnh Phúc', N'Thành phố Vĩnh Yên', N'Phường Tích Sơn', N'nhà 123', CAST(N'2022-05-10T06:56:01.020' AS DateTime), 10000.0000, 0.0000, 290000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (80, N'duyspph21810@fpt.edu.vn', N'', N'0352255034', N'Thành phố Hà Nội', N'Quận Ba Đình', N'Phường Phúc Xá', N'nhà 123', CAST(N'2023-12-10T08:22:52.420' AS DateTime), 0.0000, 12000.0000, 336000.0000, 4, 1)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHangChiTiet] ON 

INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (47, 62, 7, 1, 99000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (48, 62, 13, 1, 150000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (49, 63, 7, 1, 99000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (50, 64, 5, 1, 12000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (51, 65, 10, 1, 34000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (52, 66, 3, 1, 150000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (53, 67, 10, 1, 34000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (54, 68, 7, 1, 99000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (55, 69, 10, 1, 34000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (56, 70, 8, 1, 29000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (57, 72, 8, 1, 29000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (58, 73, 8, 2, 29000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (59, 74, 5, 6, 12000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (60, 75, 8, 1, 29000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (61, 76, 5, 1, 12000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (62, 76, 4, 3, 100000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (63, 77, 3, 2, 150000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (64, 78, 4, 1, 100000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (65, 79, 3, 2, 150000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (66, 80, 4, 3, 100000.0000, 0)
SET IDENTITY_INSERT [dbo].[DonHangChiTiet] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (57, N'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (58, N'admin', N'', N'', N'', N'', N'', N'', CAST(N'2023-11-08T16:24:28.933' AS DateTime), 0.0000, 0.0000, 150.0000, 1)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (59, N'admin', N'', N'', NULL, N'', N'', N'', CAST(N'2023-11-08T16:28:53.780' AS DateTime), 0.0000, 0.0000, 150.0000, 1)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (60, N'admin', N'', N'', N'', N'Chọn quận', N'Chọn phường', N'', CAST(N'2023-11-08T16:33:23.237' AS DateTime), 0.0000, 0.0000, 100.0000, 1)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (61, N'admin', N'', N'', N'', N'Chọn quận', N'Chọn phường', N'', CAST(N'2023-11-08T16:34:39.093' AS DateTime), 0.0000, 0.0000, 220.0000, 1)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (62, N'admin', N'', N'', N'', N'Chọn quận', N'Chọn phường', N'', CAST(N'2023-11-08T16:36:28.743' AS DateTime), 0.0000, 0.0000, 150.0000, 1)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (63, N'admin', N'', N'', N'', N'Chọn quận', N'Chọn phường', N'', CAST(N'2023-11-08T16:37:31.880' AS DateTime), 0.0000, 0.0000, 150.0000, 1)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (64, N'admin', N'', N'', N'', N'Chọn quận', N'Chọn phường', N'', CAST(N'2023-11-08T16:41:10.097' AS DateTime), 0.0000, 0.0000, 150.0000, 1)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (65, N'admin', N'', N'', N'', N'Chọn quận', N'Chọn phường', N'', CAST(N'2023-11-08T16:41:46.343' AS DateTime), 0.0000, 0.0000, 400.0000, 1)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (66, N'admin', N'', N'', N'', N'Chọn quận', N'Chọn phường', N'', CAST(N'2023-11-08T16:41:59.093' AS DateTime), 0.0000, 0.0000, 100.0000, 1)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (67, N'spduyvn@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (68, N'spduyvn@gmail.com', N'', N'', N'Tỉnh Cao Bằng', N'Chọn quận', N'Chọn phường', N'', CAST(N'2023-11-08T16:46:42.227' AS DateTime), 0.0000, 0.0000, 150.0000, 1)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (69, N'user1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (70, N'spduyvn@gmail.com', N'', N'', N'Thành phố Hà Nội', N'Quận Nam Từ Liêm', N'Phường Mỹ Đình 1', N'', CAST(N'2023-11-08T17:00:11.850' AS DateTime), 0.0000, 0.0000, 250.0000, 1)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (71, N'user3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (72, N'duyspph21810@fpt.edu.vn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHangChiTiet] ON 

INSERT [dbo].[GioHangChiTiet] ([id], [MaGioHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (67, 69, 3, 1, 150.0000, 0)
INSERT [dbo].[GioHangChiTiet] ([id], [MaGioHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (68, 69, 5, 1, 120.0000, 0)
INSERT [dbo].[GioHangChiTiet] ([id], [MaGioHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (69, 71, 4, 1, 100.0000, 0)
SET IDENTITY_INSERT [dbo].[GioHangChiTiet] OFF
GO
SET IDENTITY_INSERT [dbo].[KichCo] ON 

INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'KC001', N'S', 1)
INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'KC002', N'M', 1)
INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'KC003', N'L', 1)
INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (4, N'KC0333', N'D', NULL)
SET IDENTITY_INSERT [dbo].[KichCo] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiKhachHang] ON 

INSERT [dbo].[LoaiKhachHang] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'LK001', N'Áo nam', 1)
INSERT [dbo].[LoaiKhachHang] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'LK002', N'Áo nữ', 1)
INSERT [dbo].[LoaiKhachHang] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'LK003', N'Unisex', 1)
SET IDENTITY_INSERT [dbo].[LoaiKhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[MaGiamGia] ON 

INSERT [dbo].[MaGiamGia] ([id], [Ten], [Ma], [SuKien], [HinhThucGiam], [NgayBatDau], [NgayKetThuc], [GiamToiThieu], [GiamToiDa], [SoLuong], [TrangThai]) VALUES (1, N'Gi?m 10%', N'GG001', N'S? ki?n A', 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 0.0000, 10000.0000, 89, 1)
INSERT [dbo].[MaGiamGia] ([id], [Ten], [Ma], [SuKien], [HinhThucGiam], [NgayBatDau], [NgayKetThuc], [GiamToiThieu], [GiamToiDa], [SoLuong], [TrangThai]) VALUES (2, N'Gi?m 20%', N'GG002', N'S? ki?n B', 1, CAST(N'2023-02-01T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), 0.0000, 20000.0000, 195, 1)
INSERT [dbo].[MaGiamGia] ([id], [Ten], [Ma], [SuKien], [HinhThucGiam], [NgayBatDau], [NgayKetThuc], [GiamToiThieu], [GiamToiDa], [SoLuong], [TrangThai]) VALUES (3, N'Gi?m 30%', N'GG003', N'S? ki?n C', 2, CAST(N'2023-03-01T00:00:00.000' AS DateTime), CAST(N'2023-10-31T00:00:00.000' AS DateTime), 50.0000, 30000.0000, 298, 1)
SET IDENTITY_INSERT [dbo].[MaGiamGia] OFF
GO
SET IDENTITY_INSERT [dbo].[MauSac] ON 

INSERT [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'M001', N'Đỏ', 0)
INSERT [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'M002', N'Xanh', 1)
INSERT [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'M003', N'Vàng', 1)
SET IDENTITY_INSERT [dbo].[MauSac] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (1, N'SP001', N'Áo phông nam cotton in hình u', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 0)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (2, N'SP002', N'Áo phông nam cotton in chữ CC', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (3, N'SP003', N'Áo phông mang phong cách siêu nhân', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (4, N'SP004', N'Áo phông cho mùa đông', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (5, N'SP005', N'Áo phông siêu nhân đỏ', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Siêu Nhân Đỏ" là một lựa chọn hoàn hảo cho những người yêu thích phim siêu nhân nói chung và siêu nhân đỏ nói riếng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (6, N'SP006', N'Áo phông siêu nhân xanh', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Siêu Nhân Xanh" là một lựa chọn hoàn hảo cho những người yêu thích phim siêu nhân nói chung và siêu nhân xanh nói riếng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (7, N'SP007', N'Áo phông siêu nhân đen', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Siêu Nhân Đen" là một lựa chọn hoàn hảo cho những người yêu thích phim siêu nhân nói chung và siêu nhân đen nói riếng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (8, N'SP008', N'Áo phông siêu nhân hồng', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Siêu Nhân Hồng" là một lựa chọn hoàn hảo cho những người yêu thích phim siêu nhân nói chung và siêu nhân hồng nói riếng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (9, N'SP009', N'Áo phông siêu nhân trắng', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Siêu Nhân Trắng" là một lựa chọn hoàn hảo cho những người yêu thích phim siêu nhân nói chung và siêu nhân trắng nói riếng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (10, N'SP0010', N'Áo phông siêu nhân bạc', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Siêu Nhân Bạc" là một lựa chọn hoàn hảo cho những người yêu thích phim siêu nhân nói chung và siêu nhân bạc nói riếng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (11, N'SP0011', N'Áo phông len', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo len đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (12, N'SP0012', N'Áo phông BaLenMeChoiDa', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình chữ "BaLenMeChoiDa" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (13, N'SP0013', N'Áo thun súp lơ', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (14, N'SP0014', N'Áo len MixiGaming', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (15, N'SP0015', N'Áo sơ mi dài tay', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (16, N'SP0016', N'Áo sơ mi ngắn tay', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (17, N'SP0017', N'Áo bó dáng suông', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (18, N'SP0018', N'Áo phông Mèo Méo Meo Mèo Meo', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (19, N'SP0019', N'Áo chống nắng', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (20, N'SP0020', N'Áo chống lạnh', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (21, N'SP0021', N'Áo chống đen', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'TH001', N'Adidogs', 0)
INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'TH002', N'Guchi', 1)
INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'TH003', N'Nikke', 0)
INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (4, N'TH004', N'Uniqla', 0)
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CoAo__3214CC9E0509296F]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[CoAo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CoAo__3214CC9E1795FEA0]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[CoAo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CoAo__3214CC9ED2DA9D88]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[CoAo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CoAo__3214CC9EEA110C20]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[CoAo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChatLieu__3214CC9E36FDFDE8]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[ChatLieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChatLieu__3214CC9E8544E36E]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[ChatLieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChatLieu__3214CC9E944BC8CD]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[ChatLieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChatLieu__3214CC9EF190E465]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[ChatLieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KichCo__3214CC9E4E2776A9]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[KichCo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KichCo__3214CC9E550E0D56]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[KichCo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KichCo__3214CC9E66C8A6A5]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[KichCo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KichCo__3214CC9E7C82DED5]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[KichCo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LoaiKhac__3214CC9E1CDDBFDB]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[LoaiKhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LoaiKhac__3214CC9E32392DB0]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[LoaiKhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LoaiKhac__3214CC9E9A9DAA5A]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[LoaiKhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LoaiKhac__3214CC9EC9E2DABB]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[LoaiKhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__MauSac__3214CC9E61EC6B85]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[MauSac] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__MauSac__3214CC9EACBD0BA6]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[MauSac] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__MauSac__3214CC9ECB67ECE8]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[MauSac] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__MauSac__3214CC9EDE8D5F4F]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[MauSac] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SanPham__3214CC9E17398F70]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[SanPham] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SanPham__3214CC9E82919DBE]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[SanPham] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SanPham__3214CC9ECFA63C0C]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[SanPham] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SanPham__3214CC9EF9147535]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[SanPham] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ThuongHi__3214CC9E9DCA7ADF]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[ThuongHieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ThuongHi__3214CC9E9EC93C52]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[ThuongHieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ThuongHi__3214CC9EADB217E9]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[ThuongHieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ThuongHi__3214CC9EB92F5251]    Script Date: 12/10/2023 9:10:36 PM ******/
ALTER TABLE [dbo].[ThuongHieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Photo]
GO
ALTER TABLE [dbo].[Anh]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[Anh]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[Anh]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[Anh]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Accounts]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Roles]
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaCoAo])
REFERENCES [dbo].[CoAo] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaCoAo])
REFERENCES [dbo].[CoAo] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaCoAo])
REFERENCES [dbo].[CoAo] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaCoAo])
REFERENCES [dbo].[CoAo] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaChatLieu])
REFERENCES [dbo].[ChatLieu] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaChatLieu])
REFERENCES [dbo].[ChatLieu] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaChatLieu])
REFERENCES [dbo].[ChatLieu] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaChatLieu])
REFERENCES [dbo].[ChatLieu] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaKichCo])
REFERENCES [dbo].[KichCo] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaKichCo])
REFERENCES [dbo].[KichCo] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaKichCo])
REFERENCES [dbo].[KichCo] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaKichCo])
REFERENCES [dbo].[KichCo] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaLoaiKH])
REFERENCES [dbo].[LoaiKhachHang] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaLoaiKH])
REFERENCES [dbo].[LoaiKhachHang] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaLoaiKH])
REFERENCES [dbo].[LoaiKhachHang] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaLoaiKH])
REFERENCES [dbo].[LoaiKhachHang] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([Ma])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[DiaChi]  WITH CHECK ADD FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DiaChi]  WITH CHECK ADD FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DiaChi]  WITH CHECK ADD FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DiaChi]  WITH CHECK ADD FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([id])
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([id])
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([id])
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([id])
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[ChiTietSanPham] ([id])
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[ChiTietSanPham] ([id])
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[ChiTietSanPham] ([id])
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[ChiTietSanPham] ([id])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[GioHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaGioHang])
REFERENCES [dbo].[GioHang] ([id])
GO
ALTER TABLE [dbo].[GioHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaGioHang])
REFERENCES [dbo].[GioHang] ([id])
GO
ALTER TABLE [dbo].[GioHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[ChiTietSanPham] ([id])
GO
ALTER TABLE [dbo].[GioHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[ChiTietSanPham] ([id])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Photo'
GO
