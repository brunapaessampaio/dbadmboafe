USE [master]
GO
/****** Object:  Database [DBADMBOAFE]    Script Date: 21/11/2023 10:50:36 ******/
CREATE DATABASE [DBADMBOAFE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBADMBOAFE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DBADMBOAFE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBADMBOAFE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DBADMBOAFE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBADMBOAFE] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBADMBOAFE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBADMBOAFE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBADMBOAFE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBADMBOAFE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBADMBOAFE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBADMBOAFE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBADMBOAFE] SET  MULTI_USER 
GO
ALTER DATABASE [DBADMBOAFE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBADMBOAFE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBADMBOAFE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBADMBOAFE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBADMBOAFE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBADMBOAFE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBADMBOAFE] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBADMBOAFE] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBADMBOAFE]
GO
/****** Object:  Table [dbo].[BLOCO]    Script Date: 21/11/2023 10:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BLOCO](
	[ID_BLOCO] [int] NOT NULL,
	[NOME_BLOCO] [nvarchar](50) NULL,
	[ID_CONDOMINIO] [int] NULL,
 CONSTRAINT [PK_BLOCO] PRIMARY KEY CLUSTERED 
(
	[ID_BLOCO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONDOMINIO]    Script Date: 21/11/2023 10:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONDOMINIO](
	[ID_CONDOMINIO] [int] NOT NULL,
	[NOME_CONDOMINIO] [nvarchar](50) NULL,
	[LOGRADOURO] [nvarchar](50) NULL,
	[NUMERO] [int] NULL,
	[COMPLEMENTO] [nvarchar](50) NULL,
	[BAIRRO] [nvarchar](100) NULL,
	[CIDADE] [nvarchar](100) NULL,
	[UF] [nvarchar](2) NULL,
	[CEP] [nvarchar](8) NULL,
 CONSTRAINT [PK_CONDOMINIO] PRIMARY KEY CLUSTERED 
(
	[ID_CONDOMINIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCACAO]    Script Date: 21/11/2023 10:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCACAO](
	[ID_LOCACAO] [int] NOT NULL,
	[ID_UNIDADE_CONDOMINAL] [int] NULL,
	[ID_LOCATARIO] [int] NULL,
	[VALOR_ALUGUEL] [numeric](18, 2) NULL,
	[TAXA_CONDOMINIO] [numeric](18, 2) NULL,
	[TAXA_IPTU] [numeric](18, 2) NULL,
	[DATA_INICIO_LOCACAO] [date] NULL,
	[DATA_FIM_LOCACAO] [date] NULL,
 CONSTRAINT [PK_LOCACAO] PRIMARY KEY CLUSTERED 
(
	[ID_LOCACAO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCATARIO]    Script Date: 21/11/2023 10:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCATARIO](
	[ID_LOCATARIO] [int] NOT NULL,
	[NOME] [nvarchar](200) NULL,
	[DATA_NASC] [date] NULL,
	[CPF] [nvarchar](11) NULL,
	[RG] [nvarchar](20) NULL,
	[TELEFONE] [nchar](20) NULL,
	[EMAIL] [nvarchar](50) NULL,
 CONSTRAINT [PK_LOCATARIO] PRIMARY KEY CLUSTERED 
(
	[ID_LOCATARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MANUTENCAO]    Script Date: 21/11/2023 10:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MANUTENCAO](
	[ID_MANUTENCAO] [int] NOT NULL,
	[ID_UNIDADE_CONDOMINIAL] [int] NULL,
	[DESCRICAO] [nvarchar](max) NULL,
	[TAXA_MANUTENCAO] [numeric](18, 2) NULL,
	[DATA_MANUTENCAO] [date] NULL,
	[EXECUTADA] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROPRIETARIO]    Script Date: 21/11/2023 10:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROPRIETARIO](
	[ID_PROPRIETARIO] [int] NOT NULL,
	[NOME] [nvarchar](200) NULL,
	[DATA_NASC] [date] NULL,
	[CPF] [nvarchar](11) NOT NULL,
	[RG] [nvarchar](20) NULL,
	[TELEFONE] [nvarchar](20) NULL,
	[EMAIL] [nvarchar](50) NULL,
 CONSTRAINT [PK_PROPRIETARIO] PRIMARY KEY CLUSTERED 
(
	[ID_PROPRIETARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UNIDADE_CONDOMINIAL]    Script Date: 21/11/2023 10:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UNIDADE_CONDOMINIAL](
	[ID_UNIDADE] [int] NOT NULL,
	[ID_BLOCO] [int] NULL,
	[ANDAR] [int] NULL,
	[NUM_APARTAMENTO] [int] NULL,
	[DESCRICAO] [nvarchar](max) NULL,
 CONSTRAINT [PK_UNIDADE_CONDOMINAL] PRIMARY KEY CLUSTERED 
(
	[ID_UNIDADE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UNIDADE_PROPRIETARIO]    Script Date: 21/11/2023 10:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UNIDADE_PROPRIETARIO](
	[ID_UNIDADE] [int] NULL,
	[ID_PROPRIETARIO] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MANUTENCAO] ADD  CONSTRAINT [DF_MANUTENCAO_EXECUTADA]  DEFAULT ((0)) FOR [EXECUTADA]
GO
ALTER TABLE [dbo].[BLOCO]  WITH CHECK ADD  CONSTRAINT [FK_BLOCO_CONDOMINIO1] FOREIGN KEY([ID_CONDOMINIO])
REFERENCES [dbo].[CONDOMINIO] ([ID_CONDOMINIO])
GO
ALTER TABLE [dbo].[BLOCO] CHECK CONSTRAINT [FK_BLOCO_CONDOMINIO1]
GO
ALTER TABLE [dbo].[LOCACAO]  WITH CHECK ADD  CONSTRAINT [FK_LOCACAO_LOCATARIO] FOREIGN KEY([ID_LOCATARIO])
REFERENCES [dbo].[LOCATARIO] ([ID_LOCATARIO])
GO
ALTER TABLE [dbo].[LOCACAO] CHECK CONSTRAINT [FK_LOCACAO_LOCATARIO]
GO
ALTER TABLE [dbo].[LOCACAO]  WITH CHECK ADD  CONSTRAINT [FK_LOCACAO_UNIDADE_CONDOMINAL] FOREIGN KEY([ID_UNIDADE_CONDOMINAL])
REFERENCES [dbo].[UNIDADE_CONDOMINIAL] ([ID_UNIDADE])
GO
ALTER TABLE [dbo].[LOCACAO] CHECK CONSTRAINT [FK_LOCACAO_UNIDADE_CONDOMINAL]
GO
ALTER TABLE [dbo].[UNIDADE_PROPRIETARIO]  WITH CHECK ADD  CONSTRAINT [FK_UNIDADE_PROPRIETARIO_PROPRIETARIO] FOREIGN KEY([ID_PROPRIETARIO])
REFERENCES [dbo].[PROPRIETARIO] ([ID_PROPRIETARIO])
GO
ALTER TABLE [dbo].[UNIDADE_PROPRIETARIO] CHECK CONSTRAINT [FK_UNIDADE_PROPRIETARIO_PROPRIETARIO]
GO
ALTER TABLE [dbo].[UNIDADE_PROPRIETARIO]  WITH CHECK ADD  CONSTRAINT [FK_UNIDADE_PROPRIETARIO_UNIDADE_CONDOMINAL] FOREIGN KEY([ID_UNIDADE])
REFERENCES [dbo].[UNIDADE_CONDOMINIAL] ([ID_UNIDADE])
GO
ALTER TABLE [dbo].[UNIDADE_PROPRIETARIO] CHECK CONSTRAINT [FK_UNIDADE_PROPRIETARIO_UNIDADE_CONDOMINAL]
GO
USE [master]
GO
ALTER DATABASE [DBADMBOAFE] SET  READ_WRITE 
GO
