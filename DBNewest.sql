USE [J6Store]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 10/19/2023 8:11:54 PM ******/
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
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anh]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[Authorities]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 10/19/2023 8:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoAo]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[ChatLieu]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[DanhGia]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[DanhSachYeuThich]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[DiaChi]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[DonHang]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[DonHangChiTiet]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[KichCo]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[LoaiKhachHang]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[MaGiamGia]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[MauSac]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/19/2023 8:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/19/2023 8:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/19/2023 8:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [char](4) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 10/19/2023 8:11:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaVaiTro] [nvarchar](50) NULL,
	[TenDangNhap] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 10/19/2023 8:11:55 PM ******/
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
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 10/19/2023 8:11:55 PM ******/
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
/****** Object:  Table [dbo].[VaiTro]    Script Date: 10/19/2023 8:11:55 PM ******/
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
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'admin', N'123', N'Sin Phúc Duy', N'spduyvn@gmail.com', N'user.png', N'guGLjnQlUbd3M2zWurZVqwmKnCXStBNiAZdnj7VJgoZ22dMJUq')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'ALFKI', N'alfki', N'Maria Anders', N'alfki@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'ANATR', N'anatr', N'Ana Trujillo', N'anatr@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'ANTON', N'anton', N'Antonio Moreno', N'anton@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'AROUT', N'arout', N'Thomas Hardy', N'arout@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'BERGS', N'bergs', N'Christina Berglund', N'bergs@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'BLAUS', N'blaus', N'Hanna Moos', N'blaus@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'BLONP', N'blonp', N'Frédérique Citeaux', N'blonp@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'BOLID', N'bolid', N'Martín Sommer', N'bolid@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'BONAP', N'bonap', N'Laurence Lebihan', N'bonap@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'BOTTM', N'bottm', N'Elizabeth Lincoln', N'bottm@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'BSBEV', N'bsbev', N'Victoria Ashworth', N'bsbev@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'CACTU', N'cactu', N'Patricio Simpson', N'cactu@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'CENTC', N'centc', N'Francisco Chang', N'centc@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'COMMI', N'commi', N'Pedro Afonso', N'commi@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'CONSH', N'consh', N'Elizabeth Brown', N'consh@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'CHOPS', N'chops', N'Yang Wang', N'chops@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'DRACD', N'dracd', N'Sven Ottlieb', N'dracd@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'DUMON', N'dumon', N'Janine Labrune', N'dumon@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'EASTC', N'eastc', N'Ann Devon', N'eastc@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'ERNSH', N'ernsh', N'Roland Mendel', N'ernsh@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'FAMIA', N'famia', N'Aria Cruz', N'famia@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'FISSA', N'fissa', N'Diego Roel', N'fissa@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'FOLIG', N'folig', N'Martine Rancé', N'folig@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'FOLKO', N'folko', N'Maria Larsson', N'folko@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'FRANK', N'frank', N'Peter Franken', N'frank@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'FRANR', N'franr', N'Carine Schmitt', N'franr@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'FRANS', N'frans', N'Paolo Accorti', N'frans@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'FURIB', N'furib', N'Lino Rodriguez', N'furib@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'GALED', N'galed', N'Eduardo Saavedra', N'galed@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'GODOS', N'godos', N'José Pedro Freyre', N'godos@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'GOURL', N'gourl', N'André Fonseca', N'gourl@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'GREAL', N'greal', N'Howard Snyder', N'greal@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'GROSR', N'grosr', N'Manuel Pereira', N'grosr@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'HANAR', N'hanar', N'Mario Pontes', N'hanar@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'HILAA', N'hilaa', N'Carlos Hernández', N'hilaa@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'HUNGC', N'hungc', N'Yoshi Latimer', N'hungc@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'HUNGO', N'hungo', N'Patricia McKenna', N'hungo@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'ISLAT', N'islat', N'Helen Bennett', N'islat@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'KOENE', N'koene', N'Philip Cramer', N'koene@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'LACOR', N'lacor', N'Daniel Tonini', N'lacor@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'LAMAI', N'lamai', N'Annette Roulet', N'lamai@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'LAUGB', N'laugb', N'Yoshi Tannamuri', N'laugb@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'LAZYK', N'lazyk', N'John Steel', N'lazyk@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'LEHMS', N'lehms', N'Renate Messner', N'lehms@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'LETSS', N'letss', N'Jaime Yorres', N'letss@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'LILAS', N'lilas', N'Carlos González', N'lilas@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'LINOD', N'linod', N'Felipe Izquierdo', N'linod@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'LONEP', N'lonep', N'Fran Wilson', N'lonep@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'MAGAA', N'magaa', N'Giovanni Rovelli', N'magaa@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'MAISD', N'maisd', N'Catherine Dewey', N'maisd@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'MEREP', N'merep', N'Jean Fresnière', N'merep@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'MORGK', N'morgk', N'Alexander Feuer', N'morgk@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'NORTS', N'norts', N'Simon Crowther', N'norts@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'OCEAN', N'ocean', N'Yvonne Moncada', N'ocean@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'OLDWO', N'oldwo', N'Rene Phillips', N'oldwo@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'OTTIK', N'ottik', N'Henriette Pfalzheim', N'ottik@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'PARIS', N'paris', N'Marie Bertrand', N'paris@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'PERIC', N'peric', N'Guillermo Fernández', N'peric@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'PICCO', N'picco', N'Georg Pipps', N'picco@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'PRINI', N'prini', N'Isabel de Castro', N'prini@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'QUEDE', N'quede', N'Bernardo Batista', N'quede@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'QUEEN', N'queen', N'Lúcia Carvalho', N'queen@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'QUICK', N'quick', N'Horst Kloss', N'quick@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'RANCH', N'ranch', N'Sergio Gutiérrez', N'ranch@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'RATTC', N'rattc', N'Paula Wilson', N'rattc@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'REGGC', N'reggc', N'Maurizio Moroni', N'reggc@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'RICAR', N'ricar', N'Janete Limeira', N'ricar@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'RICSU', N'ricsu', N'Michael Holz', N'ricsu@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'ROMEY', N'romey', N'Alejandra Camino', N'romey@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'SANTG', N'santg', N'Jonas Bergulfsen', N'santg@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'SAVEA', N'savea', N'Jose Pavarotti', N'savea@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'SEVES', N'seves', N'Hari Kumar', N'seves@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'SIMOB', N'simob', N'Jytte Petersen', N'simob@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'SPECD', N'specd', N'Dominique Perrier', N'specd@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'SPLIR', N'splir', N'Art Braunschweiger', N'splir@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'staff', N'123', N'Phạm Thị Nở', N'duyplus1999@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'SUPRD', N'suprd', N'Pascale Cartrain', N'suprd@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'TOMSP', N'tomsp', N'Karin Josephs', N'tomsp@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'TORTU', N'tortu', N'Miguel Angel Paolino', N'tortu@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'THEBI', N'thebi', N'Liz Nixon', N'thebi@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'THECR', N'thecr', N'Liu Wong', N'thecr@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'TRADH', N'tradh', N'Anabela Domingues', N'tradh@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'TRAIH', N'traih', N'Helvetius Nagy', N'traih@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'user', N'123', N'Nguyễn Văn Tèo', N'duyplus0909@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'VAFFE', N'vaffe', N'Palle Ibsen', N'vaffe@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'VICTE', N'victe', N'Mary Saveley', N'victe@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'VINET', N'vinet', N'Paul Henriot', N'vinet@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'WANDK', N'wandk', N'Rita Müller', N'wandk@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'WARTH', N'warth', N'Pirkko Koskitalo', N'warth@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'WELLI', N'welli', N'Paula Parente', N'welli@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'WHITC', N'whitc', N'Karl Jablonski', N'whitc@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'WILMK', N'wilmk', N'Matti Karttunen', N'wilmk@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'WOLZA', N'wolza', N'Zbyszek Piestrzeniewicz', N'wolza@gmail.com', N'user.png', N'token')
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2, N'ALFKI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (3, N'ANATR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (4, N'ANTON', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (5, N'AROUT', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (6, N'BERGS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7, N'BLAUS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (8, N'BLONP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (9, N'BOLID', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (10, N'BONAP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (11, N'BOTTM', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (12, N'BSBEV', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (13, N'CACTU', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (14, N'CENTC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (15, N'CHOPS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (16, N'COMMI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (17, N'CONSH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (18, N'DRACD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (19, N'DUMON', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (20, N'EASTC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (21, N'ERNSH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (22, N'FAMIA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (23, N'FISSA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (24, N'FOLIG', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (25, N'FOLKO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (26, N'FRANK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (27, N'FRANR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (28, N'FRANS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (29, N'FURIB', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (30, N'GALED', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (31, N'GODOS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (32, N'GOURL', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (33, N'GREAL', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (34, N'GROSR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (35, N'HANAR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (36, N'HILAA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (37, N'HUNGC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (38, N'HUNGO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (39, N'ISLAT', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (40, N'KOENE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (41, N'LACOR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (42, N'LAMAI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (43, N'LAUGB', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (44, N'LAZYK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (45, N'LEHMS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (46, N'LETSS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (47, N'LILAS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (48, N'LINOD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (49, N'LONEP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (50, N'MAGAA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (51, N'MAISD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (52, N'MEREP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (53, N'MORGK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (55, N'NORTS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (56, N'OCEAN', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (57, N'OLDWO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (58, N'OTTIK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (59, N'PARIS', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (60, N'PERIC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (61, N'PICCO', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (62, N'PRINI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (63, N'QUEDE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (64, N'QUEEN', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (65, N'QUICK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (66, N'RANCH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (67, N'RATTC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (68, N'REGGC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (69, N'RICAR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (70, N'RICSU', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (71, N'ROMEY', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (74, N'SAVEA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (75, N'SEVES', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (76, N'SIMOB', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (77, N'SPECD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (78, N'SPLIR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (79, N'SUPRD', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (80, N'user', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (82, N'THEBI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (83, N'THECR', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (84, N'TOMSP', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (85, N'TORTU', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (86, N'TRADH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (87, N'TRAIH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (89, N'VAFFE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (90, N'VICTE', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (91, N'VINET', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (92, N'WANDK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (93, N'WARTH', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (94, N'WELLI', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (95, N'WHITC', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (96, N'WILMK', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (97, N'WOLZA', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (98, N'admin', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (100, N'staff', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (101, N'admin', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (102, N'staff', N'CUST')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
INSERT [dbo].[Categories] ([Id], [Name], [Note], [Description]) VALUES (N'1000', N'Áo phông nam', N'Đồng hồ', N'Đồng hồ đeo tay')
INSERT [dbo].[Categories] ([Id], [Name], [Note], [Description]) VALUES (N'1002', N'Áo phông nữ', N'Máy ảnh', N'Máy ảnh chụp hình')
GO
SET IDENTITY_INSERT [dbo].[CoAo] ON 

INSERT [dbo].[CoAo] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'CA001', N'S', 1)
INSERT [dbo].[CoAo] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'CA002', N'M', 1)
INSERT [dbo].[CoAo] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'CA003', N'L', 1)
SET IDENTITY_INSERT [dbo].[CoAo] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatLieu] ON 

INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'CL1', N'Da Khủng Long', 1)
INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'CL2', N'Cánh đại bàng', 1)
INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (4, N'CL001', N'V?i', 1)
INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (5, N'CL002', N'Da', 1)
INSERT [dbo].[ChatLieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (6, N'CL003', N'L?a', 1)
SET IDENTITY_INSERT [dbo].[ChatLieu] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] ON 

INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (1, N'SP001', N'LK001', N'TH001', N'M001', N'KC001', N'CL001', N'CA001', 50, 50.0000, 100.0000, N'Mô t? chi ti?t SP001', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (2, N'SP001', N'LK002', N'TH002', N'M002', N'KC002', N'CL002', N'CA002', 30, 70.0000, 120.0000, N'Mô t? chi ti?t SP001', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
INSERT [dbo].[ChiTietSanPham] ([id], [MaSanPham], [MaLoaiKH], [MaThuongHieu], [MaMau], [MaKichCo], [MaChatLieu], [MaCoAo], [SoLuong], [GiaNhap], [GiaBan], [MoTa], [NgayThem], [NgaySua], [TrangThai]) VALUES (3, N'SP002', N'LK003', N'TH003', N'M003', N'KC003', N'CL003', N'CA003', 40, 80.0000, 150.0000, N'Mô t? chi ti?t SP002', CAST(N'2023-10-19T20:07:39.253' AS DateTime), CAST(N'2023-10-19T20:07:39.253' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[ChiTietSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhGia] ON 

INSERT [dbo].[DanhGia] ([id], [MaSanPham], [MaKhachHang], [DanhGia], [BinhLuan], [Ngay], [TrangThai]) VALUES (1, N'SP001', N'user1', 5, N'S?n ph?m tuy?t v?i', CAST(N'2023-10-19T20:08:49.623' AS DateTime), 1)
INSERT [dbo].[DanhGia] ([id], [MaSanPham], [MaKhachHang], [DanhGia], [BinhLuan], [Ngay], [TrangThai]) VALUES (2, N'SP002', N'user2', 4, N'S?n ph?m r?t t?t', CAST(N'2023-10-19T20:08:49.623' AS DateTime), 1)
INSERT [dbo].[DanhGia] ([id], [MaSanPham], [MaKhachHang], [DanhGia], [BinhLuan], [Ngay], [TrangThai]) VALUES (3, N'SP003', N'user3', 5, N'S?n ph?m đ?p', CAST(N'2023-10-19T20:08:49.623' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[DanhGia] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] ON 

INSERT [dbo].[DanhSachYeuThich] ([id], [MaSanPham], [MaKhachHang], [Ngay], [TrangThai]) VALUES (1, N'SP001', N'user1', CAST(N'2023-10-19T20:08:46.500' AS DateTime), 1)
INSERT [dbo].[DanhSachYeuThich] ([id], [MaSanPham], [MaKhachHang], [Ngay], [TrangThai]) VALUES (2, N'SP002', N'user1', CAST(N'2023-10-19T20:08:46.500' AS DateTime), 1)
INSERT [dbo].[DanhSachYeuThich] ([id], [MaSanPham], [MaKhachHang], [Ngay], [TrangThai]) VALUES (3, N'SP003', N'user2', CAST(N'2023-10-19T20:08:46.500' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[DanhSachYeuThich] OFF
GO
SET IDENTITY_INSERT [dbo].[DiaChi] ON 

INSERT [dbo].[DiaChi] ([id], [Ten], [ThanhPho], [Quan], [Phuong], [ChiTiet], [MaTaiKhoan], [GhiChu], [TrangThai]) VALUES (2, N'Đ?a ch? 1', N'Hà N?i', N'Qu?n 1', N'Phư?ng A', N'123 Đư?ng ABC', N'user1', N'Ghi chú đ?a ch? 1', 1)
INSERT [dbo].[DiaChi] ([id], [Ten], [ThanhPho], [Quan], [Phuong], [ChiTiet], [MaTaiKhoan], [GhiChu], [TrangThai]) VALUES (3, N'Đ?a ch? 2', N'TPHCM', N'Qu?n 2', N'Phư?ng B', N'456 Đư?ng XYZ', N'user2', N'Ghi chú đ?a ch? 2', 1)
INSERT [dbo].[DiaChi] ([id], [Ten], [ThanhPho], [Quan], [Phuong], [ChiTiet], [MaTaiKhoan], [GhiChu], [TrangThai]) VALUES (4, N'Đ?a ch? 3', N'Đà N?ng', N'Qu?n 3', N'Phư?ng C', N'789 Đư?ng DEF', N'user3', N'Ghi chú đ?a ch? 3', 1)
SET IDENTITY_INSERT [dbo].[DiaChi] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [ThanhPho], [Quan], [Phuong], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TenKhachHang], [TongTien], [TrangThai]) VALUES (1, N'user1', N'GG001', N'123456789', N'TPHCM', N'Qu?n 1', N'Phư?ng A', N'123 Đư?ng ABC', CAST(N'2023-10-19T20:08:52.490' AS DateTime), 10.0000, 20.0000, N'Ngư?i dùng 1', 110.0000, 1)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [ThanhPho], [Quan], [Phuong], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TenKhachHang], [TongTien], [TrangThai]) VALUES (2, N'user2', N'GG002', N'987654321', N'Hà N?i', N'Qu?n 2', N'Phư?ng B', N'456 Đư?ng XYZ', CAST(N'2023-10-19T20:08:52.490' AS DateTime), 5.0000, 15.0000, N'Ngư?i dùng 2', 70.0000, 1)
INSERT [dbo].[DonHang] ([id], [MaKhachHang], [MaGiamGia], [SoDienThoai], [ThanhPho], [Quan], [Phuong], [DCChiTiet], [NgayDatHang], [TienGiam], [PhiGiaoHang], [TenKhachHang], [TongTien], [TrangThai]) VALUES (3, N'user3', N'GG003', N'555555555', N'Đà N?ng', N'Qu?n 3', N'Phư?ng C', N'789 Đư?ng DEF', CAST(N'2023-10-19T20:08:52.490' AS DateTime), 15.0000, 25.0000, N'Ngư?i dùng 3', 125.0000, 1)
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
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100038, 10260, 1070, 12, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100051, 10265, 1070, 12, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100055, 10267, 1076, 14.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100061, 10270, 1043, 36.8, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100070, 10273, 1076, 14.4, 33)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100086, 10280, 1075, 6.2, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100099, 10284, 1067, 11.2, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100123, 10293, 1075, 6.2, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100126, 10294, 1043, 36.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100128, 10294, 1075, 6.2, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100140, 10299, 1070, 12, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100147, 10302, 1043, 36.8, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100163, 10308, 1070, 12, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100167, 10309, 1043, 36.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100174, 10312, 1043, 36.8, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100176, 10312, 1075, 6.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100182, 10315, 1070, 12, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100187, 10318, 1076, 14.4, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100190, 10319, 1076, 14.4, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100209, 10326, 1075, 6.2, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100249, 10340, 1043, 36.8, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100258, 10343, 1076, 14.4, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100269, 10347, 1075, 6.2, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100310, 10363, 1075, 6.2, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100311, 10363, 1076, 14.4, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100351, 10380, 1070, 12, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100378, 10389, 1070, 12, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100404, 10399, 1076, 14.4, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100442, 10413, 1076, 14.4, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100462, 10420, 1070, 12, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100475, 10425, 1076, 14.4, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100493, 10434, 1076, 14.4, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100500, 10436, 1075, 6.2, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100546, 10453, 1070, 12, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100559, 10458, 1043, 36.8, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100566, 10460, 1075, 6.2, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100575, 10464, 1043, 36.8, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100588, 10468, 1043, 36.8, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100604, 10474, 1075, 6.2, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100607, 10475, 1076, 14.4, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100609, 10476, 1070, 12, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100631, 10485, 1070, 12, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100644, 10490, 1075, 6.2, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100670, 10502, 1067, 14, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100679, 10506, 1070, 15, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100680, 10507, 1043, 46, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100686, 10510, 1075, 7.75, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100701, 10514, 1075, 7.75, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100712, 10517, 1070, 15, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100734, 10524, 1043, 46, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100750, 10530, 1043, 46, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100752, 10530, 1076, 18, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100775, 10538, 1070, 15, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100794, 10544, 1067, 14, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100814, 10552, 1075, 7.75, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100831, 10557, 1075, 7.75, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100854, 10566, 1076, 18, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100860, 10569, 1076, 18, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100868, 10572, 1075, 7.75, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100879, 10575, 1076, 18, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100884, 10577, 1075, 7.75, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100889, 10579, 1075, 7.75, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100893, 10581, 1075, 7.75, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100895, 10582, 1076, 18, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100917, 10593, 1076, 18, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100925, 10596, 1075, 7.75, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100940, 10604, 1076, 18, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100965, 10612, 1076, 18, 80)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100967, 10613, 1075, 7.75, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100974, 10616, 1070, 15, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (100986, 10621, 1070, 15, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101010, 10630, 1076, 18, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101011, 10631, 1075, 7.75, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101021, 10634, 1075, 7.75, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101035, 10640, 1070, 15, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101044, 10644, 1043, 46, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101086, 10659, 1070, 15, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101099, 10665, 1076, 18, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101110, 10670, 1067, 14, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101112, 10670, 1075, 7.75, 25)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101120, 10673, 1043, 46, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101143, 10682, 1075, 7.75, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101164, 10691, 1043, 46, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101174, 10694, 1070, 15, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101183, 10697, 1070, 15, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101188, 10698, 1070, 15, 8)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101196, 10701, 1076, 18, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101198, 10702, 1076, 18, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101208, 10706, 1043, 46, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101212, 10707, 1070, 15, 28)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101255, 10722, 1075, 7.75, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101279, 10732, 1076, 18, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101285, 10734, 1076, 18, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101289, 10736, 1075, 7.75, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101322, 10749, 1076, 18, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101349, 10758, 1070, 15, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101353, 10760, 1043, 46, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101355, 10761, 1075, 7.75, 18)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101384, 10773, 1075, 7.75, 7)
GO
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101388, 10775, 1067, 14, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101397, 10780, 1070, 15, 35)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101409, 10785, 1075, 7.75, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101412, 10786, 1075, 7.75, 42)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101416, 10788, 1075, 7.75, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101466, 10808, 1076, 18, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101470, 10810, 1070, 15, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101480, 10814, 1043, 46, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101492, 10819, 1043, 46, 7)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101493, 10819, 1075, 7.75, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101498, 10822, 1070, 15, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101504, 10824, 1070, 15, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101524, 10831, 1043, 46, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101544, 10837, 1076, 18, 21)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101557, 10842, 1043, 46, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101559, 10842, 1070, 15, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101568, 10846, 1070, 15, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101582, 10850, 1070, 15, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101604, 10858, 1070, 15, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101609, 10860, 1076, 18, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101620, 10864, 1067, 14, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101656, 10879, 1076, 18, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101659, 10880, 1070, 15, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101670, 10885, 1070, 15, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101692, 10894, 1075, 7.75, 120)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101703, 10900, 1070, 15, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101715, 10907, 1075, 7.75, 14)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101726, 10911, 1067, 14, 15)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101752, 10923, 1043, 46, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101753, 10923, 1067, 14, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101756, 10924, 1075, 7.75, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101765, 10927, 1076, 18, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101767, 10928, 1076, 18, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101769, 10929, 1075, 7.75, 49)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101780, 10932, 1075, 7.75, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101791, 10938, 1043, 46, 24)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101795, 10939, 1067, 14, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101825, 10951, 1075, 7.75, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101834, 10955, 1075, 7.75, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101844, 10959, 1075, 7.75, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101848, 10961, 1076, 18, 60)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101853, 10962, 1076, 18, 44)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101874, 10973, 1075, 7.75, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101877, 10975, 1075, 7.75, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101893, 10980, 1075, 7.75, 40)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101896, 10982, 1043, 46, 9)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101907, 10986, 1076, 18, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101910, 10987, 1043, 46, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101922, 10991, 1070, 15, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101923, 10991, 1076, 18, 90)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101937, 10998, 1075, 7.75, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101956, 11004, 1076, 18, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (101988, 11017, 1070, 15, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (102003, 11023, 1043, 46, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (102041, 11037, 1070, 15, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (102066, 11050, 1076, 18, 50)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (102068, 11052, 1043, 46, 30)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (102074, 11054, 1067, 14, 20)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (102082, 11057, 1070, 15, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (102093, 11062, 1070, 15, 12)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (102109, 11068, 1043, 46, 36)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (102127, 11075, 1076, 18, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (102154, 11077, 1075, 7.75, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (162511, 71206, 1075, 7.75, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (162512, 71206, 1081, 19, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (162513, 71206, 1070, 15, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212515, 121210, 1067, 14, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 


INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10948, N'GODOS', CAST(N'1998-03-13T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10949, N'BOTTM', CAST(N'1998-03-13T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10950, N'MAGAA', CAST(N'1998-03-16T00:00:00.000' AS DateTime), N'Via Ludovico il Moro 22')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10951, N'RICSU', CAST(N'1998-03-16T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10952, N'ALFKI', CAST(N'1998-03-16T00:00:00.000' AS DateTime), N'Obere Str. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10953, N'AROUT', CAST(N'1998-03-16T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10954, N'LINOD', CAST(N'1998-03-17T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10955, N'FOLKO', CAST(N'1998-03-17T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10956, N'BLAUS', CAST(N'1998-03-17T00:00:00.000' AS DateTime), N'Forsterstr. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10957, N'HILAA', CAST(N'1998-03-18T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10958, N'OCEAN', CAST(N'1998-03-18T00:00:00.000' AS DateTime), N'Ing. Gustavo Moncada 8585 Piso 20-A')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10959, N'GOURL', CAST(N'1998-03-18T00:00:00.000' AS DateTime), N'Av. Brasil, 442')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10960, N'HILAA', CAST(N'1998-03-19T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10961, N'QUEEN', CAST(N'1998-03-19T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10962, N'QUICK', CAST(N'1998-03-19T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10963, N'FURIB', CAST(N'1998-03-19T00:00:00.000' AS DateTime), N'Jardim das rosas n. 32')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10964, N'SPECD', CAST(N'1998-03-20T00:00:00.000' AS DateTime), N'25, rue Lauriston')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10965, N'OLDWO', CAST(N'1998-03-20T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10966, N'CHOPS', CAST(N'1998-03-20T00:00:00.000' AS DateTime), N'Hauptstr. 31')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10967, N'TOMSP', CAST(N'1998-03-23T00:00:00.000' AS DateTime), N'Luisenstr. 48')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10968, N'ERNSH', CAST(N'1998-03-23T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10969, N'COMMI', CAST(N'1998-03-23T00:00:00.000' AS DateTime), N'Av. dos Lusíadas, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10970, N'BOLID', CAST(N'1998-03-24T00:00:00.000' AS DateTime), N'C/ Araquil, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10971, N'FRANR', CAST(N'1998-03-24T00:00:00.000' AS DateTime), N'54, rue Royale')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10972, N'LACOR', CAST(N'1998-03-24T00:00:00.000' AS DateTime), N'67, avenue de l''Europe')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10973, N'LACOR', CAST(N'1998-03-24T00:00:00.000' AS DateTime), N'67, avenue de l''Europe')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10974, N'SPLIR', CAST(N'1998-03-25T00:00:00.000' AS DateTime), N'P.O. Box 555')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10975, N'BOTTM', CAST(N'1998-03-25T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10976, N'HILAA', CAST(N'1998-03-25T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10977, N'FOLKO', CAST(N'1998-03-26T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10978, N'MAISD', CAST(N'1998-03-26T00:00:00.000' AS DateTime), N'Rue Joseph-Bens 532')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10979, N'ERNSH', CAST(N'1998-03-26T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10980, N'FOLKO', CAST(N'1998-03-27T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10981, N'HANAR', CAST(N'1998-03-27T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10982, N'BOTTM', CAST(N'1998-03-27T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10983, N'SAVEA', CAST(N'1998-03-27T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10984, N'SAVEA', CAST(N'1998-03-30T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10985, N'HUNGO', CAST(N'1998-03-30T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10986, N'OCEAN', CAST(N'1998-03-30T00:00:00.000' AS DateTime), N'Ing. Gustavo Moncada 8585 Piso 20-A')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10987, N'EASTC', CAST(N'1998-03-31T00:00:00.000' AS DateTime), N'35 King George')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10988, N'RATTC', CAST(N'1998-03-31T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10989, N'QUEDE', CAST(N'1998-03-31T00:00:00.000' AS DateTime), N'Rua da Panificadora, 12')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10990, N'ERNSH', CAST(N'1998-04-01T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10991, N'QUICK', CAST(N'1998-04-01T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10992, N'THEBI', CAST(N'1998-04-01T00:00:00.000' AS DateTime), N'89 Jefferson Way Suite 2')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10993, N'FOLKO', CAST(N'1998-04-01T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10994, N'VAFFE', CAST(N'1998-04-02T00:00:00.000' AS DateTime), N'Smagsloget 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10995, N'PERIC', CAST(N'1998-04-02T00:00:00.000' AS DateTime), N'Calle Dr. Jorge Cash 321')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10996, N'QUICK', CAST(N'1998-04-02T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10997, N'LILAS', CAST(N'1998-04-03T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10998, N'WOLZA', CAST(N'1998-04-03T00:00:00.000' AS DateTime), N'ul. Filtrowa 68')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (10999, N'OTTIK', CAST(N'1998-04-03T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11000, N'RATTC', CAST(N'1998-04-06T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11001, N'FOLKO', CAST(N'1998-04-06T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11002, N'SAVEA', CAST(N'1998-04-06T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11003, N'THECR', CAST(N'1998-04-06T00:00:00.000' AS DateTime), N'55 Grizzly Peak Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11004, N'MAISD', CAST(N'1998-04-07T00:00:00.000' AS DateTime), N'Rue Joseph-Bens 532')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11005, N'WILMK', CAST(N'1998-04-07T00:00:00.000' AS DateTime), N'Keskuskatu 45')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11006, N'GREAL', CAST(N'1998-04-07T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11007, N'PRINI', CAST(N'1998-04-08T00:00:00.000' AS DateTime), N'Estrada da saúde n. 58')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11008, N'ERNSH', CAST(N'1998-04-08T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11009, N'GODOS', CAST(N'1998-04-08T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11010, N'REGGC', CAST(N'1998-04-09T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11011, N'ALFKI', CAST(N'1998-04-09T00:00:00.000' AS DateTime), N'Obere Str. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11012, N'FRANK', CAST(N'1998-04-09T00:00:00.000' AS DateTime), N'Berliner Platz 43')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11013, N'ROMEY', CAST(N'1998-04-09T00:00:00.000' AS DateTime), N'Gran Vía, 1')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11014, N'LINOD', CAST(N'1998-04-10T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11015, N'SANTG', CAST(N'1998-04-10T00:00:00.000' AS DateTime), N'Erling Skakkes gate 78')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11016, N'AROUT', CAST(N'1998-04-10T00:00:00.000' AS DateTime), N'Brook Farm Stratford St. Mary')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11017, N'ERNSH', CAST(N'1998-04-13T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11018, N'LONEP', CAST(N'1998-04-13T00:00:00.000' AS DateTime), N'89 Chiaroscuro Rd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11019, N'RANCH', CAST(N'1998-04-13T00:00:00.000' AS DateTime), N'Av. del Libertador 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11020, N'OTTIK', CAST(N'1998-04-14T00:00:00.000' AS DateTime), N'Mehrheimerstr. 369')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11021, N'QUICK', CAST(N'1998-04-14T00:00:00.000' AS DateTime), N'Taucherstraße 10')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11022, N'HANAR', CAST(N'1998-04-14T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11023, N'BSBEV', CAST(N'1998-04-14T00:00:00.000' AS DateTime), N'Fauntleroy Circus')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11024, N'EASTC', CAST(N'1998-04-15T00:00:00.000' AS DateTime), N'35 King George')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11025, N'WARTH', CAST(N'1998-04-15T00:00:00.000' AS DateTime), N'Torikatu 38')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11026, N'FRANS', CAST(N'1998-04-15T00:00:00.000' AS DateTime), N'Via Monte Bianco 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11027, N'BOTTM', CAST(N'1998-04-16T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11028, N'KOENE', CAST(N'1998-04-16T00:00:00.000' AS DateTime), N'Maubelstr. 90')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11029, N'CHOPS', CAST(N'1998-04-16T00:00:00.000' AS DateTime), N'Hauptstr. 31')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11030, N'SAVEA', CAST(N'1998-04-17T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11031, N'SAVEA', CAST(N'1998-04-17T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11032, N'WHITC', CAST(N'1998-04-17T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11033, N'RICSU', CAST(N'1998-04-17T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11034, N'OLDWO', CAST(N'1998-04-20T00:00:00.000' AS DateTime), N'2743 Bering St.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11035, N'SUPRD', CAST(N'1998-04-20T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11036, N'DRACD', CAST(N'1998-04-20T00:00:00.000' AS DateTime), N'Walserweg 21')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11037, N'GODOS', CAST(N'1998-04-21T00:00:00.000' AS DateTime), N'C/ Romero, 33')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11038, N'SUPRD', CAST(N'1998-04-21T00:00:00.000' AS DateTime), N'Boulevard Tirou, 255')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11039, N'LINOD', CAST(N'1998-04-21T00:00:00.000' AS DateTime), N'Ave. 5 de Mayo Porlamar')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11040, N'GREAL', CAST(N'1998-04-22T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11041, N'CHOPS', CAST(N'1998-04-22T00:00:00.000' AS DateTime), N'Hauptstr. 31')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11042, N'COMMI', CAST(N'1998-04-22T00:00:00.000' AS DateTime), N'Av. dos Lusíadas, 23')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11043, N'SPECD', CAST(N'1998-04-22T00:00:00.000' AS DateTime), N'25, rue Lauriston')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11044, N'WOLZA', CAST(N'1998-04-23T00:00:00.000' AS DateTime), N'ul. Filtrowa 68')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11045, N'BOTTM', CAST(N'1998-04-23T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11046, N'WANDK', CAST(N'1998-04-23T00:00:00.000' AS DateTime), N'Adenauerallee 900')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11047, N'EASTC', CAST(N'1998-04-24T00:00:00.000' AS DateTime), N'35 King George')
GO
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11048, N'BOTTM', CAST(N'1998-04-24T00:00:00.000' AS DateTime), N'23 Tsawassen Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11049, N'GOURL', CAST(N'1998-04-24T00:00:00.000' AS DateTime), N'Av. Brasil, 442')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11050, N'FOLKO', CAST(N'1998-04-27T00:00:00.000' AS DateTime), N'Åkergatan 24')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11051, N'LAMAI', CAST(N'1998-04-27T00:00:00.000' AS DateTime), N'1 rue Alsace-Lorraine')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11052, N'HANAR', CAST(N'1998-04-27T00:00:00.000' AS DateTime), N'Rua do Paço, 67')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11053, N'PICCO', CAST(N'1998-04-27T00:00:00.000' AS DateTime), N'Geislweg 14')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11054, N'CACTU', CAST(N'1998-04-28T00:00:00.000' AS DateTime), N'Cerrito 333')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11055, N'HILAA', CAST(N'1998-04-28T00:00:00.000' AS DateTime), N'Carrera 22 con Ave. Carlos Soublette #8-35')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11056, N'EASTC', CAST(N'1998-04-28T00:00:00.000' AS DateTime), N'35 King George')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11057, N'NORTS', CAST(N'1998-04-29T00:00:00.000' AS DateTime), N'South House 300 Queensbridge')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11058, N'BLAUS', CAST(N'1998-04-29T00:00:00.000' AS DateTime), N'Forsterstr. 57')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11059, N'RICAR', CAST(N'1998-04-29T00:00:00.000' AS DateTime), N'Av. Copacabana, 267')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11060, N'FRANS', CAST(N'1998-04-30T00:00:00.000' AS DateTime), N'Via Monte Bianco 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11061, N'GREAL', CAST(N'1998-04-30T00:00:00.000' AS DateTime), N'2732 Baker Blvd.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11062, N'REGGC', CAST(N'1998-04-30T00:00:00.000' AS DateTime), N'Strada Provinciale 124')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11063, N'HUNGO', CAST(N'1998-04-30T00:00:00.000' AS DateTime), N'8 Johnstown Road')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11064, N'SAVEA', CAST(N'1998-05-01T00:00:00.000' AS DateTime), N'187 Suffolk Ln.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11065, N'LILAS', CAST(N'1998-05-01T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11066, N'WHITC', CAST(N'1998-05-01T00:00:00.000' AS DateTime), N'1029 - 12th Ave. S.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11067, N'DRACD', CAST(N'1998-05-04T00:00:00.000' AS DateTime), N'Walserweg 21')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11068, N'QUEEN', CAST(N'1998-05-04T00:00:00.000' AS DateTime), N'Alameda dos Canàrios, 891')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11069, N'TORTU', CAST(N'1998-05-04T00:00:00.000' AS DateTime), N'Avda. Azteca 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11070, N'LEHMS', CAST(N'1998-05-05T00:00:00.000' AS DateTime), N'Magazinweg 7')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11071, N'LILAS', CAST(N'1998-05-05T00:00:00.000' AS DateTime), N'Carrera 52 con Ave. Bolívar #65-98 Llano Largo')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11072, N'ERNSH', CAST(N'1998-05-05T00:00:00.000' AS DateTime), N'Kirchgasse 6')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11073, N'PERIC', CAST(N'1998-05-05T00:00:00.000' AS DateTime), N'Calle Dr. Jorge Cash 321')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11074, N'SIMOB', CAST(N'1998-05-06T00:00:00.000' AS DateTime), N'Vinbæltet 34')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11075, N'RICSU', CAST(N'1998-05-06T00:00:00.000' AS DateTime), N'Starenweg 5')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11076, N'BONAP', CAST(N'1998-05-06T00:00:00.000' AS DateTime), N'12, rue des Bouchers')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11077, N'RATTC', CAST(N'1998-05-06T00:00:00.000' AS DateTime), N'2817 Milton Dr.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11200, N'admin', CAST(N'2020-08-25T00:00:00.000' AS DateTime), N'Công cha như núi Thái sơn')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11205, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11206, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11207, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11208, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11209, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11210, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'ORDER PURCHASING')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11211, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'ORDER PURCHASING')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11212, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (11213, N'staff', CAST(N'2021-03-11T00:00:00.000' AS DateTime), N'Shipping Address: 123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (21205, N'staff', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (21206, N'admin', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (21207, N'admin', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'ORDER PURCHASING')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (21208, N'admin', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'Công cha như núi thái sơn
Nghĩa mẹ như nước trong nguồn chảy ra')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (21209, N'admin', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (31205, N'staff', CAST(N'2021-03-13T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (31206, N'staff', CAST(N'2021-03-13T00:00:00.000' AS DateTime), N'Mishi Kobe Niku')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (31207, N'admin', CAST(N'2021-03-13T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (41205, N'staff', CAST(N'2021-03-15T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (41206, N'staff', CAST(N'2021-03-15T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (41208, N'staff', CAST(N'2021-03-15T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (51205, N'admin', CAST(N'2021-03-16T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (61205, N'user', CAST(N'2021-03-16T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (71205, N'user', CAST(N'2021-03-16T00:00:00.000' AS DateTime), N'778/B1 Nguyễn Kiệm, F.4 Q.Tân Phú, HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (71206, N'admin', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81206, N'user', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81207, N'user', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81208, N'admin', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'Shipping Address')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81209, N'admin', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81210, N'staff', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81211, N'staff', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (81212, N'staff', CAST(N'2021-03-17T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (91205, N'user', CAST(N'2021-03-22T00:00:00.000' AS DateTime), N'Shipping Address:')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (101205, N'user', CAST(N'2021-03-22T00:00:00.000' AS DateTime), N'2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (111205, N'user', CAST(N'2021-03-23T00:00:00.000' AS DateTime), N'FPT Polytechnic © 2021. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (111206, N'user', CAST(N'2021-03-23T00:00:00.000' AS DateTime), N'FPT Polytechnic © 2021. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121205, N'staff', CAST(N'2021-04-05T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121206, N'staff', CAST(N'2021-04-05T00:00:00.000' AS DateTime), N'© 2021 by FPT Polytechnic. All rights reserved.')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121207, N'admin', CAST(N'2023-08-15T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121208, N'admin', CAST(N'2023-09-28T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121209, N'admin', CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (121210, N'admin', CAST(N'2023-10-13T00:00:00.000' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1043, N'Special Heart', N'nu1.png', 46, CAST(N'1980-03-20' AS Date), 1, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1067, N'Laughing Lumberjack Lager', N'nu2.png', 14, CAST(N'2010-12-05' AS Date), 1, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1070, N'Outback Lager', N'nu3.png', 15, CAST(N'2009-02-21' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1075, N'RhanbrAu Klosterbier', N'nu4.png', 7.75, CAST(N'1982-10-31' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1076, N'Lakkalik AAri', N'nu12.png', 18, CAST(N'1970-07-28' AS Date), 0, N'1000')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1081, N'Chai', N'1081.jpg', 19, CAST(N'1984-04-04' AS Date), 0, N'1000')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (1, N'SP001', N'Áo phông', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Mô t? s?n ph?m SP001', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (2, N'SP002', N'Áo khoác', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Mô t? s?n ph?m SP002', 1)
INSERT [dbo].[SanPham] ([id], [Ma], [Ten], [NgayTao], [MoTa], [TrangThai]) VALUES (3, N'SP003', N'Qu?n jeans', CAST(N'2023-10-19T20:07:34.667' AS DateTime), N'Mô t? s?n ph?m SP003', 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [HoVaTen], [Email], [SoDienThoai], [NgaySinh], [MatKhau], [Anh], [TrangThai]) VALUES (N'user1', N'Ngư?i dùng 1', N'user1@example.com', N'123456789', CAST(N'1990-01-01T00:00:00.000' AS DateTime), N'password1', N'user1.jpg', 1)
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [HoVaTen], [Email], [SoDienThoai], [NgaySinh], [MatKhau], [Anh], [TrangThai]) VALUES (N'user2', N'Ngư?i dùng 2', N'user2@example.com', N'987654321', CAST(N'1995-02-02T00:00:00.000' AS DateTime), N'password2', N'user2.jpg', 1)
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [HoVaTen], [Email], [SoDienThoai], [NgaySinh], [MatKhau], [Anh], [TrangThai]) VALUES (N'user3', N'Ngư?i dùng 3', N'user3@example.com', N'555555555', CAST(N'1985-03-03T00:00:00.000' AS DateTime), N'password3', N'user3.jpg', 1)
GO
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (1, N'TH001', N'Thương hi?u 1', 1)
INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (2, N'TH002', N'Thương hi?u 2', 1)
INSERT [dbo].[ThuongHieu] ([id], [Ma], [Ten], [TrangThai]) VALUES (3, N'TH003', N'Thương hi?u 3', 1)
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Anh__3214CC9E2B2010D0]    Script Date: 10/19/2023 8:11:55 PM ******/
ALTER TABLE [dbo].[Anh] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CoAo__3214CC9E02A2AE0E]    Script Date: 10/19/2023 8:11:55 PM ******/
ALTER TABLE [dbo].[CoAo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ChatLieu__3214CC9E6F9E44F1]    Script Date: 10/19/2023 8:11:55 PM ******/
ALTER TABLE [dbo].[ChatLieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KichCo__3214CC9E203C6FF2]    Script Date: 10/19/2023 8:11:55 PM ******/
ALTER TABLE [dbo].[KichCo] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LoaiKhac__3214CC9E6B098500]    Script Date: 10/19/2023 8:11:55 PM ******/
ALTER TABLE [dbo].[LoaiKhachHang] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__MauSac__3214CC9E47FCF10B]    Script Date: 10/19/2023 8:11:55 PM ******/
ALTER TABLE [dbo].[MauSac] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SanPham__3214CC9E0F3639AE]    Script Date: 10/19/2023 8:11:55 PM ******/
ALTER TABLE [dbo].[SanPham] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ThuongHi__3214CC9E27B13427]    Script Date: 10/19/2023 8:11:55 PM ******/
ALTER TABLE [dbo].[ThuongHieu] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__VaiTro__3214CC9EB1CF3DC5]    Script Date: 10/19/2023 8:11:55 PM ******/
ALTER TABLE [dbo].[VaiTro] ADD UNIQUE NONCLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Photo]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Anh]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([id])
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
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD FOREIGN KEY([MaVaiTro])
REFERENCES [dbo].[VaiTro] ([Ma])
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD FOREIGN KEY([TenDangNhap])
REFERENCES [dbo].[TaiKhoan] ([TenDangNhap])
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
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng Việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chi tiết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày đặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đang kinh doanh ?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Available'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
