
CREATE DATABASE GOTD
GO
USE GOTD
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anh](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ma] [nvarchar](50) NULL,
	[MaSP] [int] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoAo]    Script Date: 10/13/2023 11:40:12 PM ******/
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
/****** Object:  Table [dbo].[ChatLieu]    Script Date: 10/13/2023 11:40:12 PM ******/
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
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 10/13/2023 11:40:12 PM ******/
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
/****** Object:  Table [dbo].[DanhGia]    Script Date: 10/13/2023 11:40:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [nvarchar](50) NULL,
	[MaKhachHang] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[DanhSachYeuThich]    Script Date: 10/13/2023 11:40:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSachYeuThich](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [nvarchar](50) NULL,
	[MaKhachHang] [varchar](50) NULL,
	[Ngay] [datetime] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaChi]    Script Date: 10/13/2023 11:40:12 PM ******/
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
	[MaTaiKhoan] [varchar](50) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 10/13/2023 11:40:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaKhachHang] [varchar](50) NULL,
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
/****** Object:  Table [dbo].[DonHangChiTiet]    Script Date: 10/13/2023 11:40:12 PM ******/
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
/****** Object:  Table [dbo].[KichCo]    Script Date: 10/13/2023 11:40:12 PM ******/
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
/****** Object:  Table [dbo].[LoaiKhachHang]    Script Date: 10/13/2023 11:40:12 PM ******/
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
/****** Object:  Table [dbo].[MaGiamGia]    Script Date: 10/13/2023 11:40:12 PM ******/
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
/****** Object:  Table [dbo].[MauSac]    Script Date: 10/13/2023 11:40:12 PM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/13/2023 11:40:12 PM ******/
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
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 10/13/2023 11:40:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenDangNhap] [varchar](50) NOT NULL,
	[HoVaTen] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[SoDienThoai] [varchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[MatKhau] [varchar](50) NULL,
	[Anh] [nvarchar](50) NULL,
	[MaVaiTro] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 10/13/2023 11:40:12 PM ******/
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
/****** Object:  Table [dbo].[VaiTro]    Script Date: 10/13/2023 11:40:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTro](
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
SET IDENTITY_INSERT [dbo].[CoAo] ON 

INSERT [dbo].[CoAo] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'CA001', N'S', 1)
INSERT [dbo].[CoAo] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'CA002', N'M', 1)
INSERT [dbo].[CoAo] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'CA003', N'L', 1)
SET IDENTITY_INSERT [dbo].[CoAo] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatLieu] ON 

INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'CL001', N'V?i', 1)
INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'CL002', N'Da', 1)
INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'CL003', N'L?a', 1)
SET IDENTITY_INSERT [dbo].[ChatLieu] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] ON 

INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1, N'SP001', N'LK001', N'TH001', N'M001', N'KC001', N'CL001', N'CA001', 50, 50.0000, 100.0000, N'Mô t? chi ti?t SP001', CAST(N'2023-10-13T23:36:41.953' AS DateTime), CAST(N'2023-10-13T23:36:41.953' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (2, N'SP001', N'LK002', N'TH002', N'M002', N'KC002', N'CL002', N'CA002', 30, 70.0000, 120.0000, N'Mô t? chi ti?t SP001', CAST(N'2023-10-13T23:36:41.953' AS DateTime), CAST(N'2023-10-13T23:36:41.953' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (3, N'SP002', N'LK003', N'TH003', N'M003', N'KC003', N'CL003', N'CA003', 40, 80.0000, 150.0000, N'Mô t? chi ti?t SP002', CAST(N'2023-10-13T23:36:41.953' AS DateTime), CAST(N'2023-10-13T23:36:41.953' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhGia] ON 

INSERT [dbo].[DanhGia] ([id], [MaSanPham], [MaKhachHang], [DanhGia], [BinhLuan], [Ngay], [TrangThai]) VALUES (1, N'SP001', N'user1', 5, N'S?n ph?m tuy?t v?i', CAST(N'2023-10-13T23:36:41.957' AS DateTime), 1)
INSERT [dbo].[DanhGia] ([id], [MaSanPham], [MaKhachHang], [DanhGia], [BinhLuan], [Ngay], [TrangThai]) VALUES (2, N'SP002', N'user2', 4, N'S?n ph?m r?t t?t', CAST(N'2023-10-13T23:36:41.957' AS DateTime), 1)
INSERT [dbo].[DanhGia] ([id], [MaSanPham], [MaKhachHang], [DanhGia], [BinhLuan], [Ngay], [TrangThai]) VALUES (3, N'SP003', N'user3', 5, N'S?n ph?m đ?p', CAST(N'2023-10-13T23:36:41.957' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[DanhGia] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] ON 

INSERT [dbo].[DanhSachYeuThich] ([id], [MaSanPham], [MaKhachHang], [Ngay], [TrangThai]) VALUES (1, N'SP001', N'user1', CAST(N'2023-10-13T23:36:41.957' AS DateTime), 1)
INSERT [dbo].[DanhSachYeuThich] ([id], [MaSanPham], [MaKhachHang], [Ngay], [TrangThai]) VALUES (2, N'SP002', N'user1', CAST(N'2023-10-13T23:36:41.957' AS DateTime), 1)
INSERT [dbo].[DanhSachYeuThich] ([id], [MaSanPham], [MaKhachHang], [Ngay], [TrangThai]) VALUES (3, N'SP003', N'user2', CAST(N'2023-10-13T23:36:41.957' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] OFF
GO
SET IDENTITY_INSERT [dbo].[DiaChi] ON 

INSERT [dbo].[DiaChi] ([id], [Ten], [ThanhPho], [Quan], [Phuong], [ChiTiet], [MaTaiKhoan], [GhiChu], [TrangThai]) VALUES (1, N'Đ?a ch? 1', N'Hà N?i', N'Qu?n 1', N'Phư?ng A', N'123 Đư?ng ABC', N'user1', N'Ghi chú đ?a ch? 1', 1)
INSERT [dbo].[DiaChi] ([id], [Ten], [ThanhPho], [Quan], [Phuong], [ChiTiet], [MaTaiKhoan], [GhiChu], [TrangThai]) VALUES (2, N'Đ?a ch? 2', N'TPHCM', N'Qu?n 2', N'Phư?ng B', N'456 Đư?ng XYZ', N'user2', N'Ghi chú đ?a ch? 2', 1)
INSERT [dbo].[DiaChi] ([id], [Ten], [ThanhPho], [Quan], [Phuong], [ChiTiet], [MaTaiKhoan], [GhiChu], [TrangThai]) VALUES (3, N'Đ?a ch? 3', N'Đà N?ng', N'Qu?n 3', N'Phư?ng C', N'789 Đư?ng DEF', N'user3', N'Ghi chú đ?a ch? 3', 1)
SET IDENTITY_INSERT [dbo].[DiaChi] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [ThanhPho], [Quan], [Phuong], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TenKhachHang], [TongTien], [TrangThai]) VALUES (1, N'user1', N'GG001', N'123456789', N'TPHCM', N'Qu?n 1', N'Phư?ng A', N'123 Đư?ng ABC', CAST(N'2023-10-13T23:36:41.957' AS DateTime), 10.0000, 20.0000, N'Ngư?i dùng 1', 110.0000, 1)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [ThanhPho], [Quan], [Phuong], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TenKhachHang], [TongTien], [TrangThai]) VALUES (2, N'user2', N'GG002', N'987654321', N'Hà N?i', N'Qu?n 2', N'Phư?ng B', N'456 Đư?ng XYZ', CAST(N'2023-10-13T23:36:41.957' AS DateTime), 5.0000, 15.0000, N'Ngư?i dùng 2', 70.0000, 1)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [ThanhPho], [Quan], [Phuong], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TenKhachHang], [TongTien], [TrangThai]) VALUES (3, N'user3', N'GG003', N'555555555', N'Đà N?ng', N'Qu?n 3', N'Phư?ng C', N'789 Đư?ng DEF', CAST(N'2023-10-13T23:36:41.957' AS DateTime), 15.0000, 25.0000, N'Ngư?i dùng 3', 125.0000, 1)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHangChiTiet] ON 

INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (1, 1, 1, 2, 40.0000, 1)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (2, 1, 2, 3, 30.0000, 1)
INSERT [dbo].[DonHangChiTiet] ([id], [MaDonHang], [MaSanPham], [SoLuong], [DonGia], [TrangThai]) VALUES (3, 2, 3, 1, 60.0000, 1)
SET IDENTITY_INSERT [dbo].[DonHangChiTiet] OFF
GO
SET IDENTITY_INSERT [dbo].[KichCo] ON 

INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'KC001', N'S', 1)
INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'KC002', N'M', 1)
INSERT [dbo].[KichCo] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'KC003', N'L', 1)
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

INSERT [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'M001', N'Đ?', 1)
INSERT [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'M002', N'Xanh', 1)
INSERT [dbo].[MauSac] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'M003', N'Vàng', 1)
SET IDENTITY_INSERT [dbo].[MauSac] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (1, N'SP001', N'Áo phông', CAST(N'2023-10-13T23:36:41.953' AS DateTime), N'Mô t? s?n ph?m SP001', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (2, N'SP002', N'Áo khoác', CAST(N'2023-10-13T23:36:41.953' AS DateTime), N'Mô t? s?n ph?m SP002', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (3, N'SP003', N'Qu?n jeans', CAST(N'2023-10-13T23:36:41.953' AS DateTime), N'Mô t? s?n ph?m SP003', 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [HoVaTen], [Email], [SoDienThoai], [NgaySinh], [MatKhau], [Anh], [MaVaiTro], [TrangThai]) VALUES (N'user1', N'Ngư?i dùng 1', N'user1@example.com', N'123456789', CAST(N'1990-01-01T00:00:00.000' AS DateTime), N'password1', N'user1.jpg', N'VT001', 1)
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [HoVaTen], [Email], [SoDienThoai], [NgaySinh], [MatKhau], [Anh], [MaVaiTro], [TrangThai]) VALUES (N'user2', N'Ngư?i dùng 2', N'user2@example.com', N'987654321', CAST(N'1995-02-02T00:00:00.000' AS DateTime), N'password2', N'user2.jpg', N'VT002', 1)
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [HoVaTen], [Email], [SoDienThoai], [NgaySinh], [MatKhau], [Anh], [MaVaiTro], [TrangThai]) VALUES (N'user3', N'Ngư?i dùng 3', N'user3@example.com', N'555555555', CAST(N'1985-03-03T00:00:00.000' AS DateTime), N'password3', N'user3.jpg', N'VT003', 1)
GO
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'TH001', N'Thương hi?u 1', 1)
INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'TH002', N'Thương hi?u 2', 1)
INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'TH003', N'Thương hi?u 3', 1)
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
GO
SET IDENTITY_INSERT [dbo].[VaiTro] ON 

INSERT [dbo].[VaiTro] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'VT001', N'Admin', 1)
INSERT [dbo].[VaiTro] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'VT002', N'Ngư?i dùng', 1)
INSERT [dbo].[VaiTro] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'VT003', N'Khách hàng', 1)
SET IDENTITY_INSERT [dbo].[VaiTro] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Anh__3214CC9E22AB25E3]    Script Date: 10/13/2023 11:40:12 PM ******/
ALTER TABLE [dbo].[Anh] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CoAo__3214CC9E6D934CE9]    Script Date: 10/13/2023 11:40:12 PM ******/
ALTER TABLE [dbo].[CoAo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChatLieu__3214CC9EDFA15B4F]    Script Date: 10/13/2023 11:40:12 PM ******/
ALTER TABLE [dbo].[ChatLieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KichCo__3214CC9EAB239EE5]    Script Date: 10/13/2023 11:40:12 PM ******/
ALTER TABLE [dbo].[KichCo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LoaiKhac__3214CC9E6A133E5E]    Script Date: 10/13/2023 11:40:12 PM ******/
ALTER TABLE [dbo].[LoaiKhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__MauSac__3214CC9E37DF48A4]    Script Date: 10/13/2023 11:40:12 PM ******/
ALTER TABLE [dbo].[MauSac] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SanPham__3214CC9E2028A203]    Script Date: 10/13/2023 11:40:12 PM ******/
ALTER TABLE [dbo].[SanPham] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ThuongHi__3214CC9E5EBD70CD]    Script Date: 10/13/2023 11:40:12 PM ******/
ALTER TABLE [dbo].[ThuongHieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__VaiTro__3214CC9E57B2E2A4]    Script Date: 10/13/2023 11:40:12 PM ******/
ALTER TABLE [dbo].[VaiTro] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Anh]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([id])
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
REFERENCES [dbo].[TaiKhoan] ([TenDangNhap])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[TaiKhoan] ([TenDangNhap])
GO
ALTER TABLE [dbo].[DanhSachYeuThich]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([Ma])
GO
ALTER TABLE [dbo].[DiaChi]  WITH CHECK ADD FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TenDangNhap])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[TaiKhoan] ([TenDangNhap])
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([id])
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[ChiTietSanPham] ([id])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([MaVaiTro])
REFERENCES [dbo].[VaiTro] ([Ma])
GO
ALTER TABLE TaiKhoan
    ADD Token NVARCHAR(100);