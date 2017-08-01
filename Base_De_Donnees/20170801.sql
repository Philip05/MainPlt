USE [master]
GO
/****** Object:  Database [MainPltDataBase]    Script Date: 2017-08-01 16:17:32 ******/
CREATE DATABASE [MainPltDataBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MainPltDataBase', FILENAME = N'C:\Users\Client\MainPltDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MainPltDataBase_log', FILENAME = N'C:\Users\Client\MainPltDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MainPltDataBase] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MainPltDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MainPltDataBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MainPltDataBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MainPltDataBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MainPltDataBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MainPltDataBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [MainPltDataBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MainPltDataBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MainPltDataBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MainPltDataBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MainPltDataBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MainPltDataBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MainPltDataBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MainPltDataBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MainPltDataBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MainPltDataBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MainPltDataBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MainPltDataBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MainPltDataBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MainPltDataBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MainPltDataBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MainPltDataBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MainPltDataBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MainPltDataBase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MainPltDataBase] SET  MULTI_USER 
GO
ALTER DATABASE [MainPltDataBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MainPltDataBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MainPltDataBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MainPltDataBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MainPltDataBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MainPltDataBase] SET QUERY_STORE = OFF
GO
USE [MainPltDataBase]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MainPltDataBase]
GO
/****** Object:  Table [dbo].[ElementProcedures]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElementProcedures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Elements_Id] [int] NOT NULL,
	[Procedure_Id] [int] NOT NULL,
 CONSTRAINT [PK_ElementProcedures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Elements]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Elements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomElement] [nvarchar](100) NOT NULL,
	[NumeroElement] [nvarchar](100) NOT NULL,
	[TypeEmplacements_Id] [int] NOT NULL,
	[TypesElement_Id] [int] NOT NULL,
	[DescriptionElement] [nvarchar](max) NOT NULL,
	[NumeroSerieElement] [nvarchar](50) NOT NULL,
	[AnneeElement] [int] NOT NULL,
 CONSTRAINT [PK_Elements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entretiens]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entretiens](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TitreEntretien] [nvarchar](150) NOT NULL,
	[Recurrence] [int] NOT NULL,
	[DescriptionEntretien] [nvarchar](max) NOT NULL,
	[DateProchainEntretien] [datetime] NOT NULL,
	[Element_Id] [int] NOT NULL,
 CONSTRAINT [PK_Entretiens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EntretiensPrecedants]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntretiensPrecedants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomEmploye] [nvarchar](100) NOT NULL,
	[PrenomEmploye] [nvarchar](100) NOT NULL,
	[DateEntretienPrecedant] [datetime] NOT NULL,
	[DescriptionEntretienPrecedant] [nvarchar](max) NOT NULL,
	[Entretien_Id] [int] NOT NULL,
	[Elements_Id] [int] NOT NULL,
 CONSTRAINT [PK_EntretiensPrecedants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EntretiensProduits]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntretiensProduits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuantiteProduitEntretien] [float] NOT NULL,
	[Entretien_Id] [int] NOT NULL,
	[Produit_Id] [int] NOT NULL,
 CONSTRAINT [PK_EntretiensProduits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Commentaires] [varchar](max) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK__Messages__3214EC07F5FA2148] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotosElements]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotosElements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SourcePhotoElement] [nvarchar](500) NOT NULL,
	[Elements_Id] [int] NOT NULL,
 CONSTRAINT [PK_PhotosElements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotosProduits]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotosProduits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SourcePhotoProduit] [nvarchar](500) NOT NULL,
	[Produit_Id] [int] NOT NULL,
 CONSTRAINT [PK_PhotosProduits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhotosRemarques]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotosRemarques](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SourcePhotoRemarque] [nvarchar](500) NOT NULL,
	[Remarque_Id] [int] NOT NULL,
 CONSTRAINT [PK_PhotosRemarques] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Procedures]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procedures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SourceProcedure] [nvarchar](500) NOT NULL,
	[NomProcedure] [nvarchar](100) NOT NULL,
	[DescriptionProcedure] [nvarchar](200) NOT NULL,
	[TypeEmplacement_Id] [int] NOT NULL,
	[TypesMachines_Id] [int] NOT NULL,
 CONSTRAINT [PK_Procedures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Produits]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomProduit] [nvarchar](100) NOT NULL,
	[DescriptionProduit] [nvarchar](max) NOT NULL,
	[TypesProduit_Id] [int] NOT NULL,
 CONSTRAINT [PK_Produits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Remarques]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Remarques](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TitreRemarque] [nvarchar](150) NOT NULL,
	[DescriptionRemarque] [nvarchar](max) NOT NULL,
	[EntretiensPrecedant_Id] [int] NOT NULL,
	[Entretiens_Id] [int] NOT NULL,
	[Elements_Id] [int] NOT NULL,
 CONSTRAINT [PK_Remarques] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[Id] [int] NOT NULL,
	[Commentaires] [varchar](max) NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeEmplacementSet]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeEmplacementSet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomTypeEmplacement] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TypeEmplacementSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypesElements]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesElements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomTypeElement] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TypesElements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypesProduits]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesProduits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NomTypeProduit] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_TypesProduits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usagers]    Script Date: 2017-08-01 16:17:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usagers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](100) NOT NULL,
	[Prenom] [nvarchar](100) NOT NULL,
	[DateInscription] [datetime] NOT NULL,
	[MotDePasse] [nvarchar](200) NOT NULL,
	[Administrateur] [bit] NOT NULL,
	[UserGuid] [uniqueidentifier] NULL,
	[Hash] [nvarchar](max) NULL,
 CONSTRAINT [PK_Usagers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_FK_ElementProcedureElement]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ElementProcedureElement] ON [dbo].[ElementProcedures]
(
	[Elements_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProcedureElementProcedure]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProcedureElementProcedure] ON [dbo].[ElementProcedures]
(
	[Procedure_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ElementTypeEmplacement]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ElementTypeEmplacement] ON [dbo].[Elements]
(
	[TypeEmplacements_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TypesElementElement]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_TypesElementElement] ON [dbo].[Elements]
(
	[TypesElement_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ElementEntretien]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ElementEntretien] ON [dbo].[Entretiens]
(
	[Element_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EntretienEntretiensPrecedant]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_EntretienEntretiensPrecedant] ON [dbo].[EntretiensPrecedants]
(
	[Entretien_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EntretiensPrecedantElement]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_EntretiensPrecedantElement] ON [dbo].[EntretiensPrecedants]
(
	[Elements_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EntretienEntretiensProduit]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_EntretienEntretiensProduit] ON [dbo].[EntretiensProduits]
(
	[Entretien_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProduitEntretiensProduit]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProduitEntretiensProduit] ON [dbo].[EntretiensProduits]
(
	[Produit_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PhotosElementElement]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_PhotosElementElement] ON [dbo].[PhotosElements]
(
	[Elements_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProduitPhotosProduit]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProduitPhotosProduit] ON [dbo].[PhotosProduits]
(
	[Produit_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RemarquePhotosRemarque]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_RemarquePhotosRemarque] ON [dbo].[PhotosRemarques]
(
	[Remarque_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProcedureTypeEmplacement]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProcedureTypeEmplacement] ON [dbo].[Procedures]
(
	[TypeEmplacement_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_ProcedureTypesMachine]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_ProcedureTypesMachine] ON [dbo].[Procedures]
(
	[TypesMachines_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_TypesProduitProduit]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_TypesProduitProduit] ON [dbo].[Produits]
(
	[TypesProduit_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_EntretiensPrecedantRemarque]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_EntretiensPrecedantRemarque] ON [dbo].[Remarques]
(
	[EntretiensPrecedant_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RemarqueElement]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_RemarqueElement] ON [dbo].[Remarques]
(
	[Elements_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_RemarqueEntretien]    Script Date: 2017-08-01 16:17:32 ******/
