
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/02/2017 21:20:05
-- Generated from EDMX file: C:\Users\Client\Google Drive\Autres\Informatique\MainPlt\MainPlt\App_Code\MainPltModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MainPltDataBase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ProcedureTypeEmplacement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Procedures] DROP CONSTRAINT [FK_ProcedureTypeEmplacement];
GO
IF OBJECT_ID(N'[dbo].[FK_ElementTypeEmplacement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Elements] DROP CONSTRAINT [FK_ElementTypeEmplacement];
GO
IF OBJECT_ID(N'[dbo].[FK_ElementProcedureElement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ElementProcedures] DROP CONSTRAINT [FK_ElementProcedureElement];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedureElementProcedure]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ElementProcedures] DROP CONSTRAINT [FK_ProcedureElementProcedure];
GO
IF OBJECT_ID(N'[dbo].[FK_ProcedureTypesMachine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TypesElements] DROP CONSTRAINT [FK_ProcedureTypesMachine];
GO
IF OBJECT_ID(N'[dbo].[FK_PhotosElementElement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PhotosElements] DROP CONSTRAINT [FK_PhotosElementElement];
GO
IF OBJECT_ID(N'[dbo].[FK_ElementEntretien]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Entretiens] DROP CONSTRAINT [FK_ElementEntretien];
GO
IF OBJECT_ID(N'[dbo].[FK_EntretienEntretiensProduit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EntretiensProduits] DROP CONSTRAINT [FK_EntretienEntretiensProduit];
GO
IF OBJECT_ID(N'[dbo].[FK_EntretienEntretiensPrecedant]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EntretiensPrecedants] DROP CONSTRAINT [FK_EntretienEntretiensPrecedant];
GO
IF OBJECT_ID(N'[dbo].[FK_EntretiensPrecedantRemarque]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Remarques] DROP CONSTRAINT [FK_EntretiensPrecedantRemarque];
GO
IF OBJECT_ID(N'[dbo].[FK_RemarquePhotosRemarque]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PhotosRemarques] DROP CONSTRAINT [FK_RemarquePhotosRemarque];
GO
IF OBJECT_ID(N'[dbo].[FK_ProduitEntretiensProduit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EntretiensProduits] DROP CONSTRAINT [FK_ProduitEntretiensProduit];
GO
IF OBJECT_ID(N'[dbo].[FK_TypesProduitProduit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Produits] DROP CONSTRAINT [FK_TypesProduitProduit];
GO
IF OBJECT_ID(N'[dbo].[FK_ProduitPhotosProduit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PhotosProduits] DROP CONSTRAINT [FK_ProduitPhotosProduit];
GO
IF OBJECT_ID(N'[dbo].[FK_TypesElementElement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Elements] DROP CONSTRAINT [FK_TypesElementElement];
GO
IF OBJECT_ID(N'[dbo].[FK_RemarqueEntretien]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Remarques] DROP CONSTRAINT [FK_RemarqueEntretien];
GO
IF OBJECT_ID(N'[dbo].[FK_PhotosRemarqueEntretien]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PhotosRemarques] DROP CONSTRAINT [FK_PhotosRemarqueEntretien];
GO
IF OBJECT_ID(N'[dbo].[FK_PhotosRemarquePhotosRemarque]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PhotosRemarques] DROP CONSTRAINT [FK_PhotosRemarquePhotosRemarque];
GO
IF OBJECT_ID(N'[dbo].[FK_PhotosRemarqueElement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PhotosRemarques] DROP CONSTRAINT [FK_PhotosRemarqueElement];
GO
IF OBJECT_ID(N'[dbo].[FK_RemarqueElement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Remarques] DROP CONSTRAINT [FK_RemarqueElement];
GO
IF OBJECT_ID(N'[dbo].[FK_EntretiensPrecedantElement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EntretiensPrecedants] DROP CONSTRAINT [FK_EntretiensPrecedantElement];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Usagers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usagers];
GO
IF OBJECT_ID(N'[dbo].[Elements]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Elements];
GO
IF OBJECT_ID(N'[dbo].[Entretiens]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Entretiens];
GO
IF OBJECT_ID(N'[dbo].[EntretiensProduits]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EntretiensProduits];
GO
IF OBJECT_ID(N'[dbo].[Produits]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Produits];
GO
IF OBJECT_ID(N'[dbo].[PhotosElements]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PhotosElements];
GO
IF OBJECT_ID(N'[dbo].[TypesElements]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TypesElements];
GO
IF OBJECT_ID(N'[dbo].[Procedures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Procedures];
GO
IF OBJECT_ID(N'[dbo].[EntretiensPrecedants]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EntretiensPrecedants];
GO
IF OBJECT_ID(N'[dbo].[PhotosProduits]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PhotosProduits];
GO
IF OBJECT_ID(N'[dbo].[Remarques]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Remarques];
GO
IF OBJECT_ID(N'[dbo].[TypesProduits]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TypesProduits];
GO
IF OBJECT_ID(N'[dbo].[PhotosRemarques]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PhotosRemarques];
GO
IF OBJECT_ID(N'[dbo].[ElementProcedures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ElementProcedures];
GO
IF OBJECT_ID(N'[dbo].[TypeEmplacementSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TypeEmplacementSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Usagers'
CREATE TABLE [dbo].[Usagers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(100)  NOT NULL,
    [Prenom] nvarchar(100)  NOT NULL,
    [DateInscription] datetime  NOT NULL,
    [MotDePasse] nvarchar(20)  NOT NULL,
    [Administrateur] bit  NOT NULL
);
GO

-- Creating table 'Elements'
CREATE TABLE [dbo].[Elements] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(100)  NOT NULL,
    [Numero] nvarchar(100)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [TypeEmplacements_Id] int  NOT NULL,
    [TypesElement_Id] int  NOT NULL
);
GO

-- Creating table 'Entretiens'
CREATE TABLE [dbo].[Entretiens] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Titre] nvarchar(150)  NOT NULL,
    [Recurrence] int  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [DateProchainEntretien] datetime  NOT NULL,
    [Element_Id] int  NOT NULL
);
GO

-- Creating table 'EntretiensProduits'
CREATE TABLE [dbo].[EntretiensProduits] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Quantite] float  NOT NULL,
    [Entretien_Id] int  NOT NULL,
    [Produit_Id] int  NOT NULL
);
GO

-- Creating table 'Produits'
CREATE TABLE [dbo].[Produits] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(100)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [TypesProduit_Id] int  NOT NULL
);
GO

-- Creating table 'PhotosElements'
CREATE TABLE [dbo].[PhotosElements] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Source] nvarchar(500)  NOT NULL,
    [Elements_Id] int  NOT NULL
);
GO

-- Creating table 'TypesElements'
CREATE TABLE [dbo].[TypesElements] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Procedures'
CREATE TABLE [dbo].[Procedures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Source] nvarchar(500)  NOT NULL,
    [Nom] nvarchar(100)  NOT NULL,
    [Description] nvarchar(200)  NOT NULL,
    [TypeEmplacement_Id] int  NOT NULL,
    [TypesMachines_Id] int  NOT NULL
);
GO

-- Creating table 'EntretiensPrecedants'
CREATE TABLE [dbo].[EntretiensPrecedants] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NomEmploye] nvarchar(100)  NOT NULL,
    [PrenomEmploye] nvarchar(100)  NOT NULL,
    [Date] datetime  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Entretien_Id] int  NOT NULL,
    [Elements_Id] int  NOT NULL
);
GO

-- Creating table 'PhotosProduits'
CREATE TABLE [dbo].[PhotosProduits] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Source] nvarchar(500)  NOT NULL,
    [Produit_Id] int  NOT NULL
);
GO

-- Creating table 'Remarques'
CREATE TABLE [dbo].[Remarques] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Titre] nvarchar(150)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [EntretiensPrecedant_Id] int  NOT NULL,
    [Entretiens_Id] int  NOT NULL,
    [Elements_Id] int  NOT NULL
);
GO

-- Creating table 'TypesProduits'
CREATE TABLE [dbo].[TypesProduits] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(100)  NOT NULL
);
GO

-- Creating table 'PhotosRemarques'
CREATE TABLE [dbo].[PhotosRemarques] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Source] nvarchar(500)  NOT NULL,
    [Remarque_Id] int  NOT NULL,
    [Entretiens_Id] int  NOT NULL,
    [PhotosRemarque1_Id] int  NOT NULL,
    [Elements_Id] int  NOT NULL
);
GO

-- Creating table 'ElementProcedures'
CREATE TABLE [dbo].[ElementProcedures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Elements_Id] int  NOT NULL,
    [Procedure_Id] int  NOT NULL
);
GO

-- Creating table 'TypeEmplacementSet'
CREATE TABLE [dbo].[TypeEmplacementSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Usagers'
ALTER TABLE [dbo].[Usagers]
ADD CONSTRAINT [PK_Usagers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Elements'
ALTER TABLE [dbo].[Elements]
ADD CONSTRAINT [PK_Elements]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Entretiens'
ALTER TABLE [dbo].[Entretiens]
ADD CONSTRAINT [PK_Entretiens]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EntretiensProduits'
ALTER TABLE [dbo].[EntretiensProduits]
ADD CONSTRAINT [PK_EntretiensProduits]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Produits'
ALTER TABLE [dbo].[Produits]
ADD CONSTRAINT [PK_Produits]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PhotosElements'
ALTER TABLE [dbo].[PhotosElements]
ADD CONSTRAINT [PK_PhotosElements]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TypesElements'
ALTER TABLE [dbo].[TypesElements]
ADD CONSTRAINT [PK_TypesElements]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Procedures'
ALTER TABLE [dbo].[Procedures]
ADD CONSTRAINT [PK_Procedures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EntretiensPrecedants'
ALTER TABLE [dbo].[EntretiensPrecedants]
ADD CONSTRAINT [PK_EntretiensPrecedants]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PhotosProduits'
ALTER TABLE [dbo].[PhotosProduits]
ADD CONSTRAINT [PK_PhotosProduits]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Remarques'
ALTER TABLE [dbo].[Remarques]
ADD CONSTRAINT [PK_Remarques]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TypesProduits'
ALTER TABLE [dbo].[TypesProduits]
ADD CONSTRAINT [PK_TypesProduits]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PhotosRemarques'
ALTER TABLE [dbo].[PhotosRemarques]
ADD CONSTRAINT [PK_PhotosRemarques]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ElementProcedures'
ALTER TABLE [dbo].[ElementProcedures]
ADD CONSTRAINT [PK_ElementProcedures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TypeEmplacementSet'
ALTER TABLE [dbo].[TypeEmplacementSet]
ADD CONSTRAINT [PK_TypeEmplacementSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TypeEmplacement_Id] in table 'Procedures'
ALTER TABLE [dbo].[Procedures]
ADD CONSTRAINT [FK_ProcedureTypeEmplacement]
    FOREIGN KEY ([TypeEmplacement_Id])
    REFERENCES [dbo].[TypeEmplacementSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedureTypeEmplacement'
CREATE INDEX [IX_FK_ProcedureTypeEmplacement]
ON [dbo].[Procedures]
    ([TypeEmplacement_Id]);
GO

-- Creating foreign key on [TypeEmplacements_Id] in table 'Elements'
ALTER TABLE [dbo].[Elements]
ADD CONSTRAINT [FK_ElementTypeEmplacement]
    FOREIGN KEY ([TypeEmplacements_Id])
    REFERENCES [dbo].[TypeEmplacementSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ElementTypeEmplacement'
CREATE INDEX [IX_FK_ElementTypeEmplacement]
ON [dbo].[Elements]
    ([TypeEmplacements_Id]);
GO

-- Creating foreign key on [Elements_Id] in table 'ElementProcedures'
ALTER TABLE [dbo].[ElementProcedures]
ADD CONSTRAINT [FK_ElementProcedureElement]
    FOREIGN KEY ([Elements_Id])
    REFERENCES [dbo].[Elements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ElementProcedureElement'
CREATE INDEX [IX_FK_ElementProcedureElement]
ON [dbo].[ElementProcedures]
    ([Elements_Id]);
GO

-- Creating foreign key on [Procedure_Id] in table 'ElementProcedures'
ALTER TABLE [dbo].[ElementProcedures]
ADD CONSTRAINT [FK_ProcedureElementProcedure]
    FOREIGN KEY ([Procedure_Id])
    REFERENCES [dbo].[Procedures]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedureElementProcedure'
CREATE INDEX [IX_FK_ProcedureElementProcedure]
ON [dbo].[ElementProcedures]
    ([Procedure_Id]);
GO

-- Creating foreign key on [TypesMachines_Id] in table 'Procedures'
ALTER TABLE [dbo].[Procedures]
ADD CONSTRAINT [FK_ProcedureTypesMachine]
    FOREIGN KEY ([TypesMachines_Id])
    REFERENCES [dbo].[TypesElements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProcedureTypesMachine'
CREATE INDEX [IX_FK_ProcedureTypesMachine]
ON [dbo].[Procedures]
    ([TypesMachines_Id]);
GO

-- Creating foreign key on [Elements_Id] in table 'PhotosElements'
ALTER TABLE [dbo].[PhotosElements]
ADD CONSTRAINT [FK_PhotosElementElement]
    FOREIGN KEY ([Elements_Id])
    REFERENCES [dbo].[Elements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PhotosElementElement'
CREATE INDEX [IX_FK_PhotosElementElement]
ON [dbo].[PhotosElements]
    ([Elements_Id]);
GO

-- Creating foreign key on [Element_Id] in table 'Entretiens'
ALTER TABLE [dbo].[Entretiens]
ADD CONSTRAINT [FK_ElementEntretien]
    FOREIGN KEY ([Element_Id])
    REFERENCES [dbo].[Elements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ElementEntretien'
CREATE INDEX [IX_FK_ElementEntretien]
ON [dbo].[Entretiens]
    ([Element_Id]);
GO

-- Creating foreign key on [Entretien_Id] in table 'EntretiensProduits'
ALTER TABLE [dbo].[EntretiensProduits]
ADD CONSTRAINT [FK_EntretienEntretiensProduit]
    FOREIGN KEY ([Entretien_Id])
    REFERENCES [dbo].[Entretiens]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EntretienEntretiensProduit'
CREATE INDEX [IX_FK_EntretienEntretiensProduit]
ON [dbo].[EntretiensProduits]
    ([Entretien_Id]);
GO

-- Creating foreign key on [Entretien_Id] in table 'EntretiensPrecedants'
ALTER TABLE [dbo].[EntretiensPrecedants]
ADD CONSTRAINT [FK_EntretienEntretiensPrecedant]
    FOREIGN KEY ([Entretien_Id])
    REFERENCES [dbo].[Entretiens]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EntretienEntretiensPrecedant'
CREATE INDEX [IX_FK_EntretienEntretiensPrecedant]
ON [dbo].[EntretiensPrecedants]
    ([Entretien_Id]);
GO

-- Creating foreign key on [EntretiensPrecedant_Id] in table 'Remarques'
ALTER TABLE [dbo].[Remarques]
ADD CONSTRAINT [FK_EntretiensPrecedantRemarque]
    FOREIGN KEY ([EntretiensPrecedant_Id])
    REFERENCES [dbo].[EntretiensPrecedants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EntretiensPrecedantRemarque'
CREATE INDEX [IX_FK_EntretiensPrecedantRemarque]
ON [dbo].[Remarques]
    ([EntretiensPrecedant_Id]);
GO

-- Creating foreign key on [Remarque_Id] in table 'PhotosRemarques'
ALTER TABLE [dbo].[PhotosRemarques]
ADD CONSTRAINT [FK_RemarquePhotosRemarque]
    FOREIGN KEY ([Remarque_Id])
    REFERENCES [dbo].[Remarques]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RemarquePhotosRemarque'
CREATE INDEX [IX_FK_RemarquePhotosRemarque]
ON [dbo].[PhotosRemarques]
    ([Remarque_Id]);
GO

-- Creating foreign key on [Produit_Id] in table 'EntretiensProduits'
ALTER TABLE [dbo].[EntretiensProduits]
ADD CONSTRAINT [FK_ProduitEntretiensProduit]
    FOREIGN KEY ([Produit_Id])
    REFERENCES [dbo].[Produits]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProduitEntretiensProduit'
CREATE INDEX [IX_FK_ProduitEntretiensProduit]
ON [dbo].[EntretiensProduits]
    ([Produit_Id]);
GO

-- Creating foreign key on [TypesProduit_Id] in table 'Produits'
ALTER TABLE [dbo].[Produits]
ADD CONSTRAINT [FK_TypesProduitProduit]
    FOREIGN KEY ([TypesProduit_Id])
    REFERENCES [dbo].[TypesProduits]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TypesProduitProduit'
CREATE INDEX [IX_FK_TypesProduitProduit]
ON [dbo].[Produits]
    ([TypesProduit_Id]);
GO

-- Creating foreign key on [Produit_Id] in table 'PhotosProduits'
ALTER TABLE [dbo].[PhotosProduits]
ADD CONSTRAINT [FK_ProduitPhotosProduit]
    FOREIGN KEY ([Produit_Id])
    REFERENCES [dbo].[Produits]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProduitPhotosProduit'
CREATE INDEX [IX_FK_ProduitPhotosProduit]
ON [dbo].[PhotosProduits]
    ([Produit_Id]);
GO

-- Creating foreign key on [TypesElement_Id] in table 'Elements'
ALTER TABLE [dbo].[Elements]
ADD CONSTRAINT [FK_TypesElementElement]
    FOREIGN KEY ([TypesElement_Id])
    REFERENCES [dbo].[TypesElements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TypesElementElement'
CREATE INDEX [IX_FK_TypesElementElement]
ON [dbo].[Elements]
    ([TypesElement_Id]);
GO

-- Creating foreign key on [Entretiens_Id] in table 'Remarques'
ALTER TABLE [dbo].[Remarques]
ADD CONSTRAINT [FK_RemarqueEntretien]
    FOREIGN KEY ([Entretiens_Id])
    REFERENCES [dbo].[Entretiens]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RemarqueEntretien'
CREATE INDEX [IX_FK_RemarqueEntretien]
ON [dbo].[Remarques]
    ([Entretiens_Id]);
GO

-- Creating foreign key on [Entretiens_Id] in table 'PhotosRemarques'
ALTER TABLE [dbo].[PhotosRemarques]
ADD CONSTRAINT [FK_PhotosRemarqueEntretien]
    FOREIGN KEY ([Entretiens_Id])
    REFERENCES [dbo].[Entretiens]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PhotosRemarqueEntretien'
CREATE INDEX [IX_FK_PhotosRemarqueEntretien]
ON [dbo].[PhotosRemarques]
    ([Entretiens_Id]);
GO

-- Creating foreign key on [PhotosRemarque1_Id] in table 'PhotosRemarques'
ALTER TABLE [dbo].[PhotosRemarques]
ADD CONSTRAINT [FK_PhotosRemarquePhotosRemarque]
    FOREIGN KEY ([PhotosRemarque1_Id])
    REFERENCES [dbo].[PhotosRemarques]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PhotosRemarquePhotosRemarque'
CREATE INDEX [IX_FK_PhotosRemarquePhotosRemarque]
ON [dbo].[PhotosRemarques]
    ([PhotosRemarque1_Id]);
GO

-- Creating foreign key on [Elements_Id] in table 'PhotosRemarques'
ALTER TABLE [dbo].[PhotosRemarques]
ADD CONSTRAINT [FK_PhotosRemarqueElement]
    FOREIGN KEY ([Elements_Id])
    REFERENCES [dbo].[Elements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PhotosRemarqueElement'
CREATE INDEX [IX_FK_PhotosRemarqueElement]
ON [dbo].[PhotosRemarques]
    ([Elements_Id]);
GO

-- Creating foreign key on [Elements_Id] in table 'Remarques'
ALTER TABLE [dbo].[Remarques]
ADD CONSTRAINT [FK_RemarqueElement]
    FOREIGN KEY ([Elements_Id])
    REFERENCES [dbo].[Elements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RemarqueElement'
CREATE INDEX [IX_FK_RemarqueElement]
ON [dbo].[Remarques]
    ([Elements_Id]);
GO

-- Creating foreign key on [Elements_Id] in table 'EntretiensPrecedants'
ALTER TABLE [dbo].[EntretiensPrecedants]
ADD CONSTRAINT [FK_EntretiensPrecedantElement]
    FOREIGN KEY ([Elements_Id])
    REFERENCES [dbo].[Elements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EntretiensPrecedantElement'
CREATE INDEX [IX_FK_EntretiensPrecedantElement]
ON [dbo].[EntretiensPrecedants]
    ([Elements_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------