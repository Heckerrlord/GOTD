	-- Kiểm tra nếu cơ sở dữ liệu "GOTD" tồn tại
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'GOTD')
BEGIN
    -- Nếu tồn tại, thực hiện DROP DATABASE để xóa
    USE master;
    DROP DATABASE GOTD;
END

-- Sau đó, tạo lại cơ sở dữ liệu "GOTD"
CREATE DATABASE GOTD;
	GO
	USE [GOTD]
	GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 10/28/2023 2:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[Anh]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[Authorities]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[CoAo]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[ChatLieu]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[DanhGia]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[DanhSachYeuThich]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[DiaChi]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[DonHang]    Script Date: 10/28/2023 2:05:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [nvarchar](50) NULL,
	[MaGiamGia] [nvarchar](50) NULL,
	[SoDienThoai] [varchar](50) NULL,
	[ThanhPho] [nvarchar](100) NULL,
	[Quan] [nvarchar](100) NULL,
	[Phuong] [nvarchar](100) NULL,
	[DCChiTiet] [nvarchar](100) NULL,
	[NgayDatHang] [datetime] NULL,
	[TienGiam] [money] NULL,
	[PhiGiaoHang] [money] NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[TongTien] [money] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHangChiTiet]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[KichCo]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[LoaiKhachHang]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[MaGiamGia]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[MauSac]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/28/2023 2:05:18 PM ******/
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
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 10/28/2023 2:05:18 PM ******/
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
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'admin', N'123', N'Sin Phúc Duy', N'spduyvn@gmail.com', N'user.png', N'guGLjnQlUbd3M2zWurZVqwmKnCXStBNiAZdnj7VJgoZ22dMJUq', NULL, NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token], [SoDienThoai], [TrangThai]) VALUES (N'user1', N'1234', N'Duyvip00', N'duy9bdz@gmail.com', N'user.png', N'token', NULL, NULL)
GO
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam1.png', N'SP001', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam1a.png', N'SP001', 0)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam1b.png', N'SP001', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam1c.png', N'SP001', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam2.png', N'SP002', 0)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam3.png', N'SP002', 0)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam5.png', N'SP003', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam6.png', N'SP004', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam7.png', N'SP004', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam8.png', N'SP005', 1)
INSERT [dbo].[Anh] ([Ma], [MaSP], [TrangThai]) VALUES (N'Nam9.png', N'SP005', 1)
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (98, N'admin', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (101, N'admin', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (115, N'admin', N'CUST')
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
INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (5, N'CL002', N'Da', 1)
INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (6, N'CL003', N'L?a', 1)
SET IDENTITY_INSERT [dbo].[ChatLieu] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] ON 

INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1, N'SP001', N'LK001', N'TH001', N'M001', N'KC001', N'CL001', N'CA001', 50, 50.0000, 100.0000, N'Mô t? chi ti?t SP001', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (2, N'SP001', N'LK002', N'TH002', N'M002', N'KC002', N'CL002', N'CA002', 30, 70.0000, 120.0000, N'Mô t? chi ti?t SP001', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (3, N'SP002', N'LK003', N'TH003', N'M003', N'KC003', N'CL003', N'CA003', 40, 80.0000, 150.0000, N'Mô t? chi ti?t SP002', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (4, N'SP004', N'LK003', N'TH003', N'M003', N'KC003', N'CL003', N'CA003', 10, 15.0000, 100.0000, N'Mô t? chi ti?t SP002', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (5, N'SP003', N'LK003', N'TH002', N'M001', N'KC003', N'CL002', N'CA002', 30, 80.0000, 120.0000, N'Mô t? chi ti?t SP002', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[KichCo] ON 

INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'KC001', N'S', 1)
INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'KC002', N'M', 1)
INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'KC003', N'L', 1)
INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (4, N'KC0333', N'D', NULL)
SET IDENTITY_INSERT [dbo].[KichCo] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiKhachHang] ON 

INSERT [dbo].[LoaiKhachHang] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'LK001', N'Lo?i 1', 1)
INSERT [dbo].[LoaiKhachHang] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'LK002', N'Lo?i 2', 1)
INSERT [dbo].[LoaiKhachHang] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'LK003', N'Lo?i 3', 1)
SET IDENTITY_INSERT [dbo].[LoaiKhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[MaGiamGia] ON 

INSERT [dbo].[MaGiamGia] ([id], [Ten], [Ma], [SuKien], [HinhThucGiam], [NgayBatDau], [NgayKetThuc], [GiamToiThieu], [GiamToiDa], [SoLuong], [TrangThai]) VALUES (1, N'Gi?m 10%', N'GG001', N'S? ki?n A', 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), CAST(N'2023-12-31T00:00:00.000' AS DateTime), 0.0000, 10.0000, 100, 1)
INSERT [dbo].[MaGiamGia] ([id], [Ten], [Ma], [SuKien], [HinhThucGiam], [NgayBatDau], [NgayKetThuc], [GiamToiThieu], [GiamToiDa], [SoLuong], [TrangThai]) VALUES (2, N'Gi?m 20%', N'GG002', N'S? ki?n B', 1, CAST(N'2023-02-01T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime), 0.0000, 20.0000, 200, 1)
INSERT [dbo].[MaGiamGia] ([id], [Ten], [Ma], [SuKien], [HinhThucGiam], [NgayBatDau], [NgayKetThuc], [GiamToiThieu], [GiamToiDa], [SoLuong], [TrangThai]) VALUES (3, N'Gi?m 30%', N'GG003', N'S? ki?n C', 2, CAST(N'2023-03-01T00:00:00.000' AS DateTime), CAST(N'2023-10-31T00:00:00.000' AS DateTime), 50.0000, 30.0000, 300, 1)
SET IDENTITY_INSERT [dbo].[MaGiamGia] OFF
GO
SET IDENTITY_INSERT [dbo].[MauSac] ON 

INSERT [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'M001', N'#eb0f0f', 0)
INSERT [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'M002', N'Xanh', 1)
INSERT [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'M003', N'Vàng', 1)
SET IDENTITY_INSERT [dbo].[MauSac] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (1, N'SP001', N'Áo phông nam cotton in hình bộ phận sinh dục', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (2, N'SP002', N'Áo phông nam cotton in chữ CC', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (3, N'SP003', N'Áo phông mang phong cách siêu nhân', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (4, N'SP004', N'Áo phông cho mùa đông', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (5, N'SP005', N'Áo phông siêu nhân', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Áo phông đen với hình in "Mountain Explorer" là một lựa chọn hoàn hảo cho những người yêu thích thể thao núi và sự phiêu lưu. Với thiết kế trẻ trung và hiện đại, chiếc áo này sẽ giúp bạn tỏa sáng và thể hiện đam mê của mình với núi rừng.', 1)
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
/****** Object:  Index [UQ__CoAo__3214CC9E02A2AE0E]    Script Date: 10/28/2023 2:05:19 PM ******/
ALTER TABLE [dbo].[CoAo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChatLieu__3214CC9E6F9E44F1]    Script Date: 10/28/2023 2:05:19 PM ******/
ALTER TABLE [dbo].[ChatLieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KichCo__3214CC9E203C6FF2]    Script Date: 10/28/2023 2:05:19 PM ******/
ALTER TABLE [dbo].[KichCo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LoaiKhac__3214CC9E6B098500]    Script Date: 10/28/2023 2:05:19 PM ******/
ALTER TABLE [dbo].[LoaiKhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__MauSac__3214CC9E47FCF10B]    Script Date: 10/28/2023 2:05:19 PM ******/
ALTER TABLE [dbo].[MauSac] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SanPham__3214CC9E0F3639AE]    Script Date: 10/28/2023 2:05:19 PM ******/
ALTER TABLE [dbo].[SanPham] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ThuongHi__3214CC9E27B13427]    Script Date: 10/28/2023 2:05:19 PM ******/
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
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaChatLieu])
REFERENCES [dbo].[ChatLieu] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaKichCo])
REFERENCES [dbo].[KichCo] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaLoaiKH])
REFERENCES [dbo].[LoaiKhachHang] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([Ma])
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