CREATE NONCLUSTERED INDEX [IX_FK_RemarqueEntretien] ON [dbo].[Remarques]
(
	[Entretiens_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ElementProcedures]  WITH CHECK ADD  CONSTRAINT [FK_ElementProcedureElement] FOREIGN KEY([Elements_Id])
REFERENCES [dbo].[Elements] ([Id])
GO
ALTER TABLE [dbo].[ElementProcedures] CHECK CONSTRAINT [FK_ElementProcedureElement]
GO
ALTER TABLE [dbo].[ElementProcedures]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureElementProcedure] FOREIGN KEY([Procedure_Id])
REFERENCES [dbo].[Procedures] ([Id])
GO
ALTER TABLE [dbo].[ElementProcedures] CHECK CONSTRAINT [FK_ProcedureElementProcedure]
GO
ALTER TABLE [dbo].[Elements]  WITH CHECK ADD  CONSTRAINT [FK_ElementTypeEmplacement] FOREIGN KEY([TypeEmplacements_Id])
REFERENCES [dbo].[TypeEmplacementSet] ([Id])
GO
ALTER TABLE [dbo].[Elements] CHECK CONSTRAINT [FK_ElementTypeEmplacement]
GO
ALTER TABLE [dbo].[Elements]  WITH CHECK ADD  CONSTRAINT [FK_TypesElementElement] FOREIGN KEY([TypesElement_Id])
REFERENCES [dbo].[TypesElements] ([Id])
GO
ALTER TABLE [dbo].[Elements] CHECK CONSTRAINT [FK_TypesElementElement]
GO
ALTER TABLE [dbo].[Entretiens]  WITH CHECK ADD  CONSTRAINT [FK_ElementEntretien] FOREIGN KEY([Element_Id])
REFERENCES [dbo].[Elements] ([Id])
GO
ALTER TABLE [dbo].[Entretiens] CHECK CONSTRAINT [FK_ElementEntretien]
GO
ALTER TABLE [dbo].[EntretiensPrecedants]  WITH CHECK ADD  CONSTRAINT [FK_EntretienEntretiensPrecedant] FOREIGN KEY([Entretien_Id])
REFERENCES [dbo].[Entretiens] ([Id])
GO
ALTER TABLE [dbo].[EntretiensPrecedants] CHECK CONSTRAINT [FK_EntretienEntretiensPrecedant]
GO
ALTER TABLE [dbo].[EntretiensPrecedants]  WITH CHECK ADD  CONSTRAINT [FK_EntretiensPrecedantElement] FOREIGN KEY([Elements_Id])
REFERENCES [dbo].[Elements] ([Id])
GO
ALTER TABLE [dbo].[EntretiensPrecedants] CHECK CONSTRAINT [FK_EntretiensPrecedantElement]
GO
ALTER TABLE [dbo].[EntretiensProduits]  WITH CHECK ADD  CONSTRAINT [FK_EntretienEntretiensProduit] FOREIGN KEY([Entretien_Id])
REFERENCES [dbo].[Entretiens] ([Id])
GO
ALTER TABLE [dbo].[EntretiensProduits] CHECK CONSTRAINT [FK_EntretienEntretiensProduit]
GO
ALTER TABLE [dbo].[EntretiensProduits]  WITH CHECK ADD  CONSTRAINT [FK_ProduitEntretiensProduit] FOREIGN KEY([Produit_Id])
REFERENCES [dbo].[Produits] ([Id])
GO
ALTER TABLE [dbo].[EntretiensProduits] CHECK CONSTRAINT [FK_ProduitEntretiensProduit]
GO
ALTER TABLE [dbo].[PhotosElements]  WITH CHECK ADD  CONSTRAINT [FK_PhotosElementElement] FOREIGN KEY([Elements_Id])
REFERENCES [dbo].[Elements] ([Id])
GO
ALTER TABLE [dbo].[PhotosElements] CHECK CONSTRAINT [FK_PhotosElementElement]
GO
ALTER TABLE [dbo].[PhotosProduits]  WITH CHECK ADD  CONSTRAINT [FK_ProduitPhotosProduit] FOREIGN KEY([Produit_Id])
REFERENCES [dbo].[Produits] ([Id])
GO
ALTER TABLE [dbo].[PhotosProduits] CHECK CONSTRAINT [FK_ProduitPhotosProduit]
GO
ALTER TABLE [dbo].[PhotosRemarques]  WITH CHECK ADD  CONSTRAINT [FK_RemarquePhotosRemarque] FOREIGN KEY([Remarque_Id])
REFERENCES [dbo].[Remarques] ([Id])
GO
ALTER TABLE [dbo].[PhotosRemarques] CHECK CONSTRAINT [FK_RemarquePhotosRemarque]
GO
ALTER TABLE [dbo].[Procedures]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureTypeEmplacement] FOREIGN KEY([TypeEmplacement_Id])
REFERENCES [dbo].[TypeEmplacementSet] ([Id])
GO
ALTER TABLE [dbo].[Procedures] CHECK CONSTRAINT [FK_ProcedureTypeEmplacement]
GO
ALTER TABLE [dbo].[Procedures]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureTypesMachine] FOREIGN KEY([TypesMachines_Id])
REFERENCES [dbo].[TypesElements] ([Id])
GO
ALTER TABLE [dbo].[Procedures] CHECK CONSTRAINT [FK_ProcedureTypesMachine]
GO
ALTER TABLE [dbo].[Produits]  WITH CHECK ADD  CONSTRAINT [FK_TypesProduitProduit] FOREIGN KEY([TypesProduit_Id])
REFERENCES [dbo].[TypesProduits] ([Id])
GO
ALTER TABLE [dbo].[Produits] CHECK CONSTRAINT [FK_TypesProduitProduit]
GO
ALTER TABLE [dbo].[Remarques]  WITH CHECK ADD  CONSTRAINT [FK_EntretiensPrecedantRemarque] FOREIGN KEY([EntretiensPrecedant_Id])
REFERENCES [dbo].[EntretiensPrecedants] ([Id])
GO
ALTER TABLE [dbo].[Remarques] CHECK CONSTRAINT [FK_EntretiensPrecedantRemarque]
GO
ALTER TABLE [dbo].[Remarques]  WITH CHECK ADD  CONSTRAINT [FK_RemarqueElement] FOREIGN KEY([Elements_Id])
REFERENCES [dbo].[Elements] ([Id])
GO
ALTER TABLE [dbo].[Remarques] CHECK CONSTRAINT [FK_RemarqueElement]
GO
ALTER TABLE [dbo].[Remarques]  WITH CHECK ADD  CONSTRAINT [FK_RemarqueEntretien] FOREIGN KEY([Entretiens_Id])
REFERENCES [dbo].[Entretiens] ([Id])
GO
ALTER TABLE [dbo].[Remarques] CHECK CONSTRAINT [FK_RemarqueEntretien]
GO
USE [master]
GO
ALTER DATABASE [MainPltDataBase] SET  READ_WRITE 
GO
