/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.2002)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [Canchita]    Script Date: 22/01/2019 10:53:50 ******/
CREATE DATABASE [Canchita]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Canchita', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Canchita.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Canchita_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Canchita_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Canchita] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Canchita].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Canchita] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Canchita] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Canchita] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Canchita] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Canchita] SET ARITHABORT OFF 
GO
ALTER DATABASE [Canchita] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Canchita] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Canchita] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Canchita] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Canchita] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Canchita] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Canchita] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Canchita] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Canchita] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Canchita] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Canchita] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Canchita] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Canchita] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Canchita] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Canchita] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Canchita] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Canchita] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Canchita] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Canchita] SET  MULTI_USER 
GO
ALTER DATABASE [Canchita] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Canchita] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Canchita] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Canchita] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Canchita] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Canchita] SET QUERY_STORE = OFF
GO
USE [Canchita]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Canchita]
GO
/****** Object:  Table [dbo].[T_alquiler]    Script Date: 22/01/2019 10:53:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_alquiler](
	[alqui_id] [uniqueidentifier] NOT NULL,
	[alqui_adelanto] [money] NOT NULL,
	[alqui_cancelado] [money] NOT NULL,
	[alqui_fecha_reserva] [datetime] NOT NULL,
	[alqui_hora_inicio] [time](7) NOT NULL,
	[alqui_hora_fin] [time](7) NOT NULL,
	[alqui_pago_real] [money] NOT NULL,
	[alqui_estado] [varchar](20) NOT NULL,
	[cli_id] [uniqueidentifier] NOT NULL,
	[cancha_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_T_alquiler] PRIMARY KEY CLUSTERED 
(
	[alqui_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_cancha]    Script Date: 22/01/2019 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_cancha](
	[cancha_id] [uniqueidentifier] NOT NULL,
	[cancha_tipo] [varchar](50) NOT NULL,
	[cancha_descripcion] [varchar](50) NOT NULL,
	[local_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_T_cancha] PRIMARY KEY CLUSTERED 
(
	[cancha_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_cliente]    Script Date: 22/01/2019 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_cliente](
	[cli_id] [uniqueidentifier] NOT NULL,
	[cli_nombres] [varchar](50) NOT NULL,
	[cli_apellidos] [varchar](50) NOT NULL,
	[cli_email] [varchar](50) NULL,
	[cli_telefono] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_cliente] PRIMARY KEY CLUSTERED 
(
	[cli_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_departamento]    Script Date: 22/01/2019 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_departamento](
	[dpto_id] [uniqueidentifier] NOT NULL,
	[dto_nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_departamento] PRIMARY KEY CLUSTERED 
(
	[dpto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_distrito]    Script Date: 22/01/2019 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_distrito](
	[dist_id] [uniqueidentifier] NOT NULL,
	[dist_descripcion] [varchar](50) NOT NULL,
	[prov_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_T_distrito] PRIMARY KEY CLUSTERED 
(
	[dist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_imagen]    Script Date: 22/01/2019 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_imagen](
	[ima_id] [uniqueidentifier] NOT NULL,
	[ima_url] [varchar](100) NOT NULL,
	[cancha_id] [uniqueidentifier] NOT NULL,
	[local_id] [uniqueidentifier] NOT NULL,
	[loc_serv_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_T_imagen] PRIMARY KEY CLUSTERED 
(
	[ima_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_local]    Script Date: 22/01/2019 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_local](
	[local_id] [uniqueidentifier] NOT NULL,
	[local_descripcion] [varchar](max) NOT NULL,
	[local_nombre] [varchar](50) NOT NULL,
	[local_direccion] [varchar](50) NOT NULL,
	[local_hora_apertura] [time](7) NOT NULL,
	[local_hora_cierre] [time](7) NOT NULL,
	[local_telefono] [varchar](20) NOT NULL,
	[local_latitud] [varchar](20) NOT NULL,
	[local_longitud] [varchar](20) NOT NULL,
	[local_dist] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_T_local] PRIMARY KEY CLUSTERED 
(
	[local_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_local_servicio]    Script Date: 22/01/2019 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_local_servicio](
	[loc_serv_id] [uniqueidentifier] NOT NULL,
	[local_id] [uniqueidentifier] NOT NULL,
	[serv_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_T_local_servicio] PRIMARY KEY CLUSTERED 
(
	[loc_serv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_precio]    Script Date: 22/01/2019 10:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_precio](
	[prec_id] [uniqueidentifier] NOT NULL,
	[prec_monto] [money] NOT NULL,
	[cancha_id] [uniqueidentifier] NOT NULL,
	[turno_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_T_precio] PRIMARY KEY CLUSTERED 
(
	[prec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_provincia]    Script Date: 22/01/2019 10:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_provincia](
	[prov_id] [uniqueidentifier] NOT NULL,
	[prov_nombre] [varchar](50) NOT NULL,
	[dto_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_T_provincia] PRIMARY KEY CLUSTERED 
(
	[prov_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_servicio]    Script Date: 22/01/2019 10:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_servicio](
	[serv_id] [uniqueidentifier] NOT NULL,
	[serv_nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_T_servicio] PRIMARY KEY CLUSTERED 
(
	[serv_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_turno]    Script Date: 22/01/2019 10:53:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_turno](
	[turno_id] [uniqueidentifier] NOT NULL,
	[turno_descripcion] [varchar](50) NOT NULL,
	[turno_horario_inicio] [time](7) NOT NULL,
	[turno_horario_fin] [time](7) NOT NULL,
 CONSTRAINT [PK_T_turno] PRIMARY KEY CLUSTERED 
(
	[turno_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_alquiler]  WITH CHECK ADD  CONSTRAINT [FK_T_alquiler_T_cancha] FOREIGN KEY([cancha_id])
REFERENCES [dbo].[T_cancha] ([cancha_id])
GO
ALTER TABLE [dbo].[T_alquiler] CHECK CONSTRAINT [FK_T_alquiler_T_cancha]
GO
ALTER TABLE [dbo].[T_alquiler]  WITH CHECK ADD  CONSTRAINT [FK_T_alquiler_T_cliente] FOREIGN KEY([cli_id])
REFERENCES [dbo].[T_cliente] ([cli_id])
GO
ALTER TABLE [dbo].[T_alquiler] CHECK CONSTRAINT [FK_T_alquiler_T_cliente]
GO
ALTER TABLE [dbo].[T_cancha]  WITH CHECK ADD  CONSTRAINT [FK_T_cancha_T_local] FOREIGN KEY([local_id])
REFERENCES [dbo].[T_local] ([local_id])
GO
ALTER TABLE [dbo].[T_cancha] CHECK CONSTRAINT [FK_T_cancha_T_local]
GO
ALTER TABLE [dbo].[T_distrito]  WITH CHECK ADD  CONSTRAINT [FK_T_distrito_T_provincia] FOREIGN KEY([prov_id])
REFERENCES [dbo].[T_provincia] ([prov_id])
GO
ALTER TABLE [dbo].[T_distrito] CHECK CONSTRAINT [FK_T_distrito_T_provincia]
GO
ALTER TABLE [dbo].[T_imagen]  WITH CHECK ADD  CONSTRAINT [FK_T_imagen_T_cancha] FOREIGN KEY([cancha_id])
REFERENCES [dbo].[T_cancha] ([cancha_id])
GO
ALTER TABLE [dbo].[T_imagen] CHECK CONSTRAINT [FK_T_imagen_T_cancha]
GO
ALTER TABLE [dbo].[T_imagen]  WITH CHECK ADD  CONSTRAINT [FK_T_imagen_T_local] FOREIGN KEY([local_id])
REFERENCES [dbo].[T_local] ([local_id])
GO
ALTER TABLE [dbo].[T_imagen] CHECK CONSTRAINT [FK_T_imagen_T_local]
GO
ALTER TABLE [dbo].[T_imagen]  WITH CHECK ADD  CONSTRAINT [FK_T_imagen_T_local_servicio] FOREIGN KEY([loc_serv_id])
REFERENCES [dbo].[T_local_servicio] ([loc_serv_id])
GO
ALTER TABLE [dbo].[T_imagen] CHECK CONSTRAINT [FK_T_imagen_T_local_servicio]
GO
ALTER TABLE [dbo].[T_local]  WITH CHECK ADD  CONSTRAINT [FK_T_local_T_distrito] FOREIGN KEY([local_dist])
REFERENCES [dbo].[T_distrito] ([dist_id])
GO
ALTER TABLE [dbo].[T_local] CHECK CONSTRAINT [FK_T_local_T_distrito]
GO
ALTER TABLE [dbo].[T_local_servicio]  WITH CHECK ADD  CONSTRAINT [FK_T_local_servicio_T_local] FOREIGN KEY([local_id])
REFERENCES [dbo].[T_local] ([local_id])
GO
ALTER TABLE [dbo].[T_local_servicio] CHECK CONSTRAINT [FK_T_local_servicio_T_local]
GO
ALTER TABLE [dbo].[T_local_servicio]  WITH CHECK ADD  CONSTRAINT [FK_T_local_servicio_T_servicio] FOREIGN KEY([serv_id])
REFERENCES [dbo].[T_servicio] ([serv_id])
GO
ALTER TABLE [dbo].[T_local_servicio] CHECK CONSTRAINT [FK_T_local_servicio_T_servicio]
GO
ALTER TABLE [dbo].[T_precio]  WITH CHECK ADD  CONSTRAINT [FK_T_precio_T_cancha] FOREIGN KEY([cancha_id])
REFERENCES [dbo].[T_cancha] ([cancha_id])
GO
ALTER TABLE [dbo].[T_precio] CHECK CONSTRAINT [FK_T_precio_T_cancha]
GO
ALTER TABLE [dbo].[T_precio]  WITH CHECK ADD  CONSTRAINT [FK_T_precio_T_turno] FOREIGN KEY([turno_id])
REFERENCES [dbo].[T_turno] ([turno_id])
GO
ALTER TABLE [dbo].[T_precio] CHECK CONSTRAINT [FK_T_precio_T_turno]
GO
ALTER TABLE [dbo].[T_provincia]  WITH CHECK ADD  CONSTRAINT [FK_T_provincia_T_departamento] FOREIGN KEY([dto_id])
REFERENCES [dbo].[T_departamento] ([dpto_id])
GO
ALTER TABLE [dbo].[T_provincia] CHECK CONSTRAINT [FK_T_provincia_T_departamento]
GO
USE [master]
GO
ALTER DATABASE [Canchita] SET  READ_WRITE 
GO
