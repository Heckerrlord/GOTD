USE [test1]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[Anh]    Script Date: 12/24/2023 3:50:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anh](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [nvarchar](max) NOT NULL,
	[MaSP] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[Blogs]    Script Date: 12/24/2023 3:50:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](200) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[Anh] [nvarchar](150) NULL,
	[NgayTao] [datetime] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoAo]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[ChatLieu]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 12/24/2023 3:50:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanPham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [nvarchar](50) NULL,
	[MaMau] [nvarchar](50) NULL,
	[MaKichCo] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[DanhGia]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[DanhSachYeuThich]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[DiaChi]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[DonHang]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[DonHangChiTiet]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[GioHang]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[GioHangChiTiet]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[KichCo]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[LoaiAo]    Script Date: 12/24/2023 3:50:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiAo](
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
/****** Object:  Table [dbo].[MaGiamGia]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[MauSac]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 12/24/2023 3:50:52 PM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/24/2023 3:50:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [nvarchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
	[NgayTao] [datetime] NULL,
	[MaLoaiAo] [nvarchar](50) NULL,
	[MaThuongHieu] [nvarchar](50) NULL,
	[MaChatLieu] [nvarchar](50) NULL,
	[MaCoAo] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 12/24/2023 3:50:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [nvarchar](50) NULL,
	[Ten] [nvarchar](100) NULL,
	[Images] [nvarchar](100) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'123213', N'12312321', N'123123', N'Dgamer090203@gmail.com', N'user.png', N'token', N'312312', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'admin', N'123', N'Sin Phúc Duy', N'spduyvn@gmail.com', N'user.png', N'guGLjnQlUbd3M2zWurZVqwmKnCXStBNiAZdnj7VJgoZ22dMJUq', N'0352255034', 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'admin2', N'Duyvip11', N'Sin Phúc Duy', N'spduyvn2@gmail.com', N'user.png', N'token', N'1', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'duyspph21810@fpt.edu.vn', N'$2a$10$zdPhUoe4grlVlGKkoXXzK.BPO2n1XBArnesnpBVy9dezPSib4NXOy', N'duyspph 2 1 8 1 0 fplhn', N'duyspph21810@fpt.edu.vn', N'user.png', N'token', NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'lequyan', N'Lequyan2210', N'Sin Phúc Duy', N'lequyan2210@gmail.com', N'user.png', N'token', N'0989078978', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'spduyvn@gmail.com', N'$2a$10$aAfVEX.UHEd3bhxloBS58eJWK8/XslRyVy1YEZcvCLLfYEkGqNHrW', N'Duy Sin', N'spduyvn@gmail.com', N'user.png', N'token', NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'spdvn99@gmail.com', N'$2a$10$xUvXh3XspiPS4YeDR/fxWepJwJLFLBR4CQ26vvYJRw2NXOANDgDgq', N'Duy', N'spdvn99@gmail.com', N'user.png', N'token', NULL, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'user1', N'1234', N'Duyvip00', N'duy9bdz@gmail.com', N'1698867711894_0.jpg', N'kruW3AsV5KsUziXoNfGzE1nGIgHdRRewNwObnGFR6H4qt4sslR', N'0352255034', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'user111', N'123456', N'Sin Phúc Duy', N'spduyvn1@gmail.com', N'user.png', N'token', N'0352255034', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'user1213', N'12321312', N'ssss', N'3213@ga.co', N'user.png', N'token', N'0989078978', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'user2', N'Duyvip00', N'Sin Phúc Duy', N'spduyvna@gmail.com', N'user.png', N'token', N'0352255034', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'user22', N'Duyvip00', N'Sin Phúc Duy', N'duy9bdz@gmail.com', N'user.png', N'token', N'0352255034', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'vinh123@', N'vinh123@', N'Sin Phúc Vinh', N'spduyvan@gmail.com', N'user.png', N'token', N'0123123123', 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'williamorona@gmail.coma', N'đáasd', N'Sin phúc duy', N'williamorona@gmail.coms', N'user.png', N'token', N'0222222222', 0)
GO
SET IDENTITY_INSERT [dbo].[Anh] ON 

INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1023, N'nam1.png', N'SP001', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1024, N'nam1a.png', N'SP001', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1025, N'nam1b.png', N'SP001', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1026, N'nam9.jpg', N'SP003', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1028, N'z4824239984868_1659c41f5bf7bd6ee25080320bbdc1be.jpg', N'SP004', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1029, N'z4824304198831_16428cf1f77b92df20256dc813681ad3.jpg', N'SP004', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1030, N'z4824304963684_282d7e6a32d8085fe10ddc04d6a62822.jpg', N'SP004', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1031, N'nam2.png', N'SP005', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1032, N'z4824312274191_da735ebfc14e629bfdf311b8001afe22.jpg', N'SP005', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1033, N'z4824309283987_6059700a80923644724875d5a95e0aee.jpg', N'SP005', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1034, N'z4824310919157_72db9965b93818ab6ebef995ef99c9ff.jpg', N'SP005', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1035, N'nam20.png', N'SP006', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1036, N'z4824293386069_e0931824bae1ffbb285d06b543ac556d.jpg', N'SP006', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1037, N'z4824294688431_71fb10e3c1c59bf8c88d8fd169301262.jpg', N'SP006', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1038, N'nam3.png', N'SP007', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1039, N'z4824304198831_16428cf1f77b92df20256dc813681ad3.jpg', N'SP007', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1040, N'z4824304963684_282d7e6a32d8085fe10ddc04d6a62822.jpg', N'SP007', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1041, N'nam5.png', N'SP009', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1042, N'nam7.png', N'SP010', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1043, N'nam21.png', N'SP008', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1044, N'nam8.png', N'SP012', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1045, N'nam3.png', N'SP099', 0)
INSERT [dbo].[Anh] ([Id], [Ma], [MaSP], [TrangThai]) VALUES (1046, N'nam2.png', N'SP099', 0)
SET IDENTITY_INSERT [dbo].[Anh] OFF
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (1, N'admin', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (4, N'admin', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (8, N'User1', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (9, N'user2', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (10, N'user22', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (11, N'lequyan', N'CUST')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([Id], [TieuDe], [NoiDung], [Anh], [NgayTao], [TrangThai]) VALUES (2, N'Hôm nay tôi buồn', N'Đây là câu chuyện của một chàng trai được chia sẻ trên trang NEU Confessions. Nó là lời tâm sự đẫm nước mắt của chàng trai, khi anh anh bỗng nhận hung tin cô gặp tai nạn khi đi mua hoa về bán trong ngày 8/3 ba năm về trước.

Chuyện tình cảm động này đã lấy đi không ít nước mắt của nhiều người.

Nguyên văn dòng tâm sự:', N'1703031657010_0.webp', CAST(N'2023-12-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Blogs] ([Id], [TieuDe], [NoiDung], [Anh], [NgayTao], [TrangThai]) VALUES (3, N'Hôm nay tôi vui', N'“Anh đang ngồi ở Hồ Tây, chỗ 2 đứa mình hay đến mỗi khi em qua Hà Nội ý. Lạnh. Chỉ có tiếng nước đập vào bờ. Hôm nay anh lại thấy nhớ em.

18 năm làm bạn, hơn 2 năm yêu nhau và thiếu 7 ngày nữa là tròn 3 năm chúng ta xa nhau. Em đi mà không nói một lời. Em đi mà khiến cho bao nhiêu dự định của 2 đứa bỗng trở thành mây khói. Em đi để lại đây một mình anh sống trong nuối tiếc và ân hận. Em đi ở cái tuổi đẹp nhất đời con gái. Tuổi 20.', N'1703031662713_0.webp', CAST(N'2023-12-20T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[CoAo] ON 

INSERT [dbo].[CoAo] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'CA001', N'Polo', 0)
INSERT [dbo].[CoAo] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'CA002', N'Tròn', 0)
INSERT [dbo].[CoAo] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'CA003', N'Trái tim', 0)
SET IDENTITY_INSERT [dbo].[CoAo] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatLieu] ON 

INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'CL001', N'Cotton', 1)
SET IDENTITY_INSERT [dbo].[ChatLieu] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] ON 

INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1018, N'SP002', N'MS001', N'KC001', 350, 99000.0000, 129000.0000, NULL, CAST(N'2023-12-20T01:06:16.017' AS DateTime), CAST(N'2023-12-20T01:06:16.017' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1019, N'SP002', N'#6e3f3f', N'KC001', 1, 1.0000, 1.0000, NULL, CAST(N'2023-12-20T01:06:16.017' AS DateTime), CAST(N'2023-12-20T01:06:16.017' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1020, N'SP001', N'MS001', N'KC001', 0, 99000.0000, 129000.0000, NULL, CAST(N'2023-12-20T02:11:58.987' AS DateTime), CAST(N'2023-12-20T02:11:58.987' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1021, N'SP003', N'#6e3f3f', N'KC002', 35, 69000.0000, 80000.0000, NULL, CAST(N'2023-12-20T02:15:34.283' AS DateTime), CAST(N'2023-12-20T02:15:34.283' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1022, N'SP003', N'#ff0000', N'KC001', 99, 67000.0000, 99000.0000, NULL, CAST(N'2023-12-20T02:15:34.283' AS DateTime), CAST(N'2023-12-20T02:15:34.283' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1023, N'SP004', N'#6e3f3f', N'KC003', 70, 10000.0000, 129000.0000, NULL, CAST(N'2023-12-20T02:16:59.417' AS DateTime), CAST(N'2023-12-20T02:16:59.417' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1024, N'SP004', N'MS001', N'KC002', 99, 10000.0000, 139000.0000, NULL, CAST(N'2023-12-20T02:16:59.417' AS DateTime), CAST(N'2023-12-20T02:16:59.417' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1025, N'SP005', N'MS001', N'KC002', 0, 99.0000, 159000.0000, NULL, CAST(N'2023-12-20T02:24:40.777' AS DateTime), CAST(N'2023-12-20T02:24:40.777' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1026, N'SP006', N'MS001', N'KC001', 47, 100000.0000, 100000.0000, NULL, CAST(N'2023-12-20T02:55:51.653' AS DateTime), CAST(N'2023-12-20T02:55:51.653' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1027, N'SP006', N'MS001', N'KC002', 97, 100000.0000, 100000.0000, NULL, CAST(N'2023-12-20T02:55:51.653' AS DateTime), CAST(N'2023-12-20T02:55:51.653' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1028, N'SP006', N'#6e3f3f', N'KC001', 95, 100000.0000, 120000.0000, NULL, CAST(N'2023-12-20T02:55:51.653' AS DateTime), CAST(N'2023-12-20T02:55:51.653' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1029, N'SP006', N'MS001', N'KC001', 99, 100000.0000, 110000.0000, NULL, CAST(N'2023-12-20T02:55:51.653' AS DateTime), CAST(N'2023-12-20T02:55:51.653' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1030, N'SP007', N'#ff0000', N'KC001', 85, 12000.0000, 120000.0000, NULL, CAST(N'2023-12-20T04:17:38.943' AS DateTime), CAST(N'2023-12-20T04:17:38.943' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1031, N'SP007', N'#ff0000', N'KC003', 94, 12000.0000, 120000.0000, NULL, CAST(N'2023-12-20T04:17:38.943' AS DateTime), CAST(N'2023-12-20T04:17:38.943' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1032, N'SP009', N'#6e3f3f', N'KC005', 79, 79000.0000, 189000.0000, NULL, CAST(N'2023-12-20T05:38:18.297' AS DateTime), CAST(N'2023-12-20T05:38:18.297' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1033, N'SP009', N'#ff0000', N'KC004', 1780, 178000.0000, 219000.0000, NULL, CAST(N'2023-12-20T05:38:18.297' AS DateTime), CAST(N'2023-12-20T05:38:18.297' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1034, N'SP010', N'#ff0000', N'KC003', 63, 167000.0000, 259000.0000, NULL, CAST(N'2023-12-20T05:39:42.940' AS DateTime), CAST(N'2023-12-20T05:39:42.940' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1035, N'SP010', N'MS001', N'KC003', 78, 123000.0000, 159000.0000, NULL, CAST(N'2023-12-20T05:39:42.940' AS DateTime), CAST(N'2023-12-20T05:39:42.940' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1036, N'SP008', N'MS001', N'KC003', 76, 12000.0000, 230000.0000, NULL, CAST(N'2023-12-20T05:40:52.010' AS DateTime), CAST(N'2023-12-20T05:40:52.010' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1037, N'SP012', N'#ff0000', N'KC004', 89, 320000.0000, 330000.0000, NULL, CAST(N'2023-12-20T05:42:18.223' AS DateTime), CAST(N'2023-12-20T05:42:18.223' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1038, N'SP099', N'MS001', N'KC001', 10, 120000.0000, 150000.0000, NULL, CAST(N'2023-12-20T07:45:10.640' AS DateTime), CAST(N'2023-12-20T07:45:10.640' AS DateTime), 0)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaMau], [MaKichCo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1039, N'SP002', N'#6e3f3f', N'KC002', 100, 99000.0000, 139000.0000, NULL, NULL, CAST(N'2023-12-20T08:17:06.290' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhGia] ON 

INSERT [dbo].[DanhGia] ([id], [MaSanPham], [MaKhachHang], [DanhGia], [BinhLuan], [Ngay], [TrangThai]) VALUES (2, N'SP002', N'admin', 5, N'Hhaha', CAST(N'2023-12-20T01:34:27.623' AS DateTime), 1)
INSERT [dbo].[DanhGia] ([id], [MaSanPham], [MaKhachHang], [DanhGia], [BinhLuan], [Ngay], [TrangThai]) VALUES (3, N'SP002', N'lequyan', 5, N'sản phẩm tốt', CAST(N'2023-12-20T07:41:02.497' AS DateTime), 1)
INSERT [dbo].[DanhGia] ([id], [MaSanPham], [MaKhachHang], [DanhGia], [BinhLuan], [Ngay], [TrangThai]) VALUES (4, N'SP007', N'lequyan', 5, NULL, CAST(N'2023-12-20T07:52:00.433' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[DanhGia] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] ON 

INSERT [dbo].[DanhSachYeuThich] ([id], [MaSanPham], [MaKhachHang], [Ngay], [TrangThai]) VALUES (1003, N'SP004', N'lequyan', CAST(N'2023-12-20T08:19:32.827' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (17, N'admin', N'', N'035225034', N'Tỉnh Bắc Ninh', N'Thành phố Bắc Ninh', N'Phường Khắc Niệm', N'Địa chỉ 1', CAST(N'2023-11-20T01:11:00.627' AS DateTime), 0.0000, 0.0000, 774000.0000, 2, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (18, N'admin', N'', N'0396772803', N'Tỉnh Bắc Ninh', N'Huyện Yên Phong', N'Xã Tam Đa', N'Chỗ đó đó', CAST(N'2023-10-20T01:15:10.120' AS DateTime), 0.0000, 0.0000, 258000.0000, 2, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (19, N'admin', N'', N'12312312', N'Tỉnh Hà Giang', N'Thành phố Hà Giang', N'Phường Ngọc Hà', N'321312', CAST(N'2023-02-20T01:32:27.690' AS DateTime), 0.0000, 0.0000, 129000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (20, N'admin', N'', N'123213', N'Tỉnh Hà Giang', N'Huyện Mèo Vạc', N'Xã Xín Cái', N'1', CAST(N'2023-06-20T01:36:16.487' AS DateTime), 0.0000, 0.0000, 129000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (21, N'user2', N'', N'0396884025', N'Tỉnh Cao Bằng', N'Huyện Bảo Lạc', N'Xã Bảo Toàn', N'69100', CAST(N'2023-07-20T02:20:52.837' AS DateTime), 0.0000, 0.0000, 129000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (22, N'admin', N'', N'0933060989', N'Tỉnh Hà Giang', N'Huyện Đồng Văn', N'Thị trấn Đồng Văn', N'ádsadas', CAST(N'2023-05-20T02:55:10.463' AS DateTime), 0.0000, 0.0000, 1174000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (23, N'admin', N'', N'0352255034', N'Tỉnh Hà Giang', N'Huyện Mèo Vạc', N'Xã Pải Lủng', N'1123213', CAST(N'2023-11-20T04:33:04.310' AS DateTime), 0.0000, 0.0000, 900000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (24, N'admin', N'', N'035225934', N'Tỉnh Hà Giang', N'Huyện Đồng Văn', N'Xã Má Lé', N'12321321', CAST(N'2023-07-20T04:44:19.713' AS DateTime), 0.0000, 0.0000, 100000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (25, N'duyspph21810@fpt.edu.vn', N'', N'0377896789', N'Tỉnh Bắc Ninh', N'Thị xã Quế Võ', N'Xã Hán Quảng', N'HAHA', CAST(N'2023-04-20T05:26:12.637' AS DateTime), 0.0000, 0.0000, 440000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (26, N'spdvn99@gmail.com', N'', N'0987678789', N'Tỉnh Hà Giang', N'Huyện Đồng Văn', N'Xã Má Lé', N'heheheh', CAST(N'2023-04-20T05:34:50.950' AS DateTime), 0.0000, 0.0000, 389000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (27, N'admin', N'MAGIAMGIA', N'123213123', N'Tỉnh Bắc Kạn', N'Thành Phố Bắc Kạn', N'Phường Đức Xuân', N'321312312', CAST(N'2023-09-20T05:50:53.273' AS DateTime), 20000.0000, 0.0000, 238000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (28, N'admin', N'', N'12321321321', N'Thành phố Hải Phòng', N'Huyện Vĩnh Bảo', N'Xã Vinh Quang', N'3213123', CAST(N'2023-11-20T05:52:20.950' AS DateTime), 0.0000, 0.0000, 259000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (29, N'duyspph21810@fpt.edu.vn', N'', N'0352255934', N'Tỉnh Cao Bằng', N'Huyện Bảo Lạc', N'Xã Thượng Hà', N'12321312', CAST(N'2023-02-20T05:59:08.657' AS DateTime), 0.0000, 0.0000, 129000.0000, 0, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (30, N'duyspph21810@fpt.edu.vn', N'', N'3213213', N'Tỉnh Bắc Ninh', N'Thị xã Quế Võ', N'Xã Mộ Đạo', N'13213123', CAST(N'2023-12-20T05:59:31.783' AS DateTime), 0.0000, 0.0000, 129000.0000, 1, 1)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (31, N'lequyan', N'MAGIAMGIA', N'0966861471', N'Thành phố Hà Nội', N'Quận Hoàn Kiếm', N'Phường Đồng Xuân', N'123', CAST(N'2023-12-20T07:39:19.883' AS DateTime), 20000.0000, 0.0000, 238000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (32, N'lequyan', N'', N'0966816451', N'Tỉnh Hà Giang', N'Thành phố Hà Giang', N'Phường Quang Trung', N'133', CAST(N'2023-12-20T07:43:08.790' AS DateTime), 0.0000, 0.0000, 278000.0000, 1, 1)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (33, N'lequyan', N'', N'0966861471', N'Thành phố Hà Nội', N'Quận Ba Đình', N'Phường Trúc Bạch', N'132', CAST(N'2023-12-20T07:49:50.027' AS DateTime), 0.0000, 0.0000, 13612000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (34, N'lequyan', N'', N'0966861471', N'Thành phố Hà Nội', N'Quận Ba Đình', N'Phường Trúc Bạch', N'312', CAST(N'2023-12-20T07:51:19.783' AS DateTime), 0.0000, 0.0000, 120000.0000, 4, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (35, N'duyspph21810@fpt.edu.vn', N'', N'0966854671', N'Thành phố Hà Nội', N'Quận Hoàn Kiếm', N'Phường Hàng Mã', N'132', CAST(N'2023-12-20T08:01:19.227' AS DateTime), 0.0000, 0.0000, 5160000.0000, 0, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (36, N'lequyan', N'', N'0966864567', N'Thành phố Hà Nội', N'Quận Hoàn Kiếm', N'Phường Đồng Xuân', N'312', CAST(N'2023-12-20T08:03:12.563' AS DateTime), 0.0000, 100.0000, 36000000.0000, 1, 0)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai], [Thanhtoan]) VALUES (37, N'lequyan', N'MAGIAMGIA', N'0966861471', N'Thành phố Hà Nội', N'Quận Ba Đình', N'Phường Phúc Xá', N'132', CAST(N'2023-12-20T08:12:50.900' AS DateTime), 20000.0000, 0.0000, 60000.0000, 4, 0)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHangChiTiet] ON 

INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (19, 17, 1018, 6, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (20, 18, 1018, 2, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (21, 19, 1018, 1, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (22, 20, 1018, 1, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (23, 21, 1020, 1, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (24, 22, 1023, 6, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (25, 22, 1021, 5, 80000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (26, 23, 1026, 9, 100000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (27, 24, 1026, 1, 100000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (28, 25, 1030, 1, 120000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (29, 25, 1026, 2, 100000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (30, 25, 1028, 1, 120000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (31, 26, 1023, 1, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (32, 26, 1021, 2, 80000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (33, 26, 1026, 1, 100000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (34, 27, 1018, 2, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (35, 28, 1034, 1, 259000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (36, 29, 1018, 1, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (37, 30, 1023, 1, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (38, 31, 1018, 2, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (39, 32, 1019, 2, 139000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (40, 33, 1018, 1, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (41, 33, 1019, 97, 139000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (42, 34, 1031, 1, 120000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (43, 35, 1020, 40, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (44, 36, 1020, 25, 129000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (45, 36, 1021, 1, 80000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (46, 36, 1036, 1, 230000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (47, 36, 1027, 1, 100000.0000, 0)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (48, 37, 1021, 1, 80000.0000, 0)
SET IDENTITY_INSERT [dbo].[DonHangChiTiet] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (5, N'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (6, N'user1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (7, N'user2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (8, N'duyspph21810@fpt.edu.vn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (9, N'spdvn99@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (10, N'user22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[GioHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [Tinh], [Huyen], [Xa], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TongTien], [TrangThai]) VALUES (11, N'lequyan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHangChiTiet] ON 

INSERT [dbo].[GioHangChiTiet] ([id], [MaGioHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (1033, 6, 1021, 1, 80000.0000, 0)
INSERT [dbo].[GioHangChiTiet] ([id], [MaGioHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (1055, 6, 1026, 4, 100000.0000, 0)
INSERT [dbo].[GioHangChiTiet] ([id], [MaGioHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (1056, 6, 1018, 1, 129000.0000, 0)
INSERT [dbo].[GioHangChiTiet] ([id], [MaGioHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (1069, 10, 1037, 1, 330000.0000, 0)
INSERT [dbo].[GioHangChiTiet] ([id], [MaGioHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (1070, 7, 1020, 1, 129000.0000, 0)
SET IDENTITY_INSERT [dbo].[GioHangChiTiet] OFF
GO
SET IDENTITY_INSERT [dbo].[KichCo] ON 

INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'KC001', N'M', 0)
INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'KC002', N'S', 0)
INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'KC003', N'L', 0)
INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (6, N'KC004', N'X', NULL)
INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (7, N'KC005', N'XL', NULL)
SET IDENTITY_INSERT [dbo].[KichCo] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiAo] ON 

INSERT [dbo].[LoaiAo] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'L001', N'Áo thun', 1)
SET IDENTITY_INSERT [dbo].[LoaiAo] OFF
GO
SET IDENTITY_INSERT [dbo].[MaGiamGia] ON 

INSERT [dbo].[MaGiamGia] ([id], [Ten], [Ma], [SuKien], [HinhThucGiam], [NgayBatDau], [NgayKetThuc], [GiamToiThieu], [GiamToiDa], [SoLuong], [TrangThai]) VALUES (1, N'Giam Gia noel', N'MAGIAMGIA', N'NOEL', 1, CAST(N'2023-12-13T00:00:00.000' AS DateTime), CAST(N'2023-12-22T00:00:00.000' AS DateTime), 10000.0000, 20000.0000, -2, 0)
SET IDENTITY_INSERT [dbo].[MaGiamGia] OFF
GO
SET IDENTITY_INSERT [dbo].[MauSac] ON 

INSERT [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'MS001', N'Đen', 0)
INSERT [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'#6e3f3f', N'Nâu', 0)
INSERT [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'#ff0000', N'Đỏ', 0)
INSERT [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (4, N'#f5f5f5', N'Trắng', 0)
SET IDENTITY_INSERT [dbo].[MauSac] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MaLoaiAo], [MaThuongHieu], [MaChatLieu], [MaCoAo], [MoTa], [TrangThai]) VALUES (1009, N'SP002', N'Áo phông unisex người lớn cotton dáng rộng', CAST(N'2023-12-20T01:07:17.450' AS DateTime), N'L001', N'TH001', N'CL001', N'CA001', N'Áo phông dáng rộng, cổ tròn, cộc tay.
Phía trước in họa tiết chữ khác màu.
Thiết kế áo thun cổ tròn unisex đơn giản.
Thiết kế theo phong cách basic dễ mặc và dễ phối với nhiều trang phục khác nhau.
Sản phẩm chứng chỉ cotton USA.
Chất liệu 100% cotton:
- Ưu điểm nguyên liệu: Thân thiện với môi trường. Độ bền tốt. Thấm hút tốt, thoáng mát, không gây hại cho sức khỏe. Thoáng mát khi mặc.', 0)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MaLoaiAo], [MaThuongHieu], [MaChatLieu], [MaCoAo], [MoTa], [TrangThai]) VALUES (1010, N'SP001', N'Áo phông nam cotton in hình Avenger dáng rộng', CAST(N'2023-12-20T02:12:34.503' AS DateTime), N'L001', N'TH002', N'CL001', N'CA002', N'Áo được may từ chất liệu cotton với form relax, có đường cắt rộng rãi, tạo cảm giác thoải mái và tự nhiên khi mặc.
Chiếc áo thun in hình Avenger ở ngực áo - là sản phẩm của sự hợp tác giữa Canifa và Marvel - đơn vị sở hữu bản quyền Avenger.', 0)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MaLoaiAo], [MaThuongHieu], [MaChatLieu], [MaCoAo], [MoTa], [TrangThai]) VALUES (1011, N'SP003', N'Áo phông unisex người lớn có hình in', CAST(N'2023-12-20T02:16:26.913' AS DateTime), N'L001', N'TH002', N'CL001', N'CA002', N'Áo được may từ chất liệu cotton với form relax, có đường cắt rộng rãi, tạo cảm giác thoải mái và tự nhiên khi mặc.
Chiếc áo thun in hình Avenger ở ngực áo - là sản phẩm của sự hợp tác giữa Canifa và Marvel - đơn vị sở hữu bản quyền Avenger.', 0)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MaLoaiAo], [MaThuongHieu], [MaChatLieu], [MaCoAo], [MoTa], [TrangThai]) VALUES (1012, N'SP004', N'Áo phông unisex người lớn cotton có hình in', CAST(N'2023-12-20T02:18:52.203' AS DateTime), N'L001', N'TH002', N'CL001', N'CA002', N'Áo phông 100% cotton in hình', 0)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MaLoaiAo], [MaThuongHieu], [MaChatLieu], [MaCoAo], [MoTa], [TrangThai]) VALUES (1013, N'SP005', N'Áo phông nóng', CAST(N'2023-12-20T02:25:50.287' AS DateTime), N'L001', N'TH003', N'CL001', N'CA003', N'Giặt máy ở chế độ nhẹ, nhiệt độ thường.
Không sử dụng hóa chất tẩy có chứa clo.
Phơi trong bóng mát.
Sấy thùng, chế độ nhẹ nhàng.
Là ở nhiệt độ trung bình 150 độ C.
Giặt với sản phẩm cùng màu.
Không là lên chi tiết trang trí.', 0)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MaLoaiAo], [MaThuongHieu], [MaChatLieu], [MaCoAo], [MoTa], [TrangThai]) VALUES (1014, N'SP006', N'Áo phông unisex người lớn cotton dáng rộng', CAST(N'2023-12-20T02:58:34.090' AS DateTime), N'L001', N'TH002', N'CL001', N'CA002', N'Áo phông dáng rộng, cổ tròn, cộc tay.
Phía trước in họa tiết chữ khác màu.
Thiết kế áo thun cổ tròn unisex đơn giản.
Thiết kế theo phong cách basic dễ mặc và dễ phối với nhiều trang phục khác nhau.', 0)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MaLoaiAo], [MaThuongHieu], [MaChatLieu], [MaCoAo], [MoTa], [TrangThai]) VALUES (1015, N'SP007', N'Áo polo nam dệt dáng suông', CAST(N'2023-12-20T04:19:27.587' AS DateTime), N'L001', N'TH003', N'CL001', N'CA002', N'Áo polo sợi nam cộc tay dáng regular với đặc trưng vừa phần vai, phần thân và tay áo hơi ôm vào body nhưng không đem lại sự khó chịu hay bó sát. Trong tiết trời nóng lạnh thất thường mỗi khi giao mùa, áo polo sợi sẽ là sự lựa chọn hoàn hảo. Áo polo sợi hội tụ đủ những yếu tố cần thiết: lịch sự, chỉn chu nhưng lại không quá trang trọng.', 0)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MaLoaiAo], [MaThuongHieu], [MaChatLieu], [MaCoAo], [MoTa], [TrangThai]) VALUES (1016, N'SP009', N'Áo phông nam cotton in hình Avenger dáng rộng', CAST(N'2023-12-20T05:39:32.673' AS DateTime), N'L001', N'TH002', N'CL001', N'CA002', N'Hình in sử dụng công ghệ in kỹ thuật số giúp cho hình in bền, đẹp, không nứt trong quá trình sử dụng.
Đây là một item hiện đại, basic dễ mặc, dễ mix cùng nhiều trang phục khác nhau.
Chất liệu 100% cotton:', 0)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MaLoaiAo], [MaThuongHieu], [MaChatLieu], [MaCoAo], [MoTa], [TrangThai]) VALUES (1017, N'SP010', N'Áo phông unisex người lớn cotton có hình in', CAST(N'2023-12-20T05:40:51.610' AS DateTime), N'L001', N'TH004', N'CL001', N'CA002', N'Giặt máy ở chế độ nhẹ, nhiệt độ thường.
Không sử dụng hóa chất tẩy có chứa clo.
Phơi trong bóng mát.
Sấy thùng, chế độ nhẹ nhàng.
Là ở nhiệt độ trung bình 150 độ C.
Giặt với sản phẩm cùng màu.
Không là lên chi tiết trang trí.

Thanh toán khi nhận hàng (COD)
Giao hàng toàn quốc.

Miễn phí giao hàng
Với đơn hàng trên 599.000đ.', 0)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MaLoaiAo], [MaThuongHieu], [MaChatLieu], [MaCoAo], [MoTa], [TrangThai]) VALUES (1018, N'SP008', N'Áo phông nam cotton có hình in Mickey dáng suông', CAST(N'2023-12-20T05:42:10.597' AS DateTime), N'L001', N'TH003', N'CL001', N'CA002', N'Áo phông chất liệu 100% cotton in nhỏ ở ngực và in to sau lưng, phom regular.', 0)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MaLoaiAo], [MaThuongHieu], [MaChatLieu], [MaCoAo], [MoTa], [TrangThai]) VALUES (1019, N'SP012', N'Áo phông nam cotton cổ tròn có hình in Marvel dáng suông', CAST(N'2023-12-20T05:43:00.647' AS DateTime), N'L001', N'TH003', N'CL001', N'CA002', N'Giặt máy ở chế độ nhẹ, nhiệt độ thường.
Không sử dụng hóa chất tẩy có chứa clo.
Phơi trong bóng mát.
Sấy thùng, chế độ nhẹ nhàng.
Là ở nhiệt độ trung bình 150 độ C.
Giặt với sản phẩm cùng màu.
Không là lên chi tiết trang trí.', 0)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MaLoaiAo], [MaThuongHieu], [MaChatLieu], [MaCoAo], [MoTa], [TrangThai]) VALUES (1020, N'SP099', N'AO PHÔNG', CAST(N'2023-12-20T07:45:52.717' AS DateTime), N'L001', N'TH001', N'CL001', N'CA001', N'ABC', 0)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [Images], [TrangThai]) VALUES (1, N'TH001', N'Niko', N'niko.jpg', 0)
INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [Images], [TrangThai]) VALUES (2, N'TH002', N'Adigas', N'Adigas.png', 0)
INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [Images], [TrangThai]) VALUES (3, N'TH003', N'Uniquila', N'Uniquila.png', 0)
INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [Images], [TrangThai]) VALUES (4, N'TH004', N'Guem', N'Guem.png', 0)
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CoAo__3214CC9E391CA160]    Script Date: 12/24/2023 3:50:52 PM ******/
ALTER TABLE [dbo].[CoAo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChatLieu__3214CC9E18198098]    Script Date: 12/24/2023 3:50:52 PM ******/
ALTER TABLE [dbo].[ChatLieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KichCo__3214CC9E966484C8]    Script Date: 12/24/2023 3:50:52 PM ******/
ALTER TABLE [dbo].[KichCo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LoaiAo__3214CC9E8DB72223]    Script Date: 12/24/2023 3:50:52 PM ******/
ALTER TABLE [dbo].[LoaiAo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__MauSac__3214CC9EBF1376EA]    Script Date: 12/24/2023 3:50:52 PM ******/
ALTER TABLE [dbo].[MauSac] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SanPham__3214CC9E2FADC219]    Script Date: 12/24/2023 3:50:52 PM ******/
ALTER TABLE [dbo].[SanPham] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ThuongHi__3214CC9E09C3E503]    Script Date: 12/24/2023 3:50:52 PM ******/
ALTER TABLE [dbo].[ThuongHieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Anh]  WITH CHECK ADD  CONSTRAINT [FK_Anh_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[Anh] CHECK CONSTRAINT [FK_Anh_SanPham]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Accounts]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Roles]
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSanPham_KichCo] FOREIGN KEY([MaKichCo])
REFERENCES [dbo].[KichCo] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham] CHECK CONSTRAINT [FK_ChiTietSanPham_KichCo]
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSanPham_MauSac] FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham] CHECK CONSTRAINT [FK_ChiTietSanPham_MauSac]
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietSanPham_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham] CHECK CONSTRAINT [FK_ChiTietSanPham_SanPham]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[DiaChi]  WITH CHECK ADD FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
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
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[GioHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaGioHang])
REFERENCES [dbo].[GioHang] ([id])
GO
ALTER TABLE [dbo].[GioHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[ChiTietSanPham] ([id])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_CoAo] FOREIGN KEY([MaCoAo])
REFERENCES [dbo].[CoAo] ([Ma])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_CoAo]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ChatLieu] FOREIGN KEY([MaChatLieu])
REFERENCES [dbo].[ChatLieu] ([Ma])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_ChatLieu]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiAo] FOREIGN KEY([MaLoaiAo])
REFERENCES [dbo].[LoaiAo] ([Ma])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiAo]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ThuongHieu] FOREIGN KEY([MaThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([Ma])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_ThuongHieu]
GO
