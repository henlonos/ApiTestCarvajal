USE [master]
GO
/****** Object:  Database [EcommerceHaloPets]    Script Date: 26/05/2022 8:16:47 p. m. ******/
CREATE DATABASE [EcommerceHaloPets]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EcommerceHaloPets', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EcommerceHaloPets.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EcommerceHaloPets_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\EcommerceHaloPets_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EcommerceHaloPets] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EcommerceHaloPets].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EcommerceHaloPets] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET ARITHABORT OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EcommerceHaloPets] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EcommerceHaloPets] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EcommerceHaloPets] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EcommerceHaloPets] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EcommerceHaloPets] SET  MULTI_USER 
GO
ALTER DATABASE [EcommerceHaloPets] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EcommerceHaloPets] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EcommerceHaloPets] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EcommerceHaloPets] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EcommerceHaloPets] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EcommerceHaloPets] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EcommerceHaloPets] SET QUERY_STORE = OFF
GO
USE [EcommerceHaloPets]
GO
/****** Object:  Table [dbo].[logsProduct]    Script Date: 26/05/2022 8:16:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logsProduct](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[level] [varchar](100) NOT NULL,
	[logger] [varchar](1000) NOT NULL,
	[message] [varchar](3600) NOT NULL,
	[userid] [int] NULL,
	[exception] [varchar](3600) NULL,
 CONSTRAINT [PK_ExceptionLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 26/05/2022 8:16:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[code] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](200) NOT NULL,
	[description] [varchar](max) NULL,
	[price] [float] NOT NULL,
	[nameImage] [varchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productsInStock]    Script Date: 26/05/2022 8:16:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productsInStock](
	[idStock] [int] IDENTITY(1,1) NOT NULL,
	[codeProduct] [int] NOT NULL,
	[stock] [int] NOT NULL,
 CONSTRAINT [PK_ProductsInStock] PRIMARY KEY CLUSTERED 
(
	[idStock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 26/05/2022 8:16:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales]    Script Date: 26/05/2022 8:16:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales](
	[idSale] [int] IDENTITY(1,1) NOT NULL,
	[idProduct] [int] NOT NULL,
	[idUser] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [float] NOT NULL,
	[timespan] [datetime] NULL,
	[codeSale] [int] NULL,
 CONSTRAINT [PK_sales] PRIMARY KEY CLUSTERED 
(
	[idSale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 26/05/2022 8:16:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[User_id] [int] NOT NULL,
	[Role_id] [int] NOT NULL,
 CONSTRAINT [PK_User_Roles] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC,
	[Role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 26/05/2022 8:16:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[address] [varchar](200) NULL,
	[email] [varchar](200) NULL,
	[phone] [varchar](200) NULL,
	[password] [varchar](200) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ('') FOR [productName]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ('') FOR [description]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ('') FOR [nameImage]
GO
ALTER TABLE [dbo].[productsInStock]  WITH CHECK ADD FOREIGN KEY([codeProduct])
REFERENCES [dbo].[products] ([code])
GO
ALTER TABLE [dbo].[sales]  WITH CHECK ADD FOREIGN KEY([idProduct])
REFERENCES [dbo].[products] ([code])
GO
ALTER TABLE [dbo].[sales]  WITH CHECK ADD FOREIGN KEY([idUser])
REFERENCES [dbo].[users] ([Id])
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD  CONSTRAINT [FK_User_Roles_roles] FOREIGN KEY([Role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[user_roles] CHECK CONSTRAINT [FK_User_Roles_roles]
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD  CONSTRAINT [FK_User_Roles_users] FOREIGN KEY([User_id])
REFERENCES [dbo].[users] ([Id])
GO
ALTER TABLE [dbo].[user_roles] CHECK CONSTRAINT [FK_User_Roles_users]
GO
/****** Object:  StoredProcedure [dbo].[adminLogs]    Script Date: 26/05/2022 8:16:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[adminLogs]
     
	 @id         [INT] null,   
     @timestam  [DATETIME]  NULL,   
     @level      [VARCHAR](100)  NULL,   
     @logger     [VARCHAR](1000)  NULL,   
     @message    [VARCHAR](3600)  NULL,   
     @userid     [INT] NULL,   
     @exception  [VARCHAR](3600) NULL,   
     @stacktrace [VARCHAR](3600) NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into dbo.logsProduct ([TimeStamp],[Level],Logger, [Message], UserId, Exception, StackTrace) 
	values (@timestam, @level, @logger, @message, case when len(@userid) = 0 then null else @userid end, @exception, @stacktrace)
END
GO
/****** Object:  StoredProcedure [dbo].[ManagementUsers]    Script Date: 26/05/2022 8:16:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ManagementUsers] 
	-- Add the parameters for the stored procedure here
@option varchar(200) ,
@nameUser varchar(200) null,
@address varchar(200) null,
@email varchar(200) null,
@phone varchar(200) null,
@idRole int null,
@password varchar(200)= null


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @option = 'createUser'
	begin
	   begin transaction
	   declare @idUser int
	   insert into dbo.users values (@nameUser,@address,@email,@phone,@password)


	   select @idUser = max(Id)  from dbo.users 
	   

	   insert into dbo.user_roles values (@idUser,@idRole)

	   commit;

	end
END
GO
/****** Object:  StoredProcedure [dbo].[managerProducts]    Script Date: 26/05/2022 8:16:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[managerProducts]
	-- Add the parameters for the stored procedure here
@option varchar(200) ,
@userName varchar(200) = null,
@password varchar(200) = null,
@codeproduct int = null,
@nameproduct varchar(200) = null,
@description varchar(200) = null,
@price int = null,
@items int = null,
@nameImage varchar(200) = null,
@userId int = null,
@codeSale int  = null,
@timestamp datetime = null,
@level varchar(max) = null,
@logger varchar(200) = null,
@message varchar(max) = null,
@exception varchar(max) = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if @option = 'validatingLogin'
	begin


	       if(select count(*) from dbo.users where email= @userName and password = @password) = 1
		   begin
		          select  c.Name Role,a.Id userId  from dbo.users a
				  join dbo.user_roles b on a.Id = b.User_id
				  join dbo.roles c on b.Role_id = c.id
				  where email= @userName and password = @password
		   end
	end

	if @option = 'registerProduct'
	begin
	      declare @id int 
	      insert into dbo.products values (@nameproduct,@description,@price,@nameImage)

		  

		  insert into dbo.productsInStock values ((select max(code) from dbo.products),@items)
	end

	if @option = 'searchProducts'
	begin
	     select code,productName,description,price,replace(replace(nameImage,'C:\Devops\EcommerceHaloPets\src\assets\Imgs\',''),'.jpg','.png') nameImage,stock from dbo.products a 
		join dbo.productsInStock b on a.code = b.codeProduct
		where b.stock > 0
	end

	if @option = 'getCodeSale'
	begin

	    if(select count(*) from dbo.sales) = 0
		begin
		select '1' codeSale 
		end
		else
		begin
		 select max(codeSale +1) codeSale from dbo.sales
		end
	    
	end

	if @option = 'saveOrder'
	begin
	     begin transaction 

		    
		    insert into dbo.sales values (@codeProduct,@userId,1,@price,getdate(),@codeSale)

			
			update dbo.productsInStock set stock = (stock -1) where codeProduct = @codeproduct
		 commit;
	end

	if @option = 'getProductMax'
	begin
	        
			select top 1 a.idProduct, b.productName, count(a.idProduct) as items
			from dbo.sales a
			inner join dbo.products b
			on a.idProduct = b.code
			group by a.idProduct, b.productName, b.code
			order by count(a.idProduct) desc;

	end
	if @option = 'getProductMin'
	begin
	        
			select top 1 a.idProduct, b.productName, count(a.idProduct) as items
			from dbo.sales a
			inner join dbo.products b
			on a.idProduct = b.code
			group by a.idProduct, b.productName, b.code
			order by count(a.idProduct) asc;

	end

	if @option = 'RegisterLogger'
	begin
	       insert into dbo.logsProduct values (@timestamp,@level,@logger,@message,@userId,@exception)
	end
END

GO
USE [master]
GO
ALTER DATABASE [EcommerceHaloPets] SET  READ_WRITE 
GO
