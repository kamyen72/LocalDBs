USE [master]
GO
/****** Object:  Database [ThirdM]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE DATABASE [ThirdM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ThirdM', FILENAME = N'C:\mssql_data\ThirdM.mdf' , SIZE = 22880256KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ThirdM_log', FILENAME = N'C:\mssql_data\ThirdM_log.ldf' , SIZE = 18948096KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ThirdM] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ThirdM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ThirdM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ThirdM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ThirdM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ThirdM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ThirdM] SET ARITHABORT OFF 
GO
ALTER DATABASE [ThirdM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ThirdM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ThirdM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ThirdM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ThirdM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ThirdM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ThirdM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ThirdM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ThirdM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ThirdM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ThirdM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ThirdM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ThirdM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ThirdM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ThirdM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ThirdM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ThirdM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ThirdM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ThirdM] SET  MULTI_USER 
GO
ALTER DATABASE [ThirdM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ThirdM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ThirdM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ThirdM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ThirdM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ThirdM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ThirdM', N'ON'
GO
ALTER DATABASE [ThirdM] SET QUERY_STORE = OFF
GO
USE [ThirdM]
GO
/****** Object:  User [TMUser]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE USER [TMUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [TMUser]
GO
/****** Object:  Table [dbo].[MemberShip]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberShip](
	[MemberID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[Pwd] [nvarchar](200) NOT NULL,
	[UserLevelID] [int] NOT NULL,
	[MGroupID] [int] NOT NULL,
	[Birthday] [datetime] NULL,
	[MoneyPwd] [nvarchar](200) NOT NULL,
	[NickName] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[AgentParentID] [int] NOT NULL,
	[AgentPositionTakingRebate] [nvarchar](10) NULL,
	[AgentParentMap] [nvarchar](200) NOT NULL,
	[AgentLevelSCID] [int] NULL,
	[ReferralParentID] [int] NOT NULL,
	[ReferralPayType] [int] NULL,
	[ReferralLayerLevel] [nvarchar](50) NULL,
	[ReferralMap] [nvarchar](200) NOT NULL,
	[ReferralCashRebate] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[LoginTime] [datetime] NULL,
	[LastLoginTime] [datetime] NULL,
	[LoginIP] [nvarchar](200) NULL,
	[LoginWrongTimes] [int] NULL,
	[TotalBalance] [nvarchar](30) NOT NULL,
	[MonthDeposit] [nvarchar](30) NOT NULL,
	[TotalDeposit] [nvarchar](200) NOT NULL,
	[MaxWinAmount] [nvarchar](200) NOT NULL,
	[TotalRealBet] [nvarchar](200) NULL,
	[ReferralLink] [nvarchar](200) NULL,
	[UserType] [nvarchar](10) NULL,
	[IsMultiLogin] [bit] NOT NULL,
	[WalletIsLock] [bit] NOT NULL,
	[FirstPwd] [nvarchar](200) NULL,
	[SecondPwd] [nvarchar](200) NULL,
	[CashRebatePayType] [int] NULL,
	[CashBackRebatePayType] [int] NULL,
	[IsEditPhone] [bit] NOT NULL,
	[IsEmailValidator] [bit] NOT NULL,
	[IsEditEmail] [bit] NOT NULL,
	[IsFirst] [bit] NOT NULL,
	[IsLock] [bit] NOT NULL,
	[IsEnable] [bit] NOT NULL,
	[IsOnline] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberShip] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ConfigName] [nvarchar](100) NOT NULL,
	[ConfigNotice] [nvarchar](max) NULL,
	[ConfigValues] [nvarchar](max) NULL,
	[ConfigTypeID] [int] NOT NULL,
	[ConfigParentID] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MPlayer]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MPlayer](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SecondMPlayerID] [int] NULL,
	[MemberID] [int] NOT NULL,
	[GameDealerMemberID] [int] NULL,
	[UserName] [nvarchar](200) NULL,
	[LotteryInfoID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[CurrentPeriod] [nvarchar](100) NOT NULL,
	[LotteryInfoName] [nvarchar](200) NOT NULL,
	[SelectedNums] [nvarchar](max) NOT NULL,
	[IsAfter] [bit] NOT NULL,
	[IsWinStop] [bit] NOT NULL,
	[ManualBet] [nvarchar](50) NULL,
	[Multiple] [nvarchar](50) NULL,
	[DiscountPrice] [nvarchar](50) NOT NULL,
	[Price] [nvarchar](50) NOT NULL,
	[Qty] [nvarchar](50) NOT NULL,
	[IsWin] [bit] NULL,
	[ShowResultDate] [datetime] NOT NULL,
	[RebatePro] [nvarchar](10) NULL,
	[RebateProMoney] [nvarchar](50) NULL,
	[WinMoney] [nvarchar](50) NULL,
	[WinMoneyWithCapital] [nvarchar](50) NULL,
	[ReferralPayType] [int] NULL,
	[CashRebatePayType] [int] NULL,
	[CashBackRebatePayType] [int] NULL,
	[IsReferralWriteReport] [int] NOT NULL,
	[IsCashRebateWriteReport] [int] NOT NULL,
	[IsCashBackWriteReport] [int] NOT NULL,
	[IsReset] [int] NOT NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MPlayer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwMemberShip]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwMemberShip]
AS
SELECT          ms.MemberID, ms.UserName, ms.Pwd, ms.UserLevelID, ms.Birthday, ms.MoneyPwd, ms.FullName, ms.NickName, 
                            ms.AgentParentID, ms.AgentPositionTakingRebate, ms.AgentParentMap, ms.AgentLevelSCID, ms.ReferralPayType, 
                            ms.ReferralLayerLevel, ms.ReferralMap, ms.ReferralCashRebate, ms.Email, ms.Phone, ms.LoginTime, 
                            ms.LastLoginTime, ms.LoginIP, ms.TotalBalance, ms.MonthDeposit, ms.TotalDeposit, ms.MaxWinAmount, 
                            ms.TotalRealBet, ms.ReferralLink, ms.UserType, ms.IsMultiLogin, ms.WalletIsLock, ms.FirstPwd, ms.SecondPwd, 
                            ms.IsEditPhone, ms.IsEmailValidator, ms.IsEditEmail, ms.IsFirst, ms.IsLock, ms.IsEnable, ms.IsOnline, 
                            ms.CreateBy, ms.CreateDate, sc.ConfigName AS AgentLevelName, sc.ConfigNotice AS AgentLevelNotice, 
                            sc.ConfigValues AS AgentLevelValue, mp.MemberTotalBet, ms.ReferralParentID, ms.CashRebatePayType, 
                            ms.CashBackRebatePayType, ms.MGroupID, ms.LoginWrongTimes
FROM              dbo.MemberShip AS ms LEFT OUTER JOIN
                            dbo.SystemConfig AS sc ON ms.AgentLevelSCID = sc.ID LEFT OUTER JOIN
                                (SELECT          COUNT(ID) AS MemberTotalBet, MemberID
                                  FROM               dbo.MPlayer
                                  GROUP BY    MemberID) AS mp ON ms.MemberID = mp.MemberID
GO
/****** Object:  Table [dbo].[MWallet]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MWallet](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CompanyID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[LotteryClassID] [int] NOT NULL,
	[TotalPrice] [nvarchar](200) NULL,
	[TodayTotalWin] [nvarchar](200) NULL,
	[TodayTotalLost] [nvarchar](200) NULL,
	[PromotionBonusPrice] [nvarchar](50) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberPrice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LotteryClass]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryClass](
	[LotteryClassID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LotteryClassName] [nvarchar](200) NOT NULL,
	[Notice] [nvarchar](200) NULL,
	[GameRoomID] [int] NOT NULL,
	[Sort] [int] NOT NULL,
	[IsMaintain] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[LotteryClass_TableID] [int] NOT NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LotteryClass] PRIMARY KEY CLUSTERED 
(
	[LotteryClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwMWallet]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwMWallet]
AS
SELECT          dbo.MWallet.ID, dbo.MWallet.CompanyID, dbo.MWallet.MemberID, dbo.MWallet.LotteryClassID, 
                            dbo.MWallet.TotalPrice, dbo.MWallet.TodayTotalWin, dbo.MWallet.TodayTotalLost, 
                            dbo.MWallet.PromotionBonusPrice, dbo.MWallet.CreateBy, dbo.MWallet.CreateDate, dbo.MWallet.UpdateBy, 
                            dbo.MWallet.UpdateDate, dbo.LotteryClass.LotteryClassName, dbo.LotteryClass.Notice
FROM              dbo.LotteryClass INNER JOIN
                            dbo.MWallet ON dbo.LotteryClass.LotteryClassID = dbo.MWallet.LotteryClassID
GO
/****** Object:  Table [dbo].[BankPayMainType]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankPayMainType](
	[PMTID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PMTName] [nvarchar](200) NOT NULL,
	[PMTCode] [nvarchar](200) NOT NULL,
	[PMRMethod] [nvarchar](200) NULL,
	[Notice] [nvarchar](200) NULL,
	[IsClose] [bit] NOT NULL,
	[Status] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PayMainType] PRIMARY KEY CLUSTERED 
(
	[PMTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankAcceptable]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAcceptable](
	[AcceptableID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PMTID] [int] NOT NULL,
	[BankName] [nvarchar](200) NOT NULL,
	[BankCode] [nvarchar](200) NULL,
	[PayMainURL] [nvarchar](200) NULL,
	[Notice] [nvarchar](200) NULL,
	[Status] [int] NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AcceptedBank] PRIMARY KEY CLUSTERED 
(
	[AcceptableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deposit]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deposit](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PMTID] [int] NOT NULL,
	[PMTLogID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[MBankID] [int] NOT NULL,
	[CBankID] [int] NOT NULL,
	[DepositPayMothed] [nvarchar](200) NOT NULL,
	[PromotionID] [int] NOT NULL,
	[RefCode] [nvarchar](200) NULL,
	[Amount] [nvarchar](200) NOT NULL,
	[TotalBonus] [nvarchar](200) NOT NULL,
	[DepositTypeSCID] [int] NOT NULL,
	[MaxAmount] [int] NULL,
	[MinAmount] [int] NULL,
	[Remark] [nvarchar](max) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Deposit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CBank]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CBank](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[AcceptableID] [int] NOT NULL,
	[BankAccount] [nvarchar](200) NULL,
	[AccountNumber] [nvarchar](200) NOT NULL,
	[BankNotice] [nvarchar](max) NOT NULL,
	[BankUrl] [nvarchar](200) NULL,
	[IsEnable] [bit] NULL,
	[MinAmount] [nvarchar](200) NULL,
	[MaxAmount] [nvarchar](200) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CBank] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwDeposit]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwDeposit]
AS
SELECT          dbo.Deposit.ID, dbo.CBank.BankAccount, dbo.CBank.AccountNumber, dbo.BankAcceptable.BankName, 
                            dbo.BankAcceptable.BankCode, dbo.BankPayMainType.PMTName, dbo.Deposit.MemberID, dbo.Deposit.MBankID, 
                            dbo.Deposit.CBankID, dbo.Deposit.DepositPayMothed, dbo.Deposit.PromotionID, dbo.Deposit.Amount, 
                            dbo.Deposit.DepositTypeSCID, dbo.Deposit.MaxAmount, dbo.Deposit.MinAmount, dbo.Deposit.CreateBy, 
                            dbo.Deposit.CreateDate, dbo.Deposit.UpdateBy, dbo.Deposit.UpdateDate, dbo.MemberShip.UserName, 
                            dbo.Deposit.Remark, dbo.MemberShip.ReferralMap, dbo.MemberShip.LoginIP, dbo.Deposit.RefCode, 
                            dbo.MemberShip.FullName, dbo.Deposit.TotalBonus, dbo.Deposit.PMTID, dbo.Deposit.PMTLogID
FROM              dbo.Deposit INNER JOIN
                            dbo.CBank ON dbo.Deposit.CBankID = dbo.CBank.ID INNER JOIN
                            dbo.BankAcceptable ON dbo.CBank.AcceptableID = dbo.BankAcceptable.AcceptableID LEFT OUTER JOIN
                            dbo.BankPayMainType ON dbo.BankAcceptable.PMTID = dbo.BankPayMainType.PMTID LEFT OUTER JOIN
                            dbo.MemberShip ON dbo.Deposit.MemberID = dbo.MemberShip.MemberID
GO
/****** Object:  Table [dbo].[GameDealerMPlayer]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameDealerMPlayer](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[LotteryInfoID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[CurrentPeriod] [nvarchar](100) NOT NULL,
	[LotteryInfoName] [nvarchar](200) NOT NULL,
	[SelectedNums] [nvarchar](max) NOT NULL,
	[IsAfter] [bit] NOT NULL,
	[IsWinStop] [bit] NOT NULL,
	[ManualBet] [nvarchar](50) NULL,
	[Multiple] [nvarchar](50) NULL,
	[DiscountPrice] [nvarchar](50) NULL,
	[Price] [nvarchar](50) NOT NULL,
	[Qty] [nvarchar](50) NOT NULL,
	[IsWin] [bit] NULL,
	[RebatePro] [nvarchar](10) NULL,
	[RebateProMoney] [nvarchar](50) NULL,
	[WinMoney] [nvarchar](50) NULL,
	[WinMoneyWithCapital] [nvarchar](50) NULL,
	[IsWriteReport] [bit] NOT NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GameDealerMPlayer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LotteryInfo]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryInfo](
	[LotteryInfoID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LotteryInfoName] [nvarchar](200) NOT NULL,
	[LotteryInfoNotice] [nvarchar](max) NOT NULL,
	[LotteryClassID] [int] NOT NULL,
	[LotteryTypeID] [int] NOT NULL,
	[DrawTypeID] [int] NOT NULL,
	[DisCount] [decimal](18, 2) NOT NULL,
	[MinBet] [int] NOT NULL,
	[MaxBet] [decimal](18, 1) NOT NULL,
	[FamliyBigID] [nvarchar](200) NULL,
	[FamliyMiddelID] [int] NULL,
	[FamliySmallID] [int] NULL,
	[Status] [bit] NOT NULL,
	[SelectArray] [nvarchar](max) NOT NULL,
	[LotteryInfo_TableID] [int] NOT NULL,
	[ResultPosition] [nvarchar](max) NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [date] NOT NULL,
 CONSTRAINT [PK_LotteryInfo_1] PRIMARY KEY CLUSTERED 
(
	[LotteryInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LotteryType]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryType](
	[LotteryTypeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LotteryTypeName] [nvarchar](200) NOT NULL,
	[LotteryTypeCode] [nvarchar](200) NOT NULL,
	[LotteryClassID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[PeriodInterval] [int] NOT NULL,
	[RealPlayTime] [int] NOT NULL,
	[MaxBonusMoneyPool] [int] NOT NULL,
	[DrawBonusPercentage] [nvarchar](20) NOT NULL,
	[IsEnableAI] [bit] NULL,
	[IsMaintain] [bit] NULL,
	[AIType] [int] NULL,
	[CompanyWinPercentage] [nvarchar](20) NULL,
	[UserWinPercentage] [nvarchar](20) NULL,
	[CompanyPresetCompensation] [decimal](18, 2) NULL,
	[URL] [nvarchar](200) NOT NULL,
	[FamliyID] [int] NULL,
	[FamliyISort] [int] NULL,
	[NewOrHot] [int] NULL,
	[IsOfficial] [bit] NULL,
	[IsCloseGame] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[LotteryType_TableID] [int] NOT NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LotteryType] PRIMARY KEY CLUSTERED 
(
	[LotteryTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OLottery]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OLottery](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LotteryTypeID] [int] NOT NULL,
	[CurrentLotteryTime] [datetime] NOT NULL,
	[CurrentPeriod] [nvarchar](100) NOT NULL,
	[Result] [nvarchar](max) NULL,
	[IsOpen] [bit] NOT NULL,
	[RealCloseTime] [datetime] NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[EndPlayTime] [datetime] NOT NULL,
	[ResultNotice] [nvarchar](max) NULL,
	[IsReset] [bit] NOT NULL,
	[ResetTimes] [int] NOT NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_OLottery] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwGameDealerMPlayer]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VwGameDealerMPlayer]
AS
SELECT          lt.LotteryTypeName, ol.CurrentLotteryTime, ol.Result, lt.LotteryTypeID, lt.LotteryClassID, lt.LotteryTypeCode, mp.ID, 
                            mp.MemberID, mp.LotteryInfoID, mp.CompanyID, mp.CurrentPeriod, mp.LotteryInfoName, mp.SelectedNums, 
                            mp.IsAfter, mp.IsWinStop, mp.ManualBet, mp.Multiple, mp.DiscountPrice, mp.Price, mp.IsWin, mp.Qty, 
                            mp.RebatePro, mp.RebateProMoney, mp.WinMoneyWithCapital, mp.WinMoney, mp.IsWriteReport, mp.CreateID, 
                            mp.CreateDate, mp.UpdateID, mp.UpdateDate
FROM              dbo.GameDealerMPlayer AS mp WITH (nolock) INNER JOIN
                            dbo.LotteryInfo AS li ON li.LotteryInfoID = mp.LotteryInfoID INNER JOIN
                            dbo.LotteryType AS lt ON li.LotteryTypeID = lt.LotteryTypeID LEFT OUTER JOIN
                            dbo.OLottery AS ol ON ol.CurrentPeriod = mp.CurrentPeriod AND ol.LotteryTypeID = lt.LotteryTypeID
GO
/****** Object:  Table [dbo].[PlatformSetting]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlatformSetting](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PlatformName] [nvarchar](200) NOT NULL,
	[ServerIP] [nvarchar](200) NOT NULL,
	[URL] [nvarchar](200) NOT NULL,
	[WebName] [nvarchar](200) NULL,
	[CompanyName] [nvarchar](max) NOT NULL,
	[CompanyDNS] [nvarchar](max) NOT NULL,
	[APIPath] [nvarchar](max) NOT NULL,
	[APID] [nvarchar](max) NOT NULL,
	[PrivateKeyAPID] [nvarchar](max) NOT NULL,
	[APICode] [nvarchar](50) NULL,
	[ShortName] [nvarchar](50) NOT NULL,
	[PlayTokenStatus] [bit] NOT NULL,
	[IsTest] [bit] NOT NULL,
	[IsMaintain] [bit] NOT NULL,
	[TypeCode] [nvarchar](50) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[StagingCompanyDNS] [nvarchar](200) NULL,
 CONSTRAINT [PK_PlatformSetting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberPlatform]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPlatform](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PlatformID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[GameDealerMemberID] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberPlatform] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VWMPlatform]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VWMPlatform]
AS
SELECT          ms.MemberID AS Expr1, ms.UserName, ms.Pwd, ms.UserLevelID, ms.MGroupID, ms.Birthday, ms.MoneyPwd, 
                            ms.NickName, ms.FullName, ms.AgentParentID, ms.AgentPositionTakingRebate, ms.AgentParentMap, 
                            ms.AgentLevelSCID, ms.ReferralParentID, ms.ReferralPayType, ms.ReferralLayerLevel, ms.ReferralMap, 
                            ms.ReferralCashRebate, ms.Email, ms.Phone, ms.LoginTime, ms.LastLoginTime, ms.LoginIP, ms.LoginWrongTimes, 
                            ms.TotalBalance, ms.MonthDeposit, ms.TotalDeposit, ms.MaxWinAmount, ms.TotalRealBet, ms.ReferralLink, 
                            ms.UserType, ms.IsMultiLogin, ms.WalletIsLock, ms.FirstPwd, ms.SecondPwd, ms.CashRebatePayType, 
                            ms.CashBackRebatePayType, ms.IsEditPhone, ms.IsEmailValidator, ms.IsEditEmail, ms.IsFirst, ms.IsLock, 
                            ms.IsEnable, ms.IsOnline, ms.CreateBy, ms.CreateDate, ms.UpdateBy, ms.UpdateDate, pfs.ID AS PFSID, 
                            pfs.PlatformName, pfs.URL, pfs.ShortName
FROM              dbo.MemberPlatform AS mp WITH (NOLOCK) INNER JOIN
                            dbo.MemberShip AS ms WITH (NOLOCK) ON ms.MemberID = mp.MemberID INNER JOIN
                            dbo.PlatformSetting AS pfs WITH (NOLOCK) ON pfs.ID = mp.ID
GO
/****** Object:  Table [dbo].[GameDealerMPlayerReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameDealerMPlayerReport](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[MPlayerID] [int] NOT NULL,
	[LotteryClassID] [int] NULL,
	[LotteryTypeID] [int] NULL,
	[CurrentPeriod] [nvarchar](100) NULL,
	[ReferralParentID] [int] NOT NULL,
	[DiscountPrice] [nvarchar](50) NOT NULL,
	[TypeCode] [nvarchar](200) NULL,
	[Status] [nvarchar](200) NULL,
	[TurnOverMoney] [nvarchar](200) NULL,
	[RecordMoney] [nvarchar](200) NULL,
	[CashRebateMoney] [nvarchar](100) NULL,
	[CashRebateMoneyStatus] [bit] NULL,
	[CashBackRebateMoney] [nvarchar](100) NULL,
	[CashBackRebateMoneyStatus] [bit] NULL,
	[CashRebatePayType] [int] NULL,
	[CashBackRebatePayType] [int] NULL,
	[AgentMoney] [nvarchar](200) NULL,
	[AngentMemberID] [int] NOT NULL,
	[AgentLevelSCID] [int] NULL,
	[ReferralLevel] [nvarchar](200) NULL,
	[ReferralMemberID] [int] NOT NULL,
	[ReferralMoney] [nvarchar](200) NULL,
	[ReferralPayType] [int] NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GameDealerMPlayerReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameDealerMemberShip]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameDealerMemberShip](
	[MemberID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Currency] [nvarchar](200) NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[Pwd] [nvarchar](200) NOT NULL,
	[MGroupID] [int] NOT NULL,
	[UserLevelID] [int] NOT NULL,
	[LoginToken] [nvarchar](200) NULL,
	[Birthday] [datetime] NULL,
	[MoneyPwd] [nvarchar](200) NOT NULL,
	[NickName] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[AgentParentID] [int] NOT NULL,
	[AgentPositionTakingRebate] [nvarchar](10) NULL,
	[AgentParentMap] [nvarchar](200) NOT NULL,
	[AgentParentName] [nvarchar](200) NULL,
	[AgentLevelSCID] [int] NULL,
	[ReferralParentID] [int] NOT NULL,
	[ReferralPayType] [nvarchar](10) NULL,
	[ReferralLayerLevel] [nvarchar](50) NULL,
	[ReferralMap] [nvarchar](200) NOT NULL,
	[ReferralCashRebate] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[LoginTime] [datetime] NULL,
	[LastLoginTime] [datetime] NULL,
	[LoginIP] [nvarchar](200) NULL,
	[LoginWrongTimes] [int] NULL,
	[TotalBalance] [nvarchar](30) NOT NULL,
	[MonthDeposit] [nvarchar](30) NOT NULL,
	[TotalDeposit] [nvarchar](200) NOT NULL,
	[MaxWinAmount] [nvarchar](200) NOT NULL,
	[TotalRealBet] [nvarchar](200) NULL,
	[ReferralLink] [nvarchar](200) NULL,
	[UserType] [nvarchar](10) NULL,
	[IsMultiLogin] [bit] NOT NULL,
	[WalletIsLock] [bit] NOT NULL,
	[FirstPwd] [nvarchar](200) NULL,
	[SecondPwd] [nvarchar](200) NULL,
	[CashRebatePayType] [int] NULL,
	[CashBackRebatePayType] [int] NULL,
	[IsEditPhone] [bit] NOT NULL,
	[IsEmailValidator] [bit] NOT NULL,
	[IsEditEmail] [bit] NOT NULL,
	[IsFirst] [bit] NOT NULL,
	[IsLock] [bit] NOT NULL,
	[IsEnable] [bit] NOT NULL,
	[IsOnline] [bit] NOT NULL,
	[IsTest] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GameDealerMemberShip] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwGameDealerMPlayerReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwGameDealerMPlayerReport]
AS
SELECT          dbo.GameDealerMPlayerReport.ID, dbo.GameDealerMPlayerReport.MemberID, 
                            dbo.GameDealerMPlayerReport.MPlayerID, dbo.GameDealerMPlayerReport.CurrentPeriod, 
                            dbo.GameDealerMPlayerReport.TypeCode, dbo.GameDealerMPlayerReport.Status, 
                            dbo.GameDealerMPlayerReport.TurnOverMoney, dbo.GameDealerMPlayerReport.RecordMoney, 
                            dbo.GameDealerMPlayerReport.CashRebateMoney, dbo.GameDealerMPlayerReport.CashBackRebateMoney, 
                            dbo.GameDealerMPlayerReport.AgentMoney, dbo.GameDealerMPlayerReport.ReferralMoney, 
                            dbo.GameDealerMPlayerReport.CreateBy, dbo.GameDealerMPlayerReport.CreateDate, 
                            dbo.GameDealerMPlayerReport.UpdateBy, dbo.GameDealerMPlayerReport.UpdateDate, 
                            dbo.GameDealerMPlayerReport.CashRebateMoneyStatus, 
                            dbo.GameDealerMPlayerReport.CashBackRebateMoneyStatus, dbo.GameDealerMPlayerReport.ReferralLevel, 
                            dbo.GameDealerMPlayerReport.ReferralMemberID, dbo.GameDealerMPlayerReport.ReferralParentID, 
                            dbo.GameDealerMPlayerReport.AngentMemberID, dbo.SystemConfig.ConfigValues AS AgentLevel, 
                            dbo.GameDealerMPlayerReport.AgentLevelSCID, dbo.GameDealerMPlayerReport.LotteryClassID, 
                            dbo.GameDealerMPlayerReport.LotteryTypeID, dbo.GameDealerMPlayerReport.CashRebatePayType, 
                            dbo.GameDealerMPlayerReport.CashBackRebatePayType, dbo.GameDealerMPlayerReport.ReferralPayType, 
                            dbo.GameDealerMemberShip.UserName
FROM              dbo.GameDealerMPlayerReport INNER JOIN
                            dbo.GameDealerMemberShip ON 
                            dbo.GameDealerMPlayerReport.MemberID = dbo.GameDealerMemberShip.MemberID LEFT OUTER JOIN
                            dbo.SystemConfig ON dbo.GameDealerMPlayerReport.AgentLevelSCID = dbo.SystemConfig.ID
GO
/****** Object:  Table [dbo].[LotteryBetLimitMap]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryBetLimitMap](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LimitID] [int] NULL,
	[LotteryClassID] [int] NULL,
	[LotteryTypeID] [int] NULL,
	[LotteryInfoID] [int] NULL,
	[ParentID] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LotteryBetLimitMap] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LotteryBetLimit]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryBetLimit](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LimitName] [nvarchar](200) NULL,
	[LimitMin] [int] NOT NULL,
	[LimitMax] [int] NOT NULL,
	[IsParentType] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LotteryBetLimit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwLotteryClassLimit]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwLotteryClassLimit]
AS
SELECT          dbo.LotteryBetLimitMap.ID AS LotteryBetLimitMapID, dbo.LotteryBetLimitMap.LimitID, 
                            dbo.LotteryBetLimitMap.LotteryTypeID, dbo.LotteryBetLimitMap.LotteryInfoID, 
                            dbo.LotteryBetLimit.ID AS LotteryBetLimitID, dbo.LotteryBetLimit.LimitMin, dbo.LotteryBetLimit.LimitMax, 
                            dbo.LotteryClass.LotteryClassID, dbo.LotteryClass.LotteryClassName, dbo.LotteryClass.Notice, 
                            dbo.LotteryClass.GameRoomID, dbo.LotteryClass.Sort, dbo.LotteryClass.Status
FROM              dbo.LotteryBetLimitMap INNER JOIN
                            dbo.LotteryBetLimit ON dbo.LotteryBetLimitMap.LimitID = dbo.LotteryBetLimit.ID INNER JOIN
                            dbo.LotteryClass ON dbo.LotteryBetLimitMap.LotteryClassID = dbo.LotteryClass.LotteryClassID
WHERE          (dbo.LotteryBetLimitMap.LotteryTypeID = 0) AND (dbo.LotteryBetLimitMap.LotteryInfoID = 0)
GO
/****** Object:  View [dbo].[VwLotteryInfoLimit]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwLotteryInfoLimit]
AS
SELECT          dbo.LotteryInfo.LotteryInfoID, dbo.LotteryInfo.LotteryInfoName, dbo.LotteryInfo.LotteryInfoNotice, 
                            dbo.LotteryInfo.LotteryClassID, dbo.LotteryInfo.LotteryTypeID, dbo.LotteryInfo.DrawTypeID, dbo.LotteryInfo.DisCount, 
                            dbo.LotteryInfo.MinBet, dbo.LotteryInfo.MaxBet, dbo.LotteryInfo.FamliyBigID, dbo.LotteryInfo.FamliyMiddelID, 
                            dbo.LotteryInfo.FamliySmallID, dbo.LotteryInfo.Status, dbo.LotteryInfo.SelectArray, 
                            dbo.LotteryInfo.LotteryInfo_TableID, dbo.LotteryBetLimitMap.LimitID, dbo.LotteryBetLimit.LimitName, 
                            dbo.LotteryBetLimit.LimitMin, dbo.LotteryBetLimit.LimitMax, dbo.LotteryBetLimitMap.ParentID, 
                            dbo.LotteryBetLimitMap.ID AS LotteryBetLimitMapID, dbo.LotteryBetLimit.ID AS LotteryBetLimitID
FROM              dbo.LotteryInfo INNER JOIN
                            dbo.LotteryBetLimitMap ON dbo.LotteryInfo.LotteryInfoID = dbo.LotteryBetLimitMap.LotteryInfoID INNER JOIN
                            dbo.LotteryBetLimit ON dbo.LotteryBetLimitMap.LimitID = dbo.LotteryBetLimit.ID
WHERE          (dbo.LotteryInfo.LotteryInfoID > 0)
GO
/****** Object:  View [dbo].[VwLotteryTypeLimit]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwLotteryTypeLimit]
AS
SELECT          dbo.LotteryType.LotteryTypeID, dbo.LotteryType.LotteryTypeName, dbo.LotteryType.LotteryTypeCode, 
                            dbo.LotteryType.LotteryClassID, dbo.LotteryType.CompanyID, dbo.LotteryType.PeriodInterval, 
                            dbo.LotteryType.RealPlayTime, dbo.LotteryType.MaxBonusMoneyPool, dbo.LotteryType.DrawBonusPercentage, 
                            dbo.LotteryType.IsEnableAI, dbo.LotteryType.AIType, dbo.LotteryType.CompanyWinPercentage, 
                            dbo.LotteryType.UserWinPercentage, dbo.LotteryType.CompanyPresetCompensation, dbo.LotteryType.URL, 
                            dbo.LotteryType.FamliyID, dbo.LotteryType.FamliyISort, dbo.LotteryType.NewOrHot, dbo.LotteryType.Status, 
                            dbo.LotteryType.LotteryType_TableID, dbo.LotteryBetLimitMap.LimitID, dbo.LotteryBetLimit.LimitName, 
                            dbo.LotteryBetLimit.LimitMin, dbo.LotteryBetLimit.LimitMax, dbo.LotteryBetLimitMap.ParentID, 
                            dbo.LotteryBetLimitMap.ID AS LotteryBetLimitMapID, dbo.LotteryBetLimitMap.LotteryInfoID, 
                            dbo.LotteryBetLimit.ID AS LotteryBetLimitID
FROM              dbo.LotteryType INNER JOIN
                            dbo.LotteryBetLimitMap ON dbo.LotteryType.LotteryTypeID = dbo.LotteryBetLimitMap.LotteryTypeID INNER JOIN
                            dbo.LotteryBetLimit ON dbo.LotteryBetLimitMap.LimitID = dbo.LotteryBetLimit.ID
WHERE          (dbo.LotteryBetLimitMap.LotteryInfoID = 0) AND (dbo.LotteryBetLimitMap.ParentID = 0) OR
                            (dbo.LotteryBetLimitMap.LotteryInfoID IS NULL)
GO
/****** Object:  Table [dbo].[MGroup]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MGroup](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MGroupName] [nvarchar](500) NULL,
	[IsDefault] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MGMap]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MGMap](
	[FID] [int] NOT NULL,
	[MGroupID] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MGMap_1] PRIMARY KEY CLUSTERED 
(
	[FID] ASC,
	[MGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwMFGroup]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwMFGroup]
AS
SELECT          dbo.MGMap.FID, dbo.MGroup.MGroupName, dbo.MemberShip.MemberID, dbo.MemberShip.UserName, 
                            dbo.MemberShip.Pwd, dbo.MemberShip.UserLevelID, dbo.MemberShip.MGroupID, dbo.MemberShip.Birthday, 
                            dbo.MemberShip.MoneyPwd, dbo.MemberShip.NickName, dbo.MemberShip.FullName, 
                            dbo.MemberShip.AgentParentID, dbo.MemberShip.AgentPositionTakingRebate, dbo.MemberShip.AgentParentMap, 
                            dbo.MemberShip.AgentLevelSCID, dbo.MemberShip.ReferralParentID, dbo.MemberShip.ReferralPayType, 
                            dbo.MemberShip.ReferralLayerLevel, dbo.MemberShip.ReferralMap, dbo.MemberShip.ReferralCashRebate, 
                            dbo.MemberShip.Email, dbo.MemberShip.Phone, dbo.MemberShip.LoginTime, dbo.MemberShip.LastLoginTime, 
                            dbo.MemberShip.LoginIP, dbo.MemberShip.TotalBalance, dbo.MemberShip.MonthDeposit, 
                            dbo.MemberShip.TotalDeposit, dbo.MemberShip.MaxWinAmount, dbo.MemberShip.TotalRealBet, 
                            dbo.MemberShip.ReferralLink, dbo.MemberShip.UserType, dbo.MemberShip.IsMultiLogin, 
                            dbo.MemberShip.WalletIsLock, dbo.MemberShip.FirstPwd, dbo.MemberShip.SecondPwd, 
                            dbo.MemberShip.CashRebatePayType, dbo.MemberShip.CashBackRebatePayType, dbo.MemberShip.IsEditPhone, 
                            dbo.MemberShip.IsEmailValidator, dbo.MemberShip.IsEditEmail, dbo.MemberShip.IsFirst, dbo.MemberShip.IsLock, 
                            dbo.MemberShip.IsEnable, dbo.MemberShip.IsOnline, dbo.MemberShip.CreateBy, dbo.MemberShip.CreateDate, 
                            dbo.MemberShip.UpdateBy, dbo.MemberShip.UpdateDate
FROM              dbo.MGroup INNER JOIN
                            dbo.MemberShip ON dbo.MGroup.ID = dbo.MemberShip.MGroupID INNER JOIN
                            dbo.MGMap ON dbo.MGroup.ID = dbo.MGMap.MGroupID
GO
/****** Object:  View [dbo].[VwMPlayer]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VwMPlayer]
AS
SELECT    lt.LotteryTypeName, lt.LotteryTypeID, lt.LotteryClassID, lt.LotteryTypeCode, mp.MemberID, mp.LotteryInfoID, mp.CompanyID, 
                     mp.CurrentPeriod, mp.IsReset, mp.ShowResultDate, mp.LotteryInfoName, mp.SelectedNums, mp.IsAfter, mp.IsWinStop, 
                     mp.ManualBet, mp.Multiple, mp.DiscountPrice, mp.Price, mp.Qty, mp.IsWin, mp.RebatePro, mp.RebateProMoney, mp.WinMoney, 
                     mp.CreateID, mp.CreateDate, mp.UpdateID, mp.UpdateDate, mp.CashRebatePayType, mp.ReferralPayType, 
                     mp.CashBackRebatePayType, mp.IsCashBackWriteReport, mp.IsCashRebateWriteReport, mp.IsReferralWriteReport, mp.ID, 
                     mp.GameDealerMemberID, mp.SecondMPlayerID, mp.UserName, li.DrawTypeID, gm.IsTest, mp.WinMoneyWithCapital
FROM        dbo.MPlayer AS mp WITH (nolock) LEFT OUTER JOIN
                     dbo.LotteryInfo AS li ON li.LotteryInfoID = mp.LotteryInfoID LEFT OUTER JOIN
                     dbo.LotteryType AS lt ON li.LotteryTypeID = lt.LotteryTypeID LEFT OUTER JOIN
                     dbo.GameDealerMemberShip AS gm ON gm.MemberID = mp.GameDealerMemberID
GO
/****** Object:  Table [dbo].[FunctionGroup]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunctionGroup](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[FName] [nvarchar](500) NULL,
	[FURL] [nvarchar](500) NULL,
	[LKey] [nvarchar](500) NULL,
	[ParentID] [int] NOT NULL,
	[IsDropdown] [bit] NULL,
	[IsDefault] [bit] NULL,
	[IsRead] [bit] NULL,
	[GroupA] [int] NOT NULL,
	[GroupB] [int] NOT NULL,
	[Sort] [int] NULL,
	[IsBO] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_FunctionGroup_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIDefault]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIDefault](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Controller] [nvarchar](500) NOT NULL,
	[Action] [nvarchar](500) NOT NULL,
	[Sort] [int] NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_FunctionDefault] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FGMap]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FGMap](
	[APIID] [int] NOT NULL,
	[FID] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_FGMap_1] PRIMARY KEY CLUSTERED 
(
	[APIID] ASC,
	[FID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwFGroup]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwFGroup]
AS
SELECT          dbo.APIDefault.Controller, dbo.APIDefault.Action, dbo.FGMap.APIID, dbo.FunctionGroup.ID, dbo.FunctionGroup.FName, 
                            dbo.FunctionGroup.ParentID, dbo.FunctionGroup.IsDropdown, dbo.FunctionGroup.Sort, dbo.FunctionGroup.IsBO, 
                            dbo.FunctionGroup.CreateBy, dbo.FunctionGroup.CreateDate, dbo.FunctionGroup.UpdateBy, 
                            dbo.FunctionGroup.UpdateDate
FROM              dbo.APIDefault INNER JOIN
                            dbo.FGMap ON dbo.APIDefault.ID = dbo.FGMap.APIID INNER JOIN
                            dbo.FunctionGroup ON dbo.FGMap.FID = dbo.FunctionGroup.ID
GO
/****** Object:  Table [dbo].[PlatformPromotion]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlatformPromotion](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PromotionName] [nvarchar](200) NOT NULL,
	[PromotionPeriodS] [datetime] NOT NULL,
	[PromotionPeriodE] [datetime] NOT NULL,
	[SystemConfigTypeID] [int] NOT NULL,
	[UserLevelID] [nvarchar](200) NULL,
	[Content] [nvarchar](max) NULL,
	[Img] [nvarchar](max) NULL,
	[MinDepositMoney] [nvarchar](200) NULL,
	[BonusPercentage] [nvarchar](10) NOT NULL,
	[MaxBonus] [nvarchar](200) NOT NULL,
	[UnlockLossPercentage] [nvarchar](10) NULL,
	[UnlockWithdrawalMultiple] [int] NOT NULL,
	[UnlockWithdrawalTask] [nvarchar](200) NOT NULL,
	[LotteryTypeID] [nvarchar](200) NOT NULL,
	[Status] [bit] NOT NULL,
	[IsFirstPromotion] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PlatformActivity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MPromotion]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MPromotion](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PromotionID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[LotteryTypeID] [nvarchar](200) NOT NULL,
	[DepositAmount] [nvarchar](200) NOT NULL,
	[TotalBonus] [nvarchar](200) NOT NULL,
	[TurnOverAmount] [nvarchar](200) NOT NULL,
	[TotalPlayerWinAmount] [nvarchar](200) NOT NULL,
	[TotalPlayerAmount] [nvarchar](200) NOT NULL,
	[UnlockWithdrawalTask] [nvarchar](200) NOT NULL,
	[JoinDate] [datetime] NOT NULL,
	[IslockWithdrawal] [bit] NOT NULL,
	[Remark] [nvarchar](200) NULL,
 CONSTRAINT [PK_MPromotion_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwMPromotion]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwMPromotion]
AS
SELECT          dbo.MPromotion.ID AS Expr1, dbo.MPromotion.PromotionID, dbo.MPromotion.MemberID, 
                            dbo.MPromotion.DepositAmount, dbo.MPromotion.TotalPlayerAmount, dbo.MPromotion.UnlockWithdrawalTask, 
                            dbo.MPromotion.JoinDate, dbo.MPromotion.IslockWithdrawal, dbo.PlatformPromotion.BonusPercentage, 
                            CAST(dbo.MPromotion.DepositAmount AS decimal(18, 4)) 
                            * CAST(dbo.PlatformPromotion.BonusPercentage AS decimal(18, 4)) AS BonusAmount, 
                            dbo.MPromotion.TurnOverAmount, dbo.MPromotion.LotteryTypeID, dbo.PlatformPromotion.PromotionName, 
                            dbo.PlatformPromotion.PromotionPeriodS, dbo.PlatformPromotion.PromotionPeriodE, 
                            dbo.PlatformPromotion.SystemConfigTypeID, dbo.SystemConfig.ConfigName, dbo.SystemConfig.ConfigNotice, 
                            dbo.SystemConfig.ConfigValues, dbo.SystemConfig.ConfigTypeID, dbo.SystemConfig.ConfigParentID, 
                            dbo.PlatformPromotion.MinDepositMoney, dbo.PlatformPromotion.MaxBonus, dbo.PlatformPromotion.Status, 
                            dbo.PlatformPromotion.IsFirstPromotion, dbo.PlatformPromotion.UserLevelID, dbo.PlatformPromotion.[Content]
FROM              dbo.SystemConfig INNER JOIN
                            dbo.PlatformPromotion ON dbo.SystemConfig.ID = dbo.PlatformPromotion.SystemConfigTypeID RIGHT OUTER JOIN
                            dbo.MPromotion ON dbo.PlatformPromotion.ID = dbo.MPromotion.PromotionID
GO
/****** Object:  Table [dbo].[MBank]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MBank](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[BankCode] [nvarchar](10) NOT NULL,
	[BankName] [nvarchar](200) NOT NULL,
	[BankNumber] [nvarchar](200) NOT NULL,
	[MailValidatorCode] [nvarchar](200) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BankType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WithDrawal]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WithDrawal](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[CBankID] [int] NOT NULL,
	[MBankID] [int] NOT NULL,
	[RefCode] [nvarchar](200) NULL,
	[Amount] [nvarchar](200) NOT NULL,
	[WithDrawalTypeSCID] [int] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_WithDrawal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwWithdrawal]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwWithdrawal]
AS
SELECT          dbo.WithDrawal.ID, dbo.WithDrawal.MemberID, dbo.WithDrawal.MBankID, dbo.WithDrawal.Amount, 
                            dbo.WithDrawal.WithDrawalTypeSCID, dbo.WithDrawal.CreateBy, dbo.WithDrawal.CreateDate, 
                            dbo.WithDrawal.UpdateBy, dbo.WithDrawal.UpdateDate, dbo.MBank.BankName, dbo.MBank.BankCode, 
                            dbo.MemberShip.UserName, dbo.MBank.BankNumber, dbo.WithDrawal.Remark, dbo.MemberShip.ReferralMap, 
                            dbo.MemberShip.LoginIP, dbo.WithDrawal.RefCode, dbo.WithDrawal.CBankID
FROM              dbo.WithDrawal LEFT OUTER JOIN
                            dbo.MBank ON dbo.WithDrawal.ID = dbo.MBank.ID INNER JOIN
                            dbo.MemberShip ON dbo.WithDrawal.MemberID = dbo.MemberShip.MemberID
GO
/****** Object:  View [dbo].[VwPlatformPromotion]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwPlatformPromotion]
AS
SELECT          dbo.PlatformPromotion.ID, dbo.PlatformPromotion.PromotionName, dbo.PlatformPromotion.PromotionPeriodS, 
                            dbo.PlatformPromotion.PromotionPeriodE, dbo.PlatformPromotion.SystemConfigTypeID, 
                            dbo.PlatformPromotion.UserLevelID, dbo.PlatformPromotion.[Content], dbo.PlatformPromotion.Img, 
                            dbo.PlatformPromotion.MinDepositMoney, dbo.PlatformPromotion.BonusPercentage, 
                            dbo.PlatformPromotion.UnlockWithdrawalMultiple, dbo.PlatformPromotion.UnlockWithdrawalTask, 
                            dbo.PlatformPromotion.LotteryTypeID, dbo.PlatformPromotion.Status, dbo.PlatformPromotion.IsFirstPromotion, 
                            dbo.PlatformPromotion.CreateBy, dbo.PlatformPromotion.CreateDate, dbo.PlatformPromotion.UpdateBy, 
                            dbo.PlatformPromotion.UpdateDate, dbo.SystemConfig.ConfigName, dbo.PlatformPromotion.UnlockLossPercentage, 
                            dbo.PlatformPromotion.MaxBonus
FROM              dbo.PlatformPromotion INNER JOIN
                            dbo.SystemConfig ON dbo.PlatformPromotion.SystemConfigTypeID = dbo.SystemConfig.ID
GO
/****** Object:  Table [dbo].[MPlayerReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MPlayerReport](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[MPlayerID] [int] NOT NULL,
	[LotteryClassID] [int] NULL,
	[LotteryTypeID] [int] NULL,
	[CurrentPeriod] [nvarchar](100) NULL,
	[ReferralParentID] [int] NOT NULL,
	[DiscountPrice] [nvarchar](50) NOT NULL,
	[TypeCode] [nvarchar](200) NULL,
	[Status] [nvarchar](200) NULL,
	[TurnOverMoney] [nvarchar](200) NULL,
	[RecordMoney] [nvarchar](200) NULL,
	[CashRebateMoney] [nvarchar](100) NULL,
	[CashRebateMoneyStatus] [bit] NULL,
	[CashBackRebateMoney] [nvarchar](100) NULL,
	[CashBackRebateMoneyStatus] [bit] NULL,
	[CashRebatePayType] [int] NULL,
	[CashBackRebatePayType] [int] NULL,
	[AgentMoney] [nvarchar](200) NULL,
	[AngentMemberID] [int] NOT NULL,
	[AgentLevelSCID] [int] NULL,
	[ReferralLevel] [nvarchar](200) NULL,
	[ReferralMemberID] [int] NOT NULL,
	[ReferralMoney] [nvarchar](200) NULL,
	[ReferralPayType] [int] NULL,
	[IsReset] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MPlayerReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwMPlayerReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwMPlayerReport]
AS
SELECT          dbo.MPlayerReport.ID, dbo.MPlayerReport.MemberID, dbo.MPlayerReport.MPlayerID, dbo.MPlayerReport.TypeCode, 
                            dbo.MPlayerReport.Status, dbo.MPlayerReport.TurnOverMoney, dbo.MPlayerReport.RecordMoney, 
                            dbo.MPlayerReport.CashRebateMoney, dbo.MPlayerReport.CashBackRebateMoney, 
                            dbo.MPlayerReport.AgentMoney, dbo.MPlayerReport.ReferralMoney, dbo.MPlayerReport.CreateBy, 
                            dbo.MPlayerReport.CreateDate, dbo.MPlayerReport.UpdateBy, dbo.MPlayerReport.UpdateDate, 
                            dbo.MemberShip.UserName, dbo.MPlayerReport.CashRebateMoneyStatus, dbo.MPlayerReport.IsReset, 
                            dbo.MPlayerReport.CashBackRebateMoneyStatus, dbo.MPlayerReport.ReferralLevel, 
                            dbo.MPlayerReport.ReferralMemberID, dbo.MPlayerReport.ReferralParentID, dbo.MPlayerReport.AngentMemberID, 
                            dbo.SystemConfig.ConfigValues AS AgentLevel, dbo.MPlayerReport.AgentLevelSCID, 
                            dbo.MPlayerReport.LotteryClassID, dbo.MPlayerReport.LotteryTypeID, dbo.MPlayerReport.CashRebatePayType, 
                            dbo.MPlayerReport.CashBackRebatePayType, dbo.MPlayerReport.ReferralPayType, 
                            dbo.MPlayerReport.CurrentPeriod, dbo.MPlayerReport.DiscountPrice
FROM              dbo.MemberShip INNER JOIN
                            dbo.MPlayerReport ON dbo.MemberShip.MemberID = dbo.MPlayerReport.MemberID LEFT OUTER JOIN
                            dbo.SystemConfig ON dbo.MPlayerReport.AgentLevelSCID = dbo.SystemConfig.ID
GO
/****** Object:  View [dbo].[VwLotteryInfoHasGRID]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwLotteryInfoHasGRID]
AS
SELECT          li.LotteryInfoID, li.LotteryInfoName, li.LotteryInfoNotice, li.LotteryClassID, li.LotteryTypeID, li.DrawTypeID, li.Status, 
                            li.LotteryInfo_TableID, li.CreateID, li.CreateDate, li.UpdateID, li.UpdateDate, lc.GameRoomID
FROM              dbo.LotteryInfo AS li WITH (nolock) INNER JOIN
                            dbo.LotteryClass AS lc WITH (nolock) ON li.LotteryClassID = lc.LotteryClassID
GO
/****** Object:  Table [dbo].[TransactionsHistory]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionsHistory](
	[TransactionsID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[RefCode] [nvarchar](200) NULL,
	[PMTID] [int] NOT NULL,
	[DepositID] [int] NOT NULL,
	[WithdrawalID] [int] NOT NULL,
	[CBankID] [int] NULL,
	[MBankID] [int] NULL,
	[DebitAmount] [nvarchar](200) NULL,
	[CreditAmount] [nvarchar](200) NULL,
	[Fees] [nvarchar](200) NULL,
	[TransacitonsTypeSCID] [int] NULL,
	[Remark] [nvarchar](max) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TransactionsHistory] PRIMARY KEY CLUSTERED 
(
	[TransactionsID] ASC,
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwTransactionsHistory]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwTransactionsHistory]
AS
SELECT          dbo.TransactionsHistory.TransactionsID, dbo.TransactionsHistory.MemberID, dbo.TransactionsHistory.DebitAmount, 
                            dbo.TransactionsHistory.CreditAmount, dbo.TransactionsHistory.Fees, dbo.Deposit.DepositPayMothed, 
                            dbo.TransactionsHistory.TransacitonsTypeSCID, dbo.TransactionsHistory.Remark, 
                            dbo.TransactionsHistory.CreateBy, dbo.TransactionsHistory.CreateDate, dbo.TransactionsHistory.UpdateBy, 
                            dbo.TransactionsHistory.UpdateDate, dbo.MemberShip.UserName, dbo.SystemConfig.ConfigName, 
                            dbo.MBank.BankName AS MBankName, dbo.MBank.BankNumber AS MBankNumber, 
                            dbo.TransactionsHistory.DepositID, dbo.TransactionsHistory.WithdrawalID, dbo.TransactionsHistory.MBankID, 
                            dbo.TransactionsHistory.CBankID, dbo.TransactionsHistory.RefCode, dbo.MBank.BankCode AS MBankCode, 
                            dbo.BankAcceptable.BankCode AS CBankCode, dbo.BankAcceptable.BankName AS CBankName, 
                            dbo.CBank.BankAccount AS CBankAccount, dbo.CBank.AccountNumber AS CAccountNumber, 
                            dbo.MemberShip.FullName
FROM              dbo.TransactionsHistory LEFT OUTER JOIN
                            dbo.MBank ON dbo.TransactionsHistory.MBankID = dbo.MBank.ID LEFT OUTER JOIN
                            dbo.CBank ON dbo.TransactionsHistory.CBankID = dbo.CBank.ID INNER JOIN
                            dbo.BankAcceptable ON dbo.BankAcceptable.AcceptableID = dbo.CBank.AcceptableID INNER JOIN
                            dbo.MemberShip ON dbo.TransactionsHistory.MemberID = dbo.MemberShip.MemberID INNER JOIN
                            dbo.SystemConfig ON dbo.TransactionsHistory.TransacitonsTypeSCID = dbo.SystemConfig.ID LEFT OUTER JOIN
                            dbo.Deposit ON dbo.TransactionsHistory.DepositID = dbo.Deposit.ID
GO
/****** Object:  Table [dbo].[CashBackR]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashBackR](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CBRSID] [int] NOT NULL,
	[CashBackRebate] [nvarchar](10) NOT NULL,
	[MinLoss] [nvarchar](200) NOT NULL,
	[MaxLoss] [nvarchar](200) NOT NULL,
	[PayType] [int] NOT NULL,
	[UserLevelID] [int] NOT NULL,
	[GameRoomID] [int] NOT NULL,
	[LotteryClassID] [int] NOT NULL,
	[LotteryTypeID] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CashBackRebate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CBRS]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CBRS](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DateS] [datetime] NOT NULL,
	[DateE] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[RebateType] [int] NOT NULL,
	[SettingType] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CashBackRebateSetting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwCashBackRSetting]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwCashBackRSetting]
AS
SELECT          dbo.CashBackR.CBRSID, dbo.CBRS.Name, dbo.CBRS.DateS, dbo.CBRS.DateE, dbo.CBRS.Status, 
                            dbo.CBRS.RebateType, dbo.CashBackR.ID AS CashBackRID, dbo.CashBackR.CashBackRebate, 
                            dbo.CashBackR.UserLevelID, dbo.CashBackR.GameRoomID, dbo.CashBackR.LotteryClassID, dbo.CBRS.SettingType,
                             dbo.CashBackR.LotteryTypeID, dbo.CashBackR.MinLoss, dbo.CashBackR.MaxLoss, dbo.CashBackR.PayType
FROM              dbo.CBRS INNER JOIN
                            dbo.CashBackR ON dbo.CBRS.ID = dbo.CashBackR.CBRSID
GO
/****** Object:  Table [dbo].[CashR]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashR](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CBRSID] [int] NOT NULL,
	[CashRebate] [nvarchar](10) NOT NULL,
	[MinLoss] [nvarchar](200) NOT NULL,
	[MaxLoss] [nvarchar](200) NOT NULL,
	[PayType] [int] NOT NULL,
	[UserLevelID] [int] NOT NULL,
	[GameRoomID] [int] NOT NULL,
	[LotteryClassID] [int] NOT NULL,
	[LotteryTypeID] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CashRebate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VwCashRSetting]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwCashRSetting]
AS
SELECT          dbo.CashR.ID AS CashRID, dbo.CashR.CBRSID, dbo.CBRS.Name, dbo.CBRS.DateS, dbo.CBRS.DateE, 
                            dbo.CBRS.Status, dbo.CBRS.RebateType, dbo.CashR.CashRebate, dbo.CashR.UserLevelID, 
                            dbo.CashR.GameRoomID, dbo.CashR.LotteryClassID, dbo.CashR.LotteryTypeID, dbo.CBRS.SettingType, 
                            dbo.CashR.PayType, dbo.CashR.MaxLoss, dbo.CashR.MinLoss
FROM              dbo.CBRS INNER JOIN
                            dbo.CashR ON dbo.CBRS.ID = dbo.CashR.CBRSID
GO
/****** Object:  Table [dbo].[AgentReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentReport](
	[ID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[LotteryClassID] [int] NOT NULL,
	[AgentMoney] [nvarchar](200) NOT NULL,
	[IsOver] [bit] NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AgentRepot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AreaManagement]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreaManagement](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AreaID] [nvarchar](200) NULL,
	[AreaName] [nvarchar](200) NOT NULL,
	[ConfigID] [int] NOT NULL,
	[IsEnable] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BannerNotice] [nvarchar](max) NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[FileExtension] [nvarchar](20) NOT NULL,
	[BannerContent] [nvarchar](max) NULL,
	[IsEnable] [bit] NOT NULL,
	[DateS] [datetime] NOT NULL,
	[DateE] [datetime] NOT NULL,
	[Type] [nvarchar](20) NULL,
	[FamilyBigID] [varchar](20) NULL,
	[FamilyMiddleID] [varchar](20) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bulletin]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bulletin](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BulletinTitle] [nvarchar](200) NOT NULL,
	[BulletinNotice] [nvarchar](max) NOT NULL,
	[IsEnable] [bit] NOT NULL,
	[DateS] [datetime] NOT NULL,
	[DateE] [datetime] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Bulletin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CBankULevel]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CBankULevel](
	[CBankID] [int] NOT NULL,
	[UserLevelID] [int] NOT NULL,
 CONSTRAINT [PK_CBankULevel] PRIMARY KEY CLUSTERED 
(
	[CBankID] ASC,
	[UserLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CompanyName] [nvarchar](200) NOT NULL,
	[CompanyCode] [nvarchar](200) NOT NULL,
	[APID] [nvarchar](max) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CountryName] [nvarchar](200) NOT NULL,
	[NickName] [nvarchar](200) NOT NULL,
	[Currency] [nvarchar](50) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurrentPeriodByCronJob]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrentPeriodByCronJob](
	[LotteryTypeID] [int] NULL,
	[CurrentPeriod] [nvarchar](50) NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepositFile]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepositFile](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DepositID] [int] NULL,
	[Img] [nvarchar](max) NOT NULL,
	[FileName] [nvarchar](max) NULL,
	[FileExtension] [nvarchar](20) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MBankFile] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepositHistory]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepositHistory](
	[ID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[Amount] [nvarchar](200) NOT NULL,
	[PromotionID] [int] NOT NULL,
	[SystemConfigID] [int] NOT NULL,
	[MBankID] [int] NOT NULL,
	[CBankID] [int] NOT NULL,
	[DepositPayMothed] [nvarchar](200) NOT NULL,
	[RefCode] [nvarchar](200) NULL,
	[DepositTypeSCID] [int] NOT NULL,
	[MaxAmount] [int] NULL,
	[MinAmount] [int] NULL,
	[Remark] [nvarchar](max) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DepositHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepositType]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepositType](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DepositTypeName] [nvarchar](200) NOT NULL,
	[DepositTypeNotice] [nvarchar](max) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DepositType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DrawType]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DrawType](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DrawTypeName] [nvarchar](50) NOT NULL,
	[DrawTypeNotice] [nvarchar](50) NULL,
	[DrawTypeStyle] [nvarchar](max) NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CalculType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorCode]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorCode](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ErrorCodeID] [nvarchar](200) NOT NULL,
	[ErrorMsg] [nvarchar](max) NOT NULL,
	[LanguageID] [int] NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ErrorCode_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FieldType]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldType](
	[FieldTypeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LanguageTypeID] [int] NOT NULL,
	[DNS] [nvarchar](max) NULL,
	[ControllerName] [nvarchar](max) NULL,
	[ActionName] [nvarchar](max) NULL,
	[HasPageStatus] [bit] NOT NULL,
	[PageStatus] [nvarchar](500) NULL,
	[FamilyBigID] [nvarchar](200) NULL,
	[FamilyMiddelID] [int] NULL,
	[FamilySmallID] [int] NULL,
	[FieldKey] [nvarchar](500) NULL,
	[FieldValue] [nvarchar](max) NULL,
	[FieldNotice] [nvarchar](500) NULL,
 CONSTRAINT [PK_FieldType] PRIMARY KEY CLUSTERED 
(
	[FieldTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameDealerBuyLottery]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameDealerBuyLottery](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CompanyID] [int] NOT NULL,
	[LotteryTypeCode] [nvarchar](200) NOT NULL,
	[LotteryTypeStatus] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GameDealerBuy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameDealerBuySlot]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameDealerBuySlot](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CompanyID] [int] NOT NULL,
	[SlotTypeCode] [nvarchar](200) NOT NULL,
	[SlotTypeStatus] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GameDealerBuySlot] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameDealerCB]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameDealerCB](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CompanyID] [int] NOT NULL,
	[GameActivie] [nvarchar](50) NOT NULL,
	[CallBackURL] [nvarchar](max) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GameDealerCB] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameDealerWinLoseReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameDealerWinLoseReport](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[GameDealerMemberID] [int] NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[SourceMemberID] [int] NULL,
	[SourceUserName] [nvarchar](200) NULL,
	[AgentParentID] [int] NOT NULL,
	[AgentPositionTakingRebate] [nvarchar](10) NULL,
	[AgentParentMap] [nvarchar](200) NOT NULL,
	[TotalDiscountPrice] [decimal](18, 4) NOT NULL,
	[WinLoseMoney] [decimal](18, 4) NOT NULL,
	[VIPWinLoseMoney] [decimal](18, 4) NOT NULL,
	[TurnOver] [decimal](18, 4) NOT NULL,
	[VIPTurnOver] [decimal](18, 4) NOT NULL,
	[TotalComission] [decimal](18, 4) NOT NULL,
	[Profit] [decimal](18, 4) NOT NULL,
	[VIPProfit] [decimal](18, 4) NOT NULL,
	[UpperTotal] [decimal](18, 4) NOT NULL,
	[VIPUpperTotal] [decimal](18, 4) NOT NULL,
	[InitialCredit] [decimal](18, 4) NOT NULL,
	[CreditBalance] [decimal](18, 4) NOT NULL,
	[CashBalance] [decimal](18, 4) NOT NULL,
	[Platform] [nvarchar](200) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GameDealerWinLoseReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameRoomType]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameRoomType](
	[GameRoomID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[GamePwd] [nvarchar](200) NULL,
	[GameName] [nvarchar](200) NOT NULL,
	[GameType] [nvarchar](50) NOT NULL,
	[MinCommission] [nvarchar](200) NOT NULL,
	[MaxCommission] [nvarchar](200) NOT NULL,
	[Status] [bit] NOT NULL,
	[GameRoom_TableID] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GameRoomType] PRIMARY KEY CLUSTERED 
(
	[GameRoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IPManagement]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IPManagement](
	[ID] [int] NOT NULL,
	[BlockIP] [nvarchar](200) NULL,
	[BlockIPRange] [nvarchar](200) NULL,
	[IsBlock] [bit] NOT NULL,
	[IsWhite] [bit] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BlockIP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageType]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageType](
	[LanguageTypeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LanguageName] [nvarchar](50) NOT NULL,
	[LanguageAbbreviation] [nvarchar](50) NOT NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_LanguageType] PRIMARY KEY CLUSTERED 
(
	[LanguageTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginHistory]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginHistory](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NULL,
	[LoginAreaID] [int] NULL,
	[LoginIP] [nvarchar](200) NULL,
	[LoginTime] [datetime] NULL,
	[Platform] [nvarchar](200) NULL,
	[ActionOS] [nvarchar](200) NULL,
	[OSVersion] [nvarchar](200) NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LoginHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LotteryContent]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryContent](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LotteryInfoID] [int] NOT NULL,
	[ContentText] [nvarchar](50) NULL,
	[ContentStyle] [nvarchar](200) NULL,
	[ContentValue] [nvarchar](200) NULL,
	[ContentImg] [nvarchar](max) NULL,
	[Types] [int] NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [date] NOT NULL,
 CONSTRAINT [PK_LotteryContent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LotteryTypeMaintain]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryTypeMaintain](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LotteryTypeID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[IsMaintain] [bit] NOT NULL,
	[IsCloseGame] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
 CONSTRAINT [PK_LotteryTypeMaintain] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LotteryTypeRankin]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LotteryTypeRankin](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[LotteryBettingRanking] [int] NOT NULL,
	[LotteryTypeID] [int] NOT NULL,
	[LotteryTypeName] [nvarchar](200) NOT NULL,
	[URL] [nvarchar](200) NOT NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LotteryTypeRankin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MCompany]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCompany](
	[CompanyID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CompanyName] [nvarchar](200) NOT NULL,
	[CompanyCode] [nvarchar](200) NOT NULL,
	[CashRebate] [nvarchar](10) NOT NULL,
	[CashBackRebate] [nvarchar](10) NOT NULL,
	[Sort] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MWCompany] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberCountry]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberCountry](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CountryID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MemberCountry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MPlayerTopSort]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MPlayerTopSort](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[UserName] [nvarchar](200) NOT NULL,
	[LotteryTypeID] [int] NOT NULL,
	[LotteryTypeName] [nvarchar](200) NOT NULL,
	[LotteryTypeCode] [nvarchar](200) NULL,
	[TotalBet] [decimal](18, 4) NOT NULL,
	[TotalWin] [decimal](18, 4) NOT NULL,
	[Sort] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MPlayerTopSort] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MPlayerTotalSum]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MPlayerTotalSum](
	[Date] [datetime] NOT NULL,
	[TotalTurnover] [varchar](200) NOT NULL,
	[TotalBetAmount] [varchar](200) NOT NULL,
	[TotalWinLose] [varchar](200) NOT NULL,
	[TotalWinMoney] [varchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MPositionProfitMap]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MPositionProfitMap](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AgentParentMap] [nvarchar](max) NULL,
	[MemberID] [int] NULL,
	[GameDealerMemberID] [int] NULL,
	[SubMemberID] [int] NULL,
	[CompanyID] [int] NULL,
	[PositionTaking] [nvarchar](200) NULL,
	[PositionTakingProfit] [nvarchar](200) NULL,
	[AgentLevelSCID] [int] NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MPositionProfitMap] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MPositionTaking]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MPositionTaking](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[PositionTaking] [nvarchar](200) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MPositionTaking] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MPositionTakingHistory]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MPositionTakingHistory](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SourcePTID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[PositionTaking] [nvarchar](200) NULL,
	[EffectiveS] [datetime] NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MPositionTakingHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OLotteryHistory]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OLotteryHistory](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LotteryTypeID] [int] NOT NULL,
	[CurrentLotteryTime] [datetime] NOT NULL,
	[CurrentPeriod] [nvarchar](100) NOT NULL,
	[Result] [nvarchar](max) NULL,
	[IsOpen] [bit] NOT NULL,
	[RealCloseTime] [datetime] NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[EndPlayTime] [datetime] NOT NULL,
	[ResultNotice] [nvarchar](max) NULL,
	[IsReset] [bit] NOT NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LotteryHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlatformProfitLoss]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlatformProfitLoss](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[ProfitLossType] [nvarchar](max) NULL,
	[PrizeMoney] [nvarchar](max) NULL,
	[ProfitLossMoney] [nvarchar](max) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PrizePlatform] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferralLayer]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferralLayer](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ReferralLevel] [nvarchar](50) NULL,
	[ReferralName] [nvarchar](50) NULL,
	[ReferralPercentage] [nvarchar](50) NULL,
	[PayType] [int] NOT NULL,
	[GameRoomTypeID] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReferralLayer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReferralReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferralReport](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[ParentID] [int] NOT NULL,
	[ReferralMoney] [nvarchar](200) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReferralReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEO]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEO](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[PageTitle] [nvarchar](200) NOT NULL,
	[PageURL] [nvarchar](200) NOT NULL,
	[MetaTitle] [nvarchar](200) NOT NULL,
	[MetaKeyword] [nvarchar](max) NOT NULL,
	[MetaDescription] [nvarchar](max) NOT NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SEO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotMPlayer]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotMPlayer](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SecondSlotMPlayerID] [int] NULL,
	[CompanyID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[SlotTypeID] [int] NOT NULL,
	[SlotInfoID] [int] NOT NULL,
	[RoundId] [nvarchar](100) NOT NULL,
	[SlotTypeName] [nvarchar](200) NOT NULL,
	[SlotTypeCode] [nvarchar](200) NOT NULL,
	[SlotInfoName] [nvarchar](200) NOT NULL,
	[RoundDetails] [nvarchar](200) NOT NULL,
	[Timestamp] [nvarchar](200) NOT NULL,
	[Price] [nvarchar](100) NOT NULL,
	[Qty] [nvarchar](50) NOT NULL,
	[IsWin] [bit] NULL,
	[Reference] [nvarchar](500) NULL,
	[RebatePro] [nvarchar](10) NULL,
	[RebateProMoney] [nvarchar](50) NULL,
	[WinMoney] [nvarchar](50) NULL,
	[IsWriteReport] [bit] NOT NULL,
	[CashBackMoney] [nvarchar](50) NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SlotMPlayer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotMPlayerRefund]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotMPlayerRefund](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CompanyID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[SlotTypeID] [int] NOT NULL,
	[SlotInfoID] [int] NOT NULL,
	[RoundId] [nvarchar](100) NOT NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SlotMPlayerRefund] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotMPlayerReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotMPlayerReport](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[MPlayerID] [int] NOT NULL,
	[ReferralParentID] [int] NOT NULL,
	[TypeCode] [nvarchar](200) NULL,
	[Status] [nvarchar](200) NULL,
	[TurnOverMoney] [nvarchar](200) NULL,
	[RecordMoney] [nvarchar](200) NULL,
	[CashRebateMoney] [nvarchar](100) NULL,
	[CashRebateMoneyStatus] [bit] NULL,
	[CashBackRebateMoney] [nvarchar](100) NULL,
	[CashBackRebateMoneyStatus] [bit] NULL,
	[AgentMoney] [nvarchar](200) NULL,
	[AngentMemberID] [int] NOT NULL,
	[AgentLevelSCID] [int] NULL,
	[ReferralLevel] [nvarchar](200) NULL,
	[ReferralMemberID] [int] NOT NULL,
	[ReferralMoney] [nvarchar](200) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SlotMPlayerReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotStatement]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotStatement](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[RoundId] [nvarchar](100) NULL,
	[LotteryInfoID] [int] NOT NULL,
	[Balance] [nvarchar](max) NOT NULL,
	[SlotTypeName] [nvarchar](max) NOT NULL,
	[ValueMoney] [nvarchar](max) NOT NULL,
	[Total] [nvarchar](max) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SlotStatement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotTransaction]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotTransaction](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SlotMPlayerID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[RoundId] [nvarchar](100) NOT NULL,
	[Price] [nvarchar](100) NULL,
	[Qty] [nvarchar](50) NOT NULL,
	[IsWin] [bit] NULL,
	[Bonus] [nvarchar](50) NULL,
	[WinMoney] [nvarchar](50) NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SlotTransaction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlotType]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlotType](
	[SlotTypeID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SlotTypeName] [nvarchar](200) NOT NULL,
	[SlotTypeCode] [nvarchar](200) NOT NULL,
	[SlotRows] [nvarchar](50) NOT NULL,
	[Reels] [nvarchar](50) NOT NULL,
	[LotteryClassID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[MaxBonusMoneyPool] [int] NOT NULL,
	[DrawBonusPercentage] [nvarchar](20) NOT NULL,
	[IsEnableAI] [bit] NULL,
	[AIType] [int] NULL,
	[CompanyWinPercentage] [nvarchar](20) NULL,
	[UserWinPercentage] [nvarchar](20) NULL,
	[URL] [nvarchar](200) NOT NULL,
	[FamliyID] [int] NULL,
	[FamliySort] [int] NULL,
	[NewOrHot] [int] NULL,
	[Status] [bit] NOT NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SlotType] PRIMARY KEY CLUSTERED 
(
	[SlotTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SQLLog]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLLog](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TableName] [nvarchar](200) NOT NULL,
	[CommandStr] [nvarchar](max) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SQLLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statement]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statement](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[CurrentPeriod] [nvarchar](100) NULL,
	[LotteryInfoID] [int] NOT NULL,
	[LotteryClassID] [int] NULL,
	[LotteryTypeID] [int] NULL,
	[ShowResultDate] [datetime] NOT NULL,
	[Balance] [nvarchar](max) NOT NULL,
	[TypeCode] [nvarchar](max) NOT NULL,
	[ValueMoney] [nvarchar](max) NOT NULL,
	[Total] [nvarchar](max) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Statement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemLog]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemLog](
	[ID] [int] NOT NULL,
	[ErrorFunction] [nvarchar](200) NOT NULL,
	[ErrorCode] [nvarchar](200) NOT NULL,
	[ErrorMsg] [nvarchar](max) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SystemLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemTable]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemTable](
	[TableID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TableName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_SystemTable] PRIMARY KEY CLUSTERED 
(
	[TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TotalWinLoseReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TotalWinLoseReport](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[GameDealerMemberID] [int] NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[SourceMemberID] [int] NULL,
	[SourceUserName] [nvarchar](200) NULL,
	[AgentParentID] [int] NOT NULL,
	[AgentPositionTakingRebate] [nvarchar](10) NULL,
	[AgentParentMap] [nvarchar](200) NOT NULL,
	[WinLoseMoney] [decimal](18, 4) NOT NULL,
	[VIPWinLoseMoney] [decimal](18, 4) NOT NULL,
	[TurnOver] [decimal](18, 4) NOT NULL,
	[VIPTurnOver] [decimal](18, 4) NOT NULL,
	[TotalComission] [decimal](18, 4) NOT NULL,
	[Profit] [decimal](18, 4) NOT NULL,
	[VIPProfit] [decimal](18, 4) NOT NULL,
	[UpperTotal] [decimal](18, 4) NOT NULL,
	[VIPUpperTotal] [decimal](18, 4) NOT NULL,
	[InitialCredit] [decimal](18, 4) NOT NULL,
	[CreditBalance] [decimal](18, 4) NOT NULL,
	[CashBalance] [decimal](18, 4) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TotalWinLoseReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UpdateRecords]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpdateRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](200) NULL,
	[UpdateDetail] [nvarchar](max) NULL,
	[UpdateBy] [nvarchar](200) NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLevel]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLevel](
	[LevelID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LevelName] [nvarchar](50) NOT NULL,
	[ULevel] [int] NOT NULL,
	[LevelNotice] [nvarchar](200) NULL,
	[MinAddCredit] [nvarchar](100) NULL,
	[MinTotalRealBet] [nvarchar](100) NULL,
	[SPCashBack] [nvarchar](50) NULL,
	[Sort] [int] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserLevel] PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebSite]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebSite](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BrandName] [nvarchar](200) NOT NULL,
	[PageTitle] [nvarchar](200) NOT NULL,
	[WebsiteStyleSCID] [int] NOT NULL,
	[GoogleAnalytics] [nvarchar](max) NOT NULL,
	[FooterText] [nvarchar](max) NOT NULL,
	[WebsiteUrl] [nvarchar](200) NOT NULL,
	[MWebsiteUrl] [nvarchar](200) NULL,
	[LogoImg] [nvarchar](max) NOT NULL,
	[LogoFileName] [nvarchar](200) NOT NULL,
	[LogoFileExtension] [nvarchar](20) NOT NULL,
	[FaviconImg] [nvarchar](max) NOT NULL,
	[FaviconFileName] [nvarchar](200) NOT NULL,
	[FaviconFileExtension] [nvarchar](20) NOT NULL,
	[LivecharUrl] [nvarchar](200) NULL,
	[LivechatCode] [nvarchar](max) NULL,
	[Email] [nvarchar](200) NULL,
	[Skype] [nvarchar](200) NULL,
	[Wechat] [nvarchar](200) NULL,
	[Facebook] [nvarchar](200) NULL,
	[Instagram] [nvarchar](200) NULL,
	[Phone] [nvarchar](200) NULL,
	[Line] [nvarchar](200) NULL,
	[Whatsapp] [nvarchar](200) NULL,
	[Twitter] [nvarchar](200) NULL,
	[Google] [nvarchar](200) NULL,
	[CreateID] [int] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[UpdateID] [int] NOT NULL,
	[UpdateDate] [date] NOT NULL,
 CONSTRAINT [PK_WebSite] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WinLoseReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WinLoseReport](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[UserName] [nvarchar](200) NULL,
	[SourceMemberID] [int] NULL,
	[SourceUserName] [nvarchar](200) NULL,
	[AgentParentID] [int] NOT NULL,
	[AgentPositionTakingRebate] [nvarchar](10) NULL,
	[AgentParentMap] [nvarchar](200) NOT NULL,
	[TotalDiscountPrice] [decimal](18, 4) NOT NULL,
	[WinLoseMoney] [decimal](18, 4) NOT NULL,
	[VIPWinLoseMoney] [decimal](18, 4) NOT NULL,
	[TurnOver] [decimal](18, 4) NOT NULL,
	[VIPTurnOver] [decimal](18, 4) NOT NULL,
	[TotalComission] [decimal](18, 4) NOT NULL,
	[Profit] [decimal](18, 4) NOT NULL,
	[VIPProfit] [decimal](18, 4) NOT NULL,
	[UpperTotal] [decimal](18, 4) NOT NULL,
	[VIPUpperTotal] [decimal](18, 4) NOT NULL,
	[InitialCredit] [decimal](18, 4) NOT NULL,
	[CreditBalance] [decimal](18, 4) NOT NULL,
	[CashBalance] [decimal](18, 4) NOT NULL,
	[Platform] [nvarchar](200) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_WinLoseReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WinLoseReportByGameTotal]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WinLoseReportByGameTotal](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LotteryTypeID] [int] NOT NULL,
	[LotteryInfoID] [int] NULL,
	[MemberID] [int] NULL,
	[PlatfromID] [int] NULL,
	[GameDealerMemberID] [int] NULL,
	[AgentLevelSCID] [int] NULL,
	[AgentMemberID] [int] NULL,
	[AgentGameDealerMemberID] [int] NULL,
	[LotteryInfoName] [nvarchar](200) NULL,
	[SelectedNums] [nvarchar](max) NULL,
	[TotalDiscountPrice] [decimal](18, 4) NOT NULL,
	[SMTotalWinLose] [decimal](18, 4) NOT NULL,
	[MTotalWinLose] [decimal](18, 4) NOT NULL,
	[AGTotalWinLose] [decimal](18, 4) NOT NULL,
	[TotalBet] [decimal](18, 4) NOT NULL,
	[TotalWin] [decimal](18, 4) NOT NULL,
	[TotalLose] [decimal](18, 4) NOT NULL,
	[TotalPending] [decimal](18, 4) NOT NULL,
	[Platform] [nvarchar](200) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_WinLoseReportByGame] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WinLoseReportThirdPartyByGameTotal]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WinLoseReportThirdPartyByGameTotal](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[LotteryTypeID] [int] NOT NULL,
	[LotteryInfoID] [int] NULL,
	[MemberID] [int] NULL,
	[PlatfromID] [int] NULL,
	[GameDealerMemberID] [int] NULL,
	[LotteryInfoName] [nvarchar](200) NULL,
	[SelectedNums] [nvarchar](max) NULL,
	[TotalDiscountPrice] [decimal](18, 4) NOT NULL,
	[TotalBet] [decimal](18, 4) NOT NULL,
	[TotalWin] [decimal](18, 4) NOT NULL,
	[TotalLose] [decimal](18, 4) NOT NULL,
	[TotalPending] [decimal](18, 4) NOT NULL,
	[Platform] [nvarchar](200) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_WinLoseReportThirdPartyByGameTotal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WithDrawalHistory]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WithDrawalHistory](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[MemberID] [int] NOT NULL,
	[Amount] [nvarchar](200) NOT NULL,
	[SystemConfigID] [int] NOT NULL,
	[CBankID] [int] NOT NULL,
	[MBankID] [int] NOT NULL,
	[RefCode] [nvarchar](200) NULL,
	[WithDrawalTypeSCID] [int] NOT NULL,
	[Remark] [nvarchar](max) NULL,
	[CreateBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateBy] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_WithDrawalHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_GameDealerMemberShip_AgentLevelSCID]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_GameDealerMemberShip_AgentLevelSCID] ON [dbo].[GameDealerMemberShip]
(
	[AgentLevelSCID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_GameDealerMemberShip_AgentParentMap]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_GameDealerMemberShip_AgentParentMap] ON [dbo].[GameDealerMemberShip]
(
	[AgentParentMap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_GameDealerMemberShip_LoginToken]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_GameDealerMemberShip_LoginToken] ON [dbo].[GameDealerMemberShip]
(
	[LoginToken] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_GameDealerMemberShip_UserName]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_GameDealerMemberShip_UserName] ON [dbo].[GameDealerMemberShip]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GameDealerMPlayerReport_AgentLevelSCID]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_GameDealerMPlayerReport_AgentLevelSCID] ON [dbo].[GameDealerMPlayerReport]
(
	[AgentLevelSCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GameDealerMPlayerReport_MemberID]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_GameDealerMPlayerReport_MemberID] ON [dbo].[GameDealerMPlayerReport]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GameDealerMPlayerReport_MPlayerID]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_GameDealerMPlayerReport_MPlayerID] ON [dbo].[GameDealerMPlayerReport]
(
	[MPlayerID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_GameDealerMPlayerReport_TypeCode]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_GameDealerMPlayerReport_TypeCode] ON [dbo].[GameDealerMPlayerReport]
(
	[TypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MPlayer_CompanyID]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_MPlayer_CompanyID] ON [dbo].[MPlayer]
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MPlayer_CurrentPeriod]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_MPlayer_CurrentPeriod] ON [dbo].[MPlayer]
(
	[CurrentPeriod] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MPlayer_GameDealerMemberID]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_MPlayer_GameDealerMemberID] ON [dbo].[MPlayer]
(
	[GameDealerMemberID] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MPlayer_LotteryInfoID]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_MPlayer_LotteryInfoID] ON [dbo].[MPlayer]
(
	[LotteryInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MPlayer_MemberID]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_MPlayer_MemberID] ON [dbo].[MPlayer]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MPlayer_UserName]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_MPlayer_UserName] ON [dbo].[MPlayer]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CurrentPeriod]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_CurrentPeriod] ON [dbo].[OLottery]
(
	[CurrentPeriod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IsOpen]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_IsOpen] ON [dbo].[OLottery]
(
	[IsOpen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LotteryTypeID]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_LotteryTypeID] ON [dbo].[OLottery]
(
	[LotteryTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WinLoseReportByGameTotal_GameDealerMemberID]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_WinLoseReportByGameTotal_GameDealerMemberID] ON [dbo].[WinLoseReportByGameTotal]
(
	[GameDealerMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WinLoseReportByGameTotal_LotteryInfoID]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_WinLoseReportByGameTotal_LotteryInfoID] ON [dbo].[WinLoseReportByGameTotal]
(
	[LotteryTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WinLoseReportByGameTotal_MemberID]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_WinLoseReportByGameTotal_MemberID] ON [dbo].[WinLoseReportByGameTotal]
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WinLoseReportByGameTotal_PlatformID]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_WinLoseReportByGameTotal_PlatformID] ON [dbo].[WinLoseReportByGameTotal]
(
	[PlatfromID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WinLoseReportByGameTotal_TotalBet]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_WinLoseReportByGameTotal_TotalBet] ON [dbo].[WinLoseReportByGameTotal]
(
	[TotalBet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WinLoseReportByGameTotal_TotalPending]    Script Date: 8/19/2024 3:43:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_WinLoseReportByGameTotal_TotalPending] ON [dbo].[WinLoseReportByGameTotal]
(
	[TotalPending] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AgentReport] ADD  CONSTRAINT [DF_AgentRepot_IsOver]  DEFAULT ((0)) FOR [IsOver]
GO
ALTER TABLE [dbo].[AreaManagement] ADD  CONSTRAINT [DF_Area_Status]  DEFAULT ((0)) FOR [ConfigID]
GO
ALTER TABLE [dbo].[BankAcceptable] ADD  CONSTRAINT [DF_AcceptedBank_PMTID]  DEFAULT ((1)) FOR [PMTID]
GO
ALTER TABLE [dbo].[BankAcceptable] ADD  CONSTRAINT [DF_AcceptedBank_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[BankPayMainType] ADD  CONSTRAINT [DF_PayMainType_Status1]  DEFAULT ((0)) FOR [IsClose]
GO
ALTER TABLE [dbo].[BankPayMainType] ADD  CONSTRAINT [DF_PayMainType_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CashBackR] ADD  CONSTRAINT [DF_CashBackR_CashBackRebateSettingID]  DEFAULT ((0)) FOR [CBRSID]
GO
ALTER TABLE [dbo].[CashBackR] ADD  CONSTRAINT [DF_Table_1_CashRebate]  DEFAULT ('0.00') FOR [CashBackRebate]
GO
ALTER TABLE [dbo].[CashBackR] ADD  CONSTRAINT [DF_CashBackR_MinLoss]  DEFAULT ((100000)) FOR [MinLoss]
GO
ALTER TABLE [dbo].[CashBackR] ADD  CONSTRAINT [DF_CashBackR_MaxLoss]  DEFAULT ((10000000)) FOR [MaxLoss]
GO
ALTER TABLE [dbo].[CashBackR] ADD  CONSTRAINT [DF_CashBackR_PayType]  DEFAULT ((34)) FOR [PayType]
GO
ALTER TABLE [dbo].[CashBackR] ADD  CONSTRAINT [DF_CashBackRebate_UserLevelID]  DEFAULT ((0)) FOR [UserLevelID]
GO
ALTER TABLE [dbo].[CashBackR] ADD  CONSTRAINT [DF_CashBackRebate_GameRoomID]  DEFAULT ((0)) FOR [GameRoomID]
GO
ALTER TABLE [dbo].[CashBackR] ADD  CONSTRAINT [DF_CashBackRebate_LotteryClassID]  DEFAULT ((0)) FOR [LotteryClassID]
GO
ALTER TABLE [dbo].[CashBackR] ADD  CONSTRAINT [DF_CashBackR_LotteryTypeID]  DEFAULT ((0)) FOR [LotteryTypeID]
GO
ALTER TABLE [dbo].[CashR] ADD  CONSTRAINT [DF_CashR_UserLevelID1]  DEFAULT ((0)) FOR [CBRSID]
GO
ALTER TABLE [dbo].[CashR] ADD  CONSTRAINT [DF_CashRebate_CashRebate]  DEFAULT ('0.00') FOR [CashRebate]
GO
ALTER TABLE [dbo].[CashR] ADD  CONSTRAINT [DF_CashR_MinLoss]  DEFAULT ((100000)) FOR [MinLoss]
GO
ALTER TABLE [dbo].[CashR] ADD  CONSTRAINT [DF_CashR_MaxLoss]  DEFAULT ((10000000)) FOR [MaxLoss]
GO
ALTER TABLE [dbo].[CashR] ADD  CONSTRAINT [DF_CashR_PayType]  DEFAULT ((34)) FOR [PayType]
GO
ALTER TABLE [dbo].[CashR] ADD  CONSTRAINT [DF_CashRebate_UserLevelID]  DEFAULT ((0)) FOR [UserLevelID]
GO
ALTER TABLE [dbo].[CashR] ADD  CONSTRAINT [DF_CashRebate_GameRoomID]  DEFAULT ((0)) FOR [GameRoomID]
GO
ALTER TABLE [dbo].[CashR] ADD  CONSTRAINT [DF_CashRebate_LotteryTypeID]  DEFAULT ((0)) FOR [LotteryClassID]
GO
ALTER TABLE [dbo].[CashR] ADD  CONSTRAINT [DF_CashR_LotteryClassID1]  DEFAULT ((0)) FOR [LotteryTypeID]
GO
ALTER TABLE [dbo].[CBank] ADD  CONSTRAINT [DF_CBank_MemberID]  DEFAULT ((0)) FOR [MemberID]
GO
ALTER TABLE [dbo].[CBank] ADD  CONSTRAINT [DF_CBank_AcceptableID]  DEFAULT ((0)) FOR [AcceptableID]
GO
ALTER TABLE [dbo].[CBank] ADD  CONSTRAINT [DF_CBank_MinAmount]  DEFAULT ((0)) FOR [MinAmount]
GO
ALTER TABLE [dbo].[CBank] ADD  CONSTRAINT [DF_CBank_MaxAmount]  DEFAULT ((100000)) FOR [MaxAmount]
GO
ALTER TABLE [dbo].[CBRS] ADD  CONSTRAINT [DF_CashBackRebateSetting_DateS]  DEFAULT (((1911)/(1))/(1)) FOR [DateS]
GO
ALTER TABLE [dbo].[CBRS] ADD  CONSTRAINT [DF_CashBackRebateSetting_DateE]  DEFAULT (((2999)/(12))/(31)) FOR [DateE]
GO
ALTER TABLE [dbo].[CBRS] ADD  CONSTRAINT [DF_CBRS_RebateType1]  DEFAULT ((1)) FOR [RebateType]
GO
ALTER TABLE [dbo].[CBRS] ADD  CONSTRAINT [DF_CBRS_RebateType]  DEFAULT ((1)) FOR [SettingType]
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [DF_Company_APID]  DEFAULT (N'Free30') FOR [APID]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_NickName]  DEFAULT ('MYR') FOR [NickName]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_Currency]  DEFAULT ('MYR') FOR [Currency]
GO
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF_Country_CreateBy]  DEFAULT ((0)) FOR [CreateBy]
GO
ALTER TABLE [dbo].[Deposit] ADD  CONSTRAINT [DF_Deposit_PMTID]  DEFAULT ((0)) FOR [PMTID]
GO
ALTER TABLE [dbo].[Deposit] ADD  CONSTRAINT [DF_Deposit_PMTID1]  DEFAULT ((0)) FOR [PMTLogID]
GO
ALTER TABLE [dbo].[Deposit] ADD  CONSTRAINT [DF_Deposit_Amount]  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[Deposit] ADD  CONSTRAINT [DF_Deposit_TotalBonus]  DEFAULT ((0)) FOR [TotalBonus]
GO
ALTER TABLE [dbo].[Deposit] ADD  CONSTRAINT [DF_Deposit_SystemConfigID]  DEFAULT ((0)) FOR [DepositTypeSCID]
GO
ALTER TABLE [dbo].[Deposit] ADD  CONSTRAINT [DF_Deposit_DepositTypeSystemConfigID1]  DEFAULT ((999999999)) FOR [MaxAmount]
GO
ALTER TABLE [dbo].[Deposit] ADD  CONSTRAINT [DF_Deposit_MaxAmount1]  DEFAULT ((0)) FOR [MinAmount]
GO
ALTER TABLE [dbo].[DepositHistory] ADD  CONSTRAINT [DF_DepositHistory_PromotionID]  DEFAULT ((0)) FOR [PromotionID]
GO
ALTER TABLE [dbo].[DepositHistory] ADD  CONSTRAINT [DF_DepositHistory_DepositStatus]  DEFAULT ((0)) FOR [SystemConfigID]
GO
ALTER TABLE [dbo].[DepositHistory] ADD  CONSTRAINT [DF_DepositHistory_DepositTypeSCID]  DEFAULT ((0)) FOR [DepositTypeSCID]
GO
ALTER TABLE [dbo].[DepositHistory] ADD  CONSTRAINT [DF_DepositHistory_MaxAmount]  DEFAULT ((999999999)) FOR [MaxAmount]
GO
ALTER TABLE [dbo].[DepositHistory] ADD  CONSTRAINT [DF_DepositHistory_MinAmount]  DEFAULT ((0)) FOR [MinAmount]
GO
ALTER TABLE [dbo].[DepositHistory] ADD  CONSTRAINT [DF_DepositHistory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[DepositHistory] ADD  CONSTRAINT [DF_DepositHistory_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[DrawType] ADD  CONSTRAINT [DF_CalculType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[DrawType] ADD  CONSTRAINT [DF_CalculType_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[FieldType] ADD  CONSTRAINT [DF_FieldType_HasPageStatus]  DEFAULT ((0)) FOR [HasPageStatus]
GO
ALTER TABLE [dbo].[FieldType] ADD  CONSTRAINT [DF_FieldType_FamliyBigID]  DEFAULT ((0)) FOR [FamilyBigID]
GO
ALTER TABLE [dbo].[FieldType] ADD  CONSTRAINT [DF_FieldType_FamliyMiddelID]  DEFAULT ((0)) FOR [FamilyMiddelID]
GO
ALTER TABLE [dbo].[FieldType] ADD  CONSTRAINT [DF_FieldType_FamliySmallID]  DEFAULT ((0)) FOR [FamilySmallID]
GO
ALTER TABLE [dbo].[FunctionGroup] ADD  CONSTRAINT [DF_UserFunction_ParentID]  DEFAULT ((0)) FOR [ParentID]
GO
ALTER TABLE [dbo].[FunctionGroup] ADD  CONSTRAINT [DF_UserFunction_IsDropdown]  DEFAULT ((0)) FOR [IsDropdown]
GO
ALTER TABLE [dbo].[FunctionGroup] ADD  CONSTRAINT [DF_FunctionGroup_IsDropdown1]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[FunctionGroup] ADD  CONSTRAINT [DF_FunctionGroup_IsDefault3]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[FunctionGroup] ADD  CONSTRAINT [DF_FunctionGroup_IsDefault2]  DEFAULT ((0)) FOR [GroupA]
GO
ALTER TABLE [dbo].[FunctionGroup] ADD  CONSTRAINT [DF_FunctionGroup_IsDefault1]  DEFAULT ((0)) FOR [GroupB]
GO
ALTER TABLE [dbo].[FunctionGroup] ADD  CONSTRAINT [DF_FunctionGroup_IsBO]  DEFAULT ((0)) FOR [IsBO]
GO
ALTER TABLE [dbo].[GameDealerBuyLottery] ADD  CONSTRAINT [DF_GameDealerBuy_LotteryTypeStatus]  DEFAULT ((1)) FOR [LotteryTypeStatus]
GO
ALTER TABLE [dbo].[GameDealerBuySlot] ADD  CONSTRAINT [DF_Table_1_LotteryTypeStatus]  DEFAULT ((1)) FOR [SlotTypeStatus]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_CompanyID]  DEFAULT ((0)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_Pwd]  DEFAULT ('') FOR [Pwd]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_MGroupID]  DEFAULT ((1)) FOR [MGroupID]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_UserLevelID]  DEFAULT ((1)) FOR [UserLevelID]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_AgentParentID]  DEFAULT ((0)) FOR [AgentParentID]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_AgentPositionTakingRebate]  DEFAULT ((0.0)) FOR [AgentPositionTakingRebate]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_ReferralParentID]  DEFAULT ((0)) FOR [ReferralParentID]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_ReferralPayType]  DEFAULT (N'Daily') FOR [ReferralPayType]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_ReferralLayerLevel]  DEFAULT ((0)) FOR [ReferralLayerLevel]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_ReferralMap]  DEFAULT (N'/') FOR [ReferralMap]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_ReferralCashRebate]  DEFAULT ((0.001)) FOR [ReferralCashRebate]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_LoginWrongTimes]  DEFAULT ((0)) FOR [LoginWrongTimes]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_TotalBalance]  DEFAULT ((0)) FOR [TotalBalance]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_MonthDeposit]  DEFAULT ((0)) FOR [MonthDeposit]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_TotalDeposit]  DEFAULT ((0)) FOR [TotalDeposit]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_IsMultiLogin]  DEFAULT ((0)) FOR [IsMultiLogin]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_WalletIsLock]  DEFAULT ((0)) FOR [WalletIsLock]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_CashRebatePayType]  DEFAULT ((1)) FOR [CashRebatePayType]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_CashBackRebatePayType]  DEFAULT ((1)) FOR [CashBackRebatePayType]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_IsEditPhone]  DEFAULT ((1)) FOR [IsEditPhone]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_IsEmailValidator]  DEFAULT ((1)) FOR [IsEmailValidator]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_IsEditEmail]  DEFAULT ((1)) FOR [IsEditEmail]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_IsFirst]  DEFAULT ((0)) FOR [IsFirst]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_IsLock]  DEFAULT ((0)) FOR [IsLock]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_IsEnable]  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_IsOnline]  DEFAULT ((1)) FOR [IsOnline]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_IsTest]  DEFAULT ((0)) FOR [IsTest]
GO
ALTER TABLE [dbo].[GameDealerMemberShip] ADD  CONSTRAINT [DF_GameDealerMemberShip_CreateBy]  DEFAULT ((0)) FOR [CreateBy]
GO
ALTER TABLE [dbo].[GameDealerMPlayer] ADD  CONSTRAINT [DF_GameDealerMPlayer_IsAfter]  DEFAULT ((0)) FOR [IsAfter]
GO
ALTER TABLE [dbo].[GameDealerMPlayer] ADD  CONSTRAINT [DF_GameDealerMPlayer_IsWinStop]  DEFAULT ((0)) FOR [IsWinStop]
GO
ALTER TABLE [dbo].[GameDealerMPlayer] ADD  CONSTRAINT [DF_GameDealerMPlayer_RebatePro]  DEFAULT ((0.0)) FOR [RebatePro]
GO
ALTER TABLE [dbo].[GameDealerMPlayer] ADD  CONSTRAINT [DF_GameDealerMPlayer_IsWriteReport_1]  DEFAULT ((0)) FOR [IsWriteReport]
GO
ALTER TABLE [dbo].[GameDealerMPlayerReport] ADD  CONSTRAINT [DF_GameDealerMPlayerReport_LotteryClassID]  DEFAULT ((0)) FOR [LotteryClassID]
GO
ALTER TABLE [dbo].[GameDealerMPlayerReport] ADD  CONSTRAINT [DF_GameDealerMPlayerReport_LotteryTypeID]  DEFAULT ((0)) FOR [LotteryTypeID]
GO
ALTER TABLE [dbo].[GameDealerMPlayerReport] ADD  CONSTRAINT [DF_GameDealerMPlayerReport_ReferralParentID]  DEFAULT ((0)) FOR [ReferralParentID]
GO
ALTER TABLE [dbo].[GameDealerMPlayerReport] ADD  CONSTRAINT [DF_GameDealerMPlayerReport_DiscountPrice]  DEFAULT ((0)) FOR [DiscountPrice]
GO
ALTER TABLE [dbo].[GameDealerMPlayerReport] ADD  CONSTRAINT [DF_GameDealerMPlayerReport_AngentMemberID]  DEFAULT ((0)) FOR [AngentMemberID]
GO
ALTER TABLE [dbo].[GameDealerMPlayerReport] ADD  CONSTRAINT [DF_GameDealerMPlayerReport_ReferralMemberID]  DEFAULT ((0)) FOR [ReferralMemberID]
GO
ALTER TABLE [dbo].[GameDealerMPlayerReport] ADD  CONSTRAINT [DF_GameDealerMPlayerReport_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[GameDealerMPlayerReport] ADD  CONSTRAINT [DF_GameDealerMPlayerReport_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_AgentParentID]  DEFAULT ((0)) FOR [AgentParentID]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_AgentPositionTakingRebate]  DEFAULT ((0.0)) FOR [AgentPositionTakingRebate]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_TotalDiscountPrice]  DEFAULT ((0)) FOR [TotalDiscountPrice]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_WinLoseMoney]  DEFAULT ((0)) FOR [WinLoseMoney]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_VIPWinLoseMoney]  DEFAULT ((0)) FOR [VIPWinLoseMoney]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_TurnOver]  DEFAULT ((0)) FOR [TurnOver]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_VIPTurnOver]  DEFAULT ((0)) FOR [VIPTurnOver]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_TotalComission]  DEFAULT ((0)) FOR [TotalComission]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_Profit]  DEFAULT ((0)) FOR [Profit]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_VIPProfit]  DEFAULT ((0)) FOR [VIPProfit]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_UpperTotal]  DEFAULT ((0)) FOR [UpperTotal]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_VIPUpperTotal]  DEFAULT ((0)) FOR [VIPUpperTotal]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_InitialCredit]  DEFAULT ((0)) FOR [InitialCredit]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_CreditBalance]  DEFAULT ((0)) FOR [CreditBalance]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_CashBalance]  DEFAULT ((0)) FOR [CashBalance]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_CreateBy]  DEFAULT ((0)) FOR [CreateBy]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_UpdateBy]  DEFAULT ((0)) FOR [UpdateBy]
GO
ALTER TABLE [dbo].[GameDealerWinLoseReport] ADD  CONSTRAINT [DF_GameDealerWinLoseReport_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[GameRoomType] ADD  CONSTRAINT [DF_GameRoomType_GamePwd_1]  DEFAULT (N'39+M6VYvuIlERC8G+aT1xhcGQ3oB2HW3olzpmQFx32Y=') FOR [GamePwd]
GO
ALTER TABLE [dbo].[GameRoomType] ADD  CONSTRAINT [DF_GameRoomType_MinCommission]  DEFAULT ((0)) FOR [MinCommission]
GO
ALTER TABLE [dbo].[GameRoomType] ADD  CONSTRAINT [DF_GameRoomType_MaxCommission]  DEFAULT ((999999999)) FOR [MaxCommission]
GO
ALTER TABLE [dbo].[GameRoomType] ADD  CONSTRAINT [DF_GameRoomType_GameStatus]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[GameRoomType] ADD  CONSTRAINT [DF_GameRoomType_GameRoom_TableID]  DEFAULT ((1)) FOR [GameRoom_TableID]
GO
ALTER TABLE [dbo].[GameRoomType] ADD  CONSTRAINT [DF_GameRoomType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[GameRoomType] ADD  CONSTRAINT [DF_GameRoomType_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[IPManagement] ADD  CONSTRAINT [DF_BlockIP_LotteryInfoStatus]  DEFAULT ((0)) FOR [IsBlock]
GO
ALTER TABLE [dbo].[IPManagement] ADD  CONSTRAINT [DF_ManagementIP_IsBlock1]  DEFAULT ((0)) FOR [IsWhite]
GO
ALTER TABLE [dbo].[LanguageType] ADD  CONSTRAINT [DF_LanguageType_Sort]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[LoginHistory] ADD  CONSTRAINT [DF_LoginHistory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[LotteryBetLimit] ADD  CONSTRAINT [DF_LotteryBetLimit_LimitMin]  DEFAULT ((1000)) FOR [LimitMin]
GO
ALTER TABLE [dbo].[LotteryBetLimit] ADD  CONSTRAINT [DF_LotteryBetLimit_LimitMax]  DEFAULT ((25000000)) FOR [LimitMax]
GO
ALTER TABLE [dbo].[LotteryBetLimitMap] ADD  CONSTRAINT [DF_LotteryBetLimitMap_LimitID]  DEFAULT ((0)) FOR [LimitID]
GO
ALTER TABLE [dbo].[LotteryBetLimitMap] ADD  CONSTRAINT [DF_LotteryBetLimitMap_LotteryClassID]  DEFAULT ((0)) FOR [LotteryClassID]
GO
ALTER TABLE [dbo].[LotteryBetLimitMap] ADD  CONSTRAINT [DF_LotteryBetLimitMap_LotteryTypeID]  DEFAULT ((0)) FOR [LotteryTypeID]
GO
ALTER TABLE [dbo].[LotteryBetLimitMap] ADD  CONSTRAINT [DF_LotteryBetLimitMap_LotteryInfoID]  DEFAULT ((0)) FOR [LotteryInfoID]
GO
ALTER TABLE [dbo].[LotteryBetLimitMap] ADD  CONSTRAINT [DF_LotteryBetLimitMap_ParentID]  DEFAULT ((0)) FOR [ParentID]
GO
ALTER TABLE [dbo].[LotteryClass] ADD  CONSTRAINT [DF_LotteryClass_Status1]  DEFAULT ((0)) FOR [IsMaintain]
GO
ALTER TABLE [dbo].[LotteryClass] ADD  CONSTRAINT [DF_LotteryClass_LotteryTypeStatus]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[LotteryClass] ADD  CONSTRAINT [DF_LotteryClass_LotteryClass_TableID]  DEFAULT ((2)) FOR [LotteryClass_TableID]
GO
ALTER TABLE [dbo].[LotteryClass] ADD  CONSTRAINT [DF_LotteryClass_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[LotteryClass] ADD  CONSTRAINT [DF_LotteryClass_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[LotteryContent] ADD  CONSTRAINT [DF_LotteryContent_Types]  DEFAULT ((1)) FOR [Types]
GO
ALTER TABLE [dbo].[LotteryContent] ADD  CONSTRAINT [DF_LotteryContent_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[LotteryContent] ADD  CONSTRAINT [DF_LotteryContent_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[LotteryInfo] ADD  CONSTRAINT [DF_LotteryInfo_CalculatorTypeID]  DEFAULT ((1)) FOR [DrawTypeID]
GO
ALTER TABLE [dbo].[LotteryInfo] ADD  CONSTRAINT [DF_LotteryInfo_FamliyBigID1]  DEFAULT ((0)) FOR [DisCount]
GO
ALTER TABLE [dbo].[LotteryInfo] ADD  CONSTRAINT [DF_LotteryInfo_FamliyBigID1_1]  DEFAULT ((1)) FOR [MinBet]
GO
ALTER TABLE [dbo].[LotteryInfo] ADD  CONSTRAINT [DF_LotteryInfo_MinBet1]  DEFAULT ((99999999)) FOR [MaxBet]
GO
ALTER TABLE [dbo].[LotteryInfo] ADD  CONSTRAINT [DF_LotteryInfo_FamliyMiddel1]  DEFAULT ((0)) FOR [FamliyBigID]
GO
ALTER TABLE [dbo].[LotteryInfo] ADD  CONSTRAINT [DF_LotteryInfo_FamliyBig1]  DEFAULT ((0)) FOR [FamliyMiddelID]
GO
ALTER TABLE [dbo].[LotteryInfo] ADD  CONSTRAINT [DF_LotteryInfo_FamliyID]  DEFAULT ((0)) FOR [FamliySmallID]
GO
ALTER TABLE [dbo].[LotteryInfo] ADD  CONSTRAINT [DF_LotteryInfo_GameStatus]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[LotteryInfo] ADD  CONSTRAINT [DF_LotteryInfo_SelectArray]  DEFAULT ('') FOR [SelectArray]
GO
ALTER TABLE [dbo].[LotteryInfo] ADD  CONSTRAINT [DF_LotteryInfo_LotteryInfo_TableID]  DEFAULT ((4)) FOR [LotteryInfo_TableID]
GO
ALTER TABLE [dbo].[LotteryInfo] ADD  CONSTRAINT [DF_LotteryInfo_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[LotteryInfo] ADD  CONSTRAINT [DF_LotteryInfo_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_CompanyID]  DEFAULT ((2)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_PeriodInterval]  DEFAULT ((1)) FOR [PeriodInterval]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_PeriodInterval1]  DEFAULT ((30)) FOR [RealPlayTime]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_maxBonusMoney]  DEFAULT ((10000)) FOR [MaxBonusMoneyPool]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_UserBonusPercentage]  DEFAULT (N'90%') FOR [DrawBonusPercentage]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_IsEnableAI]  DEFAULT ((0)) FOR [IsEnableAI]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_IsEnableAI1_1]  DEFAULT ((0)) FOR [IsMaintain]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_AIType]  DEFAULT ((1)) FOR [AIType]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_CompanyWinPercentage]  DEFAULT (N'50%') FOR [CompanyWinPercentage]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_CompanyWinPercentage1]  DEFAULT (N'50%') FOR [UserWinPercentage]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_CompanyWinPercentage1_1]  DEFAULT ((0.02)) FOR [CompanyPresetCompensation]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_UserWinPercentage1]  DEFAULT ('./#!/') FOR [URL]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_NewOrHot1]  DEFAULT ((0)) FOR [FamliyID]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_FamliyID1]  DEFAULT ((0)) FOR [FamliyISort]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_IsEnableAI1]  DEFAULT ((0)) FOR [NewOrHot]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_IsOfficial]  DEFAULT ((0)) FOR [IsOfficial]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_Status1]  DEFAULT ((0)) FOR [IsCloseGame]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_LotteryInfoStatus]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_LotteryType_TableID]  DEFAULT ((3)) FOR [LotteryType_TableID]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[LotteryType] ADD  CONSTRAINT [DF_LotteryType_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[LotteryTypeRankin] ADD  CONSTRAINT [DF_LotteryTypeRankin_LotteryBettingRanking]  DEFAULT ((0)) FOR [LotteryBettingRanking]
GO
ALTER TABLE [dbo].[LotteryTypeRankin] ADD  CONSTRAINT [DF_LotteryTypeRankin_URL]  DEFAULT ('./#!/') FOR [URL]
GO
ALTER TABLE [dbo].[LotteryTypeRankin] ADD  CONSTRAINT [DF_LotteryTypeRankin_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[LotteryTypeRankin] ADD  CONSTRAINT [DF_LotteryTypeRankin_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[MCompany] ADD  CONSTRAINT [DF_MWCompany_CashRebate]  DEFAULT ((0.001)) FOR [CashRebate]
GO
ALTER TABLE [dbo].[MCompany] ADD  CONSTRAINT [DF_MWCompany_CashBackRebate]  DEFAULT ((0.001)) FOR [CashBackRebate]
GO
ALTER TABLE [dbo].[MCompany] ADD  CONSTRAINT [DF_MWCompany_Sort]  DEFAULT ((999)) FOR [Sort]
GO
ALTER TABLE [dbo].[MemberCountry] ADD  CONSTRAINT [DF_MemberCountry_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[MemberCountry] ADD  CONSTRAINT [DF_MemberCountry_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[MemberPlatform] ADD  CONSTRAINT [DF_MemberPlatform_MemberID]  DEFAULT ((0)) FOR [MemberID]
GO
ALTER TABLE [dbo].[MemberPlatform] ADD  CONSTRAINT [DF_MemberPlatform_GameDealerMemberID]  DEFAULT ((0)) FOR [GameDealerMemberID]
GO
ALTER TABLE [dbo].[MemberPlatform] ADD  CONSTRAINT [DF_MemberPlatform_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[MemberPlatform] ADD  CONSTRAINT [DF_MemberPlatform_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_UserLevel]  DEFAULT ((1)) FOR [UserLevelID]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_UserLevelID1]  DEFAULT ((1)) FOR [MGroupID]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_AgentParentID]  DEFAULT ((0)) FOR [AgentParentID]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_CashRebate1]  DEFAULT ((0.0)) FOR [AgentPositionTakingRebate]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_ReferralParentID]  DEFAULT ((0)) FOR [ReferralParentID]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_ReferralRebate1]  DEFAULT ((34)) FOR [ReferralPayType]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_ReferralRebate]  DEFAULT ((0)) FOR [ReferralLayerLevel]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_ReferralMap]  DEFAULT (N'/') FOR [ReferralMap]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_CashRebate]  DEFAULT ((0.001)) FOR [ReferralCashRebate]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_ReferralPayType1]  DEFAULT ((0)) FOR [LoginWrongTimes]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_TotalBalance]  DEFAULT ((0)) FOR [TotalBalance]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_TotalDeposit1]  DEFAULT ((0)) FOR [MonthDeposit]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_TotalDeposit]  DEFAULT ((0)) FOR [TotalDeposit]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_IsMultiLogin]  DEFAULT ((0)) FOR [IsMultiLogin]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_WalletIsLock]  DEFAULT ((0)) FOR [WalletIsLock]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_CashRebateDaile]  DEFAULT ((1)) FOR [CashRebatePayType]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_CashBackRebateDaile]  DEFAULT ((1)) FOR [CashBackRebatePayType]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_IsBlockPhone]  DEFAULT ((1)) FOR [IsEditPhone]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_IsEmailValidator]  DEFAULT ((1)) FOR [IsEmailValidator]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_IsBlockEmail]  DEFAULT ((1)) FOR [IsEditEmail]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_IsFirst]  DEFAULT ((1)) FOR [IsFirst]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_IsLock1]  DEFAULT ((0)) FOR [IsLock]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_IsEditEmail1]  DEFAULT ((1)) FOR [IsEnable]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_IsEnable1]  DEFAULT ((1)) FOR [IsOnline]
GO
ALTER TABLE [dbo].[MemberShip] ADD  CONSTRAINT [DF_MemberShip_CreateBy]  DEFAULT ((0)) FOR [CreateBy]
GO
ALTER TABLE [dbo].[MGroup] ADD  CONSTRAINT [DF_MGroup_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[MPlayer] ADD  CONSTRAINT [DF_MPlayer_SecondMPlayerID]  DEFAULT ((0)) FOR [SecondMPlayerID]
GO
ALTER TABLE [dbo].[MPlayer] ADD  CONSTRAINT [DF_MPlayer_IsAfter]  DEFAULT ((0)) FOR [IsAfter]
GO
ALTER TABLE [dbo].[MPlayer] ADD  CONSTRAINT [DF_MPlayer_IsWinStop]  DEFAULT ((0)) FOR [IsWinStop]
GO
ALTER TABLE [dbo].[MPlayer] ADD  CONSTRAINT [DF_MPlayer_DiscountPrice]  DEFAULT ((0)) FOR [DiscountPrice]
GO
ALTER TABLE [dbo].[MPlayer] ADD  CONSTRAINT [DF_MPlayer_ShowResultDate]  DEFAULT (getdate()) FOR [ShowResultDate]
GO
ALTER TABLE [dbo].[MPlayer] ADD  CONSTRAINT [DF_MPlayer_RebatePro]  DEFAULT ((0.0)) FOR [RebatePro]
GO
ALTER TABLE [dbo].[MPlayer] ADD  CONSTRAINT [DF_MPlayer_ReferralPayType]  DEFAULT ((34)) FOR [ReferralPayType]
GO
ALTER TABLE [dbo].[MPlayer] ADD  CONSTRAINT [DF_MPlayer_CashRebatePayType]  DEFAULT ((34)) FOR [CashRebatePayType]
GO
ALTER TABLE [dbo].[MPlayer] ADD  CONSTRAINT [DF_MPlayer_CashBackRebatePayType]  DEFAULT ((34)) FOR [CashBackRebatePayType]
GO
ALTER TABLE [dbo].[MPlayer] ADD  CONSTRAINT [DF_MPlayer_IsWinStop1]  DEFAULT ((0)) FOR [IsReferralWriteReport]
GO
ALTER TABLE [dbo].[MPlayer] ADD  CONSTRAINT [DF_MPlayer_IsReferralWriteReport2]  DEFAULT ((0)) FOR [IsCashRebateWriteReport]
GO
ALTER TABLE [dbo].[MPlayer] ADD  CONSTRAINT [DF_MPlayer_IsReferralWriteReport1]  DEFAULT ((0)) FOR [IsCashBackWriteReport]
GO
ALTER TABLE [dbo].[MPlayer] ADD  CONSTRAINT [DF_MPlayer_IsReset]  DEFAULT ((0)) FOR [IsReset]
GO
ALTER TABLE [dbo].[MPlayerReport] ADD  CONSTRAINT [DF_MPlayerReport_LotteryClassID]  DEFAULT ((0)) FOR [LotteryClassID]
GO
ALTER TABLE [dbo].[MPlayerReport] ADD  CONSTRAINT [DF_MPlayerReport_LotteryTypeID]  DEFAULT ((0)) FOR [LotteryTypeID]
GO
ALTER TABLE [dbo].[MPlayerReport] ADD  CONSTRAINT [DF_MPlayerReport_ReferralMemberID1]  DEFAULT ((0)) FOR [ReferralParentID]
GO
ALTER TABLE [dbo].[MPlayerReport] ADD  CONSTRAINT [DF_MPlayerReport_DiscountPrice]  DEFAULT ((0)) FOR [DiscountPrice]
GO
ALTER TABLE [dbo].[MPlayerReport] ADD  CONSTRAINT [DF_MPlayerReport_TypeCode]  DEFAULT ((0)) FOR [TypeCode]
GO
ALTER TABLE [dbo].[MPlayerReport] ADD  CONSTRAINT [DF_MPlayerReport_AngentMemberID]  DEFAULT ((0)) FOR [AngentMemberID]
GO
ALTER TABLE [dbo].[MPlayerReport] ADD  CONSTRAINT [DF_MPlayerReport_ReferralMemberID]  DEFAULT ((0)) FOR [ReferralMemberID]
GO
ALTER TABLE [dbo].[MPlayerReport] ADD  CONSTRAINT [DF_MPlayerReport_IsReset]  DEFAULT ((0)) FOR [IsReset]
GO
ALTER TABLE [dbo].[MPlayerReport] ADD  CONSTRAINT [DF_MPlayerReport_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[MPlayerReport] ADD  CONSTRAINT [DF_MPlayerReport_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[MPlayerTopSort] ADD  CONSTRAINT [DF_Table_1_TotalWin1]  DEFAULT ((0)) FOR [TotalWin]
GO
ALTER TABLE [dbo].[MPlayerTopSort] ADD  CONSTRAINT [DF_MPlayerTopSort_TotalWin1]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[MPlayerTopSort] ADD  CONSTRAINT [DF_MPlayerTopSort_CreateBy]  DEFAULT ((0)) FOR [CreateBy]
GO
ALTER TABLE [dbo].[MPositionProfitMap] ADD  CONSTRAINT [DF_MPositionProfitMap_AgentParentMap]  DEFAULT ((0.0)) FOR [AgentParentMap]
GO
ALTER TABLE [dbo].[MPositionProfitMap] ADD  CONSTRAINT [DF_MPositionProfitMap_CreateBy]  DEFAULT ((0)) FOR [CreateBy]
GO
ALTER TABLE [dbo].[MPromotion] ADD  CONSTRAINT [DF_MPromotion_LotteryTypeID]  DEFAULT ((0)) FOR [LotteryTypeID]
GO
ALTER TABLE [dbo].[MPromotion] ADD  CONSTRAINT [DF_MPromotion_TurnOverAmount1]  DEFAULT ((0)) FOR [TotalBonus]
GO
ALTER TABLE [dbo].[MPromotion] ADD  CONSTRAINT [DF_MPromotion_TurnOverAmount]  DEFAULT ((0)) FOR [TurnOverAmount]
GO
ALTER TABLE [dbo].[MPromotion] ADD  CONSTRAINT [DF_MPromotion_TotalPlayerWinAmount]  DEFAULT ((0)) FOR [TotalPlayerWinAmount]
GO
ALTER TABLE [dbo].[MPromotion] ADD  CONSTRAINT [DF_MPromotion_TotalPlayerAmount]  DEFAULT ((0)) FOR [TotalPlayerAmount]
GO
ALTER TABLE [dbo].[MPromotion] ADD  CONSTRAINT [DF_MPromotion_IslockWithdrawal]  DEFAULT ((1)) FOR [IslockWithdrawal]
GO
ALTER TABLE [dbo].[MWallet] ADD  CONSTRAINT [DF_MWallet_LotteryClassID]  DEFAULT ((0)) FOR [LotteryClassID]
GO
ALTER TABLE [dbo].[OLottery] ADD  CONSTRAINT [DF_OLottery_IsOpen]  DEFAULT ((0)) FOR [IsOpen]
GO
ALTER TABLE [dbo].[OLottery] ADD  CONSTRAINT [DF_OLottery_IsOpen1]  DEFAULT ((0)) FOR [IsReset]
GO
ALTER TABLE [dbo].[OLottery] ADD  CONSTRAINT [DF_OLottery_IsReset1]  DEFAULT ((0)) FOR [ResetTimes]
GO
ALTER TABLE [dbo].[OLottery] ADD  CONSTRAINT [DF_OLottery_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[OLottery] ADD  CONSTRAINT [DF_OLottery_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[OLotteryHistory] ADD  CONSTRAINT [DF_OLotteryHistory_IsReset]  DEFAULT ((0)) FOR [IsReset]
GO
ALTER TABLE [dbo].[PlatformPromotion] ADD  CONSTRAINT [DF_PlatformPromotion_MaxBonus]  DEFAULT ((0)) FOR [MaxBonus]
GO
ALTER TABLE [dbo].[PlatformPromotion] ADD  CONSTRAINT [DF_PlatformPromotion_UnlockLossPercentage]  DEFAULT ((0)) FOR [UnlockLossPercentage]
GO
ALTER TABLE [dbo].[PlatformPromotion] ADD  CONSTRAINT [DF_PlatformPromotion_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[PlatformPromotion] ADD  CONSTRAINT [DF_PlatformPromotion_IsFirstPromotion]  DEFAULT ((0)) FOR [IsFirstPromotion]
GO
ALTER TABLE [dbo].[PlatformSetting] ADD  CONSTRAINT [DF_PlatformSetting_ServerIP]  DEFAULT ('') FOR [ServerIP]
GO
ALTER TABLE [dbo].[PlatformSetting] ADD  CONSTRAINT [DF_PlatformSetting_CompanyDNS1]  DEFAULT ('') FOR [CompanyName]
GO
ALTER TABLE [dbo].[PlatformSetting] ADD  CONSTRAINT [DF_PlatformSetting_CompanyDNS]  DEFAULT ('') FOR [CompanyDNS]
GO
ALTER TABLE [dbo].[PlatformSetting] ADD  CONSTRAINT [DF_PlatformSetting_CompanyDNS1_1]  DEFAULT ('') FOR [APIPath]
GO
ALTER TABLE [dbo].[PlatformSetting] ADD  CONSTRAINT [DF_PlatformSetting_APID]  DEFAULT (N'Free30') FOR [APID]
GO
ALTER TABLE [dbo].[PlatformSetting] ADD  CONSTRAINT [DF_PlatformSetting_APID1]  DEFAULT (N'Free30') FOR [PrivateKeyAPID]
GO
ALTER TABLE [dbo].[PlatformSetting] ADD  CONSTRAINT [DF_PlatformSetting_PlayTokenStatus]  DEFAULT ((0)) FOR [PlayTokenStatus]
GO
ALTER TABLE [dbo].[PlatformSetting] ADD  CONSTRAINT [DF_PlatformSetting_IsTest]  DEFAULT ((0)) FOR [IsTest]
GO
ALTER TABLE [dbo].[PlatformSetting] ADD  CONSTRAINT [DF_PlatformSetting_IsTest1]  DEFAULT ((0)) FOR [IsMaintain]
GO
ALTER TABLE [dbo].[PlatformSetting] ADD  CONSTRAINT [DF_PlatformSetting_PlatformCode]  DEFAULT ('Platform') FOR [TypeCode]
GO
ALTER TABLE [dbo].[PlatformSetting] ADD  CONSTRAINT [DF_PlatformSetting_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[PlatformSetting] ADD  CONSTRAINT [DF_PlatformSetting_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[ReferralLayer] ADD  CONSTRAINT [DF_ReferralLayer_ReferralPercentage]  DEFAULT (N'0.08%') FOR [ReferralPercentage]
GO
ALTER TABLE [dbo].[ReferralLayer] ADD  CONSTRAINT [DF_ReferralLayer_PayType]  DEFAULT ((34)) FOR [PayType]
GO
ALTER TABLE [dbo].[ReferralLayer] ADD  CONSTRAINT [DF_ReferralLayer_GameRoomTypeID]  DEFAULT ((0)) FOR [GameRoomTypeID]
GO
ALTER TABLE [dbo].[SlotMPlayer] ADD  CONSTRAINT [DF_SlotMPlayer_SlotInfoID1]  DEFAULT ((0)) FOR [SlotTypeID]
GO
ALTER TABLE [dbo].[SlotMPlayer] ADD  CONSTRAINT [DF_SlotMPlayer_SlotInfoID]  DEFAULT ((0)) FOR [SlotInfoID]
GO
ALTER TABLE [dbo].[SlotMPlayer] ADD  CONSTRAINT [DF_SlotMPlayer_LotteryInfoName]  DEFAULT ('') FOR [SlotInfoName]
GO
ALTER TABLE [dbo].[SlotMPlayer] ADD  CONSTRAINT [DF_SlotMPlayer_IsWin]  DEFAULT ((1)) FOR [IsWin]
GO
ALTER TABLE [dbo].[SlotMPlayer] ADD  CONSTRAINT [DF_SlotMPlayer_RebatePro1]  DEFAULT ((0.0)) FOR [Reference]
GO
ALTER TABLE [dbo].[SlotMPlayer] ADD  CONSTRAINT [DF_SlotMPlayer_RebatePro]  DEFAULT ((0.0)) FOR [RebatePro]
GO
ALTER TABLE [dbo].[SlotMPlayer] ADD  CONSTRAINT [DF_SlotMPlayer_IsWriteReport]  DEFAULT ((0)) FOR [IsWriteReport]
GO
ALTER TABLE [dbo].[SlotMPlayer] ADD  CONSTRAINT [DF_SlotMPlayer_CashBackMoney]  DEFAULT ((0)) FOR [CashBackMoney]
GO
ALTER TABLE [dbo].[SlotMPlayerRefund] ADD  CONSTRAINT [DF_SlotMPlayerRefund_SlotTypeID]  DEFAULT ((0)) FOR [SlotTypeID]
GO
ALTER TABLE [dbo].[SlotMPlayerRefund] ADD  CONSTRAINT [DF_SlotMPlayerRefund_SlotInfoID]  DEFAULT ((0)) FOR [SlotInfoID]
GO
ALTER TABLE [dbo].[SlotMPlayerReport] ADD  CONSTRAINT [DF_SlotMPlayerReport_ReferralParentID]  DEFAULT ((0)) FOR [ReferralParentID]
GO
ALTER TABLE [dbo].[SlotMPlayerReport] ADD  CONSTRAINT [DF_SlotMPlayerReport_AngentMemberID]  DEFAULT ((0)) FOR [AngentMemberID]
GO
ALTER TABLE [dbo].[SlotMPlayerReport] ADD  CONSTRAINT [DF_SlotMPlayerReport_ReferralMemberID]  DEFAULT ((0)) FOR [ReferralMemberID]
GO
ALTER TABLE [dbo].[SlotMPlayerReport] ADD  CONSTRAINT [DF_SlotMPlayerReport_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[SlotMPlayerReport] ADD  CONSTRAINT [DF_SlotMPlayerReport_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[SlotStatement] ADD  CONSTRAINT [DF_SlotStatement_LotteryInfoID]  DEFAULT ((0)) FOR [LotteryInfoID]
GO
ALTER TABLE [dbo].[SlotStatement] ADD  CONSTRAINT [DF_SlotStatement_ValueMoney]  DEFAULT ((0)) FOR [ValueMoney]
GO
ALTER TABLE [dbo].[SlotStatement] ADD  CONSTRAINT [DF_SlotStatement_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[SlotTransaction] ADD  CONSTRAINT [DF_SlotTransaction_IsWin]  DEFAULT ((1)) FOR [IsWin]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_LotteryClassID1]  DEFAULT ((3)) FOR [SlotRows]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_CompanyID1]  DEFAULT ((5)) FOR [Reels]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_LotteryClassID]  DEFAULT ((6)) FOR [LotteryClassID]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_CompanyID]  DEFAULT ((2)) FOR [CompanyID]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_MaxBonusMoneyPool]  DEFAULT ((10000)) FOR [MaxBonusMoneyPool]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_DrawBonusPercentage]  DEFAULT (N'90%') FOR [DrawBonusPercentage]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_IsEnableAI]  DEFAULT ((0)) FOR [IsEnableAI]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_AIType]  DEFAULT ((0)) FOR [AIType]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_CompanyWinPercentage]  DEFAULT (N'50%') FOR [CompanyWinPercentage]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_UserWinPercentage]  DEFAULT (N'50%') FOR [UserWinPercentage]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_URL]  DEFAULT ('./#!/') FOR [URL]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_FamliyID]  DEFAULT ((0)) FOR [FamliyID]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_FamliyISort]  DEFAULT ((0)) FOR [FamliySort]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_NewOrHot]  DEFAULT ((0)) FOR [NewOrHot]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[SlotType] ADD  CONSTRAINT [DF_SlotType_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Statement] ADD  CONSTRAINT [DF_Statement_LotteryInfoID]  DEFAULT ((0)) FOR [LotteryInfoID]
GO
ALTER TABLE [dbo].[Statement] ADD  CONSTRAINT [DF_Statement_LotteryClassID]  DEFAULT ((0)) FOR [LotteryClassID]
GO
ALTER TABLE [dbo].[Statement] ADD  CONSTRAINT [DF_Statement_LotteryTypeID]  DEFAULT ((0)) FOR [LotteryTypeID]
GO
ALTER TABLE [dbo].[Statement] ADD  CONSTRAINT [DF_Statement_ShowResultDate]  DEFAULT (getdate()) FOR [ShowResultDate]
GO
ALTER TABLE [dbo].[Statement] ADD  CONSTRAINT [DF_Statement_WinLose]  DEFAULT ((0)) FOR [TypeCode]
GO
ALTER TABLE [dbo].[Statement] ADD  CONSTRAINT [DF_Statement_DepositWithdrawal]  DEFAULT ((0)) FOR [ValueMoney]
GO
ALTER TABLE [dbo].[Statement] ADD  CONSTRAINT [DF_Statement_Total]  DEFAULT ((0)) FOR [Total]
GO
ALTER TABLE [dbo].[SystemConfig] ADD  CONSTRAINT [DF_SystemConfig_ConfigTypeID]  DEFAULT ((0)) FOR [ConfigTypeID]
GO
ALTER TABLE [dbo].[SystemConfig] ADD  CONSTRAINT [DF_SystemConfig_ConfigParentID]  DEFAULT ((0)) FOR [ConfigParentID]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_MemberID]  DEFAULT ((0)) FOR [MemberID]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_GameDealerMemberID]  DEFAULT ((0)) FOR [GameDealerMemberID]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_AgentParentID]  DEFAULT ((0)) FOR [AgentParentID]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_AgentPositionTakingRebate]  DEFAULT ((0.0)) FOR [AgentPositionTakingRebate]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_WinLoseMoney]  DEFAULT ((0)) FOR [WinLoseMoney]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_VIPWinLoseMoney]  DEFAULT ((0)) FOR [VIPWinLoseMoney]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_TurnOver]  DEFAULT ((0)) FOR [TurnOver]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_VIPTurnOver]  DEFAULT ((0)) FOR [VIPTurnOver]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_TotalComission]  DEFAULT ((0)) FOR [TotalComission]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_Profit]  DEFAULT ((0)) FOR [Profit]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_VIPProfit]  DEFAULT ((0)) FOR [VIPProfit]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_UpperTotal]  DEFAULT ((0)) FOR [UpperTotal]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_VIPUpperTotal]  DEFAULT ((0)) FOR [VIPUpperTotal]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_InitialCredit]  DEFAULT ((0)) FOR [InitialCredit]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_CreditBalance]  DEFAULT ((0)) FOR [CreditBalance]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_CashBalance]  DEFAULT ((0)) FOR [CashBalance]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_CreateBy]  DEFAULT ((0)) FOR [CreateBy]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_UpdateBy]  DEFAULT ((0)) FOR [UpdateBy]
GO
ALTER TABLE [dbo].[TotalWinLoseReport] ADD  CONSTRAINT [DF_TotalWinLoseReport_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[TransactionsHistory] ADD  CONSTRAINT [DF_TransactionsHistory_PMTID]  DEFAULT ((0)) FOR [PMTID]
GO
ALTER TABLE [dbo].[TransactionsHistory] ADD  CONSTRAINT [DF_TransactionsHistory_DepositID]  DEFAULT ((0)) FOR [DepositID]
GO
ALTER TABLE [dbo].[TransactionsHistory] ADD  CONSTRAINT [DF_TransactionsHistory_WithdrawalID]  DEFAULT ((0)) FOR [WithdrawalID]
GO
ALTER TABLE [dbo].[UserLevel] ADD  CONSTRAINT [DF_UserLevel_ULevel]  DEFAULT ((0)) FOR [ULevel]
GO
ALTER TABLE [dbo].[UserLevel] ADD  CONSTRAINT [DF_UserLevel_MinBet]  DEFAULT ((10000)) FOR [MinAddCredit]
GO
ALTER TABLE [dbo].[UserLevel] ADD  CONSTRAINT [DF_UserLevel_MinAddCredit1]  DEFAULT ((0)) FOR [MinTotalRealBet]
GO
ALTER TABLE [dbo].[UserLevel] ADD  CONSTRAINT [DF_UserLevel_SPCashRebate]  DEFAULT ((0)) FOR [SPCashBack]
GO
ALTER TABLE [dbo].[UserLevel] ADD  CONSTRAINT [DF_UserLevel_Sort]  DEFAULT ((1)) FOR [Sort]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_AgentParentID]  DEFAULT ((0)) FOR [AgentParentID]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_AgentPositionTakingRebate]  DEFAULT ((0.0)) FOR [AgentPositionTakingRebate]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_TotalDiscountPrice]  DEFAULT ((0)) FOR [TotalDiscountPrice]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_WinLoseMoney]  DEFAULT ((0)) FOR [WinLoseMoney]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_VIPWinLoseMoney]  DEFAULT ((0)) FOR [VIPWinLoseMoney]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_TurnOver]  DEFAULT ((0)) FOR [TurnOver]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_VIPTurnOver]  DEFAULT ((0)) FOR [VIPTurnOver]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_TotalComission]  DEFAULT ((0)) FOR [TotalComission]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_Profit]  DEFAULT ((0)) FOR [Profit]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_VIPProfit]  DEFAULT ((0)) FOR [VIPProfit]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_UpperTotal]  DEFAULT ((0)) FOR [UpperTotal]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_VIPUpperTotal]  DEFAULT ((0)) FOR [VIPUpperTotal]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_InitialCredit]  DEFAULT ((0)) FOR [InitialCredit]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_CreditBalance]  DEFAULT ((0)) FOR [CreditBalance]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_CashBalance]  DEFAULT ((0)) FOR [CashBalance]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_CreateBy]  DEFAULT ((0)) FOR [CreateBy]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_UpdateBy]  DEFAULT ((0)) FOR [UpdateBy]
GO
ALTER TABLE [dbo].[WinLoseReport] ADD  CONSTRAINT [DF_WinLoseReport_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_LotteryTypeID]  DEFAULT ((0)) FOR [LotteryTypeID]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_LotteryInfoID]  DEFAULT ((0)) FOR [LotteryInfoID]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_LotteryInfoID1]  DEFAULT ((0)) FOR [MemberID]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_CreateBy1]  DEFAULT ((1)) FOR [PlatfromID]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_GameDealerMemberID]  DEFAULT ((0)) FOR [GameDealerMemberID]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_AgentLevelSCID]  DEFAULT ((0)) FOR [AgentLevelSCID]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_AgentLevelSCID1]  DEFAULT ((0)) FOR [AgentMemberID]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_AgentLevelSCID2]  DEFAULT ((0)) FOR [AgentGameDealerMemberID]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_TotalDiscountPrice]  DEFAULT ((0)) FOR [TotalDiscountPrice]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_TotalBet1]  DEFAULT ((0)) FOR [SMTotalWinLose]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_SMTotalBet1]  DEFAULT ((0)) FOR [MTotalWinLose]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_MTotalBet1]  DEFAULT ((0)) FOR [AGTotalWinLose]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGame_TurnOver1]  DEFAULT ((0)) FOR [TotalBet]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGame_TotalBet1]  DEFAULT ((0)) FOR [TotalWin]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_TotalWin1_1]  DEFAULT ((0)) FOR [TotalLose]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGameTotal_TotalWin1]  DEFAULT ((0)) FOR [TotalPending]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGame_CreateBy]  DEFAULT ((0)) FOR [CreateBy]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGame_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGame_UpdateBy]  DEFAULT ((0)) FOR [UpdateBy]
GO
ALTER TABLE [dbo].[WinLoseReportByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportByGame_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_LotteryTypeID]  DEFAULT ((0)) FOR [LotteryTypeID]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_LotteryInfoID]  DEFAULT ((0)) FOR [LotteryInfoID]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_MemberID]  DEFAULT ((0)) FOR [MemberID]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_PlatfromSettingID]  DEFAULT ((1)) FOR [PlatfromID]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_GameDealerMemberID]  DEFAULT ((0)) FOR [GameDealerMemberID]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_TotalBet1]  DEFAULT ((0)) FOR [TotalDiscountPrice]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_TotalBet]  DEFAULT ((0)) FOR [TotalBet]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_TotalWin]  DEFAULT ((0)) FOR [TotalWin]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_TotalLose]  DEFAULT ((0)) FOR [TotalLose]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_TotalPending]  DEFAULT ((0)) FOR [TotalPending]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_CreateBy]  DEFAULT ((0)) FOR [CreateBy]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_UpdateBy]  DEFAULT ((0)) FOR [UpdateBy]
GO
ALTER TABLE [dbo].[WinLoseReportThirdPartyByGameTotal] ADD  CONSTRAINT [DF_WinLoseReportThirdPartyByGameTotal_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[WithDrawal] ADD  CONSTRAINT [DF_WithDrawal_CBankID]  DEFAULT ((0)) FOR [CBankID]
GO
ALTER TABLE [dbo].[WithDrawal] ADD  CONSTRAINT [DF_WithDrawal_MBankID]  DEFAULT ((0)) FOR [MBankID]
GO
ALTER TABLE [dbo].[WithDrawal] ADD  CONSTRAINT [DF_WithDrawal_DepositStatusType]  DEFAULT ((0)) FOR [WithDrawalTypeSCID]
GO
ALTER TABLE [dbo].[WithDrawalHistory] ADD  CONSTRAINT [DF_WithDrawalHistory_SystemConfig]  DEFAULT ((0)) FOR [SystemConfigID]
GO
ALTER TABLE [dbo].[WithDrawalHistory] ADD  CONSTRAINT [DF_WithDrawalHistory_CBankID]  DEFAULT ((0)) FOR [CBankID]
GO
ALTER TABLE [dbo].[WithDrawalHistory] ADD  CONSTRAINT [DF_WithDrawalHistory_MBankID]  DEFAULT ((0)) FOR [MBankID]
GO
ALTER TABLE [dbo].[WithDrawalHistory] ADD  CONSTRAINT [DF_WithDrawalHistory_WithDrawalTypeSCID]  DEFAULT ((0)) FOR [WithDrawalTypeSCID]
GO
ALTER TABLE [dbo].[WithDrawalHistory] ADD  CONSTRAINT [DF_WithDrawalHistory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[WithDrawalHistory] ADD  CONSTRAINT [DF_WithDrawalHistory_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[CBankULevel]  WITH CHECK ADD  CONSTRAINT [FK_CBankULevel_CBank] FOREIGN KEY([CBankID])
REFERENCES [dbo].[CBank] ([ID])
GO
ALTER TABLE [dbo].[CBankULevel] CHECK CONSTRAINT [FK_CBankULevel_CBank]
GO
ALTER TABLE [dbo].[CBankULevel]  WITH CHECK ADD  CONSTRAINT [FK_CBankULevel_UserLevel] FOREIGN KEY([UserLevelID])
REFERENCES [dbo].[UserLevel] ([LevelID])
GO
ALTER TABLE [dbo].[CBankULevel] CHECK CONSTRAINT [FK_CBankULevel_UserLevel]
GO
ALTER TABLE [dbo].[FGMap]  WITH CHECK ADD  CONSTRAINT [FK_FGMap_APIDefault] FOREIGN KEY([APIID])
REFERENCES [dbo].[APIDefault] ([ID])
GO
ALTER TABLE [dbo].[FGMap] CHECK CONSTRAINT [FK_FGMap_APIDefault]
GO
ALTER TABLE [dbo].[FGMap]  WITH CHECK ADD  CONSTRAINT [FK_FGMap_FunctionGroup] FOREIGN KEY([FID])
REFERENCES [dbo].[FunctionGroup] ([ID])
GO
ALTER TABLE [dbo].[FGMap] CHECK CONSTRAINT [FK_FGMap_FunctionGroup]
GO
ALTER TABLE [dbo].[FieldType]  WITH CHECK ADD  CONSTRAINT [FK_FieldType_LanguageType] FOREIGN KEY([LanguageTypeID])
REFERENCES [dbo].[LanguageType] ([LanguageTypeID])
GO
ALTER TABLE [dbo].[FieldType] CHECK CONSTRAINT [FK_FieldType_LanguageType]
GO
ALTER TABLE [dbo].[MGMap]  WITH CHECK ADD  CONSTRAINT [FK_MGMap_FunctionGroup] FOREIGN KEY([FID])
REFERENCES [dbo].[FunctionGroup] ([ID])
GO
ALTER TABLE [dbo].[MGMap] CHECK CONSTRAINT [FK_MGMap_FunctionGroup]
GO
ALTER TABLE [dbo].[MGMap]  WITH CHECK ADD  CONSTRAINT [FK_MGMap_MGroup] FOREIGN KEY([MGroupID])
REFERENCES [dbo].[MGroup] ([ID])
GO
ALTER TABLE [dbo].[MGMap] CHECK CONSTRAINT [FK_MGMap_MGroup]
GO
ALTER TABLE [dbo].[MWallet]  WITH CHECK ADD  CONSTRAINT [FK_MWallet_MCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[MCompany] ([CompanyID])
GO
ALTER TABLE [dbo].[MWallet] CHECK CONSTRAINT [FK_MWallet_MCompany]
GO
ALTER TABLE [dbo].[ReferralReport]  WITH CHECK ADD  CONSTRAINT [FK_ReferralReport_MemberShip] FOREIGN KEY([ParentID])
REFERENCES [dbo].[MemberShip] ([MemberID])
GO
ALTER TABLE [dbo].[ReferralReport] CHECK CONSTRAINT [FK_ReferralReport_MemberShip]
GO
/****** Object:  StoredProcedure [dbo].[sp_AngentReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- 說明: 統計用戶的Angent儲存到Report
-- 參數說明: null
-- 範例: exec sp_AngentReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20200308			Yark				進行代理費計算
-- 2			20200310			Yark				加入Statement Report
-- 3			20200418			Ben					修改AgentPositionTaking算法(上層扣下層)
-- 4			20201124			Yark				MPlayer改用Update取得資料
-- 5			20210713			Yark				加入判斷Reset欄位(重新計算註單的不能列入一般計算)
-- =============================================
CREATE PROCEDURE [dbo].[sp_AngentReport]
AS
BEGIN
	DECLARE @userCount INT;								--要計算的用戶數
	DECLARE @memberID INT;								--投注單的用戶
	DECLARE @mPlayerCount INT;							--投注單數量
	DECLARE @mPlayerID INT;								--投注單流水號
	DECLARE @agentPositionTakingRebate DECIMAL(18, 4);		--代理費用占成
	DECLARE @childAgentPositionTakingRebate DECIMAL(18, 4);	--子代理費占成
	DECLARE @winMoney DECIMAL(18, 4);					--輸贏
	DECLARE @isReset int;
	DECLARE @IsWin BIT;
	DECLARE @qty DECIMAL(18, 4);						--投注數量
	DECLARE @price DECIMAL(18, 4);						--投注單價
	DECLARE @discountPrice decimal(18, 4);
	DECLARE @agentLevelSCID INT = 32;					--Member Level
	DECLARE @typeCode NVARCHAR(200) = 'Angent';			--類別
	DECLARE @Status NVARCHAR(200) = '';					--狀態
	DECLARE @recordMoney NVARCHAR(50) = '';				--暫存記錄的金額
	DECLARE @agentMoney decimal(18, 4) = 0;				--代理費
	DECLARE @dateS DATETIME;							--查詢區間(起)
	DECLARE @dateE DATETIME;							--查詢區間(訖)
	DECLARE @createDate NVarchar(200) = '';
	DECLARE @currentPeriod NVARCHAR(100) = '';			--期號
	DECLARE @lotteryInfoID INT;							--玩法ID
	DECLARE @userBalance NVARCHAR(200);					--用戶餘額
	DECLARE @userWallet DECIMAL(18, 4);					--用戶錢包
	DECLARE @totalBalance DECIMAL(18, 4);				--用戶總餘額
	DECLARE @checkCount DECIMAL(18, 4);					--是否有值存在
	DECLARE @drawTypeID INT;							--玩法計算ID

	-- 設定啟始與結束時間
	SELECT @dateS = DATEADD(MINUTE, -5, GETDATE()), @dateE = GETDATE();

	--SELECT @dateS = '2021-10-30 00:00:00', @dateE = '2021-10-30 23:59:59'

	DROP TABLE IF EXISTS #tempMPlayer_AngentReport
	 --複製當天的投注表
	SELECT * INTO #tempMPlayer_AngentReport FROM MPlayer WITH(NOLOCK)
	WHERE UpdateDate >= @dateS 
		AND UpdateDate <= @dateE
		AND MemberID > 0
		
	DROP TABLE IF EXISTS #tempMemberShip_AngentReport
	-- 複製所有會員層級的用戶
	SELECT * INTO #tempMemberShip_AngentReport 
		FROM MemberShip WITH(NOLOCK) 
		WHERE MemberID in (SELECT MemberID FROM #tempMPlayer_AngentReport GROUP BY MemberID) or AgentLevelSCID != 32

	-- 用戶數量
	SELECT @userCount = COUNT(*) 
		FROM #tempMemberShip_AngentReport
		WHERE AgentLevelSCID = @agentLevelSCID
		
	-- 進行
	WHILE @userCount > 0
	BEGIN
			
		DECLARE @angentMap nvarchar(200); -- 當下用戶的代理地圖

		-- Step 1. 取出用戶資料
		SELECT @memberID = MemberID, @angentMap = AgentParentMap
			FROM #tempMemberShip_AngentReport
			WHERE AgentLevelSCID = @agentLevelSCID
		ORDER BY #tempMemberShip_AngentReport.MemberID
		OFFSET     (@userCount-1) ROWS
		FETCH NEXT 1 ROWS ONLY;
	
		-- Step 2. 取出投注資料
		SET @mPlayerCount = 0;
		SET @winMoney = -1;
		SET @isReset = -1;
		SET @mPlayerID = -1;
		SET @IsWin = -1;

		SELECT @mPlayerCount = COUNT(*)		
			FROM #tempMPlayer_AngentReport
			WHERE MemberID = @memberID 
				AND isWin in (0,1)
			
			-- 有Win Loss後就直接進行Agent計算，所以必需將每一次的投注結果進行計算
			WHILE @mPlayerCount > 0
			BEGIN
				SELECT @IsWin = [IsWin], @winMoney = [WinMoney], @qty = [Qty], @price = Price, @mPlayerID = [ID]
				,@discountPrice = DiscountPrice,@currentPeriod = [CurrentPeriod], @lotteryInfoID = [LotteryInfoID]
				,@createDate = Convert(NVarchar, [CreateDate], 120), @isReset = IsReset
				FROM #tempMPlayer_AngentReport
					WHERE MemberID = @memberID 
						AND isWin in (0,1)
					ORDER BY ID
				OFFSET     (@mPlayerCount-1) ROWS
				FETCH NEXT 1 ROWS ONLY;
				
				SELECT @drawTypeID = DrawTypeID
					FROM LotteryInfo
					WHERE LotteryInfoID = @lotteryInfoID

				SET @typeCode = 'Angent'
				
				-- 2020/09/30 Yark調整計算
				DECLARE @angentCount int;
				DECLARE @angentUserName nvarchar(200);
				DECLARE @angentUserId int;
				DECLARE @agentLoopLevelSCID int;
				DECLARE @splitStr nvarchar(50) = '/';

				-- 將Angent Map做成temp table
				DROP TABLE IF EXISTS #angentMapTemp
				CREATE TABLE #angentMapTemp ( ID INT IDENTITY(1, 1) primary key, AngentUserName nvarchar(200));
				INSERT INTO #angentMapTemp SELECT RTRIM(value) AS AngentUserName FROM STRING_SPLIT(@angentMap, '/') WHERE value <> '';

				SELECT @angentCount = COUNT(*) FROM #angentMapTemp;
				DECLARE @referralLevelTotal INT = (@angentCount + 1);--總階

				-- 計算
				-- 純盈利
				IF @IsWin = 0
				BEGIN
					SET @recordMoney = -(@qty * @discountPrice);
					--補單金額
					IF @isReset = 1
					BEGIN
						SET @recordMoney = @winMoney
					END
				END;
				Else
				BEGIN
					SET @recordMoney = @winMoney; -- - (@qty * @price);
					IF @drawTypeID >= 142 AND @drawTypeID <= 152
					BEGIN
						SET @recordMoney = @recordMoney - @discountPrice;
					END;
				END;

				-- 結算Angent Loop
				WHILE @angentCount > 0
				BEGIN
					-- Step 1. 取出 MemberID、AngentUserName
					SELECT @angentUserName = AngentUserName
					FROM #angentMapTemp
					ORDER BY #angentMapTemp.ID desc
					OFFSET     (@angentCount-1) ROWS
					FETCH NEXT 1 ROWS ONLY;

					SELECT @angentUserId = MemberID, 
						@agentPositionTakingRebate = (CAST(AgentPositionTakingRebate AS decimal(18, 4))), 
						@agentLoopLevelSCID = [AgentLevelSCID]
						FROM #tempMemberShip_AngentReport
						WHERE UserName = @angentUserName

					-- 取子階代理占成
					IF @angentCount >= 2
					BEGIN
						SELECT @angentUserName = AngentUserName
						FROM #angentMapTemp
						ORDER BY #angentMapTemp.ID desc
						OFFSET     (@angentCount-2) ROWS
						FETCH NEXT 1 ROWS ONLY;

						SELECT @childAgentPositionTakingRebate = (CAST(AgentPositionTakingRebate AS decimal(18, 4)))
							FROM #tempMemberShip_AngentReport WITH(NOLOCK)
							WHERE UserName = @angentUserName

						SET @agentPositionTakingRebate = (@agentPositionTakingRebate - @childAgentPositionTakingRebate)
					END
					-- 取子階代理占成

					SET @agentMoney = ((CAST(@recordMoney AS decimal(18, 4))) * @agentPositionTakingRebate);

					-- 檢查是否有資料存在
					SELECT @checkCount = COUNT(*) FROM MPlayerReport
						WHERE [MPlayerID] = @mPlayerID 
							AND [MemberID] = @memberID 
							AND [TypeCode] = 'Angent' 
							AND [AgentLevelSCID] = @agentLoopLevelSCID

					IF @checkCount = 0
					BEGIN
						-- 沒有[AgentMoney]
						INSERT INTO MPlayerReport ([MemberID], [MPlayerID], [AngentMemberID], [AgentLevelSCID], [TurnOverMoney], [DiscountPrice], [TypeCode], [Status], [RecordMoney], [CashRebateMoney], [CashBackRebateMoney], [AgentMoney], 
						[CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						VALUES (@memberID, @mPlayerID, @angentUserId, @agentLoopLevelSCID, (@qty * @price), @discountPrice, @typeCode, NULL, @recordMoney, 0, 0, @agentMoney, 
						0, @createDate, 0, @dateE)

						-- 加入Statement
						SELECT @userBalance = [TotalBalance]
							FROM  MemberShip WITH(NOLOCK) 
							WHERE MemberID = @memberID
						Set @totalBalance = CAST((CAST(@userBalance AS decimal(18, 4)) + CAST(@recordMoney AS decimal(18, 4))) AS NVARCHAR(200));

						INSERT INTO [Statement] ([MemberID], [CurrentPeriod], [LotteryInfoID], [Balance], [TypeCode], [ValueMoney], [Total], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						VALUES (@angentUserId, @currentPeriod, @lotteryInfoID, @userBalance, @typeCode, CAST(@agentMoney AS NVARCHAR(200)), CAST(@totalBalance AS NVARCHAR(200)), 0, @createDate, 0, @dateE)

						-- 更新錢包
						SELECT @userWallet = [TotalPrice] FROM [MWallet] WHERE MemberID = @angentUserId AND CompanyID = 2;
						UPDATE [MWallet] Set TotalPrice = CAST((@agentMoney + @userWallet) AS NVARCHAR(200)) 
							WHERE MemberID = @angentUserId 
								AND CompanyID = 2;

						-- 更新用戶總餘額
						UPDATE [MemberShip] Set [TotalBalance] = CAST(@totalBalance AS NVARCHAR(200)) 
							WHERE MemberID = @angentUserId;
					END;
					SET @angentCount = @angentCount - 1;
				END;
				Set @mPlayerCount = @mPlayerCount - 1;
				CONTINUE  
			END;
		Set @userCount = @userCount - 1;
		CONTINUE  
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculatorWinLoseReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 說明: 
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20201017			Yark				取得用戶的樹狀結構
-- 2			20210611			Ben					IsNull包在外面才完全不會有null值
-- =============================================
CREATE PROCEDURE [dbo].[sp_CalculatorWinLoseReport]
AS
BEGIN
	DECLARE @userName NVARCHAR(200) = 'Admin';						-- 起始的帳號
	DECLARE @memberID INT;											-- 用戶ID
	DECLARE @checkDataCount INT;									-- 確認資料筆數							
	DECLARE @subUserCount INT;										-- 子層用戶資料
	DECLARE @subUserName NVARCHAR(200);								-- 子層用戶帳號
	DECLARE @agentLevelSCID INT;									-- 
	DECLARE @checkSubAgent INT;										-- 
	DECLARE @getWinLoseMemberID INT;								-- 
	DECLARE @subMemberID INT;										-- 子層用戶ID
	DECLARE @subAgentParentID INT;									-- 子層用戶的父層ID
	DECLARE @subAgentPositionTakingRebate NVARCHAR(200);			-- 子層用戶PositionTaking
	DECLARE @subAgentParentMap NVARCHAR(200);						-- 子層用戶Map
	DECLARE @newSubAgentParentMap NVARCHAR(200);					-- 新的Map檢查用
	DECLARE @calculatorCount INT;
	DECLARE @nowTypeCode NVARCHAR(200);	
	DECLARE @winLoseMoney DECIMAL(18,4) = 0;
	DECLARE @vipWinLoseMoney DECIMAL(18,4) = 0;
	DECLARE @totalDiscountPrice DECIMAL(18,4) = 0;
	DECLARE @turnOver DECIMAL(18,4) = 0;
	DECLARE @vipTurnOver DECIMAL(18,4) = 0;
	DECLARE @totalComission DECIMAL(18,4) = 0;
	DECLARE @profit DECIMAL(18,4) = 0;
	DECLARE @layerTotalProfit DECIMAL(18,4) = 0;
	DECLARE @vipProfit DECIMAL(18,4) = 0;
	DECLARE @vipLayerTotalProfit DECIMAL(18,4) = 0;
	DECLARE @upper DECIMAL(18,4) = 0;
	DECLARE @vipUpper DECIMAL(18,4) = 0;
	DECLARE @initialCredit DECIMAL(18,4) = 0;
	DECLARE @totalPrice DECIMAL(18,4) = 0;
	DECLARE @cashBalance DECIMAL(18,4) = 0;
	DECLARE @dateS DATETIME;										--查詢區間(起)
	DECLARE @dateE DATETIME;										--查詢區間(訖)

	-- 設定啟始與結束時間
	SELECT @dateS = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 00:00:00'
	, @dateE = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 23:59:59'
	--SELECT @dateS = '2021/6/10 00:00:00', @dateE = '2021/6/10 23:59:59';
	
	DROP TABLE IF EXISTS #tempNewMemberShip;

	SELECT * INTO #tempNewMemberShip 
		FROM MemberShip WITH(NOLOCK)
		WHERE AgentParentMap LIKE @userName + '%'

	-- --複製當天的投注表
	--WITH NewMemberShip AS (
	--	SELECT main.*
	--	FROM [GHL].[dbo].[MemberShip] AS main WITH(NOLOCK) WHERE main.UserName = @userName
	--	UNION ALL
	--	--跟 CTE 自身做遞迴 JOIN (A 的上級主管[SuperiorNum]是 EmployeeOrder 的員工編號[EmployeeNum])
	--	SELECT subJoin.*
	--	FROM [GHL].[dbo].[MemberShip] AS subJoin WITH(NOLOCK)
	--	inner join NewMemberShip ON NewMemberShip.MemberID = subJoin.AgentParentID
	--)
	--SELECT * INTO #tempNewMemberShip 
	--FROM NewMemberShip
	--OPTION (MAXRECURSION 0);  ---要加 hint : OPTION (MAXRECURSION 0)  表示 遞迴為無限制
	
	SELECT @memberID = MemberID 
		FROM #tempNewMemberShip
		WHERE UserName = @userName

	SELECT @subUserCount = count(*) 
		FROM #tempNewMemberShip
		WHERE [UserType] != '10'

	-- 開始進行計算
	WHILE @subUserCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT @subMemberID = MemberID
			,@subUserName = UserName
			,@subAgentParentID = AgentParentID
			,@subAgentParentMap = AgentParentMap
			,@subAgentPositionTakingRebate = AgentPositionTakingRebate
			,@agentLevelSCID = AgentLevelSCID
			FROM #tempNewMemberShip
		WHERE [UserType] != '10'
		ORDER BY #tempNewMemberShip.MemberID
		OFFSET     (@subUserCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;

		-- 建立新的Map檢查用
		IF NULLIF(@subAgentParentMap, '') = ''
		BEGIN
			SET @newSubAgentParentMap = @subUserName + '/';
		END;
		ELSE IF @agentLevelSCID = 31
		BEGIN
			SET @newSubAgentParentMap = @subAgentParentMap;
		END;
		ELSE
		BEGIN
			SET @newSubAgentParentMap = @subAgentParentMap + @subUserName + '/'
		END;

		IF @agentLevelSCID = 31
		BEGIN
			-- 取出Wallet
			SELECT @totalPrice = ISNULL(SUM((CAST(NULLIF(mw.[TotalPrice], '') AS decimal(18, 4)))),0 )
				FROM MWallet as mw WITH(NOLOCK)
				INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mw.MemberID
				WHERE ms.[AgentParentMap] LIKE '%' + @newSubAgentParentMap + '%'
					AND ms.AgentParentID = @subMemberID

			-- 進行WinLose 總計算
			-- 進行TurnOver 總計算
			SELECT @turnOver = ISNULL(SUM((CAST(NULLIF(mpr.[TurnOverMoney], '') AS decimal(18, 4)))),0 ),
				@totalDiscountPrice = ISNULL(SUM((CAST(NULLIF(mp.[DiscountPrice], '') AS decimal(18, 4)))),0 ),
				@winLoseMoney = ISNULL(SUM((CAST(NULLIF(mpr.[RecordMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[MPlayerReport] AS mpr WITH(NOLOCK)
					INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
					INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.MemberID
				WHERE  mpr.[TypeCode] IN ('Win', 'Loss')
					AND ms.[AgentParentMap] LIKE @newSubAgentParentMap + '%'
					--AND ms.AgentParentID = @subMemberID
					AND ms.AgentLevelSCID = 32
					AND mp.[UpdateDate] >= @dateS
					AND mp.[UpdateDate] <= @dateE
					AND mp.[IsReset] = 0

			-- 取出用戶相對的Angent
			SELECT @profit = ISNULL(SUM((CAST(NULLIF(mpr.[AgentMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[MPlayerReport] AS mpr WITH(NOLOCK)
				INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
				INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.[AngentMemberID]
				WHERE mpr.[AngentMemberID] = @subMemberID
					AND mpr.[TypeCode] IN ('Angent')
					AND mp.[UpdateDate] >= @dateS
					AND mp.[UpdateDate] <= @dateE
					AND mp.[IsReset] = 0

			-- Upper
			SELECT @layerTotalProfit = ISNULL(SUM((CAST(NULLIF(mpr.[AgentMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[MPlayerReport] AS mpr WITH(NOLOCK)
				INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
				INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.AngentMemberID
				WHERE ms.[AgentParentMap] like @newSubAgentParentMap + @subUserName + '%'
					--AND ms.AgentParentID = @subMemberID
					AND mpr.[TypeCode] IN ('Angent')
					AND mp.[UpdateDate] >= @dateS
					AND mp.[UpdateDate] <= @dateE
					AND mp.[IsReset] = 0
		END;
		ELSE
		BEGIN
			-- 取出Wallet
			SELECT @totalPrice = ISNULL(SUM((CAST(NULLIF(mw.[TotalPrice], '') AS decimal(18, 4)))),0 )
				FROM MWallet as mw WITH(NOLOCK)
				INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mw.MemberID
				WHERE ms.[AgentParentMap] LIKE '%' + @newSubAgentParentMap + '%'

			-- 進行WinLose 總計算
			-- 進行TurnOver 總計算
			SELECT @turnOver = ISNULL(SUM((CAST(NULLIF(mpr.[TurnOverMoney], '') AS decimal(18, 4)))),0 ),
				@totalDiscountPrice = ISNULL(SUM((CAST(NULLIF(mp.[DiscountPrice], '') AS decimal(18, 4)))),0 ),
				@winLoseMoney = ISNULL(SUM((CAST(NULLIF(mpr.[RecordMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[MPlayerReport] AS mpr WITH(NOLOCK)
					INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
					INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.MemberID
				WHERE mpr.[TypeCode] IN ('Win', 'Loss')
					AND ms.[AgentParentMap] LIKE @newSubAgentParentMap + '%'
					AND ms.AgentLevelSCID = 32
					AND mp.[UpdateDate] >= @dateS
					AND mp.[UpdateDate] <= @dateE
					AND mp.[IsReset] = 0

			-- 取出用戶相對的Angent
			SELECT @profit = ISNULL(SUM((CAST(NULLIF(mpr.[AgentMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[MPlayerReport] AS mpr WITH(NOLOCK)
				INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
				INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.[AngentMemberID]
				WHERE mpr.[AngentMemberID] = @subMemberID
					AND mpr.[TypeCode] IN ('Angent')
					AND mp.[UpdateDate] >= @dateS
					AND mp.[UpdateDate] <= @dateE
					AND mp.[IsReset] = 0
				
			-- Upper
			SELECT @layerTotalProfit = ISNULL(SUM((CAST(NULLIF(mpr.[AgentMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[MPlayerReport] AS mpr WITH(NOLOCK)
				INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
				INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.AngentMemberID
				WHERE ms.[AgentParentMap] like @newSubAgentParentMap + '%'
					AND mpr.[TypeCode] IN ('Angent')
					AND mp.[UpdateDate] >= @dateS
					AND mp.[UpdateDate] <= @dateE
					AND mp.[IsReset] = 0

		END;

		SET @upper = (@winLoseMoney - @layerTotalProfit - @profit);

		IF @turnOver >0 OR @vipTurnOver >0
		BEGIN
			
			--SELECT @subAgentParentID,@subUserName,@upper,@winLoseMoney,@layerTotalProfit,@profit
			
			Select @checkDataCount = Count(*) From [dbo].[WinLoseReport]
			Where [MemberID] = @subMemberID 
				AND [CreateDate] >= @dateS
				AND [CreateDate] <= @dateE

			-- 有資料則Update
			IF @checkDataCount > 0
			BEGIN
				UPDATE [dbo].[WinLoseReport] 
					SET [WinLoseMoney] = CAST(ISNULL(NULLIF(CAST(@winLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TotalDiscountPrice] = CAST(ISNULL(NULLIF(CAST(@totalDiscountPrice AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPWinLoseMoney] = CAST(ISNULL(NULLIF(CAST(@vipWinLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TurnOver] = CAST(ISNULL(NULLIF(CAST(@turnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPTurnOver] = CAST(ISNULL(NULLIF(CAST(@vipTurnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TotalComission] = CAST(ISNULL(NULLIF(CAST(@totalComission AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[Profit] = CAST(ISNULL(NULLIF(CAST(@profit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPProfit] = CAST(ISNULL(NULLIF(CAST(@vipProfit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[UpperTotal] = CAST(ISNULL(NULLIF(CAST(@upper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPUpperTotal] = CAST(ISNULL(NULLIF(CAST(@vipUpper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[InitialCredit] = CAST(ISNULL(NULLIF(CAST(@initialCredit AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[CreditBalance] = CAST(ISNULL(NULLIF(CAST(@totalPrice AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[CashBalance] = CAST(ISNULL(NULLIF(CAST(@cashBalance AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[UpdateDate] = GETDATE()
					WHERE [MemberID] = @subMemberID  
						AND [CreateDate] >= @dateS
						AND [CreateDate] <= @dateE

			END;
			-- 沒資料則Add
			ELSE
			BEGIN
				INSERT INTO [dbo].[WinLoseReport] ([MemberID]
						  ,[UserName]
						  ,[AgentParentID]
						  ,[AgentPositionTakingRebate]
						  ,[AgentParentMap]
						  ,[WinLoseMoney]
						  ,[TotalDiscountPrice]
						  ,[VIPWinLoseMoney]
						  ,[TurnOver]
						  ,[VIPTurnOver]
						  ,[TotalComission]
						  ,[Profit]
						  ,[VIPProfit]
						  ,[UpperTotal]
						  ,[VIPUpperTotal]
						  ,[InitialCredit]
						  ,[CreditBalance]
						  ,[CashBalance]
						  ,[CreateBy]
						  ,[CreateDate]
						  ,[UpdateBy]
						  ,[UpdateDate])
					VALUES (@subMemberID
						  ,@subUserName
						  ,@subAgentParentID
						  ,@subAgentPositionTakingRebate
						  ,@subAgentParentMap
						  ,CAST(ISNULL(NULLIF(CAST(@winLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@totalDiscountPrice AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipWinLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@turnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipTurnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@totalComission AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@profit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipProfit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@upper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipUpper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@initialCredit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@totalPrice AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@cashBalance AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,0
						  ,@dateS
						  ,0
						  ,@dateE
					)
			END;
		END;

		SET @subUserCount = @subUserCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculatorWinLoseReportDetail]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 說明: 
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20201118			Yark				
-- =============================================
CREATE PROCEDURE [dbo].[sp_CalculatorWinLoseReportDetail]
AS
BEGIN
	DECLARE @userName NVARCHAR(200) = 'Admin';						-- 起始的帳號
	DECLARE @memberID INT;											-- 用戶ID
	DECLARE @agentPositionTakingRebate NVARCHAR(200);				-- PositionTaking
	DECLARE @agentParentID INT;										-- 用戶的父層ID
	DECLARE @agentParentMap NVARCHAR(200);							-- 子層用戶Map
	DECLARE @checkDataCount INT;									-- 確認資料筆數							
	DECLARE @userCount INT;											-- 資料筆數						
	DECLARE @subUserCount INT;										-- 子層資料筆數
	DECLARE @subUserName NVARCHAR(200);								-- 子層用戶帳號
	DECLARE @subMemberID INT;										-- 子層用戶ID
	DECLARE @subAgentParentID INT;									-- 子層用戶的父層ID
	DECLARE @subAgentPositionTakingRebate NVARCHAR(200);			-- 子層用戶PositionTaking
	DECLARE @subAgentParentMap NVARCHAR(200);						-- 子層用戶Map
	DECLARE @subProfit DECIMAL(18,4) = 0;
	DECLARE @subVipProfit DECIMAL(18,4) = 0;
	DECLARE @calculatorCount INT;
	DECLARE @nowTypeCode NVARCHAR(200);	
	DECLARE @winLoseMoney DECIMAL(18,4) = 0;
	DECLARE @vipWinLoseMoney DECIMAL(18,4) = 0;
	DECLARE @totalDiscountPrice DECIMAL(18,4) = 0;
	DECLARE @turnOver DECIMAL(18,4) = 0;
	DECLARE @vipTurnOver DECIMAL(18,4) = 0;
	DECLARE @totalComission DECIMAL(18,4) = 0;
	DECLARE @profit DECIMAL(18,4) = 0;
	DECLARE @vipProfit DECIMAL(18,4) = 0;
	DECLARE @layerTotalProfit DECIMAL(18,4) = 0;
	DECLARE @vipLayerTotalProfit DECIMAL(18,4) = 0;
	DECLARE @upper DECIMAL(18,4) = 0;
	DECLARE @vipUpper DECIMAL(18,4) = 0;
	DECLARE @subUpper DECIMAL(18,4) = 0;
	DECLARE @subVipUpper DECIMAL(18,4) = 0;
	DECLARE @initialCredit DECIMAL(18,4) = 0;
	DECLARE @creditBalance DECIMAL(18,4) = 0;
	DECLARE @cashBalance DECIMAL(18,4) = 0;
	DECLARE @dateS DATETIME;										--查詢區間(起)
	DECLARE @dateE DATETIME;										--查詢區間(訖)

	-- 設定啟始與結束時間
	SELECT @dateS = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 00:00:00'
	, @dateE = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 23:59:59'
	--SELECT @dateS = '2020/11/04 00:00:00', @dateE = '2020/11/04 23:59:59';

	SELECT @dateS, @dateE
	
	DROP TABLE IF EXISTS #tempWinLoseReport;
	DROP TABLE IF EXISTS #tempNewMemberShip;

	 --複製當天的投注表
	WITH NewMemberShip AS (
		SELECT main.*
		FROM [dbo].[MemberShip] AS main WITH(NOLOCK) WHERE main.UserName = @userName
		UNION ALL
		--跟 CTE 自身做遞迴 JOIN (A 的上級主管[SuperiorNum]是 EmployeeOrder 的員工編號[EmployeeNum])
		SELECT subJoin.*
		FROM [dbo].[MemberShip] AS subJoin WITH(NOLOCK)
		inner join NewMemberShip ON NewMemberShip.MemberID = subJoin.AgentParentID
	)
	SELECT * INTO #tempNewMemberShip
		FROM [NewMemberShip]

	SELECT * INTO #tempWinLoseReport
		FROM [dbo].[WinLoseReport] WITH(NOLOCK)
		WHERE [CreateDate] >= @dateS
			AND [CreateDate] <= @dateE
			AND [SourceMemberID] IS NULL
			AND [SourceUserName] IS NULL
	
	SELECT @userCount = COUNT(*) 
		FROM #tempNewMemberShip
		WHERE [UserType] != '10'
			AND [AgentLevelSCID] < 31

	-- 開始進行計算
	WHILE @userCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT @memberID = MemberID
			,@userName = UserName
			,@agentPositionTakingRebate = AgentPositionTakingRebate
			,@agentParentID = AgentParentID
			FROM #tempNewMemberShip
			WHERE [UserType] != '10'
				AND AgentLevelSCID < 31
			ORDER BY #tempNewMemberShip.MemberID
			OFFSET     (@userCount - 1) ROWS
			FETCH NEXT 1 ROWS ONLY;

		SELECT @subUserCount = COUNT(*) 
			FROM #tempWinLoseReport
			Where AgentParentID = @memberID

		WHILE @subUserCount > 0
		BEGIN
			SELECT @subMemberID = MemberID
				,@subUserName = UserName
				,@subAgentParentID = ISNULL(NULLIF(AgentParentID, ''),0 )
				,@subAgentParentMap = AgentParentMap
				,@subAgentPositionTakingRebate = AgentPositionTakingRebate
				,@subProfit = Profit
				,@subVipProfit = VipProfit
				,@winLoseMoney = WinLoseMoney
				,@vipWinLoseMoney = VipWinLoseMoney
				,@turnOver = TurnOver
				,@totalDiscountPrice = TotalDiscountPrice
				,@vipTurnOver = VIPTurnOver
				,@totalComission = TotalComission
				,@subUpper = [UpperTotal]
				,@subVipUpper = [VipUpperTotal]
				,@cashBalance = [CashBalance]
				,@creditBalance = [CreditBalance]
			FROM #tempWinLoseReport
			Where AgentParentID = @memberID
			ORDER BY #tempWinLoseReport.MemberID
			OFFSET     (@subUserCount - 1) ROWS
			FETCH NEXT 1 ROWS ONLY;

			IF @memberID = @subMemberID
			BEGIN
				SET @subUserCount = @subUserCount - 1;
				CONTINUE;
			END;

			DECLARE @calculatorPT DECIMAL(18,4) = CAST(ISNULL(NULLIF(@agentPositionTakingRebate, ''),0 ) AS DECIMAL(18, 4)) - CAST(ISNULL(NULLIF(@subAgentPositionTakingRebate, ''),0 ) AS DECIMAL(18, 4));
			
			SET @profit = @winLoseMoney * @calculatorPT;
			SET @vipProfit = @totalComission * @calculatorPT;

			SET @upper = @subUpper - @profit;
			SET @vipUpper = (@subVipUpper + @vipProfit);

			Select @checkDataCount = Count(*) From [dbo].[WinLoseReport]
			Where [MemberID] = @memberID 
				AND [SourceMemberID] = @subMemberID 
				AND [CreateDate] >= @dateS
				AND [CreateDate] <= @dateE

			IF @checkDataCount > 0
			BEGIN
				UPDATE [dbo].[WinLoseReport] 
					SET [WinLoseMoney] = CAST(ISNULL(NULLIF(CAST(@winLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPWinLoseMoney] = CAST(ISNULL(NULLIF(CAST(@vipWinLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TotalDiscountPrice] = CAST(ISNULL(NULLIF(CAST(@totalDiscountPrice AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TurnOver] = CAST(ISNULL(NULLIF(CAST(@turnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPTurnOver] = CAST(ISNULL(NULLIF(CAST(@vipTurnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TotalComission] = CAST(ISNULL(NULLIF(CAST(@totalComission AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[Profit] = CAST(ISNULL(NULLIF(CAST(@profit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPProfit] = CAST(ISNULL(NULLIF(CAST(@vipProfit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[UpperTotal] = CAST(ISNULL(NULLIF(CAST(@upper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPUpperTotal] = CAST(ISNULL(NULLIF(CAST(@vipUpper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[InitialCredit] = CAST(ISNULL(NULLIF(CAST(@initialCredit AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[CreditBalance] = CAST(ISNULL(NULLIF(CAST(@creditBalance AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[CashBalance] = CAST(ISNULL(NULLIF(CAST(@cashBalance AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[UpdateDate] = GETDATE()
					WHERE [MemberID] = @memberID 
						AND [SourceMemberID] = @subMemberID 
						AND [CreateDate] >= @dateS
						AND [CreateDate] <= @dateE
			END;
			ELSE
			BEGIN
				INSERT INTO [dbo].[WinLoseReport] ([MemberID]
						  ,[UserName]
						  ,[SourceMemberID]
						  ,[SourceUserName]
						  ,[AgentParentID]
						  ,[AgentPositionTakingRebate]
						  ,[AgentParentMap]
						  ,[WinLoseMoney]
						  ,[VIPWinLoseMoney]
						  ,[TotalDiscountPrice]
						  ,[TurnOver]
						  ,[VIPTurnOver]
						  ,[TotalComission]
						  ,[Profit]
						  ,[VIPProfit]
						  ,[UpperTotal]
						  ,[VIPUpperTotal]
						  ,[InitialCredit]
						  ,[CreditBalance]
						  ,[CashBalance]
						  ,[CreateBy]
						  ,[CreateDate]
						  ,[UpdateBy]
						  ,[UpdateDate])
					VALUES (@memberID
						  ,@userName
						  ,@subMemberID
						  ,@subUserName
						  ,@subAgentParentID
						  ,@subAgentPositionTakingRebate
						  ,@subAgentParentMap
						  ,CAST(ISNULL(NULLIF(CAST(@winLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipWinLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@totalDiscountPrice AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@turnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipTurnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@totalComission AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@profit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipProfit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@upper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipUpper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@initialCredit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@creditBalance AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@cashBalance AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,0
						  ,@dateS
						  ,0
						  ,@dateE
					)
			END;
			
			SET @subUserCount = @subUserCount - 1;
		END;

		SET @userCount = @userCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CashBackReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20200308			Yark				進行代理費計算
-- 2			20200310			Yark				加入Statement Report
-- 3			20200713			Yark				加入CurrentPeriod
-- 4			20200816			Yark				CashRebate修改為流水不是輸贏
-- 5			20200902			Ben					CashRabete/CashBack不加入Statement及錢包,由後台確認後才發放
-- 6			20200908			Yark				調整發放規則(不列入Statement，待後台確認才寫入)
-- 7			20200914			Ben					修改起訖時間規則
-- 8			20200915			Ben					增加抓取VwCashBack條件(起訖日,狀態),如無或等於0則不寫入Report
-- 9			20200915			Yark				加入maxLoss及minLoss判斷
-- 10			20200919			Yark				加入Promotion判斷
-- 11			20201203			Ben					加入LotteryClass抓取CBRS判斷判斷,Min.Max Loss
-- 12			20210226			Ben					WinLose Money減掉TotalBet
-- 13			20210315			Ben					計算TotalLose,加入Record Money計算
-- =============================================
CREATE PROCEDURE [dbo].[sp_CashBackReport]
(@payType int)
AS
BEGIN
	DECLARE @userCount int; -- 要計算的用戶數
	DECLARE @memberID int;
	DECLARE @userLevelID int;
	DECLARE @mPlayerCount int;
	DECLARE @lotteryClassCount int; 
	DECLARE @totalBet decimal(18, 4);					-- 總投注
	DECLARE @totalWinMoney decimal(18, 4);
	DECLARE @totalLoseMoney decimal(18, 4);
	DECLARE @totalClassBet decimal(18, 4);					-- 總投注
	DECLARE @totalClassWinMoney decimal(18, 4);
	DECLARE @totalClassLoseMoney decimal(18, 4);
	--DECLARE @payType int = 34;
	DECLARE @mPlayerID int = -1;
	
	DECLARE @gameRoomID int = 1;
	DECLARE @lotteryClassID int;
	DECLARE @typeCode varchar(200) = 'Win';
	DECLARE @cashBackRebateMoney varchar(200) = '';				--CashBackRebate
	DECLARE @totalCashBackRebateMoney decimal(18, 4);				--CashBackRebate
	DECLARE @cashBackRebateProcentage varchar(200) = '';		--CashBackRebateProcentage
	DECLARE @minLoss decimal(18, 4);							--MinLoss
	DECLARE @maxLoss decimal(18, 4);							--MaxLoss
	DECLARE @dateS varchar(200) = '';
	DECLARE @dateE varchar(200) = '';
	DECLARE @updateDate varchar(200) = '';
	DECLARE @mPromotionCheck bit = 0;

	-- 設定啟始與結束時間
	-- 日
	IF @payType = 34
	Begin
		SELECT @dateS = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 00:00:00', 120), @dateE = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 23:59:59' , 120);
	End;
	ELSE IF @payType = 35
	Begin
		SELECT @dateS = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -7, getdate()), 111) + ' 00:00:00', 120), @dateE = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 23:59:59' , 120);
	End;
	ELSE IF @payType = 36
	Begin
		SELECT @dateS = CONVERT(varchar, CONVERT(varchar, DATEADD(MONTH, -1, getdate()), 111) + ' 00:00:00', 120), @dateE = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 23:59:59' , 120);
	End;
	
	SET @updateDate = DATEADD(DAY, +1, @dateE)

	SELECT @gameRoomID = [GameRoomID]
		FROM [dbo].[GameRoomType]
		WHERE [GameName] = 'Lottery'

	DROP TABLE IF EXISTS #tempVwMPlayer
	 --複製當天的投注表
	SELECT * INTO #tempVwMPlayer FROM VwMPlayer with(nolock)
	WHERE CreateDate >= @dateS AND 
		CreateDate <= @dateE AND 
		IsCashBackWriteReport = 0 AND
		CashBackRebatePayType = @payType AND
		IsReset = 0

	 --複製當天的投注表計算總額
	DROP TABLE IF EXISTS #tempTotalMPlayer
	SELECT * INTO #tempTotalMPlayer FROM (
		SELECT MemberID,LotteryClassID, SUM(CONVERT(DECIMAL(18, 4), ISNULL(Price, 0))) as 'TotalBet',
						SUM(CONVERT(DECIMAL(18, 4), ISNULL(WinMoney, 0))) as 'TotalWinMoney' ,
						SUM(CASE WHEN CONVERT(DECIMAL(18, 4), ISNULL(WinMoney, 0)) = 0  THEN CONVERT(DECIMAL(18, 4), ISNULL(Price, 0)) ELSE 0 END) as 'TotalLoseMoney' 
			FROM #tempVwMPlayer with(nolock)
			WHERE CreateDate >= @dateS AND CreateDate <= @dateE
			GROUP BY MemberID,LotteryClassID
			) AS MplayerTable;

	--取出付款型別的用戶數量
	DROP TABLE IF EXISTS #tempMemberShip
	SELECT * INTO #tempMemberShip 
		FROM MemberShip WITH(NOLOCK) 
		--WHERE CashBackRebatePayType = @payType

	--取出遊戲類型
	DROP TABLE IF EXISTS #tempLotteryClass
	SELECT * INTO #tempLotteryClass
		FROM LotteryClass WITH(NOLOCK) 
		
	SELECT @userCount = count(*)
		FROM #tempMemberShip;

	WHILE @userCount > 0
	BEGIN
		-- Step 0. 取出用戶資料
		SELECT 
			@memberID = MemberID,
			@userLevelID = UserLevelID
			FROM #tempMemberShip 
		ORDER BY #tempMemberShip.MemberID
		OFFSET     (@userCount-1) ROWS
		FETCH NEXT 1 ROWS ONLY;
		
		-- Step 1. 檢查進行中Promotion
		SET @mPromotionCheck = 0;
		SELECT @mPromotionCheck = ISNULL(IslockWithdrawal, 0) 
			FROM MPromotion 
			WHERE MemberID = @memberID AND IslockWithdrawal = 1;

		IF @mPromotionCheck = 0
		BEGIN
		
			SET @totalBet = 0;
			SET @totalWinMoney = 0;
			SET @totalLoseMoney = 0;
			SET @totalCashBackRebateMoney = 0;
			SELECT @lotteryClassCount = count(*)
				FROM #tempLotteryClass

			WHILE @lotteryClassCount > 0
			BEGIN
				SELECT @lotteryClassID = LotteryClassID 
					FROM #tempLotteryClass 
				ORDER BY #tempLotteryClass.LotteryClassID
				OFFSET     (@lotteryClassCount-1) ROWS
				FETCH NEXT 1 ROWS ONLY;
				
				SET @totalClassBet = Null;
				SET @totalClassWinMoney = Null;
				SET @totalClassLoseMoney = Null;
				-- 取得用戶的總投注及總WinMoney

				SELECT @totalClassBet = (CAST(TotalBet AS decimal(18, 4))) ,
						@totalClassWinMoney = (CAST(TotalWinMoney AS decimal(18, 4))) ,
						@totalClassLoseMoney = (CAST(TotalLoseMoney AS decimal(18, 4)))
					FROM #tempTotalMPlayer
					WHERE MemberID = @memberID AND LotteryClassID = @lotteryClassID;			
				
				SET @totalClassBet = ISNULL(@totalClassBet,0)
				SET @totalClassWinMoney = ISNULL(@totalClassWinMoney,0)
				SET @totalClassLoseMoney = ISNULL(@totalClassLoseMoney,0)

				-- Lose 才計算 CashBack
				IF @totalClassLoseMoney > 0
				BEGIN
					SET @typeCode = 'CashBack'
					SET @cashBackRebateProcentage = ''

					-- 取得用戶的CashBackRebateProcentage
					-- 20201124 Ben 新增payType,classID判斷
					SELECT @cashBackRebateProcentage = CashBackRebate,
							@minLoss = (CAST(ISNULL(NULLIF(MinLoss, ''),0 ) AS decimal(18, 4))),
							@maxLoss = (CAST(ISNULL(NULLIF(MaxLoss, ''),0 ) AS decimal(18, 4)))
						FROM [dbo].[VwCashBackRSetting]
						WHERE UserLevelID = @userLevelID AND Status = 1 AND RebateType = 1 AND PayType = @payType AND (GameRoomID = @gameRoomID or LotteryClassID = @lotteryClassID)
							AND DateS <= DATEADD(DAY, -1, getdate()) AND DateE >= DATEADD(DAY, -1, getdate())

					-- 20200915 Yark 加入判斷總輸要>minLoss的判斷
					-- 20200915 Ben percent大於0再計算
					IF @cashBackRebateProcentage != '' AND @totalClassLoseMoney > @minLoss
					BEGIN
						IF @totalClassLoseMoney <= @maxLoss
						BEGIN
							SELECT @cashBackRebateMoney = (CAST(@cashBackRebateProcentage AS decimal(18,4)) * @totalClassLoseMoney);
						END;
						ELSE
						BEGIN
							SELECT @cashBackRebateMoney = (CAST(@cashBackRebateProcentage AS decimal(18,4)) * (@maxLoss));
						END;

						SET @totalCashBackRebateMoney = @totalCashBackRebateMoney + @cashBackRebateMoney
					END
					
				END;

				--SET @totalBet = @totalBet + @totalClassBet;
				--SET @totalWinMoney = @totalWinMoney + @totalClassWinMoney;
				SET @lotteryClassCount = @lotteryClassCount - 1;
			END

			--每個遊戲類別CashBack加總>0
			IF @totalCashBackRebateMoney > 0
			BEGIN
				SELECT @totalBet = SUM(CAST(TotalBet AS decimal(18, 4))),
						@totalWinMoney = SUM(CAST(TotalWinMoney AS decimal(18, 4))),
						@totalLoseMoney = SUM(CAST(TotalLoseMoney AS decimal(18, 4)))
					FROM #tempTotalMPlayer
					WHERE MemberID = @memberID
				
				INSERT INTO MPlayerReport ([MemberID], [MPlayerID], [TurnOverMoney], [TypeCode], [Status], [RecordMoney], [CashRebateMoney], [CashBackRebateMoney], [CashBackRebatePayType],
					[ReferralLevel], [AgentLevelSCID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
					values (@memberID, -1, @totalBet, @typeCode, NULL, @totalWinMoney - @totalLoseMoney, NULL, @totalCashBackRebateMoney, @payType,
						CONVERT(varchar,@userLevelID)+','+@cashBackRebateProcentage, 32, 0, @dateS, 0, @updateDate)
			END
	
			-- Step 2. 取出投注資料
			-- 更新目前己計算的MPlayer
			SELECT @mPlayerCount = COUNT(*)  
				FROM #tempVwMPlayer
				WHERE MemberID = @memberID and isWin in (0,1);

			WHILE @mPlayerCount > 0
				BEGIN
					SELECT @mPlayerID = ID
					FROM #tempVwMPlayer
						WHERE MemberID = @memberID and isWin in (0, 1)
						ORDER BY #tempVwMPlayer.CurrentPeriod
					OFFSET     (@mPlayerCount-1) ROWS
					FETCH NEXT 1 ROWS ONLY;

					UPDATE MPlayer SET IsCashBackWriteReport = 1 
						WHERE ID = @mPlayerID
				
					SET @mPlayerCount = @mPlayerCount - 1;
					CONTINUE  
				END;
		END;
		SET @userCount = @userCount - 1;
		CONTINUE;
	END;
END



GO
/****** Object:  StoredProcedure [dbo].[sp_CashRebateReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- Step 0. 取得所有遊戲的CashRebate
-- Step 1. 取得所有遊戲
-- Step 2. 取得付款類型的單
-- Step 3. 
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20200308			Yark				進行代理費計算
-- 2			20200310			Yark				加入Statement Report
-- 3			20200713			Yark				加入CurrentPeriod
-- 4			20200816			Yark				CashRebate修改為流水不是輸贏
-- 5			20200902			Ben					CashRabete/CashBack不加入Statement及錢包,由後台確認後才發放
-- 6			20200908			Yark				調整發放規則(不列入Statement，待後台確認才寫入)
-- 7			20200914			Ben					修改起訖時間規則
-- 8			20200915			Ben					增加抓取VwCashBack條件(起訖日,狀態),如無或等於0則不寫入Report
-- 9			20200915			Yark				取出MinLoss與MaxLoss(其實是Bonus)，加入判斷超過最大Bonus則以最大Bonus給予
-- 10			20200919			Yark				加入Promotion判斷
-- 11			20201203			Ben					加入LotteryClass抓取CBRS判斷判斷,Min.Max Bonus
-- 12			20210104			Yark				調整CashRebate計算方式
-- 13			20210226			Ben					
-- 14			20210729			Yark				加入判斷< min則不計算，> max則以max為主
-- =============================================
CREATE PROCEDURE [dbo].[sp_CashRebateReport]
(@payType int)

AS
BEGIN
	DECLARE @vwCashRSettingCount int;							-- 要計算的cashRebate數量
	DECLARE @gameRoomID int;									-- 遊戲主類ID
	DECLARE @lotteryClassID int;								-- 遊戲大類ID
	DECLARE @lotteryTypeID int;									-- 遊戲中類ID
	DECLARE @lotteryInfoID int;									-- 遊戲ID
	DECLARE @userLevelID int;									-- VIP用戶等級
	DECLARE @lotteryClassIDForDetail int;
	--DECLARE @payType int;										-- 付款類型
	DECLARE @gameRoomCount int;									-- 遊戲主類數量
	DECLARE @lotteryClassCount int;								-- 遊戲大類數量
	DECLARE @lotteryTypeCount int;								-- 遊戲中類數量
	DECLARE @totalMPlayerCount int;								-- 統計總額的數量
	DECLARE @memberCount int;									-- 用戶的數量
	DECLARE @vwLotteryInfoHasGRIDCount int;						-- LotteryInfo數量
	DECLARE @mPlayerCount int;									-- MPlayer數量
	DECLARE @memberID int;										-- MemberID
	
	DECLARE @cashRebateProcentage varchar(200) = '';			-- CashRebateProcentage
	DECLARE @cashRebateMoney varchar(200) = '';					-- CashRebate金額
	DECLARE @totalCashRebateMoney decimal(18, 4);				-- CashRebate總額
	DECLARE @cashRebateCount int;								-- CashRebate的數量
	DECLARE @userCount int;										-- 要計算的用戶數
	DECLARE @qty decimal(18, 4);								-- 投注數量
	DECLARE @price decimal(18, 4);								-- 投注金額
	DECLARE @totalBet decimal(18, 4);							-- 總投注
	DECLARE @totalWinMoney decimal(18, 4);						-- 
	DECLARE @totalClassBet decimal(18, 4);						-- 總投注
	DECLARE @totalClassWinMoney decimal(18, 4);					-- 
	--DECLARE @payType int = 34;								
	DECLARE @mPlayerID int = -1;								-- 
	DECLARE @checkCashRebate int;								-- 檢查CashRebate是否存在
	
	DECLARE @typeCode varchar(200) = 'CashRebate';
	DECLARE @Status varchar(200) = '';
	DECLARE @recordMoney varchar(200) = '';						--WinMoney
	DECLARE @minBonus decimal(18, 4);							--MinLoss
	DECLARE @maxBonus decimal(18, 4);							--MaxLoss
	DECLARE @dateS varchar(200) = '';
	DECLARE @dateE varchar(200) = '';
	DECLARE @updateDate varchar(200) = '';
	DECLARE @mPromotionCheck bit = 0;

	-- 設定啟始與結束時間
	-- 日
	IF @payType = 34
	Begin
		SELECT @dateS = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 00:00:00', 120), @dateE = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 23:59:59' , 120);
	End;
	ELSE IF @payType = 35
	Begin
		SELECT @dateS = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -7, getdate()), 111) + ' 00:00:00', 120), @dateE = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 23:59:59' , 120);
	End;
	ELSE IF @payType = 36
	Begin
		SELECT @dateS = CONVERT(varchar, CONVERT(varchar, DATEADD(MONTH, -1, getdate()), 111) + ' 00:00:00', 120), @dateE = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 23:59:59' , 120);
	End;

	SET @updateDate = DATEADD(DAY, +1, @dateE)

	SELECT @gameRoomID = [GameRoomID]
		FROM [dbo].[GameRoomType]
		WHERE [GameName] = 'Lottery'

	-- 取得CBRS
	DROP TABLE IF EXISTS #tempVwCashRSetting
	SELECT * INTO #tempVwCashRSetting 
		FROM [VwCashRSetting]
		WHERE PayType = @payType
			AND ([DateS] <= @dateE AND [DateE] >= @dateS)

	SELECT @vwCashRSettingCount = COUNT(*)
		FROM #tempVwCashRSetting

	-- 取得相同計算type的注單
	DROP TABLE IF EXISTS #tempVwMPlayer
	 --複製當天的投注表
	SELECT * INTO #tempVwMPlayer 
		FROM VwMPlayer WITH(nolock)
		WHERE CreateDate >= @dateS AND 
			CreateDate <= @dateE AND 
			IsCashRebateWriteReport = 0 AND
			CashRebatePayType = @payType AND
			IsReset = 0
			
	SELECT @dateS,@dateE,@payType
	--SELECT * FROM #tempVwMPlayer

	--複製當天的投注表計算總額
	DROP TABLE IF EXISTS #tempTotalMPlayer
	SELECT * INTO #tempTotalMPlayer FROM (
		SELECT MemberID
			,LotteryClassID
			,LotteryTypeID
			,SUM(CONVERT(DECIMAL(18, 4), ISNULL(Price, 0))) as 'TotalBet'
			,SUM(CONVERT(DECIMAL(18, 4), ISNULL(WinMoney, 0))) as 'TotalWinMoney' 
			FROM #tempVwMPlayer with(nolock)
			WHERE CreateDate >= @dateS
				AND CreateDate <= @dateE
			GROUP BY MemberID, LotteryClassID, LotteryTypeID
			) AS MplayerTable;

	SELECT * FROM #tempTotalMPlayer

	--取出付款型別的用戶數量
	DROP TABLE IF EXISTS #tempMemberShip
	SELECT * INTO #tempMemberShip 
		FROM MemberShip WITH(NOLOCK) 

	WHILE @vwCashRSettingCount > 0
	BEGIN
		SET @gameRoomID = 0;
		SET @lotteryClassID = 0;
		SET @lotteryTypeID = 0;
		
		-- Step 0. 取出用戶資料
		SELECT @cashRebateProcentage = CashRebate
			,@gameRoomID = GameRoomID
			,@lotteryClassID = LotteryClassID
			,@lotteryTypeID = LotteryTypeID
			,@userLevelID = UserLevelID
			,@minBonus = (CAST(ISNULL(NULLIF(MinLoss, ''),0 ) AS decimal(18, 4)))
			,@maxBonus = (CAST(ISNULL(NULLIF(MaxLoss, ''),0 ) AS decimal(18, 4)))
			FROM #tempVwCashRSetting 
		ORDER BY #tempVwCashRSetting.CashRID
		OFFSET     (@vwCashRSettingCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;

		IF @cashRebateProcentage != ''
		BEGIN
			-- 先進行Member人數計算
			-- UserLevel檢查是否符合
			SELECT @memberCount = COUNT(*)
				FROM #tempMemberShip
				WHERE UserLevelID = @userLevelID
				
			--SELECT @memberCount,@userLevelID,@cashRebateProcentage,@gameRoomID,@lotteryClassID,@lotteryTypeID
			WHILE @memberCount > 0
			BEGIN
				-- Step 0. 取出用戶資料
				SELECT @memberID = MemberID
					FROM #tempMemberShip 
					WHERE UserLevelID = @userLevelID
				ORDER BY #tempMemberShip.MemberID
				OFFSET     (@memberCount - 1) ROWS
				FETCH NEXT 1 ROWS ONLY;
				
				SET @totalCashRebateMoney = 0;
				SET @totalBet = 0;
				
				--SELECT @memberID,@userLevelID,@lotteryTypeID,@lotteryClassID,@gameRoomID
				IF @lotteryTypeID > 0
				BEGIN
					SET @totalClassBet = 0;
					SET @totalClassWinMoney = 0;
					SET @cashRebateMoney = 0;

					SELECT @totalClassBet = SUM(TotalBet)
						,@totalClassWinMoney = SUM(TotalWinMoney)
						FROM #tempTotalMPlayer
						WHERE MemberID = @memberID
							AND LotteryTypeID = @lotteryTypeID
						Group By MemberID

					SET @cashRebateMoney = (CAST(@cashRebateProcentage AS decimal(18,4)) * @totalClassBet);

					IF @cashRebateMoney > @minBonus
					BEGIN
						-- 20200915 Yark 加入判斷如果大於最大Bonus則以最大Bonus為主要設定值
						IF @cashRebateMoney > @maxBonus
						BEGIN
							SET @cashRebateMoney = @maxBonus;
						END;
					END;
							
					SET @totalBet = @totalBet + @totalClassBet;
					SET @totalWinMoney = @totalWinMoney + @totalClassWinMoney;
					
					SELECT 'ByLotteryType', @memberID as memberID,@cashRebateMoney as cashRebateMoney,@totalClassBet as totalClassBet,@totalClassWinMoney as totalClassWinMoney

					IF @cashRebateMoney < @minBonus
					BEGIN
						SET @cashRebateMoney = 0;
					END;

					IF CAST(@cashRebateMoney AS decimal(18,4)) > 0
					BEGIN
						SELECT 'ByLotteryType', @memberID as memberID,@cashRebateMoney as cashRebateMoney,@totalClassBet as totalClassBet,@totalClassWinMoney as totalClassWinMoney

						SELECT @checkCashRebate = COUNT(*)
							FROM MPlayerReport
							WHERE [MemberID] = @memberID
								AND [TypeCode] = @typeCode
								AND [LotteryClassID] = @lotteryClassID
								AND [LotteryTypeID] = @lotteryTypeID
								AND [CashRebatePayType] = @payType
								AND [CreateDate] > @dateS
							
						IF @checkCashRebate > 0
						BEGIN
							UPDATE [MPlayerReport]
								SET [CashRebateMoney] = @totalCashRebateMoney
								WHERE [MemberID] = @memberID
									AND [LotteryClassID] = @lotteryClassID
									AND [LotteryTypeID] = @lotteryTypeID
									AND [CashRebatePayType] = @payType
									AND [CreateDate] > @dateS
						END;
						ELSE
						BEGIN
							INSERT INTO [MPlayerReport] ([MemberID], [MPlayerID], [LotteryClassID], [LotteryTypeID], [TurnOverMoney], [TypeCode], [Status]
								, [RecordMoney], [CashRebateMoney], [CashBackRebateMoney], [CashRebatePayType], [ReferralLevel], [AgentLevelSCID], [CreateBy], [CreateDate]
								, [UpdateBy], [UpdateDate])
								VALUES (@memberID, -1, @lotteryClassID, @lotteryTypeID, @totalBet, @typeCode, NULL
								, @recordMoney, @totalCashRebateMoney, 0, @payType, CONVERT(varchar,@userLevelID)+','+@cashRebateProcentage, 32, 0, @dateS, 0, @updateDate);
						END;
					END;
				END;
				ELSE IF @lotteryClassID > 0
				BEGIN
					SET @totalClassBet = 0;
					SET @totalClassWinMoney = 0;
					SET @cashRebateMoney = 0;

					SELECT @totalClassBet = SUM(TotalBet)
						,@totalClassWinMoney = SUM(TotalWinMoney)
						FROM #tempTotalMPlayer
						WHERE MemberID = @memberID
							AND LotteryClassID = @lotteryClassID
						Group By MemberID

					IF @totalClassBet = 0 
					BEGIN
						SET @memberCount = @memberCount - 1;
						continue;
					END

					SET @cashRebateMoney = (CAST(@cashRebateProcentage AS decimal(18,4)) * @totalClassBet);

					IF @cashRebateMoney > @minBonus
					BEGIN
						-- 20200915 Yark 加入判斷如果大於最大Bonus則以最大Bonus為主要設定值
						IF @cashRebateMoney > @maxBonus
						BEGIN
							SET @cashRebateMoney = @maxBonus;
						END;
					END;

					SET @totalBet = @totalBet + @totalClassBet;
					SET @totalWinMoney = @totalWinMoney + @totalClassWinMoney;
					
					IF @cashRebateMoney < @minBonus
					BEGIN
						SET @cashRebateMoney = 0;
					END;

					IF CAST(@cashRebateMoney AS decimal(18,4)) > 0
					BEGIN
						SELECT 'ByLotteryClass', @memberID as memberID,@cashRebateMoney as cashRebateMoney,@totalClassBet as totalClassBet,@totalClassWinMoney as totalClassWinMoney

						SET @checkCashRebate = 0;
						SELECT @checkCashRebate = COUNT(*)
							FROM MPlayerReport
							WHERE [MemberID] = @memberID
								AND [TypeCode] = @typeCode
								AND [LotteryClassID] = @lotteryClassID
								AND [LotteryTypeID] = @lotteryTypeID
								AND [CashRebatePayType] = @payType
								AND [CreateDate] = @dateS
						
						IF @checkCashRebate > 0
						BEGIN
							UPDATE [MPlayerReport]
								SET [CashRebateMoney] = @cashRebateMoney
								WHERE [MemberID] = @memberID
									AND [LotteryClassID] = @lotteryClassID
									AND [LotteryTypeID] = @lotteryTypeID
									AND [CashRebatePayType] = @payType
									AND [CreateDate] = @dateS
						END;
						ELSE
						BEGIN
							INSERT INTO [MPlayerReport] ([MemberID], [MPlayerID], [LotteryClassID], [LotteryTypeID], [TurnOverMoney], [TypeCode], [Status]
								, [RecordMoney], [CashRebateMoney], [CashBackRebateMoney], [CashRebatePayType], [ReferralLevel], [AgentLevelSCID], [CreateBy], [CreateDate]
								, [UpdateBy], [UpdateDate])
								VALUES (@memberID, -1, @lotteryClassID, @lotteryTypeID, @totalBet, @typeCode, NULL
								, @recordMoney, @cashRebateMoney, 0, @payType, CONVERT(varchar,@userLevelID)+','+@cashRebateProcentage, 32, 0, @dateS, 0, @updateDate);
						END;
					END;
				END;
				ELSE IF @gameRoomID > 0
				BEGIN
					-- 取得遊戲大類
					SELECT @lotteryClassCount = COUNT(*) 
						FROM LotteryClass
						WHERE GameRoomID = @gameRoomID
						
					WHILE @lotteryClassCount > 0
					BEGIN
						SET @totalClassBet = 0;
						SET @totalClassWinMoney = 0;

						SELECT @lotteryClassIDForDetail = LotteryClassID
							FROM LotteryClass
							WHERE GameRoomID = @gameRoomID
						ORDER BY LotteryClass.LotteryClassID
						OFFSET     (@lotteryClassCount - 1) ROWS
						FETCH NEXT 1 ROWS ONLY;

						SELECT @totalClassBet = SUM(TotalBet)
							,@totalClassWinMoney = SUM(TotalWinMoney)
							FROM #tempTotalMPlayer
							WHERE MemberID = @memberID
								AND LotteryClassID = @lotteryClassIDForDetail
							Group By MemberID

						SET @cashRebateMoney = (CAST(@cashRebateProcentage AS decimal(18,4)) * @totalClassBet);
												
						SET @totalBet = @totalBet + @totalClassBet;
						SET @totalWinMoney = @totalWinMoney + @totalClassWinMoney;
						SET @totalCashRebateMoney = @totalCashRebateMoney + @cashRebateMoney;

						SET @lotteryClassCount = @lotteryClassCount - 1;
					END;
					
					IF @totalCashRebateMoney < @minBonus
					BEGIN
						SET @totalCashRebateMoney = 0;
					END;

					IF @totalCashRebateMoney > 0
					BEGIN
						SELECT 'ByGameRoom', @memberID as memberID,@totalCashRebateMoney as totalCashRebateMoney,@totalBet as totalBet,@userLevelID as userLevelID

						IF @totalCashRebateMoney > @minBonus
						BEGIN
							-- 20200915 Yark 加入判斷如果大於最大Bonus則以最大Bonus為主要設定值
							IF @totalCashRebateMoney > @maxBonus
							BEGIN
								SET @totalCashRebateMoney = @maxBonus;
							END;
						END;

						SELECT @checkCashRebate = COUNT(*)
							FROM MPlayerReport
							WHERE [MemberID] = @memberID
								AND [TypeCode] = @typeCode
								AND [LotteryClassID] = @lotteryClassID
								AND [LotteryTypeID] = @lotteryTypeID
									AND [CashRebatePayType] = @payType
								AND [CreateDate] = @dateS
							
						IF @checkCashRebate > 0
						BEGIN
							UPDATE [MPlayerReport]
								SET [CashRebateMoney] = @totalCashRebateMoney
								WHERE [MemberID] = @memberID
									AND [LotteryClassID] = @lotteryClassID
									AND [LotteryTypeID] = @lotteryTypeID
									AND [CashRebatePayType] = @payType
									AND [CreateDate] = @dateS
						END;
						ELSE
						BEGIN
							INSERT INTO [MPlayerReport] ([MemberID], [MPlayerID], [LotteryClassID], [LotteryTypeID], [TurnOverMoney], [TypeCode], [Status]
								, [RecordMoney], [CashRebateMoney], [CashBackRebateMoney], [CashRebatePayType], [ReferralLevel], [AgentLevelSCID], [CreateBy], [CreateDate]
								, [UpdateBy], [UpdateDate])
								VALUES (@memberID, -1, @lotteryClassID, @lotteryTypeID, @totalBet, @typeCode, NULL
								, @recordMoney, @totalCashRebateMoney, 0, @payType, CONVERT(varchar,@userLevelID)+','+@cashRebateProcentage, 32, 0, @dateS, 0, @updateDate);
						END;
					END;
				END;
				
				-- Step 2. 取出投注資料
				-- 更新目前己計算的MPlayer
				SELECT @mPlayerCount = COUNT(*)  
					FROM #tempVwMPlayer
					WHERE MemberID = @memberID

				WHILE @mPlayerCount > 0
					BEGIN
						SELECT @mPlayerID = ID
						FROM #tempVwMPlayer
							WHERE MemberID = @memberID
							ORDER BY #tempVwMPlayer.CurrentPeriod
						OFFSET     (@mPlayerCount-1) ROWS
						FETCH NEXT 1 ROWS ONLY;

						UPDATE MPlayer SET IsCashRebateWriteReport = 1 
							WHERE ID = @mPlayerID
				
						SET @mPlayerCount = @mPlayerCount - 1;
						CONTINUE  
					END;

				SET @memberCount = @memberCount - 1;
			END;
		END;

		SET @vwCashRSettingCount = @vwCashRSettingCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CashRebateReportV20201203]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20200308			Yark				進行代理費計算
-- 2			20200310			Yark				加入Statement Report
-- 3			20200713			Yark				加入CurrentPeriod
-- 4			20200816			Yark				CashRebate修改為流水不是輸贏
-- 5			20200902			Ben					CashRabete/CashBack不加入Statement及錢包,由後台確認後才發放
-- 6			20200908			Yark				調整發放規則(不列入Statement，待後台確認才寫入)
-- 7			20200914			Ben					修改起訖時間規則
-- 8			20200915			Ben					增加抓取VwCashBack條件(起訖日,狀態),如無或等於0則不寫入Report
-- 9			20200915			Yark				取出MinLoss與MaxLoss(其實是Bonus)，加入判斷超過最大Bonus則以最大Bonus給予
-- 10			20200919			Yark				加入Promotion判斷
-- 11			20201203			Ben					加入LotteryClass抓取CBRS判斷判斷,Min.Max Bonus
-- =============================================
CREATE PROCEDURE [dbo].[sp_CashRebateReportV20201203]
(@payType int)
AS
BEGIN
	DECLARE @userCount int; -- 要計算的用戶數
	DECLARE @memberID int;
	DECLARE @userLevelID int;
	DECLARE @mPlayerCount int;
	DECLARE @lotteryClassCount int; 
	DECLARE @qty decimal(18, 4);						-- 投注數量
	DECLARE @price decimal(18, 4);						-- 投注金額
	DECLARE @totalBet decimal(18, 4);					-- 總投注
	DECLARE @totalWinMoney decimal(18, 4);
	DECLARE @totalClassBet decimal(18, 4);					-- 總投注
	DECLARE @totalClassWinMoney decimal(18, 4);
	--DECLARE @payType int = 34;
	DECLARE @mPlayerID int = -1;
	
	DECLARE @gameRoomID int = 1;
	DECLARE @lotteryClassID int;
	DECLARE @typeCode varchar(200) = 'Win';
	DECLARE @Status varchar(200) = '';
	DECLARE @recordMoney varchar(200) = '';						--WinMoney
	DECLARE @cashRebateMoney varchar(200) = '';					--CashRebate
	DECLARE @totalCashRebateMoney decimal(18, 4);				--CashBackRebate
	DECLARE @cashRebateProcentage varchar(200) = '';			--CashRebateProcentage
	DECLARE @minBonus decimal(18, 4);							--MinLoss
	DECLARE @maxBonus decimal(18, 4);							--MaxLoss
	DECLARE @dateS varchar(200) = '';
	DECLARE @dateE varchar(200) = '';
	DECLARE @mPromotionCheck bit = 0;

	-- 設定啟始與結束時間
	-- 日
	IF @payType = 34
	Begin
		SELECT @dateS = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 00:00:00', 120), @dateE = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 23:59:59' , 120);
	End;
	ELSE IF @payType = 35
	Begin
		SELECT @dateS = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -7, getdate()), 111) + ' 00:00:00', 120), @dateE = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -7, getdate()), 111) + ' 23:59:59' , 120);
	End;
	ELSE IF @payType = 36
	Begin
		SELECT @dateS = CONVERT(varchar, CONVERT(varchar, DATEADD(MONTH, -1, getdate()), 111) + ' 00:00:00', 120), @dateE = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 23:59:59' , 120);
	End;

	SELECT @gameRoomID = [GameRoomID]
		FROM [GHL].[dbo].[GameRoomType]
		WHERE [GameName] = 'Lottery'

	-- 取得CBRS
	DROP TABLE IF EXISTS #tempVwCashRSetting
	SELECT * INTO #tempVwCashRSetting 
		FROM [VwCashRSetting]
		WHERE PayType = @payType

	--取出遊戲類型,大類
	DROP TABLE IF EXISTS #tempLotteryClass
	SELECT * INTO #tempLotteryClass
		FROM LotteryClass WITH(NOLOCK) 

	--取出遊戲類型,中類
	DROP TABLE IF EXISTS #tempLotteryType
	SELECT * INTO #tempLotteryType
		FROM LotteryType WITH(NOLOCK) 
	
	-- 取得相同計算type的注單
	DROP TABLE IF EXISTS #tempVwMPlayer
	 --複製當天的投注表
	SELECT * INTO #tempVwMPlayer 
		FROM VwMPlayer WITH(nolock)
		WHERE CreateDate >= @dateS AND 
			CreateDate <= @dateE AND 
			IsCashRebateWriteReport = 0 AND
			CashRebatePayType = @payType

	 --複製當天的投注表計算總額
	DROP TABLE IF EXISTS #tempTotalMPlayer
	SELECT * INTO #tempTotalMPlayer FROM (
		SELECT MemberID
			,LotteryClassID
			,SUM(CONVERT(DECIMAL(18, 4), ISNULL(Price, 0))) as 'TotalBet'
			,SUM(CONVERT(DECIMAL(18, 4), ISNULL(WinMoney, 0))) as 'TotalWinMoney' 
			FROM #tempVwMPlayer with(nolock)
			WHERE CreateDate >= @dateS AND CreateDate <= @dateE
			GROUP BY MemberID,LotteryClassID
			) AS MplayerTable;
	
	--取出付款型別的用戶數量
	DROP TABLE IF EXISTS #tempMemberShip
	SELECT * INTO #tempMemberShip 
		FROM MemberShip WITH(NOLOCK) 
		--WHERE CashRebatePayType = @payType


	SELECT @userCount = count(*)
		FROM #tempMemberShip;

	WHILE @userCount > 0
	BEGIN
		-- Step 0. 取出用戶資料
		SELECT 
			@memberID = MemberID,
			@userLevelID = UserLevelID
			FROM #tempMemberShip 
		ORDER BY #tempMemberShip.MemberID
		OFFSET     (@userCount-1) ROWS
		FETCH NEXT 1 ROWS ONLY;
		
		SET @mPromotionCheck = 0;
		-- Step 1. 檢查進行中Promotion
		SELECT @mPromotionCheck = ISNULL(IslockWithdrawal, 0) 
			FROM MPromotion 
			WHERE MemberID = @memberID AND IslockWithdrawal = 1;

		IF @mPromotionCheck = 0
		BEGIN
		
			SET @totalBet = 0;
			SET @totalWinMoney = 0;
			SET @totalCashRebateMoney = 0;		
			SELECT @lotteryClassCount = count(*)
				FROM #tempLotteryClass

			WHILE @lotteryClassCount > 0
			BEGIN
				SELECT @lotteryClassID = LotteryClassID 
					FROM #tempLotteryClass 
				ORDER BY #tempLotteryClass.LotteryClassID
				OFFSET     (@lotteryClassCount-1) ROWS
				FETCH NEXT 1 ROWS ONLY;
				
				SET @totalClassBet = Null;
				SET @totalClassWinMoney = Null;
				-- 取得用戶的總投注及總WinMoney
				SELECT @totalClassBet = ISNULL(TotalBet, 0), @totalClassWinMoney = ISNULL(TotalWinMoney, 0) 
					FROM #tempTotalMPlayer
					WHERE MemberID = @memberID
						AND LotteryClassID = @lotteryClassID;
							
				IF @totalClassBet > 0
				BEGIN
					SET @typeCode = 'CashRebate'
					SET @cashRebateProcentage = ''

					-- 20200816 Yark 確認了 CashRebate 有流水就要計算
					-- 20201124 Ben 新增payType,classID判斷
					SELECT @cashRebateProcentage = [CashRebate] ,
							@minBonus = (CAST(ISNULL(NULLIF(MinLoss, ''),0 ) AS decimal(18, 4))),
							@maxBonus = (CAST(ISNULL(NULLIF(MaxLoss, ''),0 ) AS decimal(18, 4)))
						FROM [GHL].[dbo].[VwCashRSetting]
						WHERE UserLevelID = @userLevelID
							AND Status = 1 
							AND RebateType = 2 
							AND PayType = @payType 
							AND (GameRoomID = @gameRoomID or LotteryClassID = @lotteryClassID)
							AND DateS <= DATEADD(DAY, -1, getdate()) AND DateE >= DATEADD(DAY, -1, getdate())
		
					-- 20200915 Ben 有CashRebateProcentage且>0才計算
					IF @cashRebateProcentage != ''
					BEGIN
						SET @cashRebateMoney = (CAST(@cashRebateProcentage AS decimal(18,4)) * @totalClassBet);
				
						-- 20201124 Ben 有大於最小Bonus才計算
						IF @cashRebateMoney > @minBonus
						BEGIN
							-- 20200915 Yark 加入判斷如果大於最大Bonus則以最大Bonus為主要設定值
							IF @cashRebateMoney > @maxBonus
							BEGIN
								SET @cashRebateMoney = @maxBonus;
							END;
						END
						ELSE 
						BEGIN
							SET @cashRebateMoney = 0;
						END
						
						SET @totalBet = @totalBet + @totalClassBet;
						SET @totalWinMoney = @totalWinMoney + @totalClassWinMoney;
						SET @totalCashRebateMoney = @totalCashRebateMoney + @cashRebateMoney;
					END
				END;
				
				SET @lotteryClassCount = @lotteryClassCount - 1;
			END
				
			IF @totalCashRebateMoney > 0
			BEGIN
				INSERT INTO MPlayerReport ([MemberID], [MPlayerID], [TurnOverMoney], [TypeCode], [Status], [RecordMoney], [CashRebateMoney], [CashBackRebateMoney], 
					[ReferralMoney], [AgentLevelSCID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
					values (@memberID, @mPlayerID, @totalBet, @typeCode, NULL, @recordMoney, @totalCashRebateMoney, 0, 
						NULL, 32, 0, GETDATE(), 0, GETDATE())
			END
			
			-- Step 2. 取出投注資料
			SET @mPlayerCount = 0;
			SET @mPlayerID = -1;
			SELECT @mPlayerCount = COUNT(*)  
				FROM #tempTotalMPlayer
				WHERE MemberID = @memberID

			-- 更新目前己計算的MPlayer
			SELECT @mPlayerCount = COUNT(*)  
				FROM #tempVwMPlayer
				WHERE MemberID = @memberID and isWin in (0,1);

			WHILE @mPlayerCount > 0
				BEGIN
					SELECT @mPlayerID = ID
					FROM #tempVwMPlayer
						WHERE MemberID = @memberID and isWin in (0, 1)
						ORDER BY #tempVwMPlayer.CurrentPeriod
					OFFSET     (@mPlayerCount-1) ROWS
					FETCH NEXT 1 ROWS ONLY;

					UPDATE MPlayer SET IsCashRebateWriteReport = 1 
						WHERE ID = @mPlayerID;
				
					SET @mPlayerCount = @mPlayerCount - 1;
					CONTINUE  
				END;
		END;
		SET @userCount = @userCount - 1;
		CONTINUE;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ClearOnlineUser]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 說明: 統計用戶的Angent儲存到Report
-- 參數說明: null
-- 範例: exec sp_AngentReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20201008			Yark				每小時檢查登入的在線人數是否沒有活動超過時間
-- =============================================
CREATE PROCEDURE [dbo].[sp_ClearOnlineUser]
AS
BEGIN
   UPDATE [GHL].[dbo].[MemberShip] 
	SET [IsOnline] = 0, [UpdateDate] = GETDATE(), [UpdateBy] = 0
	WHERE DATEDIFF(MINUTE, [UpdateDate], GetDate()) > 60 
		AND [IsOnline] = 1
		AND [UserType] = '10'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CopyOLottery]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- Step 0. 取得所有遊戲的CashRebate
-- Step 1. 取得所有遊戲
-- Step 2. 取得付款類型的單
-- Step 3. 
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20200308			Yark				進行代理費計算

-- =============================================
CREATE PROCEDURE [dbo].[sp_CopyOLottery]
AS
BEGIN
	DECLARE @oLotteryCount INT;
	DECLARE @currentPeriod NVARCHAR(200);								-- 子層用戶帳號
	DECLARE @currentLotteryTime DATETIME;							-- 子層用戶帳號
	DECLARE @lotteryTypeID INT;
	DECLARE @id INT;
	DECLARE @seachCount INT;
	DECLARE @hasCount INT = 0;

	DECLARE @dateS DATETIME;											--查詢區間(起)
	DECLARE @dateE DATETIME;											--查詢區間(訖)

	-- 設定啟始與結束時間
	SELECT @dateS = CAST(CONVERT(VARCHAR, CONVERT(VARCHAR, DATEADD(DAY, 0, getdate()), 111) + ' 00:00:00', 120) AS DATETIME)
		,@dateE = CAST(CONVERT(VARCHAR, CONVERT(VARCHAR, DATEADD(DAY, 1, getdate()), 111) + ' 23:59:59' , 120) AS DATETIME);
	
	DROP TABLE IF EXISTS #tempNewOLottery;
	SELECT * INTO #tempNewOLottery 
		From 
	openrowset('SQLOLEDB', 'WIN-TIAG8M7P497'; 'sa'; '@Golden85092212', [GHL].[dbo].[OLottery])
	--[DESKTOP-BGT7OQV].[GHL].[dbo].[OLottery]
	WHERE CurrentLotteryTime >= @dateS
		AND CurrentLotteryTime < @dateE

	Select @oLotteryCount = COUNT(*)
		FROM #tempNewOLottery;

	--SELECT [OLotteryCount]=@oLotteryCount

	WHILE @oLotteryCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT @id = [ID]
			,@currentPeriod = [CurrentPeriod]
			,@currentLotteryTime = [CurrentLotteryTime]
			,@lotteryTypeID = [LotteryTypeID]
			FROM #tempNewOLottery
		ORDER BY #tempNewOLottery.[ID]
		OFFSET     (@oLotteryCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;

		SET @seachCount = 0;
		SELECT @seachCount = COUNT(*)
			FROM [OLottery]
			WHERE [CurrentPeriod] = @currentPeriod
				AND [CurrentLotteryTime] = @currentLotteryTime
				AND [LotteryTypeID] = @lotteryTypeID

		IF @seachCount = 0
		BEGIN
			
			--SET IDENTITY_INSERT [dbo].[OLottery] ON
	
			Insert Into [dbo].[OLottery] ([LotteryTypeID]
			  ,[CurrentLotteryTime]
			  ,[CurrentPeriod]
			  ,[Result]
			  ,[IsOpen]
			  ,[RealCloseTime]
			  ,[CloseTime]
			  ,[EndPlayTime]
			  ,[ResultNotice]
			  ,[CreateID]
			  ,[CreateDate]
			  ,[UpdateID]
			  ,[UpdateDate])
			SELECT [LotteryTypeID]
				,[CurrentLotteryTime]
				,[CurrentPeriod]
				,[Result]
				,[IsOpen]
				,[RealCloseTime]
				,[CloseTime]
				,[EndPlayTime]
				,[ResultNotice]
				,[CreateID]
				,[CreateDate]
				,[UpdateID]
				,[UpdateDate] 
				FROM #tempNewOLottery
				WHERE [CurrentPeriod] = @currentPeriod
					AND [CurrentLotteryTime] = @currentLotteryTime
					AND [LotteryTypeID] = @lotteryTypeID

			--SET IDENTITY_INSERT [dbo].[OLottery]  OFF
		END;
		ELSE 
		BEGIN
			SET @hasCount = @hasCount + 1;
		END;
		
		SET @oLotteryCount = @oLotteryCount - 1;
	END;
	--SELECT [HasCount]=@hasCount
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DepositeUserLevel]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20200814			Yark				進行User Level計算
-- 2			20210722			Yark				調整為只升不降
-- =============================================
CREATE PROCEDURE [dbo].[sp_DepositeUserLevel]
AS
BEGIN
	DECLARE @userCount INT;							-- 要計算的用戶數
	DECLARE @depositMoney DECIMAL(18, 4);			-- 要計算的用戶數
	DECLARE @userLevel INT;							-- 要計算的用戶數
	DECLARE @userNowLevel INT;						-- 要計算的用戶數
	DECLARE @memberID INT;

	DROP TABLE IF EXISTS #tempDeposit
	 --複製當天的投注表
	SELECT * INTO #tempDeposit FROM [dbo].[Deposit] WITH(NOLOCK) 
		WHERE DateDiff(dd, [CreateDate],getdate()) <= 30 and [DepositTypeSCID] = 10

	-- 用戶月計算的用戶數量
	DROP TABLE IF EXISTS #tempDepositMember
	 --複製當天的Deposit表
	SELECT * INTO #tempDepositMember FROM (SELECT MemberID FROM [dbo].[Deposit] WITH(NOLOCK)
		WHERE DateDiff(dd, [CreateDate],getdate()) <= 30 and [DepositTypeSCID] = 10
		GROUP BY MemberID) as [DepositMember]

	SELECT @userCount = Count(MemberID) FROM #tempDepositMember

	WHILE @userCount > 0
	BEGIN
		SET @userLevel = 1;
		SET @userLevel = -1;
		SELECT @memberID = MemberID
			FROM #tempDepositMember
			ORDER BY #tempDepositMember.MemberID
			OFFSET     (@userCount-1) ROWS
			FETCH NEXT 1 ROWS ONLY;
		
		SELECT @userNowLevel = UserLevelID
			FROM MemberShip WITH(NOLOCK)
			WHERE MemberID = @memberID

		SELECT @depositMoney = SUM(CONVERT(decimal(18,4),Amount)) 
			FROM #tempDeposit
			WHERE MemberID = @memberID;
		
		SELECT TOP(1) @userLevel = ISNULL(NULLIF([LevelID], ''),1 ) 
			FROM [dbo].[UserLevel]
			WHERE [MinAddCredit] <= @depositMoney
			ORDER BY [ULevel] DESC

		IF @userLevel > @userNowLevel
		BEGIN
			UPDATE [dbo].[MemberShip] 
				SET UserLevelID = @userLevel 
				WHERE MemberID = @memberID
		END;

		Set @userCount = @userCount-1;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GameDealerAngentReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- 說明: 統計用戶的Angent儲存到Report
-- 參數說明: null
-- 範例: exec sp_AngentReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20200308			Yark				進行代理費計算
-- 2			20200310			Yark				加入Statement Report
-- 3			20200418			Ben					修改AgentPositionTaking算法(上層扣下層)
-- 4			20201124			Yark				MPlayer改用Update取得資料
-- =============================================
CREATE PROCEDURE [dbo].[sp_GameDealerAngentReport]
AS
BEGIN
	SELECT 'sp_GameDealerAngentReport'
	DECLARE @userCount INT;								--要計算的用戶數
	DECLARE @gameDealerMemberID INT;								--投注單的用戶
	DECLARE @mPlayerCount INT;							--投注單數量
	DECLARE @mPlayerID INT;								--投注單流水號
	DECLARE @agentPositionTakingRebate DECIMAL(18, 4);		--代理費用占成
	DECLARE @childAgentPositionTakingRebate DECIMAL(18, 4);	--子代理費占成
	DECLARE @winMoney DECIMAL(18, 4);					--輸贏
	DECLARE @isReset int;
	DECLARE @IsWin BIT;
	DECLARE @qty DECIMAL(18, 4);						--投注數量
	DECLARE @price DECIMAL(18, 4);						--投注單價
	DECLARE @discountPrice decimal(18, 4);
	DECLARE @agentLevelSCID INT = 32;					--Member Level
	DECLARE @typeCode NVARCHAR(200) = 'Angent';			--類別
	DECLARE @Status NVARCHAR(200) = '';					--狀態
	DECLARE @recordMoney NVARCHAR(50) = '';				--暫存記錄的金額
	DECLARE @agentMoney decimal(18, 4) = 0;				--代理費
	DECLARE @dateS DATETIME;							--查詢區間(起)
	DECLARE @dateE DATETIME;							--查詢區間(訖)
	DECLARE @createDate NVarchar(200) = '';
	DECLARE @currentPeriod NVARCHAR(100) = '';			--期號
	DECLARE @lotteryInfoID INT;							--玩法ID
	DECLARE @userBalance NVARCHAR(200);					--用戶餘額
	DECLARE @userWallet DECIMAL(18, 4);					--用戶錢包
	DECLARE @totalBalance DECIMAL(18, 4);				--用戶總餘額
	DECLARE @checkCount DECIMAL(18, 4);					--是否有值存在
	DECLARE @drawTypeID INT;									--玩法計算ID

	-- 設定啟始與結束時間
	SELECT @dateS = DATEADD(MINUTE, -5, GETDATE()), @dateE = GETDATE();

	--SELECT @dateS = '2021-10-30 00:00:00', @dateE = '2021-10-30 23:59:59'

	DROP TABLE IF EXISTS #tempMPlayer_GameDealerAngentReport
	 --複製當天的投注表
	SELECT * INTO #tempMPlayer_GameDealerAngentReport FROM MPlayer WITH(NOLOCK)
	WHERE UpdateDate >= @dateS 
		AND UpdateDate <= @dateE
		AND GameDealerMemberID > 0
		
	DROP TABLE IF EXISTS #tempGameDealerMemberShip_GameDealerAngentReport
	-- 複製所有會員層級的用戶
	SELECT * INTO #tempGameDealerMemberShip_GameDealerAngentReport 
		FROM GameDealerMemberShip WITH(NOLOCK) 
		WHERE MemberID in (SELECT GameDealerMemberID FROM #tempMPlayer_GameDealerAngentReport GROUP BY GameDealerMemberID) or AgentLevelSCID != 32

	-- 用戶數量
	SELECT @userCount = COUNT(*) 
		FROM #tempGameDealerMemberShip_GameDealerAngentReport
		WHERE AgentLevelSCID = @agentLevelSCID
		
	-- 進行
	WHILE @userCount > 0
	Begin
			
		DECLARE @angentMap nvarchar(200); -- 當下用戶的代理地圖

		-- Step 1. 取出用戶資料
		SELECT @gameDealerMemberID = MemberID, @angentMap = AgentParentMap
			FROM #tempGameDealerMemberShip_GameDealerAngentReport
			WHERE AgentLevelSCID = @agentLevelSCID
		ORDER BY MemberID
		OFFSET     (@userCount-1) ROWS
		FETCH NEXT 1 ROWS ONLY;
	
		-- Step 2. 取出投注資料
		SET @mPlayerCount = 0;
		SET @winMoney = -1;
		SET @isReset = -1;
		SET @mPlayerID = -1;
		SET @IsWin = -1;

		SELECT @mPlayerCount = COUNT(*)		
			FROM #tempMPlayer_GameDealerAngentReport
			WHERE GameDealerMemberID = @gameDealerMemberID 
				AND isWin in (0,1)
			
			-- 有Win Loss後就直接進行Agent計算，所以必需將每一次的投注結果進行計算
			WHILE @mPlayerCount > 0
			BEGIN

				SELECT @IsWin = [IsWin], @winMoney = [WinMoney], @qty = [Qty], @price = Price, @mPlayerID = [ID]
				,@discountPrice = DiscountPrice,@currentPeriod = [CurrentPeriod], @lotteryInfoID = [LotteryInfoID]
				,@createDate = Convert(NVarchar, [CreateDate], 120), @isReset = IsReset
				FROM #tempMPlayer_GameDealerAngentReport
					WHERE GameDealerMemberID = @gameDealerMemberID 
						AND isWin in (0,1)
					ORDER BY ID
				OFFSET     (@mPlayerCount-1) ROWS
				FETCH NEXT 1 ROWS ONLY;
				
				SELECT @drawTypeID = DrawTypeID
					FROM LotteryInfo
					WHERE LotteryInfoID = @lotteryInfoID

				SET @typeCode = 'Angent'
				
				-- 2020/09/30 Yark調整計算
				DECLARE @angentCount int;
				DECLARE @angentUserName nvarchar(200);
				DECLARE @angentUserId int;
				DECLARE @agentLoopLevelSCID int;
				DECLARE @splitStr nvarchar(50) = '/';

				-- 將Angent Map做成temp table
				DROP TABLE IF EXISTS #angentMapTemp
				CREATE TABLE #angentMapTemp ( ID INT IDENTITY(1, 1) primary key, AngentUserName nvarchar(200));
				INSERT INTO #angentMapTemp SELECT RTRIM(value) AS AngentUserName FROM STRING_SPLIT(@angentMap, '/') WHERE value <> '';

				SELECT @angentCount = COUNT(*) FROM #angentMapTemp;
				DECLARE @referralLevelTotal INT = (@angentCount + 1);--總階

				-- 計算
				-- 純盈利
				IF @IsWin = 0
				BEGIN
					SET @recordMoney = -(@qty * @discountPrice);
					--補單金額
					IF @isReset = 1
					BEGIN
						SET @recordMoney = @winMoney
					END
				END;
				Else
				BEGIN
					SET @recordMoney = @winMoney; -- - (@qty * @price);
					IF @drawTypeID >= 142 AND @drawTypeID <= 152
					BEGIN
						SET @recordMoney = @recordMoney - @discountPrice;
					END;
				END;

				-- 結算Angent Loop
				WHILE @angentCount > 0
				BEGIN
					-- Step 1. 取出 MemberID、AngentUserName
					SELECT @angentUserName = AngentUserName
					FROM #angentMapTemp
					ORDER BY #angentMapTemp.ID desc
					OFFSET     (@angentCount-1) ROWS
					FETCH NEXT 1 ROWS ONLY;

					SELECT @angentUserId = MemberID, 
						@agentPositionTakingRebate = (CAST(AgentPositionTakingRebate AS decimal(18, 4))), 
						@agentLoopLevelSCID = [AgentLevelSCID]
						FROM #tempGameDealerMemberShip_GameDealerAngentReport
						WHERE UserName = @angentUserName

					-- 取子階代理占成
					IF @angentCount >= 2
					BEGIN
						SELECT @angentUserName = AngentUserName
						FROM #angentMapTemp
						ORDER BY #angentMapTemp.ID desc
						OFFSET     (@angentCount-2) ROWS
						FETCH NEXT 1 ROWS ONLY;

						SELECT @childAgentPositionTakingRebate = (CAST(AgentPositionTakingRebate AS decimal(18, 4)))
							FROM #tempGameDealerMemberShip_GameDealerAngentReport WITH(NOLOCK)
							WHERE UserName = @angentUserName

						SET @agentPositionTakingRebate = (@agentPositionTakingRebate - @childAgentPositionTakingRebate)
					END
					-- 取子階代理占成

					SET @agentMoney = ((CAST(@recordMoney AS decimal(18, 4))) * @agentPositionTakingRebate);

					-- 檢查是否有資料存在
					SELECT @checkCount = COUNT(*) FROM GameDealerMPlayerReport
						WHERE [MPlayerID] = @mPlayerID 
							AND [MemberID] = @gameDealerMemberID 
							AND CreateDate = @createDate
							AND [TypeCode] = 'Angent' 
							AND [AgentLevelSCID] = @agentLoopLevelSCID

					IF @checkCount = 0
					BEGIN
						-- 沒有[AgentMoney]
						INSERT INTO GameDealerMPlayerReport ([MemberID], [MPlayerID], [AngentMemberID], [AgentLevelSCID], [TurnOverMoney], [TypeCode], [Status], [RecordMoney], [CashRebateMoney], [CashBackRebateMoney], [AgentMoney], 
						[CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						VALUES (@gameDealerMemberID, @mPlayerID, @angentUserId, @agentLoopLevelSCID, (@qty * @price), @typeCode, NULL, @recordMoney, 0, 0, @agentMoney, 
						0, @createDate, 0, GETDATE())
					END;
					SET @angentCount = @angentCount - 1;
				END;
				Set @mPlayerCount = @mPlayerCount - 1;
				CONTINUE  
			END;
		Set @userCount = @userCount - 1;
		CONTINUE  
	END;
END




GO
/****** Object:  StoredProcedure [dbo].[sp_GameDealerCalculatorWinLoseReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- 說明: 
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20201017			Yark				取得用戶的樹狀結構
-- =============================================
CREATE PROCEDURE [dbo].[sp_GameDealerCalculatorWinLoseReport]
AS
BEGIN
	DECLARE @userName NVARCHAR(200) = 'Admin';						-- 起始的帳號
	DECLARE @memberID INT;											-- 用戶ID
	DECLARE @checkDataCount INT;									-- 確認資料筆數							
	DECLARE @subUserCount INT;										-- 子層用戶資料
	DECLARE @subUserName NVARCHAR(200);								-- 子層用戶帳號
	DECLARE @agentLevelSCID INT;									-- 
	DECLARE @checkSubAgent INT;										-- 
	DECLARE @getWinLoseMemberID INT;								-- 
	DECLARE @subMemberID INT;										-- 子層用戶ID
	DECLARE @subAgentParentID INT;									-- 子層用戶的父層ID
	DECLARE @subAgentPositionTakingRebate NVARCHAR(200);			-- 子層用戶PositionTaking
	DECLARE @subAgentParentMap NVARCHAR(200);						-- 子層用戶Map
	DECLARE @newSubAgentParentMap NVARCHAR(200);					-- 新的Map檢查用
	DECLARE @calculatorCount INT;
	DECLARE @nowTypeCode NVARCHAR(200);	
	DECLARE @winLoseMoney DECIMAL(18,4) = 0;
	DECLARE @vipWinLoseMoney DECIMAL(18,4) = 0;
	DECLARE @totalDiscountPrice DECIMAL(18,4) = 0;
	DECLARE @turnOver DECIMAL(18,4) = 0;
	DECLARE @vipTurnOver DECIMAL(18,4) = 0;
	DECLARE @totalComission DECIMAL(18,4) = 0;
	DECLARE @profit DECIMAL(18,4) = 0;
	DECLARE @layerTotalProfit DECIMAL(18,4) = 0;
	DECLARE @vipProfit DECIMAL(18,4) = 0;
	DECLARE @vipLayerTotalProfit DECIMAL(18,4) = 0;
	DECLARE @upper DECIMAL(18,4) = 0;
	DECLARE @vipUpper DECIMAL(18,4) = 0;
	DECLARE @initialCredit DECIMAL(18,4) = 0;
	DECLARE @totalPrice DECIMAL(18,4) = 0;
	DECLARE @cashBalance DECIMAL(18,4) = 0;
	DECLARE @dateS DATETIME;										--查詢區間(起)
	DECLARE @dateE DATETIME;										--查詢區間(訖)

	-- 設定啟始與結束時間
	SELECT @dateS = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 00:00:00'
	, @dateE = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 23:59:59'
	--SELECT @dateS = '2021-9-21 00:00:00', @dateE = '2021-9-21 23:59:59'

	SELECT @dateS, @dateE
	
	DROP TABLE IF EXISTS #tempNewMemberShip;

	SELECT * INTO #tempNewMemberShip 
		FROM GameDealerMemberShip WITH(NOLOCK)
		WHERE AgentParentMap LIKE @userName + '%'

	-- --複製當天的投注表
	--WITH NewMemberShip AS (
	--	SELECT main.*
	--	FROM [GHL].[dbo].[MemberShip] AS main WITH(NOLOCK) WHERE main.UserName = @userName
	--	UNION ALL
	--	--跟 CTE 自身做遞迴 JOIN (A 的上級主管[SuperiorNum]是 EmployeeOrder 的員工編號[EmployeeNum])
	--	SELECT subJoin.*
	--	FROM [GHL].[dbo].[MemberShip] AS subJoin WITH(NOLOCK)
	--	inner join NewMemberShip ON NewMemberShip.MemberID = subJoin.AgentParentID
	--)
	--SELECT * INTO #tempNewMemberShip 
	--FROM NewMemberShip
	--OPTION (MAXRECURSION 0);  ---要加 hint : OPTION (MAXRECURSION 0)  表示 遞迴為無限制
	
	SELECT @memberID = MemberID 
		FROM #tempNewMemberShip
		WHERE UserName = @userName

	SELECT @subUserCount = count(*) 
		FROM #tempNewMemberShip
		WHERE [UserType] != '10' AND AgentLevelSCID < 32

	-- 開始進行計算
	WHILE @subUserCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT @subMemberID = MemberID
			,@subUserName = UserName
			,@subAgentParentID = AgentParentID
			,@subAgentParentMap = AgentParentMap
			,@subAgentPositionTakingRebate = AgentPositionTakingRebate
			,@agentLevelSCID = AgentLevelSCID
			FROM #tempNewMemberShip
		WHERE [UserType] != '10' AND AgentLevelSCID < 32
		ORDER BY #tempNewMemberShip.MemberID
		OFFSET     (@subUserCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;

		-- 建立新的Map檢查用
		IF NULLIF(@subAgentParentMap, '') = ''
		BEGIN
			SET @newSubAgentParentMap = @subUserName + '/';
		END;
		ELSE IF @agentLevelSCID = 31
		BEGIN
			SET @newSubAgentParentMap = @subAgentParentMap;
		END;
		ELSE
		BEGIN
			SET @newSubAgentParentMap = @subAgentParentMap + @subUserName + '/'
		END;

		IF @agentLevelSCID = 31
		BEGIN
			-- 進行WinLose 總計算
			-- 進行TurnOver 總計算
			SELECT @turnOver = ISNULL(SUM((CAST(NULLIF(mpr.[TurnOverMoney], '') AS decimal(18, 4)))),0 ),
				@totalDiscountPrice = ISNULL(SUM((CAST(NULLIF(mp.[DiscountPrice], '') AS decimal(18, 4)))),0 ),
				@winLoseMoney = ISNULL(SUM((CAST(NULLIF(mpr.[RecordMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[GameDealerMPlayerReport] AS mpr WITH(NOLOCK)
					INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
					INNER JOIN [dbo].[GameDealerMemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.MemberID
				WHERE  mpr.[TypeCode] IN ('Win', 'Loss')
					AND ms.[AgentParentMap] LIKE @newSubAgentParentMap + '%'
					AND ms.AgentParentID = @subMemberID
					AND ms.AgentLevelSCID = 32
					AND mp.[UpdateDate] >= @dateS
					AND mp.[UpdateDate] <= @dateE

			-- 取出用戶相對的Angent
			SELECT @profit = ISNULL(SUM((CAST(NULLIF(mpr.[AgentMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[GameDealerMPlayerReport] AS mpr WITH(NOLOCK)
				INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
				INNER JOIN [dbo].[GameDealerMemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.[AngentMemberID]
				WHERE mpr.[AngentMemberID] = @subMemberID
					AND mpr.[TypeCode] IN ('Angent')
					AND mp.[UpdateDate] >= @dateS
					AND mp.[UpdateDate] <= @dateE

			-- Upper
			SELECT @layerTotalProfit = ISNULL(SUM((CAST(NULLIF(mpr.[AgentMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[GameDealerMPlayerReport] AS mpr WITH(NOLOCK)
				INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
				INNER JOIN [dbo].[GameDealerMemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.AngentMemberID
				WHERE ms.[AgentParentMap] like @newSubAgentParentMap + @subUserName + '%'
					AND ms.AgentParentID = @subMemberID
					AND mpr.[TypeCode] IN ('Angent')
					AND mp.[UpdateDate] >= @dateS
					AND mp.[UpdateDate] <= @dateE
		END;
		ELSE
		BEGIN
			-- 進行WinLose 總計算
			-- 進行TurnOver 總計算
			SELECT @turnOver = ISNULL(SUM((CAST(NULLIF(mpr.[TurnOverMoney], '') AS decimal(18, 4)))),0 ),
				@totalDiscountPrice = ISNULL(SUM((CAST(NULLIF(mp.[DiscountPrice], '') AS decimal(18, 4)))),0 ),
				@winLoseMoney = ISNULL(SUM((CAST(NULLIF(mpr.[RecordMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[GameDealerMPlayerReport] AS mpr WITH(NOLOCK)
					INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
					INNER JOIN [dbo].[GameDealerMemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.MemberID
				WHERE mpr.[TypeCode] IN ('Win', 'Loss')
					AND ms.[AgentParentMap] LIKE @newSubAgentParentMap + '%'
					AND ms.AgentLevelSCID = 32
					AND mp.[UpdateDate] >= @dateS
					AND mp.[UpdateDate] <= @dateE

			-- 取出用戶相對的Angent
			SELECT @profit = ISNULL(SUM((CAST(NULLIF(mpr.[AgentMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[GameDealerMPlayerReport] AS mpr WITH(NOLOCK)
				INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
				INNER JOIN [dbo].[GameDealerMemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.[AngentMemberID]
				WHERE mpr.[AngentMemberID] = @subMemberID
					AND mpr.[TypeCode] IN ('Angent')
					AND mp.[UpdateDate] >= @dateS
					AND mp.[UpdateDate] <= @dateE
				
			-- Upper
			SELECT @layerTotalProfit = ISNULL(SUM((CAST(NULLIF(mpr.[AgentMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[GameDealerMPlayerReport] AS mpr WITH(NOLOCK)
				INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
				INNER JOIN [dbo].[GameDealerMemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.AngentMemberID
				WHERE ms.[AgentParentMap] like @newSubAgentParentMap + '%'
					AND mpr.[TypeCode] IN ('Angent')
					AND mp.[UpdateDate] >= @dateS
					AND mp.[UpdateDate] <= @dateE

		END;
		
		SET @upper = (@winLoseMoney - @layerTotalProfit - @profit);
		
		SELECT @subMemberID as subMemberID,@subUserName as subUserName
			,@subAgentParentID as subAgentParentID,@profit as profit
			,@subAgentPositionTakingRebate as subAgentPositionTakingRebate,@agentLevelSCID as agentLevelSCID
			,@upper as upper,@winLoseMoney as winLoseMoney
			,@layerTotalProfit as layerTotalProfit
		IF @turnOver >0 OR @vipTurnOver >0
		BEGIN
			Select @checkDataCount = Count(*) From [dbo].[GameDealerWinLoseReport]
			Where [GameDealerMemberID] = @subMemberID 
				AND [CreateDate] >= @dateS
				AND [CreateDate] <= @dateE

			--SELECT @turnOver,@upper
			-- 有資料則Update
			IF @checkDataCount > 0
			BEGIN
				UPDATE [dbo].[GameDealerWinLoseReport] 
					SET [WinLoseMoney] = CAST(ISNULL(NULLIF(CAST(@winLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPWinLoseMoney] = CAST(ISNULL(NULLIF(CAST(@vipWinLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TotalDiscountPrice] = CAST(ISNULL(NULLIF(CAST(@totalDiscountPrice AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TurnOver] = CAST(ISNULL(NULLIF(CAST(@turnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPTurnOver] = CAST(ISNULL(NULLIF(CAST(@vipTurnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TotalComission] = CAST(ISNULL(NULLIF(CAST(@totalComission AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[Profit] = CAST(ISNULL(NULLIF(CAST(@profit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPProfit] = CAST(ISNULL(NULLIF(CAST(@vipProfit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[UpperTotal] = CAST(ISNULL(NULLIF(CAST(@upper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPUpperTotal] = CAST(ISNULL(NULLIF(CAST(@vipUpper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[InitialCredit] = CAST(ISNULL(NULLIF(CAST(@initialCredit AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[CreditBalance] = CAST(ISNULL(NULLIF(CAST(@totalPrice AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[CashBalance] = CAST(ISNULL(NULLIF(CAST(@cashBalance AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[UpdateDate] = GETDATE()
					WHERE [GameDealerMemberID] = @subMemberID  
						AND [CreateDate] >= @dateS
						AND [CreateDate] <= @dateE

			END;
			-- 沒資料則Add
			ELSE
			BEGIN
				INSERT INTO [dbo].[GameDealerWinLoseReport] ([GameDealerMemberID],[UserName],[AgentParentID],[AgentPositionTakingRebate]
				,[AgentParentMap],[WinLoseMoney],[TotalDiscountPrice],[VIPWinLoseMoney],[TurnOver],[VIPTurnOver],[TotalComission],[Profit]
				,[VIPProfit],[UpperTotal],[VIPUpperTotal],[InitialCredit],[CreditBalance],[CashBalance],[CreateBy]
				,[CreateDate],[UpdateBy],[UpdateDate])
					VALUES (@subMemberID,@subUserName,@subAgentParentID,@subAgentPositionTakingRebate,@subAgentParentMap
						,CAST(ISNULL(NULLIF(CAST(@winLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,CAST(ISNULL(NULLIF(CAST(@totalDiscountPrice AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,CAST(ISNULL(NULLIF(CAST(@vipWinLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,CAST(ISNULL(NULLIF(CAST(@turnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,CAST(ISNULL(NULLIF(CAST(@vipTurnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,CAST(ISNULL(NULLIF(CAST(@totalComission AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,CAST(ISNULL(NULLIF(CAST(@profit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,CAST(ISNULL(NULLIF(CAST(@vipProfit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,CAST(ISNULL(NULLIF(CAST(@upper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,CAST(ISNULL(NULLIF(CAST(@vipUpper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,CAST(ISNULL(NULLIF(CAST(@initialCredit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,CAST(ISNULL(NULLIF(CAST(@totalPrice AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,CAST(ISNULL(NULLIF(CAST(@cashBalance AS VARCHAR), ''),0 ) AS decimal(18, 4)),0,@dateS,0,@dateE
					)
			END;
		END;

		SET @subUserCount = @subUserCount - 1;
	END;
END



GO
/****** Object:  StoredProcedure [dbo].[sp_GameDealerCalculatorWinLoseReportDetail]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- 說明: 
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20201118			Yark				
-- =============================================
CREATE PROCEDURE [dbo].[sp_GameDealerCalculatorWinLoseReportDetail]
AS
BEGIN
	DECLARE @userName NVARCHAR(200) = 'Admin';						-- 起始的帳號
	DECLARE @gameDealerMemberID INT;											-- 用戶ID
	DECLARE @agentPositionTakingRebate NVARCHAR(200);				-- PositionTaking
	DECLARE @agentParentID INT;										-- 用戶的父層ID
	DECLARE @agentParentMap NVARCHAR(200);							-- 子層用戶Map
	DECLARE @checkDataCount INT;									-- 確認資料筆數							
	DECLARE @userCount INT;											-- 資料筆數						
	DECLARE @subUserCount INT;										-- 子層資料筆數
	DECLARE @subUserName NVARCHAR(200);								-- 子層用戶帳號
	DECLARE @subMemberID INT;										-- 子層用戶ID
	DECLARE @subAgentParentID INT;									-- 子層用戶的父層ID
	DECLARE @subAgentPositionTakingRebate NVARCHAR(200);			-- 子層用戶PositionTaking
	DECLARE @subAgentParentMap NVARCHAR(200);						-- 子層用戶Map
	DECLARE @subProfit DECIMAL(18,4) = 0;
	DECLARE @subVipProfit DECIMAL(18,4) = 0;
	DECLARE @calculatorCount INT;
	DECLARE @nowTypeCode NVARCHAR(200);	
	DECLARE @winLoseMoney DECIMAL(18,4) = 0;
	DECLARE @vipWinLoseMoney DECIMAL(18,4) = 0;
	DECLARE @totalDiscountPrice DECIMAL(18,4) = 0;
	DECLARE @turnOver DECIMAL(18,4) = 0;
	DECLARE @vipTurnOver DECIMAL(18,4) = 0;
	DECLARE @totalComission DECIMAL(18,4) = 0;
	DECLARE @profit DECIMAL(18,4) = 0;
	DECLARE @vipProfit DECIMAL(18,4) = 0;
	DECLARE @layerTotalProfit DECIMAL(18,4) = 0;
	DECLARE @vipLayerTotalProfit DECIMAL(18,4) = 0;
	DECLARE @upper DECIMAL(18,4) = 0;
	DECLARE @vipUpper DECIMAL(18,4) = 0;
	DECLARE @subUpper DECIMAL(18,4) = 0;
	DECLARE @subVipUpper DECIMAL(18,4) = 0;
	DECLARE @initialCredit DECIMAL(18,4) = 0;
	DECLARE @creditBalance DECIMAL(18,4) = 0;
	DECLARE @cashBalance DECIMAL(18,4) = 0;
	DECLARE @dateS DATETIME;										--查詢區間(起)
	DECLARE @dateE DATETIME;										--查詢區間(訖)

	-- 設定啟始與結束時間
	SELECT @dateS = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 00:00:00'
	, @dateE = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 23:59:59'
	--SELECT @dateS = '2021/10/8 00:00:00', @dateE = '2021/10/8 23:59:59';

	SELECT @dateS, @dateE
	
	DROP TABLE IF EXISTS #tempWinLoseReport;
	--DROP TABLE IF EXISTS #tempNewMemberShip;

	-- --複製當天的投注表
	--WITH NewMemberShip AS (
	--	SELECT main.*
	--	FROM [dbo].[GameDealerMemberShip] AS main WITH(NOLOCK) WHERE main.UserName = @userName
	--	UNION ALL
	--	--跟 CTE 自身做遞迴 JOIN (A 的上級主管[SuperiorNum]是 EmployeeOrder 的員工編號[EmployeeNum])
	--	SELECT subJoin.*
	--	FROM [dbo].[GameDealerMemberShip] AS subJoin WITH(NOLOCK)
	--	inner join NewMemberShip ON NewMemberShip.MemberID = subJoin.AgentParentID
	--)
	--SELECT * INTO #tempNewMemberShip
	--	FROM [NewMemberShip]

	SELECT * INTO #tempWinLoseReport
		FROM [dbo].[GameDealerWinLoseReport] WITH(NOLOCK)
		WHERE [CreateDate] >= @dateS
			AND [CreateDate] <= @dateE
			AND [SourceMemberID] IS NULL
			AND [SourceUserName] IS NULL
	
	SELECT @userCount = COUNT(*) 
		FROM GameDealerMemberShip
		WHERE [UserType] != '10'
			AND [AgentLevelSCID] < 31

	-- 開始進行計算
	WHILE @userCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT @gameDealerMemberID = MemberID
			,@userName = UserName
			,@agentPositionTakingRebate = AgentPositionTakingRebate
			,@agentParentID = AgentParentID
			FROM GameDealerMemberShip
			WHERE [UserType] != '10'
				AND AgentLevelSCID < 31
			ORDER BY GameDealerMemberShip.MemberID
			OFFSET     (@userCount - 1) ROWS
			FETCH NEXT 1 ROWS ONLY;

		SELECT @subUserCount = COUNT(*) 
			FROM #tempWinLoseReport
			Where AgentParentID = @gameDealerMemberID

		WHILE @subUserCount > 0
		BEGIN
			SELECT @subMemberID = GameDealerMemberID
				,@subUserName = UserName
				,@subAgentParentID = ISNULL(NULLIF(AgentParentID, ''),0 )
				,@subAgentParentMap = AgentParentMap
				,@subAgentPositionTakingRebate = AgentPositionTakingRebate
				,@subProfit = Profit
				,@subVipProfit = VipProfit
				,@winLoseMoney = WinLoseMoney
				,@vipWinLoseMoney = VipWinLoseMoney
				,@turnOver = TurnOver
				,@totalDiscountPrice = TotalDiscountPrice
				,@vipTurnOver = VIPTurnOver
				,@totalComission = TotalComission
				,@subUpper = [UpperTotal]
				,@subVipUpper = [VipUpperTotal]
				,@cashBalance = [CashBalance]
				,@creditBalance = [CreditBalance]
			FROM #tempWinLoseReport
			Where AgentParentID = @gameDealerMemberID
			ORDER BY #tempWinLoseReport.GameDealerMemberID
			OFFSET     (@subUserCount - 1) ROWS
			FETCH NEXT 1 ROWS ONLY;

			IF @gameDealerMemberID = @subMemberID
			BEGIN
				SET @subUserCount = @subUserCount - 1;
				CONTINUE;
			END;

			DECLARE @calculatorPT DECIMAL(18,4) = CAST(ISNULL(NULLIF(@agentPositionTakingRebate, ''),0 ) AS DECIMAL(18, 4)) - CAST(ISNULL(NULLIF(@subAgentPositionTakingRebate, ''),0 ) AS DECIMAL(18, 4));
			
			SET @profit = @winLoseMoney * @calculatorPT;
			SET @vipProfit = @totalComission * @calculatorPT;

			SET @upper = @subUpper - @profit;
			SET @vipUpper = (@subVipUpper + @vipProfit);

			Select @checkDataCount = Count(*) From [dbo].[GameDealerWinLoseReport]
			Where [GameDealerMemberID] = @gameDealerMemberID 
				AND [SourceMemberID] = @subMemberID 
				AND [CreateDate] >= @dateS
				AND [CreateDate] <= @dateE

			IF @checkDataCount > 0
			BEGIN
				UPDATE [dbo].[GameDealerWinLoseReport] 
					SET [WinLoseMoney] = CAST(ISNULL(NULLIF(CAST(@winLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPWinLoseMoney] = CAST(ISNULL(NULLIF(CAST(@vipWinLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TotalDiscountPrice] = CAST(ISNULL(NULLIF(CAST(@totalDiscountPrice AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TurnOver] = CAST(ISNULL(NULLIF(CAST(@turnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPTurnOver] = CAST(ISNULL(NULLIF(CAST(@vipTurnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TotalComission] = CAST(ISNULL(NULLIF(CAST(@totalComission AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[Profit] = CAST(ISNULL(NULLIF(CAST(@profit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPProfit] = CAST(ISNULL(NULLIF(CAST(@vipProfit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[UpperTotal] = CAST(ISNULL(NULLIF(CAST(@upper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPUpperTotal] = CAST(ISNULL(NULLIF(CAST(@vipUpper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[InitialCredit] = CAST(ISNULL(NULLIF(CAST(@initialCredit AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[CreditBalance] = CAST(ISNULL(NULLIF(CAST(@creditBalance AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[CashBalance] = CAST(ISNULL(NULLIF(CAST(@cashBalance AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[UpdateDate] = GETDATE()
					WHERE [GameDealerMemberID] = @gameDealerMemberID 
						AND [SourceMemberID] = @subMemberID 
						AND [CreateDate] >= @dateS
						AND [CreateDate] <= @dateE
			END;
			ELSE
			BEGIN
				INSERT INTO [dbo].[GameDealerWinLoseReport] ([GameDealerMemberID]
						  ,[UserName]
						  ,[SourceMemberID]
						  ,[SourceUserName]
						  ,[AgentParentID]
						  ,[AgentPositionTakingRebate]
						  ,[AgentParentMap]
						  ,[WinLoseMoney]
						  ,[VIPWinLoseMoney]
						  ,[TotalDiscountPrice]
						  ,[TurnOver]
						  ,[VIPTurnOver]
						  ,[TotalComission]
						  ,[Profit]
						  ,[VIPProfit]
						  ,[UpperTotal]
						  ,[VIPUpperTotal]
						  ,[InitialCredit]
						  ,[CreditBalance]
						  ,[CashBalance]
						  ,[CreateBy]
						  ,[CreateDate]
						  ,[UpdateBy]
						  ,[UpdateDate])
					VALUES (@gameDealerMemberID
						  ,@userName
						  ,@subMemberID
						  ,@subUserName
						  ,@subAgentParentID
						  ,@subAgentPositionTakingRebate
						  ,@subAgentParentMap
						  ,CAST(ISNULL(NULLIF(CAST(@winLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipWinLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@totalDiscountPrice AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@turnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipTurnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@totalComission AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@profit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipProfit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@upper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipUpper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@initialCredit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@creditBalance AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@cashBalance AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,0
						  ,@dateS
						  ,0
						  ,@dateE
					)
			END;
			
			SET @subUserCount = @subUserCount - 1;
		END;

		SET @userCount = @userCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GameDealerWinLoseReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20210416			Ben					從sp_WinLoseReport Copy過來,將Table換成GameDealer,刪除statement,錢包,totalBalance
-- =============================================
CREATE PROCEDURE [dbo].[sp_GameDealerWinLoseReport]
AS
BEGIN
	SELECT 'sp_GameDealerWinLoseReport'
	DECLARE @userCount int;										-- 要計算的用戶數
	DECLARE @gameDealerMemberID int;
	DECLARE @mPlayerCount int;
	DECLARE @winMoney decimal(18, 4);
	DECLARE @isReset int;
	DECLARE @qty decimal(18, 4);
	DECLARE @price decimal(18, 4);
	DECLARE @discountPrice decimal(18, 4);
	DECLARE @mPlayerID int;

	DECLARE @typeCode NVarchar(200) = 'Win';
	DECLARE @Status NVarchar(200) = '';
	DECLARE @recordMoney NVarchar(200) = '';					--WinMoney
	DECLARE @dateS NVarchar(200) = '';
	DECLARE @dateE NVarchar(200) = '';
	DECLARE @createDate NVarchar(200) = '';
	DECLARE @currentPeriod NVarchar(100) = '';					--期號
	DECLARE @drawTypeID INT;									--玩法計算ID
	DECLARE @lotteryInfoID INT;									--玩法ID
	DECLARE @lotteryTypeID INT;									--玩法類型ID
	DECLARE @lotteryClassID INT;								--玩法類型ID
	DECLARE @isWin bit;
	DECLARE @totalCount int = 0;

	-- 設定啟始與結束時間
	SELECT @dateS = CONVERT(NVarchar, DATEADD(MINUTE, -11, GETDATE()), 120)
		, @dateE=CONVERT(NVarchar, DATEADD(MINUTE, 0, GETDATE()), 120);
		
	--SELECT @dateS = '2021-10-30 00:00:00', @dateE = '2021-10-30 23:59:59'

	DROP TABLE IF EXISTS #tempMPlayer_GameDealerWinLoseReport
	 --複製當天的投注表
	SELECT * INTO #tempMPlayer_GameDealerWinLoseReport 
		FROM MPlayer with(nolock)
		WHERE UpdateDate >= @dateS 
			AND UpdateDate <= @dateE
			AND GameDealerMemberID > 0

	SELECT * FROM #tempMPlayer_GameDealerWinLoseReport
			
	DROP TABLE IF EXISTS #tempGameDealerMemberIDs_GameDealerWinLoseReport
	SELECT GameDealerMemberID INTO #tempGameDealerMemberIDs_GameDealerWinLoseReport
		FROM #tempMPlayer_GameDealerWinLoseReport 
		GROUP BY GameDealerMemberID
		
	SELECT @userCount = count(*)
		FROM #tempGameDealerMemberIDs_GameDealerWinLoseReport
	
	WHILE @userCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT 
			@gameDealerMemberID = GameDealerMemberID
		FROM #tempGameDealerMemberIDs_GameDealerWinLoseReport
		ORDER BY GameDealerMemberID
		OFFSET     (@userCount-1) ROWS
		FETCH NEXT 1 ROWS ONLY;
	
		-- Step 2. 取出投注資料
		SET @mPlayerCount = 0;
		SET @winMoney = -1;
		SET @isReset = -1;
		SET @mPlayerID = -1;
		SELECT @mPlayerCount = COUNT(*)  
			FROM #tempMPlayer_GameDealerWinLoseReport
			WHERE GameDealerMemberID = @gameDealerMemberID 
				AND isWin in (0,1)

			SET @totalCount += @mPlayerCount;
			WHILE @mPlayerCount > 0
			BEGIN
				SELECT @winMoney = WinMoney
					,@isReset = IsReset
					,@qty = Qty
					,@price = Price
					,@discountPrice = DiscountPrice
					,@mPlayerID = ID
					--,@cashBackRebateMoney = CashBackMoney
					,@lotteryInfoID = LotteryInfoID
					,@isWin = IsWin
					,@currentPeriod = CurrentPeriod
					,@createDate = Convert(NVarchar, [CreateDate], 120)
				FROM #tempMPlayer_GameDealerWinLoseReport
					WHERE GameDealerMemberID = @gameDealerMemberID 
						AND isWin in (0, 1)
					ORDER BY ID
				OFFSET     (@mPlayerCount-1) ROWS
				FETCH NEXT 1 ROWS ONLY;
				SET @createDate = Convert(NVarchar, DATEADD(SECOND, 1, @createDate), 120);

				SELECT @lotteryTypeID = LotteryTypeID
					, @lotteryClassID = LotteryClassID
					, @drawTypeID = DrawTypeID
					FROM LotteryInfo
					WHERE LotteryInfoID = @lotteryInfoID

				SET @typeCode = 'Win'
					
				DECLARE @checkGameDealerMemberID int = 0;
				DECLARE @checkMPlayerID int = 0;
				DECLARE @checkTypeCode NVarchar(200) = '';

				-- 計算(日)
				IF @isWin = 0
				BEGIN
					SET @recordMoney = -(@qty * @discountPrice);
					--補單金額
					IF @isReset = 1
					BEGIN
						SET @recordMoney = @winMoney
					END
					SET @typeCode = 'Loss'

					SELECT @checkGameDealerMemberID = ISNULL(MemberID, 0)
						, @checkMPlayerID =  ISNULL(MPlayerID, 0)
						, @checkTypeCode = TypeCode 
					FROM GameDealerMPlayerReport
					WHERE MemberID = @gameDealerMemberID 
						AND CreateDate = @createDate
						AND MPlayerID = @mPlayerID 
						AND TypeCode = @typeCode

					-- 有找到就都使用Update
					IF @checkGameDealerMemberID > 0 AND @checkMPlayerID > 0
					BEGIN
						--沒有[AgentMoney]
						UPDATE GameDealerMPlayerReport
						SET [TurnOverMoney] = (@qty * @price), 
							[DiscountPrice] = @discountPrice,
							[TypeCode] = @typeCode, 
							[RecordMoney] = @recordMoney, 
							[AgentLevelSCID] = 32, 
							[LotteryTypeID] = @lotteryTypeID, 
							[LotteryClassID] = @lotteryClassID,
							[UpdateBy] = 0, 
							[UpdateDate] = GETDATE()
						WHERE MemberID = @gameDealerMemberID 
							AND MPlayerID = @mPlayerID 
							AND TypeCode = 'Loss'
					END;
					ELSE
					BEGIN
						--沒有[AgentMoney]
						INSERT INTO GameDealerMPlayerReport ([MemberID], [MPlayerID], [LotteryTypeID], [LotteryClassID]
						, [CurrentPeriod], [TurnOverMoney], [DiscountPrice], [TypeCode], [Status], [RecordMoney], [CashRebateMoney], [CashBackRebateMoney]
						, [ReferralMoney], [AgentLevelSCID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						values (@gameDealerMemberID, @mPlayerID, @lotteryTypeID, @lotteryClassID
						, @currentPeriod, (@qty * @price), @discountPrice, @typeCode, NULL, @recordMoney, NULL
						, NULL, NULL, 32, 0, @createDate, 0, @dateE )

					END;
				END;
				Else IF @isWin = 1
				Begin
					SELECT @checkGameDealerMemberID = ISNULL(MemberID, 0)
					, @checkMPlayerID =  ISNULL(MPlayerID, 0)
					, @checkTypeCode = TypeCode 
					FROM GameDealerMPlayerReport
					WHERE MemberID = @gameDealerMemberID 
						AND MPlayerID = @mPlayerID 
						AND TypeCode = @typeCode
						
					SET @recordMoney = @winMoney;
					
					IF @drawTypeID >= 142 AND @drawTypeID <= 152
					BEGIN
						SET @recordMoney = @recordMoney - @discountPrice;
					END;

					IF @checkGameDealerMemberID > 0 AND @checkMPlayerID > 0
					BEGIN
						--沒有[AgentMoney]
						UPDATE GameDealerMPlayerReport
						SET [TurnOverMoney] = (@qty * @price), 
							[DiscountPrice] = @discountPrice,
							[TypeCode] = @typeCode, 
							[RecordMoney] = @recordMoney, 
							[AgentLevelSCID] = 32, 
							[LotteryTypeID] = @lotteryTypeID, 
							[LotteryClassID] = @lotteryClassID,
							[UpdateBy] = 0, 
							[UpdateDate] = GETDATE()
						WHERE MemberID = @gameDealerMemberID 
							AND MPlayerID = @mPlayerID 
							AND TypeCode = 'Win'
					END;
					ELSE
					BEGIN
						------沒有[AgentMoney]
						INSERT INTO GameDealerMPlayerReport ([MemberID], [MPlayerID], [LotteryTypeID], [LotteryClassID]
						, [CurrentPeriod], [TurnOverMoney], [DiscountPrice], [TypeCode], [Status], [RecordMoney], [CashRebateMoney]
						, [CashBackRebateMoney], [ReferralMoney], [AgentLevelSCID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						VALUES (@gameDealerMemberID, @mPlayerID, @lotteryTypeID, @lotteryClassID
						, @currentPeriod, (@qty * @price), @discountPrice, @typeCode, NULL, @recordMoney, NULL
						, NULL, NULL, 32, 0, @createDate, 0, @dateE)
					END;
				End;
				
				SET @mPlayerCount = @mPlayerCount - 1;
				CONTINUE  
			END;
		SET @userCount = @userCount - 1;
	END;

	SELECT @totalCount
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMemberAgentTree]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetMemberAgentTree](
	-- Add the parameters for the stored procedure here
	@UserName varchar(200)
)
AS
BEGIN
	WITH NewMemberShip AS (
		SELECT main.*
		FROM [dbo].[MemberShip] as main WHERE main.UserName = @UserName
		UNION ALL
		--跟 CTE 自身做遞迴 JOIN (A 的上級主管[SuperiorNum]是 EmployeeOrder 的員工編號[EmployeeNum])
		SELECT subJoin.*
		FROM [dbo].[MemberShip] as subJoin
		inner join NewMemberShip on NewMemberShip.MemberID = subJoin.AgentParentID
	)
	select * from NewMemberShip
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMPlayerTotalSum]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetMPlayerTotalSum] (@dateS varchar(200), @dateE varchar(200), @companyID int, @isPending int
	, @lotteryTypeIDs varchar(200), @username varchar(200), @gameDealerMemberId int, @isStaging bit)
AS
BEGIN
	--DECLARE @dateS NVARCHAR(200) = '2023-03-01';
	--DECLARE @dateE NVARCHAR(200) = '2023-04-01';
	--DECLARE @companyID int = 3;
	--DECLARE @isPending int = 2;
	--DECLARE @lotteryTypeIDs NVARCHAR(200) = '';
	--DECLARE @username int = '';
	--DECLARE @gameDealerMemberId int = 0;
	--DECLARE @isStaging bit = 0;

	DECLARE @totalTurnover DECIMAL(18, 4) = 0;
	DECLARE @totalBetAmount DECIMAL(18, 4) = 0;
	DECLARE @totalWinLose DECIMAL(18, 4) = 0;
	DECLARE @totalWinMoney DECIMAL(18, 4) = 0;
	DECLARE @totalWinMoneyWithCapital DECIMAL(18, 4) = 0;
	DECLARE @fourDCapital DECIMAL(18, 4) = 0;
	DECLARE @totalLoseMoney DECIMAL(18, 4);
	DECLARE @agentTotal DECIMAL(18, 4) = 0;
	DECLARE @upperTotal DECIMAL(18, 4) = 0;
	DECLARE @positionTaking DECIMAL(18, 4) = 0;
	DECLARE @typeCode NVARCHAR(200);
	DECLARE @shortName NVARCHAR(200);
 	
	--SELECT @totalTurnover as TotalTurnover,
	--	@totalBetAmount as TotalBetAmount,
	--	@totalWinLose as TotalWinLose,
	--	@totalWinMoney as TotalWinMoney,
	--	-@agentTotal as TotalAgentTotal,
	--	-@upperTotal as TotalUpper

	SELECT @totalTurnover = ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(Price,''))), 0),
		@totalBetAmount =  ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(DiscountPrice,''))), 0),
		@totalWinMoney =  ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(WinMoney,''))), 0),
		@totalWinMoneyWithCapital =  ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(WinMoneyWithCapital,''))), 0)
	FROM VwMPlayer with (nolock)
	WHERE UpdateDate >= @dateS AND UpdateDate < @dateE AND CompanyID = @companyID
		AND ((@isPending = 0 AND IsWin is null)
			OR (@isPending = 1 AND IsWin is not null)
			OR (@isPending = 2))
		AND ((@lotteryTypeIDs <> '' AND LotteryTypeID in (SELECT value FROM STRING_SPLIT(@lotteryTypeIDs, ',')))
			OR @lotteryTypeIDs = '')
		AND ((@username <> '' AND UserName = @username)
			OR @username = '')
		AND ((@gameDealerMemberId > 0 AND GameDealerMemberID = @gameDealerMemberId)
			OR @gameDealerMemberId = 0)
		AND (IsTest = @isStaging or IsTest is null)

	IF @isPending != 0
	BEGIN
		SELECT @fourDCapital =  ISNULL(SUM(CONVERT(DECIMAL(18, 4),DiscountPrice)), 0)
		FROM VwMPlayer with (nolock)
		WHERE UpdateDate >= @dateS AND UpdateDate < @dateE AND CompanyID = @companyID
			AND DrawTypeID >= 142 AND DrawTypeID <= 152 AND IsWin = 1
			AND ((@isPending = 0 AND IsWin is null)
				OR (@isPending = 1 AND IsWin is not null)
				OR (@isPending = 2))
			AND ((@lotteryTypeIDs <> '' AND LotteryTypeID in (SELECT value FROM STRING_SPLIT(@lotteryTypeIDs, ',')))
				OR @lotteryTypeIDs = '')
			AND ((@username <> '' AND UserName = @username)
				OR @username = '')
			AND ((@gameDealerMemberId > 0 AND GameDealerMemberID = @gameDealerMemberId)
				OR @gameDealerMemberId = 0)
			AND (IsTest = @isStaging or IsTest is null)
					
		SELECT @totalLoseMoney =  ISNULL(SUM(CONVERT(DECIMAL(18, 4),DiscountPrice)), 0)
		FROM VwMPlayer with (nolock)
		WHERE UpdateDate >= @dateS AND UpdateDate < @dateE AND CompanyID = @companyID
			AND IsWin = 0
			AND ((@isPending = 0 AND IsWin is null)
				OR (@isPending = 1 AND IsWin is not null)
				OR (@isPending = 2))
			AND ((@lotteryTypeIDs <> '' AND LotteryTypeID in (SELECT value FROM STRING_SPLIT(@lotteryTypeIDs, ',')))
				OR @lotteryTypeIDs = '')
			AND ((@username <> '' AND UserName = @username)
				OR @username = '')
			AND ((@gameDealerMemberId > 0 AND GameDealerMemberID = @gameDealerMemberId)
				OR @gameDealerMemberId = 0)
			AND (IsTest = @isStaging or IsTest is null)
	END

	SELECT @typeCode = TypeCode, @shortName = ShortName
	FROM PlatformSetting WHERE ID = @companyID
	IF @typeCode = 'Platform'
	BEGIN
		SELECT @positionTaking = CONVERT(DECIMAL(18, 4),AgentPositionTakingRebate)
		FROM MemberShip
		WHERE AgentLevelSCID = 31 AND UserName LIKE @shortName + '%'
	END
	ELSE
	BEGIN
		SELECT @positionTaking = CONVERT(DECIMAL(18, 4),AgentPositionTakingRebate)
		FROM GameDealerMemberShip
		WHERE AgentLevelSCID = 31 AND CompanyID = @companyID
	END

	SELECT @positionTaking = CONVERT(DECIMAL(18, 4),AgentPositionTakingRebate)
	FROM GameDealerMemberShip
	WHERE AgentLevelSCID = 31 AND CompanyID = @companyID

	SET @totalWinLose = @totalWinMoney - @fourDCapital - @totalLoseMoney;
	SET @agentTotal = @totalWinLose * @positionTaking;
	SET @upperTotal = @totalWinLose - @agentTotal;
	
	--SELECT @totalTurnover,@totalBetAmount,@totalWinMoney,@totalWinLose
	--SELECT @positionTaking,@agentTotal,@upperTotal

	SELECT @gameDealerMemberId as GameDealerMemberID,
		@username as UserName,
		@totalTurnover as TotalTurnover,
		@totalBetAmount as TotalBetAmount,
		@totalWinLose as TotalWinLose,
		--@totalWinMoney as TotalWinMoney,
		@totalWinMoneyWithCapital as TotalWinMoney,
		-@agentTotal as TotalAgentTotal,
		-@upperTotal as TotalUpper
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMPlayerTotalSumGroupByGameDealerMemberID]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetMPlayerTotalSumGroupByGameDealerMemberID] (@dateS varchar(200), @dateE varchar(200), @companyID int, @isPending int
	, @lotteryTypeIDs varchar(200), @username varchar(200), @gameDealerMemberId int, @isStaging bit)
AS
BEGIN
	--DECLARE @dateS NVARCHAR(200) = '2023-09-06';
	--DECLARE @dateE NVARCHAR(200) = '2023-09-07';
	--DECLARE @companyID int = 3;
	--DECLARE @isPending int = 1;
	--DECLARE @lotteryTypeIDs NVARCHAR(200) = '';
	--DECLARE @username NVARCHAR(200) = '';
	--DECLARE @gameDealerMemberId int = 0;
	--DECLARE @isStaging bit = 1;
	
	DROP TABLE IF EXISTS #tempGetMPlayerTotalSum

	SELECT GameDealerMemberID, 
		UserName,
		ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(Price,''))), 0) as TotalTurnover,
		ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(DiscountPrice,''))), 0) as TotalBetAmount ,
		ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(WinMoney,''))), 0) as TotalWinMoney ,
		ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(WinMoneyWithCapital,''))), 0) as TotalWinMoneyWithCapital,
		ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(WinMoneyWithCapital,''))), 0) - ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(DiscountPrice,''))), 0) as TotalWinLose,
		CONVERT(DECIMAL(18, 4),0) as FourDCapital,
		CONVERT(DECIMAL(18, 4),0) as TotalLoseMoney
	INTO #tempGetMPlayerTotalSum
	FROM VwMPlayer with (nolock)
	WHERE UpdateDate >= @dateS AND UpdateDate < @dateE AND CompanyID = @companyID
		AND ((@isPending = 0 AND IsWin is null)
			OR (@isPending = 1 AND IsWin is not null)
			OR (@isPending = 2))
		AND ((@lotteryTypeIDs <> '' AND LotteryTypeID in (SELECT value FROM STRING_SPLIT(@lotteryTypeIDs, ',')))
			OR @lotteryTypeIDs = '')
		AND ((@username <> '' AND UserName = @username)
			OR @username = '')
		AND ((@gameDealerMemberId > 0 AND GameDealerMemberID = @gameDealerMemberId)
			OR @gameDealerMemberId = 0)
		AND IsTest = @isStaging
	GROUP BY GameDealerMemberID, UserName

	IF @isPending != 0
	BEGIN
		UPDATE tmp
		SET FourDCapital = ISNULL(sub.TotalDiscountPrice, 0)
		FROM #tempGetMPlayerTotalSum tmp
		LEFT JOIN (
			SELECT GameDealerMemberID, SUM(CONVERT(DECIMAL(18, 4), DiscountPrice)) AS TotalDiscountPrice
			FROM VwMPlayer vw
			WHERE UpdateDate >= @dateS AND UpdateDate < @dateE
				AND CompanyID = @companyID
				AND DrawTypeID >= 142 AND DrawTypeID <= 152
				AND IsWin = 1
				AND ((@isPending = 0 AND IsWin is null)
					OR (@isPending = 1 AND IsWin is not null)
					OR (@isPending = 2))
				AND ((@lotteryTypeIDs <> '' AND LotteryTypeID in (SELECT value FROM STRING_SPLIT(@lotteryTypeIDs, ',')))
					OR @lotteryTypeIDs = '')
				AND ((@username <> '' AND vw.UserName = @username)
					OR @username = '')
				AND ((@gameDealerMemberId > 0 AND vw.GameDealerMemberID = @gameDealerMemberId)
					OR @gameDealerMemberId = 0)
				AND IsTest = @isStaging
			GROUP BY GameDealerMemberID
		) AS sub ON tmp.GameDealerMemberID = sub.GameDealerMemberID;
					
		UPDATE tmp
		SET TotalLoseMoney = ISNULL(sub.TotalDiscountPrice, 0)
		FROM #tempGetMPlayerTotalSum tmp
		LEFT JOIN (
			SELECT GameDealerMemberID, SUM(CONVERT(DECIMAL(18, 4), DiscountPrice)) AS TotalDiscountPrice
			FROM VwMPlayer vw
			WHERE UpdateDate >= @dateS AND UpdateDate < @dateE
				AND CompanyID = @companyID
				AND IsWin = 0
				AND ((@isPending = 0 AND IsWin is null)
					OR (@isPending = 1 AND IsWin is not null)
					OR (@isPending = 2))
				AND ((@lotteryTypeIDs <> '' AND LotteryTypeID in (SELECT value FROM STRING_SPLIT(@lotteryTypeIDs, ',')))
					OR @lotteryTypeIDs = '')
				AND ((@username <> '' AND vw.UserName = @username)
					OR @username = '')
				AND ((@gameDealerMemberId > 0 AND vw.GameDealerMemberID = @gameDealerMemberId)
					OR @gameDealerMemberId = 0)
				AND IsTest = @isStaging
			GROUP BY GameDealerMemberID
		) AS sub ON tmp.GameDealerMemberID = sub.GameDealerMemberID;
	END

	SELECT * FROM #tempGetMPlayerTotalSum
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMPositionProfitMap]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- 說明: 
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20201017			Yark				
-- 2			20210308			Ben					將MPositionTaking改成抓MemberShip
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetMPositionProfitMap]
AS
BEGIN
	DECLARE @userCount INT;											--要計算的用戶數
	DECLARE @memberID INT;											--投注單的用戶
	DECLARE @userName nvarchar(200);
	DECLARE @agentMap nvarchar(200);								-- 當下用戶的代理地圖
	DECLARE @memberAgentMap nvarchar(200);							-- 當下用戶的代理地圖
	DECLARE @agentLevelSCID INT = 31;								--Member Level
	DECLARE @positionTaking DECIMAL(18, 4);							--代理費用占成
	DECLARE @childPositionTaking DECIMAL(18, 4);					--子代理費占成
	DECLARE @positionTakingProfit DECIMAL(18, 4);					--子代理費占成
	DECLARE @companyID INT = 1;										-- 
	DECLARE @checkCount DECIMAL(18, 4);								--是否有值存在

  	DROP TABLE IF EXISTS #tempMemberShip
	-- 複製所有會員層級的用戶
	SELECT * INTO #tempMemberShip 
		FROM MemberShip WITH(NOLOCK) 							--是否有值存在

  	DROP TABLE IF EXISTS #tempGameDealerMemberShip
	-- 複製所有會員層級的用戶
	SELECT * INTO #tempGameDealerMemberShip 
		FROM GameDealerMemberShip WITH(NOLOCK) 

	-- 用戶數量
	SELECT @userCount = count(*) 
		FROM #tempMemberShip
		WHERE AgentLevelSCID = @agentLevelSCID

	WHILE @userCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT @memberID = MemberID
			,@userName = UserName
			,@memberAgentMap = AgentParentMap
			FROM #tempMemberShip
			WHERE AgentLevelSCID = @agentLevelSCID
		ORDER BY #tempMemberShip.MemberID
		OFFSET     (@userCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;
		
		DECLARE @agentCount int;
		DECLARE @agentUserName nvarchar(200);
		DECLARE @agentSubUserName nvarchar(200);
		DECLARE @agentUserId int;
		DECLARE @agentSubUserId int;
		DECLARE @agentLoopLevelSCID int;
		DECLARE @splitStr nvarchar(50) = '/';
		
		SET @memberAgentMap = @memberAgentMap + @userName + '/'

		-- 將agent Map做成temp table
		DROP TABLE IF EXISTS #agentMapTemp
		CREATE TABLE #agentMapTemp ( ID INT IDENTITY(1, 1) PRIMARY KEY, agentUserName NVARCHAR(200));
		INSERT INTO #agentMapTemp SELECT RTRIM(value) AS agentUserName FROM STRING_SPLIT(@memberAgentMap, '/') WHERE value <> '';
		
		SELECT @agentCount = COUNT(*) FROM #agentMapTemp;
		DECLARE @referralLevelTotal INT = (@agentCount + 1);--總階

		-- 結算agent Loop
		WHILE @agentCount > 0
		BEGIN
			-- Step 1. 取出 MemberID、agentUserName
			SELECT @agentUserName = agentUserName
			FROM #agentMapTemp
			ORDER BY #agentMapTemp.ID desc
			OFFSET     (@agentCount - 1) ROWS
			FETCH NEXT 1 ROWS ONLY;

			SET @positionTaking = 0;
			SELECT @agentUserId = MemberID
				,@agentLoopLevelSCID = [AgentLevelSCID]
				,@positionTaking =  (CAST(ISNULL(NULLIF([AgentPositionTakingRebate], ''),0 ) AS decimal(18, 4)))
				FROM #tempMemberShip
				WHERE UserName = @agentUserName

			SET @positionTakingProfit = 0;

			--SELECT @positionTaking = (CAST(ISNULL(NULLIF([PositionTaking], ''),0 ) AS decimal(18, 4)))
			--	FROM MPositionTaking WITH(NOLOCK)
			--	WHERE MemberID = @agentUserId
			--		AND CompanyID = @companyID;

			-- 取子階代理占成
			IF @agentCount >= 2
			BEGIN
				SELECT @agentSubUserName = agentUserName
					FROM #agentMapTemp
					ORDER BY #agentMapTemp.ID desc
				OFFSET     (@agentCount-2) ROWS
				FETCH NEXT 1 ROWS ONLY;

				SET @childPositionTaking = 0;
				SELECT @agentSubUserId = MemberID 
					, @agentMap = AgentParentMap
					, @childPositionTaking = (CAST(ISNULL(NULLIF([AgentPositionTakingRebate], ''),0 ) AS decimal(18, 4)))
					FROM MemberShip WITH(NOLOCK)
					WHERE UserName = @agentSubUserName

				SELECT @agentUserId,@agentUserName,@positionTaking,@agentSubUserId,@agentSubUserName,@childPositionTaking
				--SELECT @childPositionTaking = (CAST(ISNULL(NULLIF([PositionTaking], ''),0 ) AS decimal(18, 4)))
				--	FROM [MPositionTaking] WITH(NOLOCK)
				--	WHERE MemberID = @agentSubUserId
				--		AND CompanyID = @companyID;

				--SELECT @childAgentPositionTakingRebate = (CAST(ISNULL(NULLIF([AgentPositionTakingRebate], ''),0 ) AS decimal(18, 4)))
				--	FROM #tempMemberShip WITH(NOLOCK)
				--	WHERE UserName = @agentUserName

				SET @positionTakingProfit = (@positionTaking - @childPositionTaking)
			END;
			IF @agentUserId = @agentSubUserId
			BEGIN
				SET @positionTakingProfit = @positionTaking;
			END;

			SELECT @checkCount = COUNT(*) 
				FROM MPositionProfitMap WITH(NOLOCK)
				WHERE MemberID = @agentUserId
					AND SubMemberID = @agentSubUserId
					AND CompanyID = @companyID
					AND AgentParentMap = @memberAgentMap

			IF @checkCount > 0
			BEGIN
				UPDATE MPositionProfitMap 
					SET PositionTakingProfit = @positionTakingProfit
						,PositionTaking = @positionTaking
					WHERE MemberID = @agentUserId
						AND SubMemberID = @agentSubUserId
						AND CompanyID = @companyID
						AND AgentParentMap = @memberAgentMap
			END;
			ELSE
			BEGIN
				INSERT MPositionProfitMap ([AgentParentMap]
					,[MemberID]
					,[SubMemberID]
					,[CompanyID]
					,[PositionTaking]
					,[PositionTakingProfit]
					,[AgentLevelSCID]
					,[CreateBy]
					,[CreateDate]
					,[UpdateBy]
					,[UpdateDate])
					VALUES(@memberAgentMap
						,@agentUserId
						,@agentSubUserId
						,@companyID
						,@positionTaking
						,@positionTakingProfit
						,@agentLoopLevelSCID
						,0
						,GETDATE()
						,0
						,GETDATE()
						)
			END;

			-- 取子階代理占成
			SET @agentCount = @agentCount - 1;
		END;

		SET @userCount = @userCount - 1;
	END;

	
	-- GameDealer用戶數量
	SELECT @userCount = count(*) 
		FROM #tempGameDealerMemberShip
		WHERE AgentLevelSCID = @agentLevelSCID

	WHILE @userCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT @memberID = MemberID
			,@userName = UserName
			,@memberAgentMap = AgentParentMap
			,@companyID = CompanyID
			FROM #tempGameDealerMemberShip
			WHERE AgentLevelSCID = @agentLevelSCID
		ORDER BY #tempGameDealerMemberShip.MemberID
		OFFSET     (@userCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;
		
		SET @memberAgentMap = @memberAgentMap + @userName + '/'

		-- 將agent Map做成temp table
		--DROP TABLE IF EXISTS #agentMapTemp
		--CREATE TABLE #agentMapTemp ( ID INT IDENTITY(1, 1) PRIMARY KEY, agentUserName NVARCHAR(200));
		TRUNCATE TABLE #agentMapTemp
		INSERT INTO #agentMapTemp SELECT RTRIM(value) AS agentUserName FROM STRING_SPLIT(@memberAgentMap, '/') WHERE value <> '';
		
		SELECT @agentCount = COUNT(*) FROM #agentMapTemp;
		SET @referralLevelTotal = (@agentCount + 1);--總階

		-- 結算agent Loop
		WHILE @agentCount > 0
		BEGIN
			-- Step 1. 取出 MemberID、agentUserName
			SELECT @agentUserName = agentUserName
			FROM #agentMapTemp
			ORDER BY #agentMapTemp.ID desc
			OFFSET     (@agentCount - 1) ROWS
			FETCH NEXT 1 ROWS ONLY;

			SET @positionTaking = 0;
			SELECT @agentUserId = MemberID
				,@agentLoopLevelSCID = [AgentLevelSCID]
				,@positionTaking =  (CAST(ISNULL(NULLIF([AgentPositionTakingRebate], ''),0 ) AS decimal(18, 4)))
				FROM #tempGameDealerMemberShip
				WHERE UserName = @agentUserName

			SET @positionTakingProfit = 0;

			--SELECT @positionTaking = (CAST(ISNULL(NULLIF([PositionTaking], ''),0 ) AS decimal(18, 4)))
			--	FROM MPositionTaking WITH(NOLOCK)
			--	WHERE MemberID = @agentUserId
			--		AND CompanyID = @companyID;

			-- 取子階代理占成
			IF @agentCount >= 2
			BEGIN
				SELECT @agentSubUserName = agentUserName
					FROM #agentMapTemp
					ORDER BY #agentMapTemp.ID desc
				OFFSET     (@agentCount-2) ROWS
				FETCH NEXT 1 ROWS ONLY;

				SET @childPositionTaking = 0;
				SELECT @agentSubUserId = MemberID 
					, @agentMap = AgentParentMap
					, @childPositionTaking = (CAST(ISNULL(NULLIF([AgentPositionTakingRebate], ''),0 ) AS decimal(18, 4)))
					FROM #tempGameDealerMemberShip WITH(NOLOCK)
					WHERE UserName = @agentSubUserName

				--SELECT @agentUserId,@agentUserName,@positionTaking,@agentSubUserId,@agentSubUserName,@childPositionTaking
				--SELECT @childPositionTaking = (CAST(ISNULL(NULLIF([PositionTaking], ''),0 ) AS decimal(18, 4)))
				--	FROM [MPositionTaking] WITH(NOLOCK)
				--	WHERE MemberID = @agentSubUserId
				--		AND CompanyID = @companyID;

				--SELECT @childAgentPositionTakingRebate = (CAST(ISNULL(NULLIF([AgentPositionTakingRebate], ''),0 ) AS decimal(18, 4)))
				--	FROM #tempGameDealerMemberShip WITH(NOLOCK)
				--	WHERE UserName = @agentUserName

				SET @positionTakingProfit = (@positionTaking - @childPositionTaking)
			END;
			IF @agentUserId = @agentSubUserId
			BEGIN
				SET @positionTakingProfit = @positionTaking;
			END;

			SELECT @checkCount = COUNT(*) 
				FROM MPositionProfitMap WITH(NOLOCK)
				WHERE GameDealerMemberID = @agentUserId
					AND SubMemberID = @agentSubUserId
					AND CompanyID = @companyID
					AND AgentParentMap = @memberAgentMap

			IF @checkCount > 0
			BEGIN
				UPDATE MPositionProfitMap 
					SET PositionTakingProfit = @positionTakingProfit
						,PositionTaking = @positionTaking
					WHERE GameDealerMemberID = @agentUserId
						AND SubMemberID = @agentSubUserId
						AND CompanyID = @companyID
						AND AgentParentMap = @memberAgentMap
			END;
			ELSE
			BEGIN
				INSERT MPositionProfitMap ([AgentParentMap]
					,[GameDealerMemberID]
					,[SubMemberID]
					,[CompanyID]
					,[PositionTaking]
					,[PositionTakingProfit]
					,[AgentLevelSCID]
					,[CreateBy]
					,[CreateDate]
					,[UpdateBy]
					,[UpdateDate])
					VALUES(@memberAgentMap
						,@agentUserId
						,@agentSubUserId
						,@companyID
						,@positionTaking
						,@positionTakingProfit
						,@agentLoopLevelSCID
						,0
						,GETDATE()
						,0
						,GETDATE()
						)
			END;

			-- 取子階代理占成
			SET @agentCount = @agentCount - 1;
		END;

		SET @userCount = @userCount - 1;
	END;
END;







GO
/****** Object:  StoredProcedure [dbo].[sp_GetWinLoseReportByGame]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetWinLoseReportByGame] (@dateS NVARCHAR(200),@dateE NVARCHAR(200))
AS
BEGIN
	--DECLARE @dateS NVARCHAR(200)='2022-2-16';
	--DECLARE @dateE NVARCHAR(200)='2022-2-17';
	DECLARE @lotteryTypeID int = 0;

	DECLARE @totalTurnover DECIMAL(18, 4) = 0;
	DECLARE @totalBetAmount DECIMAL(18, 4) = 0;
	DECLARE @totalWinLose DECIMAL(18, 4) = 0;
	DECLARE @totalWinMoney DECIMAL(18, 4) = 0;
	DECLARE @fourDCapital DECIMAL(18, 4) = 0;
	DECLARE @totalLoseMoney DECIMAL(18, 4);
	DECLARE @agentTotal DECIMAL(18, 4) = 0;
	DECLARE @upperTotal DECIMAL(18, 4) = 0;
	DECLARE @positionTaking DECIMAL(18, 4) = 0;
	DECLARE @typeCode NVARCHAR(200);
	DECLARE @shortName NVARCHAR(200);
 	
	DECLARE @tempWinLoseReportByGameByPlatform TABLE
	(
		ID INT IDENTITY(1, 1) PRIMARY KEY,
		LotteryTypeID int, 
		PlatformID int,
		Turnover DECIMAL(18, 4), 
		Pending DECIMAL(18, 4), 
		BetAmount DECIMAL(18, 4), 
		WinMoney DECIMAL(18, 4), 
		FourDCapital DECIMAL(18, 4), 
		TotalLoseMoney DECIMAL(18, 4), 
		WinLose DECIMAL(18, 4), 
		AgentTotal DECIMAL(18, 4), 
		MasterTotal DECIMAL(18, 4), 
		SMasterTotal DECIMAL(18, 4), 
		CompanyTotal DECIMAL(18, 4)
	)
	
	--SELECT LotteryTypeID,
	--	SUM(TurnOver) as Turnover,
	--	SUM(Pending) as Pending,
	--	SUM(WinLose) as TotalWinLose,
	--	SUM(AgentTotal) as AGTotalWinLose,
	--	SUM(MasterTotal) as MTotalWinLose,
	--	SUM(SMasterTotal) as SMTotalWinLose,
	--	SUM(CompanyTotal) as CTotalWinLose		
	--FROM @tempWinLoseReportByGameByPlatform 
	--GROUP BY LotteryTypeID

	DROP TABLE IF EXISTS #tempVwMPlayer_GetWinLoseReportByGame
	
	SELECT * INTO #tempVwMPlayer_GetWinLoseReportByGame
	FROM VwMPlayer with (nolock)
	WHERE UpdateDate >= @dateS AND UpdateDate < @dateE

	INSERT INTO @tempWinLoseReportByGameByPlatform (LotteryTypeID,PlatformID,Turnover,BetAmount,WinMoney,FourDCapital,TotalLoseMoney)
	SELECT LotteryTypeID,
		CompanyID,
		ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(Price,''))), 0) as Turnover,
		ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(DiscountPrice,''))), 0) as BetAmount,
		ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(WinMoney,''))), 0) as WinMoney,
		0,
		0
	FROM #tempVwMPlayer_GetWinLoseReportByGame with (nolock)
	GROUP BY LotteryTypeID,CompanyID
				
	UPDATE @tempWinLoseReportByGameByPlatform
	SET FourDCapital = mp.FourDCapital
	FROM @tempWinLoseReportByGameByPlatform tp
	INNER JOIN 
	(
		SELECT LotteryTypeID,CompanyID,SUM(CONVERT(DECIMAL(18, 4),DiscountPrice)) as FourDCapital
		FROM #tempVwMPlayer_GetWinLoseReportByGame with (nolock) 
		WHERE DrawTypeID >= 142 AND DrawTypeID <= 152 AND IsWin = 1
		GROUP BY LotteryTypeID,CompanyID
	) as mp
	ON tp.LotteryTypeID = mp.LotteryTypeID AND tp.PlatformID = mp.CompanyID
	
	UPDATE @tempWinLoseReportByGameByPlatform
	SET TotalLoseMoney = mp.TotalLoseMoney
	FROM @tempWinLoseReportByGameByPlatform tp
	INNER JOIN 
	(
		SELECT LotteryTypeID,CompanyID,SUM(CONVERT(DECIMAL(18, 4),DiscountPrice)) as TotalLoseMoney
		FROM #tempVwMPlayer_GetWinLoseReportByGame with (nolock) 
		WHERE IsWin = 0
		GROUP BY LotteryTypeID,CompanyID
	) as mp
	ON tp.LotteryTypeID = mp.LotteryTypeID AND tp.PlatformID = mp.CompanyID
	
	UPDATE @tempWinLoseReportByGameByPlatform
	SET Pending = mp.Pending
	FROM @tempWinLoseReportByGameByPlatform tp
	INNER JOIN 
	(
		SELECT LotteryTypeID,CompanyID,SUM(CONVERT(DECIMAL(18, 4),Price)) as Pending
		FROM #tempVwMPlayer_GetWinLoseReportByGame with (nolock) 
		WHERE IsWin is null
		GROUP BY LotteryTypeID,CompanyID
	) as mp
	ON tp.LotteryTypeID = mp.LotteryTypeID AND tp.PlatformID = mp.CompanyID
		
	UPDATE @tempWinLoseReportByGameByPlatform
	SET WinLose = (WinMoney - TotalLoseMoney - FourDCapital)
	
	UPDATE @tempWinLoseReportByGameByPlatform
	SET AgentTotal = WinLose * (SELECT CONVERT(DECIMAL(18, 4), PositionTakingProfit) FROM MPositionProfitMap WHERE CompanyID = PlatformID AND AgentLevelSCID = 31),
		MasterTotal = WinLose * (SELECT CONVERT(DECIMAL(18, 4), PositionTakingProfit) FROM MPositionProfitMap WHERE CompanyID = PlatformID AND AgentLevelSCID = 30),
		SMasterTotal = WinLose * (SELECT CONVERT(DECIMAL(18, 4), PositionTakingProfit) FROM MPositionProfitMap WHERE CompanyID = PlatformID AND AgentLevelSCID = 29)
		
	UPDATE @tempWinLoseReportByGameByPlatform
	SET CompanyTotal = WinLose - AgentTotal - MasterTotal - SMasterTotal

	--SELECT * FROM @tempWinLoseReportByGameByPlatform

	SELECT LotteryTypeID,
		SUM(TurnOver) as Turnover,
		SUM(Pending) as Pending,
		SUM(WinLose) as TotalWinLose,
		SUM(AgentTotal) as AGTotalWinLose,
		SUM(MasterTotal) as MTotalWinLose,
		SUM(SMasterTotal) as SMTotalWinLose,
		SUM(CompanyTotal) as CTotalWinLose		
	FROM @tempWinLoseReportByGameByPlatform 
	GROUP BY LotteryTypeID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetWinLoseReportByGameMember]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[sp_GetWinLoseReportByGameMember] (@dateS NVARCHAR(200),@dateE NVARCHAR(200),@lotteryTypeID int)
AS
BEGIN
	--DECLARE @dateS NVARCHAR(200)='2022-2-11';
	--DECLARE @dateE NVARCHAR(200)='2022-2-12';
	--DECLARE @lotteryTypeID int = 1;
	
	DECLARE @userName NVARCHAR(200);
	DECLARE @totalTurnover DECIMAL(18, 4) = 0;
	DECLARE @totalBetAmount DECIMAL(18, 4) = 0;
	DECLARE @totalWinLose DECIMAL(18, 4) = 0;
	DECLARE @totalWinMoney DECIMAL(18, 4) = 0;
	DECLARE @fourDCapital DECIMAL(18, 4) = 0;
	DECLARE @totalLoseMoney DECIMAL(18, 4);
	DECLARE @agentTotal DECIMAL(18, 4) = 0;
	DECLARE @upperTotal DECIMAL(18, 4) = 0;
	DECLARE @positionTaking DECIMAL(18, 4) = 0;
	DECLARE @typeCode NVARCHAR(200);
	DECLARE @shortName NVARCHAR(200);
 	
	DECLARE @tempWinLoseReportByGameByMember TABLE
	(
		ID INT IDENTITY(1, 1) PRIMARY KEY,
		LotteryTypeID int,
		UserName NVARCHAR(200),
		MemberID int,
		GameDealerMemberID int,
		PlatformID int,
		Turnover DECIMAL(18, 4), 
		Pending DECIMAL(18, 4), 
		BetAmount DECIMAL(18, 4), 
		WinMoney DECIMAL(18, 4), 
		FourDCapital DECIMAL(18, 4), 
		LoseMoney DECIMAL(18, 4), 
		WinLose DECIMAL(18, 4)
	)
	
	--SELECT @lotteryTypeID as LotteryTypeID,
	--	UserName,
	--	MemberID,
	--	GameDealerMemberID,
	--	SUM(Turnover) as TurnOver,
	--	SUM(Pending) as Pending,
	--	SUM(WinMoney) as TotalWinMoney,
	--	SUM(LoseMoney) as TotalLoseMoney,
	--	SUM(WinLose) as TotalWinLose
	--FROM @tempWinLoseReportByGameByMember 
	--GROUP BY UserName,MemberID,GameDealerMemberID

	DROP TABLE IF EXISTS #tempVwMPlayer
	
	SELECT * INTO #tempVwMPlayer
	FROM VwMPlayer with (nolock)
	WHERE UpdateDate >= @dateS AND UpdateDate < @dateE AND LotteryTypeID = @lotteryTypeID

	INSERT INTO @tempWinLoseReportByGameByMember (UserName,MemberID,GameDealerMemberID,PlatformID,Turnover,BetAmount,WinMoney,FourDCapital,LoseMoney)
	SELECT UserName,
		MemberID,
		GameDealerMemberID,
		CompanyID,
		ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(Price,''))), 0) as Turnover,
		ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(DiscountPrice,''))), 0) as BetAmount,
		ISNULL(SUM(CONVERT(DECIMAL(18, 4),NULLIF(WinMoney,''))), 0) as WinMoney,
		0,
		0
	FROM #tempVwMPlayer with (nolock)
	GROUP BY UserName,MemberID,GameDealerMemberID,CompanyID
				
	UPDATE @tempWinLoseReportByGameByMember
	SET FourDCapital = mp.FourDCapital
	FROM @tempWinLoseReportByGameByMember tp
	INNER JOIN 
	(
		SELECT UserName,CompanyID,SUM(CONVERT(DECIMAL(18, 4),DiscountPrice)) as FourDCapital
		FROM #tempVwMPlayer with (nolock) 
		WHERE DrawTypeID >= 142 AND DrawTypeID <= 152 AND IsWin = 1
		GROUP BY UserName,CompanyID
	) as mp
	ON tp.UserName = mp.UserName AND tp.PlatformID = mp.CompanyID
	
	UPDATE @tempWinLoseReportByGameByMember
	SET LoseMoney = mp.TotalLoseMoney
	FROM @tempWinLoseReportByGameByMember tp
	INNER JOIN 
	(
		SELECT UserName,CompanyID,SUM(CONVERT(DECIMAL(18, 4),DiscountPrice)) as TotalLoseMoney
		FROM #tempVwMPlayer with (nolock) 
		WHERE IsWin = 0
		GROUP BY UserName,CompanyID
	) as mp
	ON tp.UserName = mp.UserName AND tp.PlatformID = mp.CompanyID
	
	UPDATE @tempWinLoseReportByGameByMember
	SET Pending = mp.Pending
	FROM @tempWinLoseReportByGameByMember tp
	INNER JOIN 
	(
		SELECT UserName,CompanyID,SUM(CONVERT(DECIMAL(18, 4),Price)) as Pending
		FROM #tempVwMPlayer with (nolock) 
		WHERE IsWin is null
		GROUP BY UserName,CompanyID
	) as mp
	ON tp.UserName = mp.UserName AND tp.PlatformID = mp.CompanyID
		
	UPDATE @tempWinLoseReportByGameByMember
	SET WinLose = (WinMoney - LoseMoney - FourDCapital)
	
	SELECT @lotteryTypeID as LotteryTypeID,
		UserName,
		MemberID,
		GameDealerMemberID,
		SUM(Turnover) as TurnOver,
		SUM(Pending) as Pending,
		SUM(WinMoney) as TotalWinMoney,
		SUM(LoseMoney) as TotalLoseMoney,
		SUM(WinLose) as TotalWinLose
	FROM @tempWinLoseReportByGameByMember 
	GROUP BY UserName,MemberID,GameDealerMemberID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetWinLoseReportByGameOutstanding]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[sp_GetWinLoseReportByGameOutstanding] (@dateS NVARCHAR(200),@lotteryTypeID int)
AS
BEGIN
	
	SELECT SelectedNums,@lotteryTypeID as LotteryTypeID,lf.LotteryInfoID,lf.LotteryInfoName
	,SUM(CONVERT(decimal,Price)) as Price
	FROM VwMPlayer vp 
	LEFT JOIN LotteryInfo lf ON vp.LotteryInfoID = lf.LotteryInfoID
	WHERE vp.IsWin is null AND vp.CreateDate >= @dateS
		AND lf.LotteryTypeID = @lotteryTypeID
	GROUP BY SelectedNums,lf.LotteryInfoID,lf.LotteryInfoName

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GiveMemberUserType]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20201017			Yark				Member身份都改UserType = 10
-- =============================================
CREATE PROCEDURE [dbo].[sp_GiveMemberUserType]
AS
BEGIN
	UPDATE [MemberShip] 
	SET [UserType] = 10,
		[UpdateBy] = 0,
		[UpdateDate] = GETDATE()
	WHERE [AgentLevelSCID] = 32 And [UserType] != 10

	UPDATE [GameDealerMemberShip] 
	SET [UserType] = 10,
		[UpdateBy] = 0,
		[UpdateDate] = GETDATE()
	WHERE [AgentLevelSCID] = 32 And [UserType] != 10
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LotteryTypeRankin]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 說明: 統計各玩家的投注熱門選項
-- 參數說明: null
-- 範例: exec [sp_LotteryTypeRankin]
-- 序號			版本號				修改人				修改參數說明
-- 1			20200211			Yark				投注次數總計
-- =============================================
CREATE PROCEDURE [dbo].[sp_LotteryTypeRankin]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	truncate table [dbo].[LotteryTypeRankin]

	insert into [dbo].[LotteryTypeRankin] ([MemberID]
      ,[LotteryBettingRanking]
      ,[LotteryTypeID]
      ,[LotteryTypeName]
      ,[URL]
      ,[CreateID]
      ,[CreateDate]
      ,[UpdateID]
      ,[UpdateDate]) 
	  SELECT ml.[MemberID], Count(ml.[MemberID]) 'LotteryBettingRanking', lt.LotteryTypeID, lt.LotteryTypeName, lt.[URL], 0, GETDATE(), 0, GETDATE()
		  FROM [dbo].[MPlayer] ml
		  inner join LotteryInfo li on li.LotteryInfoID = ml.LotteryInfoID
		  left join LotteryType lt on lt.LotteryTypeID = li.LotteryTypeID
		  group by ml.[MemberID], lt.LotteryTypeID, lt.LotteryTypeName, lt.[URL]
  SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MPlayerTopSort]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20210119			Yark				計算遊戲的投注報表
-- =============================================
CREATE PROCEDURE [dbo].[sp_MPlayerTopSort]
AS
BEGIN
	DECLARE @lotteryTypeID int = 0;								-- 遊戲類型ID
	DECLARE @lotteryTypeName NVARCHAR(200);						-- 遊戲類型
	DECLARE @lotteryTypeCode NVARCHAR(200);						-- 遊戲類型
	DECLARE @lotteryTypeCount int = 0;							-- 要計算的用戶數
	DECLARE @turnOver DECIMAL(18, 4);							-- 總流水
	DECLARE @totalBet DECIMAL(18, 4);							-- 總投注額
	DECLARE @totalWin DECIMAL(18, 4);							-- 總贏
	DECLARE @checkData int;										-- 確認資料是否存在
	DECLARE @memberCount int = 0;								-- 要計算的用戶數
	DECLARE @memberID int = 0;									-- 要計算的遊戲數
	DECLARE @userName NVARCHAR(200) = 0;						-- 要計算的用戶數
	

	DECLARE @dateS NVARCHAR(200) = '';							-- 
	DECLARE @dateE NVARCHAR(200) = '';							-- 
	DECLARE @createDate NVARCHAR(200) = '';						-- 

	-- 設定啟始與結束時間
	SELECT @dateS = CONVERT(NVarchar, getdate(), 111)+' 00:00:00'
	, @dateE = CONVERT(NVarchar, getdate(), 111)+' 23:58:00'
	, @createDate = CONVERT(NVarchar, getdate(), 111)+' 00:00:00';

	SELECT @dateS, @dateE

	DROP TABLE IF EXISTS #tempVwMPlayer
	 --複製當天的投注表
	SELECT * INTO #tempVwMPlayer 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [CreateDate] >= @dateS 
			AND [CreateDate] <= @dateE

	DROP TABLE IF EXISTS #tempMemberShip
	 --複製當天的投注表
	SELECT * INTO #tempMemberShip 
		FROM [MemberShip] WITH(NOLOCK)
		WHERE [AgentLevelSCID] = 32

	SELECT @memberCount = COUNT(*) 
		FROM #tempMemberShip

	WHILE @memberCount > 0
	BEGIN
		SET @lotteryTypeID = 0;
		SET @totalBet = 0;
		SET @totalWin = 0;

		-- Step 1. 從Lottery進行大分類的加總
		SELECT @memberID = [MemberID]
			, @userName = [UserName]
			FROM #tempMemberShip
		ORDER BY #tempMemberShip.MemberID
		OFFSET     (@memberCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;

		SELECT @lotteryTypeCount = COUNT(*) 
			FROM [dbo].[LotteryType] WITH(NOLOCK)

		WHILE @lotteryTypeCount > 0
		BEGIN
			-- Step 1. 從Lottery進行大分類的加總
			SELECT @lotteryTypeID = [LotteryTypeID]
				, @lotteryTypeName = [LotteryTypeName]
				, @lotteryTypeCode = [LotteryTypeCode]
				FROM [dbo].[LotteryType] WITH(NOLOCK) 
			ORDER BY [dbo].[LotteryType].[LotteryTypeID]
			OFFSET     (@lotteryTypeCount - 1) ROWS
			FETCH NEXT 1 ROWS ONLY;

			Select @totalBet = SUM(CAST(ISNULL(NULLIF(Price, ''),0 ) AS DECIMAL(18, 4)))
				, @totalWin = SUM(CAST(ISNULL(NULLIF(WinMoney, ''),0 ) AS DECIMAL(18, 4)))
				FROM #tempVwMPlayer
				WHERE IsWin in (1,0)
					AND [MemberID] = @memberID
					AND [LotteryTypeID] = @lotteryTypeID

			IF @totalBet > 0
			BEGIN
				SELECT @checkData = COUNT(*)
					FROM [MPlayerTopSort] WITH(NOLOCK)
					WHERE [MemberID] = @memberID
						AND [CreateDate] >= @createDate 
						AND [LotteryTypeID] = @lotteryTypeID

				IF @checkData > 0
				BEGIN
					UPDATE [MPlayerTopSort]
						SET [TotalBet] = @totalBet
						, [TotalWin] = @totalWin
						WHERE [MemberID] = @memberID
							AND [CreateDate] >= @createDate 
							AND [LotteryTypeID] = @lotteryTypeID
				END;
				ELSE
				BEGIN
					INSERT [MPlayerTopSort] 
						([MemberID]
						  ,[UserName]
						  ,[TotalBet]
						  ,[TotalWin]
						  ,[LotteryTypeID]
						  ,[LotteryTypeName]
						  ,[LotteryTypeCode]
						  ,[Sort]
						  ,[CreateBy]
						  ,[CreateDate]
						  ,[UpdateBy]
						  ,[UpdateDate])
						VALUES
							(@memberID
							, @userName
							, @totalBet
							, @totalWin
							, @lotteryTypeID
							, @lotteryTypeName
							, @lotteryTypeCode
							, 1
							, 0
							, @createDate
							, 0
							, @createDate)
				END;
			END;
			
			SET @lotteryTypeCount = @lotteryTypeCount - 1;
		END;

		SET @memberCount = @memberCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ReferralReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20200308			Yark					進行代理費計算
-- 2			20200310			Yark				加入Statement Report
-- 3			20200713			Yark				加入CurrentPeriod
-- 4			20200816			Yark				CashRebate修改為流水不是輸贏
-- 5			20200924			Ben					修改為ReferralRepot,移除WinLoss,CashBack,CashRebate
-- 6			20200929			Ben					修改一個Member總流水算1筆
-- =============================================
CREATE PROCEDURE [dbo].[sp_ReferralReport]
(@referralPayType int)
AS
BEGIN
	DECLARE @userCount int; -- 要計算的用戶數
	DECLARE @memberID int;
	DECLARE @referralParentID int;
	DECLARE @referralCashRebate decimal(18, 4);
	DECLARE @referralLayerLevel decimal(18, 4);
	DECLARE @winMoney decimal(18, 4);
	DECLARE @totalBet decimal(18, 4);					-- 總投注
	DECLARE @totalWinMoney decimal(18, 4);
	DECLARE @gameRoomID int;
	DECLARE @gameRoomCount int;
	--DECLARE @referralPayType int = 34;
	DECLARE @mPlayerID int;

	DECLARE @typeCode varchar(200) = 'Win';
	DECLARE @Status varchar(200) = '';
	DECLARE @recordMoney varchar(200) = ''; --WinMoney
	DECLARE @agentMoney decimal(18, 4) = 0;
	DECLARE @referralMoney decimal(18, 4) = 0;
	DECLARE @dateS varchar(200) = '';
	DECLARE @dateE varchar(200) = '';
	DECLARE @updateDate varchar(200) = '';
	DECLARE @currentPeriod NVARCHAR(100) = '';			--期號
	DECLARE @lotteryInfoID INT;							--玩法ID
	DECLARE @userBalance NVARCHAR(200);					--用戶餘額
	DECLARE @userWallet DECIMAL(18, 4);					--用戶錢包
	DECLARE @totalBalance DECIMAL(18, 4);				--用戶總餘額
	DECLARE @isWin bit;

	-- 設定啟始與結束時間
	IF @referralPayType = 34
	Begin
		SELECT @dateS = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 00:00:00', 120), @dateE = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 23:59:59' , 120);
	End;
	ELSE IF @referralPayType = 35
	Begin
		SELECT @dateS = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -7, getdate()), 111) + ' 00:00:00', 120), @dateE = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -7, getdate()), 111) + ' 23:59:59' , 120);
	End;
	ELSE IF @referralPayType = 36
	Begin
		SELECT @dateS = CONVERT(varchar, CONVERT(varchar, DATEADD(MONTH, -1, getdate()), 111) + ' 00:00:00', 120), @dateE = CONVERT(varchar, CONVERT(varchar, DATEADD(DAY, -1, getdate()), 111) + ' 23:59:59' , 120);
	End;

	SET @updateDate = DATEADD(DAY, +1, @dateE)

	DROP TABLE IF EXISTS #tempMPlayer
	 --複製當天的投注表
	SELECT * INTO #tempMPlayer FROM MPlayer with(nolock)
	WHERE CreateDate >= @dateS AND CreateDate <= @dateE  AND ReferralPayType = @referralPayType

	 --複製當天的投注表計算總額
	DROP TABLE IF EXISTS #tempTotalMPlayer
	SELECT * INTO #tempTotalMPlayer FROM (
		SELECT t.MemberID, SUM(CONVERT(DECIMAL(18, 4), ISNULL(t.Price, 0))) as 'TotalBet', SUM(CONVERT(DECIMAL(18, 4),
				ISNULL(t.WinMoney, 0))) as 'TotalWinMoney', LC.GameRoomID as 'GameRoomID'
			FROM #tempMPlayer t with(nolock)
					INNER JOIN LotteryInfo LI ON LI.LotteryInfoID = t.LotteryInfoID
					INNER JOIN LotteryType LT ON LT.LotteryTypeID = LI.LotteryTypeID
					INNER JOIN LotteryClass LC ON LC.LotteryClassID = LT.LotteryClassID
			WHERE t.CreateDate >= @dateS AND t.CreateDate <= @dateE
			GROUP BY MemberID,  LC.GameRoomID) AS MplayerTable;

	-- 用戶日計算的用戶數量
	SELECT @userCount = count(*)
		from MemberShip with(nolock) 
	WHERE ReferralPayType = @referralPayType

	WHILE @userCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT 
			@referralCashRebate = (CAST(ISNULL(NULLIF(ReferralCashRebate, ''),0 ) AS decimal(18, 4))),
			@referralLayerLevel = (CAST(ISNULL(NULLIF(ReferralLayerLevel, ''),0 ) AS decimal(18, 4))),
			@memberID = MemberID
			from MemberShip with(nolock) 
		WHERE ReferralPayType = @referralPayType
		ORDER BY MemberShip.MemberID
		OFFSET     (@userCount-1) ROWS
		FETCH NEXT 1 ROWS ONLY;
	
		-- Step 2. 依照GameRoomID取出投注資料
		SET @winMoney = 0;
		
		SELECT @gameRoomCount = count(*) FROM GameRoomType with(nolock) 

		WHILE @gameRoomCount > 0
		BEGIN
			SELECT @gameRoomID = GameRoomID FROM GameRoomType
			ORDER BY GameRoomID
			OFFSET  (@gameRoomCount-1) ROWS
			FETCH NEXT 1 ROWS ONLY;
			
			SET @totalBet = Null;
			SET @totalWinMoney = Null;

			-- 取得用戶的總投注及總WinMoney
			SELECT @totalBet = ISNULL(TotalBet, 0), @totalWinMoney = ISNULL(TotalWinMoney, 0)
				FROM #tempTotalMPlayer
				WHERE MemberID = @memberID AND GameRoomID = @gameRoomID;
				
			IF @totalBet > 0
			BEGIN
				-- 進行結算Referral
				DECLARE @referralCount int;
				DECLARE @referralMap nvarchar(200);
				DECLARE @referralUserName nvarchar(200);
				DECLARE @referralUserId int;
				DECLARE @splitStr nvarchar(50) = '/';

				SELECT @referralMap = ReferralMap
				FROM  MemberShip with(nolock) 
				WHERE MemberID = @memberID

				DROP TABLE IF EXISTS #referralMapTemp
				CREATE TABLE #referralMapTemp ( ID INT IDENTITY(1, 1) PRIMARY key, ReferralUserName nvarchar(200));

				INSERT INTO #referralMapTemp SELECT value 'ReferralUserName' FROM STRING_SPLIT(@referralMap, '/') WHERE RTRIM(value) <> '';

				---- Referral Calcultor
				SELECT @referralCount = count(*) from #referralMapTemp
				DECLARE @referralLevelTotal int = (@referralCount + 1);--總階
						
				WHILE @referralCount > 0
				BEGIN
					-- Step 1. 取出 MemberID、ReferralRebate
					SELECT @referralUserName = ReferralUserName
					FROM #referralMapTemp
					ORDER BY #referralMapTemp.ID
					OFFSET     (@referralCount-1) ROWS
					FETCH NEXT 1 ROWS ONLY;

					-- 取出用戶總餘額
					SELECT @referralUserId = MemberID, @userBalance = [TotalBalance]
					FROM MemberShip WITH(NOLOCK)
					WHERE UserName = @referralUserName

					-- 取出用戶錢包
					SELECT @userWallet = CAST(ISNULL(NULLIF(TotalPrice, ''),0) AS decimal(18, 4))
					FROM MWallet WITH(NOLOCK)
					WHERE MemberID = @referralUserId AND CompanyID = 2

					-- 第一層時才進行取得Member的ParentID
					IF (@referralLevelTotal - @referralCount) = 1
					BEGIN
						SET @referralParentID = @referralUserId;
					END;
						
					-- 取得referralLevelRebate
					DECLARE @referralLevelRebate decimal(18, 4) = 0;

					SELECT @referralLevelRebate = CAST(ISNULL(NULLIF(RL.[ReferralPercentage], ''), 0) AS decimal(18, 4)) 
					FROM  ReferralLayer RL 
					WHERE RL.GameRoomTypeID = @gameRoomID  And RL.ReferralLevel = (@referralLevelTotal - @referralCount);

					DECLARE @referralLevelMoney decimal(18, 4) = 0;
					SET @referralLevelMoney = @referralLevelRebate * @totalBet;

					INSERT INTO MPlayerReport ([MemberID], [ReferralMemberID], [MPlayerID], [ReferralLevel], [TypeCode], 
					[ReferralParentID], [TurnOverMoney], [Status], [RecordMoney], [CashRebateMoney], [CashBackRebateMoney],
					[ReferralMoney], [ReferralPayType], [AgentLevelSCID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
					values (@referralUserId, @memberID, 0
					, CAST((@referralLevelTotal - @referralCount) as nvarchar(100)) + ',' + CAST(@referralLevelRebate as nvarchar(100))
					, 'Referral',
					@referralParentID, @totalBet, NULL, @totalWinMoney, 0, 0, @referralLevelMoney, @referralPayType, 32, 0, @dateS, 0, @updateDate )

					-- 加入Statement--Referral
					SET @totalBalance = CAST(ISNULL(NULLIF(@userBalance, ''),0) AS decimal(18, 4)) + @referralLevelMoney;
					INSERT INTO [Statement] ([MemberID], [CurrentPeriod], [LotteryInfoID], [Balance], [TypeCode], [ValueMoney], [Total], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
					VALUES (@referralUserId, @currentPeriod, 0, @userBalance, 'Referral ' + CAST((@referralLevelTotal - @referralCount) as nvarchar(100)) , CAST(@referralLevelMoney AS NVARCHAR(200)), CAST(@totalBalance AS NVARCHAR(200)), 0, getdate(), 0, getdate())

					SET @userWallet = @userWallet + @referralLevelMoney;

					-- 更新用戶總餘額
					SET @userBalance = @totalBalance;
					UPDATE MemberShip SET [TotalBalance] = @userBalance
					WHERE UserName = @referralUserName AND MemberID = @referralUserId

					-- 更新用戶錢包
					UPDATE MWallet SET TotalPrice = @userWallet
					WHERE MemberID = @referralUserId AND CompanyID = 2

					SET @referralCount = @referralCount - 1;
				End;
			
			END
		
			SET @gameRoomCount = @gameRoomCount - 1;
		END

		-- 更新目前己計算的MPlayer
		UPDATE MPlayer SET IsReferralWriteReport = 1 
			WHERE ID IN (SELECT ID FROM #tempMPlayer WHERE MemberID = @memberID and isWin in (0, 1))

		SET @userCount = @userCount - 1;
	END;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_RefreshLotteryDataFrom31]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RefreshLotteryDataFrom31]
AS
BEGIN

	DELETE LotteryType
	SET IDENTITY_INSERT [dbo].[LotteryType] ON 
	INSERT INTO LotteryType ([LotteryTypeID],[LotteryTypeName],[LotteryTypeCode],[LotteryClassID],[CompanyID]
	,[PeriodInterval],[RealPlayTime],[MaxBonusMoneyPool],[DrawBonusPercentage],[IsEnableAI],[IsMaintain],[AIType]
	,[CompanyWinPercentage],[UserWinPercentage],[CompanyPresetCompensation],[URL],[FamliyID],[FamliyISort],[NewOrHot]
	,[IsOfficial],[IsCloseGame],[Status],[LotteryType_TableID],[CreateID],[CreateDate],[UpdateID],[UpdateDate])
	SELECT [LotteryTypeID],[LotteryTypeName],[LotteryTypeCode],[LotteryClassID],[CompanyID]
	,[PeriodInterval],[RealPlayTime],[MaxBonusMoneyPool],[DrawBonusPercentage],[IsEnableAI],[IsMaintain],[AIType]
	,[CompanyWinPercentage],[UserWinPercentage],[CompanyPresetCompensation],[URL],[FamliyID],[FamliyISort],[NewOrHot]
	,[IsOfficial],[IsCloseGame],[Status],[LotteryType_TableID],[CreateID],[CreateDate],[UpdateID],[UpdateDate] FROM openrowset('SQLOLEDB', '192.82.60.31'; 'GHLUser'; '@golden85092212', [GHL].[dbo].[LotteryType])
	SET IDENTITY_INSERT [dbo].[LotteryType] OFF

	DELETE LotteryInfo
	SET IDENTITY_INSERT [dbo].[LotteryInfo] ON 
	INSERT INTO LotteryInfo ([LotteryInfoID],[LotteryInfoName],[LotteryInfoNotice],[LotteryClassID]
			,[LotteryTypeID],[DrawTypeID],[DisCount],[MinBet],[MaxBet],[FamliyBigID],[FamliyMiddelID],[FamliySmallID]
			,[Status],[SelectArray],[LotteryInfo_TableID],[ResultPosition],[CreateID],[CreateDate],[UpdateID],[UpdateDate])
	SELECT [LotteryInfoID],[LotteryInfoName],[LotteryInfoNotice],[LotteryClassID]
			,[LotteryTypeID],[DrawTypeID],[DisCount],[MinBet],[MaxBet],[FamliyBigID],[FamliyMiddelID],[FamliySmallID]
			,[Status],[SelectArray],[LotteryInfo_TableID],[ResultPosition],[CreateID],[CreateDate],[UpdateID],[UpdateDate] FROM openrowset('SQLOLEDB', '192.82.60.31'; 'GHLUser'; '@golden85092212', [GHL].[dbo].[LotteryInfo])
	SET IDENTITY_INSERT [dbo].[LotteryInfo] OFF

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ResetAngentReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- 說明: 統計用戶的Angent儲存到Report
-- 參數說明: null
-- 範例: exec sp_AngentReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20200308			Yark				進行代理費計算
-- 2			20200310			Yark				加入Statement Report
-- 3			20200418			Ben					修改AgentPositionTaking算法(上層扣下層)
-- 4			20201124			Yark				MPlayer改用Update取得資料
-- 5			20210713			Yark				加入判斷Reset欄位(重新計算註單的不能列入一般計算)
-- =============================================
CREATE PROCEDURE [dbo].[sp_ResetAngentReport]
AS
BEGIN
	DECLARE @userCount INT;								--要計算的用戶數
	DECLARE @memberID INT;								--投注單的用戶
	DECLARE @mPlayerCount INT;							--投注單數量
	DECLARE @mPlayerID INT;								--投注單流水號
	DECLARE @agentPositionTakingRebate DECIMAL(18, 4);		--代理費用占成
	DECLARE @childAgentPositionTakingRebate DECIMAL(18, 4);	--子代理費占成
	DECLARE @winMoney DECIMAL(18, 4);					--輸贏
	DECLARE @IsWin BIT;
	DECLARE @qty DECIMAL(18, 4);						--投注數量
	DECLARE @price DECIMAL(18, 4);						--投注單價
	DECLARE @agentLevelSCID INT = 32;					--Member Level
	DECLARE @typeCode NVARCHAR(200) = 'Angent';			--類別
	DECLARE @Status NVARCHAR(200) = '';					--狀態
	DECLARE @recordMoney NVARCHAR(50) = '';				--暫存記錄的金額
	DECLARE @agentMoney decimal(18, 4) = 0;				--代理費
	DECLARE @turnOverMoney decimal(18, 4) = 0;			--TO
	DECLARE @dateS DATETIME;							--查詢區間(起)
	DECLARE @dateE DATETIME;							--查詢區間(訖)
	DECLARE @currentPeriod NVARCHAR(100) = '';			--期號
	DECLARE @lotteryInfoID INT;							--玩法ID
	DECLARE @userBalance NVARCHAR(200);					--用戶餘額
	DECLARE @userWallet DECIMAL(18, 4);					--用戶錢包
	DECLARE @totalBalance DECIMAL(18, 4);				--用戶總餘額
	DECLARE @checkCount DECIMAL(18, 4);					--是否有值存在

	-- 設定啟始與結束時間
	SELECT @dateS = DATEADD(MINUTE, -5, GETDATE()), @dateE = GETDATE();

	--SELECT @dateS = '2021-6-10 00:00:00', @dateE = '2021-6-10 23:59:59'

	DROP TABLE IF EXISTS #tempMPlayer
	 --複製當天的投注表
	SELECT * INTO #tempMPlayer FROM MPlayer WITH(NOLOCK)
	WHERE UpdateDate >= @dateS 
		AND UpdateDate <= @dateE
		AND MemberID > 0
		AND [IsReset] = 1
		
	DROP TABLE IF EXISTS #tempMemberShip
	-- 複製所有會員層級的用戶
	SELECT * INTO #tempMemberShip 
		FROM MemberShip WITH(NOLOCK) 

	-- 用戶數量
	SELECT @userCount = COUNT(*) 
		FROM #tempMemberShip
		WHERE AgentLevelSCID = @agentLevelSCID
		
	-- 進行
	WHILE @userCount > 0
	Begin
		DECLARE @angentMap nvarchar(200); -- 當下用戶的代理地圖

		-- Step 1. 取出用戶資料
		SELECT @memberID = MemberID, @angentMap = AgentParentMap
			FROM #tempMemberShip
			WHERE AgentLevelSCID = @agentLevelSCID
		ORDER BY #tempMemberShip.MemberID
		OFFSET     (@userCount-1) ROWS
		FETCH NEXT 1 ROWS ONLY;
	
		-- Step 2. 取出投注資料
		SET @mPlayerCount = 0;
		SET @winMoney = -1;
		SET @mPlayerID = -1;
		SET @IsWin = -1;

		SELECT @mPlayerCount = COUNT(*)		
			FROM #tempMPlayer
			WHERE MemberID = @memberID 
				AND isWin in (0,1)
			
			-- 有Win Loss後就直接進行Agent計算，所以必需將每一次的投注結果進行計算
			WHILE @mPlayerCount > 0
			BEGIN

				SELECT @IsWin = [IsWin], @winMoney = [WinMoney]
					, @qty = [Qty]
					, @price = Price
					, @mPlayerID = [ID]
					, @currentPeriod = [CurrentPeriod]
					, @lotteryInfoID = [LotteryInfoID]
				FROM #tempMPlayer
					WHERE MemberID = @memberID 
						AND isWin in (0,1)
					ORDER BY #tempMPlayer.CurrentPeriod
				OFFSET     (@mPlayerCount-1) ROWS
				FETCH NEXT 1 ROWS ONLY;
				
				Set @typeCode = 'Angent'
				
				-- 2020/09/30 Yark調整計算
				DECLARE @angentCount int;
				DECLARE @angentUserName nvarchar(200);
				DECLARE @angentUserId int;
				DECLARE @agentLoopLevelSCID int;
				DECLARE @splitStr nvarchar(50) = '/';

				-- 將Angent Map做成temp table
				DROP TABLE IF EXISTS #angentMapTemp
				CREATE TABLE #angentMapTemp ( ID INT IDENTITY(1, 1) primary key, AngentUserName nvarchar(200));
				INSERT INTO #angentMapTemp SELECT RTRIM(value) AS AngentUserName FROM STRING_SPLIT(@angentMap, '/') WHERE value <> '';

				SELECT @angentCount = COUNT(*) FROM #angentMapTemp;
				DECLARE @referralLevelTotal INT = (@angentCount + 1);--總階

				-- 計算
				-- 純盈利
				IF @IsWin = 0
				BEGIN
					SET @recordMoney = -(@qty * @price);
				END;
				Else
				BEGIN
					SET @recordMoney = @winMoney; -- - (@qty * @price);
				END;

				-- 結算Angent Loop
				WHILE @angentCount > 0
				BEGIN
					-- Step 1. 取出 MemberID、AngentUserName
					SELECT @angentUserName = AngentUserName
					FROM #angentMapTemp
					ORDER BY #angentMapTemp.ID desc
					OFFSET     (@angentCount-1) ROWS
					FETCH NEXT 1 ROWS ONLY;

					SELECT @angentUserId = MemberID, 
						@agentPositionTakingRebate = (CAST(AgentPositionTakingRebate AS decimal(18, 4))), 
						@agentLoopLevelSCID = [AgentLevelSCID]
						FROM #tempMemberShip
						WHERE UserName = @angentUserName

					-- 取子階代理占成
					IF @angentCount >= 2
					BEGIN
						SELECT @angentUserName = AngentUserName
						FROM #angentMapTemp
						ORDER BY #angentMapTemp.ID desc
						OFFSET     (@angentCount-2) ROWS
						FETCH NEXT 1 ROWS ONLY;

						SELECT @childAgentPositionTakingRebate = (CAST(AgentPositionTakingRebate AS decimal(18, 4)))
							FROM #tempMemberShip WITH(NOLOCK)
							WHERE UserName = @angentUserName

						SET @agentPositionTakingRebate = (@agentPositionTakingRebate - @childAgentPositionTakingRebate)
					END
					-- 取子階代理占成

					SET @agentMoney = ((CAST(@recordMoney AS decimal(18, 4))) * @agentPositionTakingRebate);

					-- 檢查是否有資料存在
					SELECT @checkCount = COUNT(*) FROM MPlayerReport
						WHERE [MPlayerID] = @mPlayerID 
							AND [MemberID] = @memberID 
							AND [AngentMemberID] = @angentUserId
							AND [TypeCode] = @typeCode
							AND [AgentLevelSCID] = @agentLoopLevelSCID

					IF @checkCount > 0 
					BEGIN
						--沒有[AgentMoney]
						UPDATE [MPlayerReport]
						SET [TurnOverMoney] = @turnOverMoney, 
							[TypeCode] = @typeCode, 
							[CurrentPeriod] = @currentPeriod, 
							[RecordMoney] = @recordMoney, 
							[AgentLevelSCID] = @agentLoopLevelSCID, 
							[UpdateBy] = 0, 
							[UpdateDate] = GETDATE()
						WHERE [MemberID] = @memberID 
							AND [MPlayerID] = @mPlayerID 
							AND [AngentMemberID] = @angentUserId
							AND TypeCode = @typeCode
							AND [AgentLevelSCID] = @agentLoopLevelSCID
					END;
					ELSE
					BEGIN
						-- 沒有[AgentMoney]
						INSERT INTO [MPlayerReport] ([MemberID], [MPlayerID], [AngentMemberID], [AgentLevelSCID], [TurnOverMoney]
						, [TypeCode], [Status], [RecordMoney], [CashRebateMoney], [CashBackRebateMoney], [AgentMoney], 
						[CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						VALUES (@memberID, @mPlayerID, @angentUserId, @agentLoopLevelSCID, @turnOverMoney
						, @typeCode, NULL, @recordMoney, 0, 0, @agentMoney, 
						0, GETDATE(), 0, GETDATE())
						
						---- 更新錢包
						--SELECT @userWallet = [TotalPrice] FROM [MWallet] WHERE MemberID = @angentUserId AND CompanyID = 2;
						---- 加入Statement
						--SELECT @userBalance = [TotalBalance]
						--	FROM  MemberShip WITH(NOLOCK) 
						--	WHERE MemberID = @memberID
						--Set @totalBalance = CAST((CAST(@userBalance AS decimal(18, 4)) + CAST(@recordMoney AS decimal(18, 4))) AS NVARCHAR(200));

						--INSERT INTO [Statement] ([MemberID], [CurrentPeriod], [LotteryInfoID], [Balance], [TypeCode], [ValueMoney], [Total], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						--VALUES (@angentUserId, @currentPeriod, @lotteryInfoID, @userBalance, @typeCode, CAST(@agentMoney AS NVARCHAR(200)), CAST(@totalBalance AS NVARCHAR(200)), 0, GETDATE(), 0, GETDATE())

						--UPDATE [MWallet] Set TotalPrice = CAST((@agentMoney + @userWallet) AS NVARCHAR(200)) 
						--	WHERE MemberID = @angentUserId 
						--		AND CompanyID = 2;

						---- 更新用戶總餘額
						--UPDATE [MemberShip] Set [TotalBalance] = CAST(@totalBalance AS NVARCHAR(200)) 
						--	WHERE MemberID = @angentUserId;
					END;
					SET @angentCount = @angentCount - 1;
				END;
				Set @mPlayerCount = @mPlayerCount - 1;
				CONTINUE  
			END;
		Set @userCount = @userCount - 1;
		CONTINUE  
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ResetCalculatorWinLoseReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- 說明: 
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20201017			Yark				取得用戶的樹狀結構
-- 2			20210611			Ben					IsNull包在外面才完全不會有null值
-- =============================================
CREATE PROCEDURE [dbo].[sp_ResetCalculatorWinLoseReport]
AS
BEGIN
	DECLARE @userName NVARCHAR(200) = 'Admin';						-- 起始的帳號
	DECLARE @memberID INT;											-- 用戶ID
	DECLARE @checkDataCount INT;									-- 確認資料筆數							
	DECLARE @subUserCount INT;										-- 子層用戶資料
	DECLARE @subUserName NVARCHAR(200);								-- 子層用戶帳號
	DECLARE @agentLevelSCID INT;									-- 
	DECLARE @checkSubAgent INT;										-- 
	DECLARE @getWinLoseMemberID INT;								-- 
	DECLARE @subMemberID INT;										-- 子層用戶ID
	DECLARE @subAgentParentID INT;									-- 子層用戶的父層ID
	DECLARE @subAgentPositionTakingRebate NVARCHAR(200);			-- 子層用戶PositionTaking
	DECLARE @subAgentParentMap NVARCHAR(200);						-- 子層用戶Map
	DECLARE @newSubAgentParentMap NVARCHAR(200);					-- 新的Map檢查用
	DECLARE @calculatorCount INT;
	DECLARE @nowTypeCode NVARCHAR(200);	
	DECLARE @winLoseMoney DECIMAL(18,4) = 0;
	DECLARE @vipWinLoseMoney DECIMAL(18,4) = 0;
	DECLARE @turnOver DECIMAL(18,4) = 0;
	DECLARE @vipTurnOver DECIMAL(18,4) = 0;
	DECLARE @totalComission DECIMAL(18,4) = 0;
	DECLARE @profit DECIMAL(18,4) = 0;
	DECLARE @layerTotalProfit DECIMAL(18,4) = 0;
	DECLARE @vipProfit DECIMAL(18,4) = 0;
	DECLARE @vipLayerTotalProfit DECIMAL(18,4) = 0;
	DECLARE @upper DECIMAL(18,4) = 0;
	DECLARE @vipUpper DECIMAL(18,4) = 0;
	DECLARE @initialCredit DECIMAL(18,4) = 0;
	DECLARE @totalPrice DECIMAL(18,4) = 0;
	DECLARE @cashBalance DECIMAL(18,4) = 0;
	DECLARE @dateS DATETIME;										--查詢區間(起)
	DECLARE @dateE DATETIME;										--查詢區間(訖)

	-- 設定啟始與結束時間
	SELECT @dateS = CAST(CONVERT(VARCHAR, getdate(), 111) + ' 00:00:00' AS DATETIME)
		,@dateE = CAST(CONVERT(VARCHAR, getdate(), 111) + ' 23:59:59' AS DATETIME);
	--SELECT @dateS = '2021/6/10 00:00:00', @dateE = '2021/6/10 23:59:59';
	
	DROP TABLE IF EXISTS #tempNewMemberShip;

	SELECT * INTO #tempNewMemberShip 
		FROM MemberShip WITH(NOLOCK)
		WHERE AgentParentMap LIKE @userName + '%'

	-- --複製當天的投注表
	--WITH NewMemberShip AS (
	--	SELECT main.*
	--	FROM [GHL].[dbo].[MemberShip] AS main WITH(NOLOCK) WHERE main.UserName = @userName
	--	UNION ALL
	--	--跟 CTE 自身做遞迴 JOIN (A 的上級主管[SuperiorNum]是 EmployeeOrder 的員工編號[EmployeeNum])
	--	SELECT subJoin.*
	--	FROM [GHL].[dbo].[MemberShip] AS subJoin WITH(NOLOCK)
	--	inner join NewMemberShip ON NewMemberShip.MemberID = subJoin.AgentParentID
	--)
	--SELECT * INTO #tempNewMemberShip 
	--FROM NewMemberShip
	--OPTION (MAXRECURSION 0);  ---要加 hint : OPTION (MAXRECURSION 0)  表示 遞迴為無限制
	
	SELECT @memberID = MemberID 
		FROM #tempNewMemberShip
		WHERE UserName = @userName

	SELECT @subUserCount = count(*) 
		FROM #tempNewMemberShip
		WHERE [UserType] != '10'

	-- 開始進行計算
	WHILE @subUserCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT @subMemberID = MemberID
			,@subUserName = UserName
			,@subAgentParentID = AgentParentID
			,@subAgentParentMap = AgentParentMap
			,@subAgentPositionTakingRebate = AgentPositionTakingRebate
			,@agentLevelSCID = AgentLevelSCID
			FROM #tempNewMemberShip
		WHERE [UserType] != '10'
		ORDER BY #tempNewMemberShip.MemberID
		OFFSET     (@subUserCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;

		-- 建立新的Map檢查用
		IF NULLIF(@subAgentParentMap, '') = ''
		BEGIN
			SET @newSubAgentParentMap = @subUserName + '/';
		END;
		ELSE IF @agentLevelSCID = 31
		BEGIN
			SET @newSubAgentParentMap = @subAgentParentMap;
		END;
		ELSE
		BEGIN
			SET @newSubAgentParentMap = @subAgentParentMap + @subUserName + '/'
		END;

		IF @agentLevelSCID = 31
		BEGIN
			-- 取出Wallet
			SELECT @totalPrice = ISNULL(SUM((CAST(NULLIF(mw.[TotalPrice], '') AS decimal(18, 4)))),0 )
				FROM MWallet as mw WITH(NOLOCK)
				INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mw.MemberID
				WHERE ms.[AgentParentMap] LIKE '%' + @newSubAgentParentMap + '%'
					AND ms.AgentParentID = @subMemberID

			-- 進行WinLose 總計算
			-- 進行TurnOver 總計算
			SELECT @turnOver = ISNULL(SUM((CAST(NULLIF(mpr.[TurnOverMoney], '') AS decimal(18, 4)))),0 ),
				@winLoseMoney = ISNULL(SUM((CAST(NULLIF(mpr.[RecordMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[MPlayerReport] AS mpr WITH(NOLOCK)
					INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
					INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.MemberID
				WHERE  mpr.[TypeCode] IN ('Win', 'Loss')
					AND ms.[AgentParentMap] LIKE @newSubAgentParentMap + '%'
					--AND ms.AgentParentID = @subMemberID
					AND ms.AgentLevelSCID = 32
					AND mpr.[UpdateDate] >= @dateS
					AND mpr.[UpdateDate] < @dateE
					AND mp.[IsReset] = 0

			-- 取出用戶相對的Angent
			SELECT @profit = ISNULL(SUM((CAST(NULLIF(mpr.[AgentMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[MPlayerReport] AS mpr WITH(NOLOCK)
				INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
				INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.[AngentMemberID]
				WHERE mpr.[AngentMemberID] = @subMemberID
					AND mpr.[TypeCode] IN ('Angent')
					AND mpr.[UpdateDate] >= @dateS
					AND mpr.[UpdateDate] < @dateE
					AND mp.[IsReset] = 0

			-- Upper
			SELECT @layerTotalProfit = ISNULL(SUM((CAST(NULLIF(mpr.[AgentMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[MPlayerReport] AS mpr WITH(NOLOCK)
				INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
				INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.AngentMemberID
				WHERE ms.[AgentParentMap] like @newSubAgentParentMap + @subUserName + '%'
					--AND ms.AgentParentID = @subMemberID
					AND mpr.[TypeCode] IN ('Angent')
					AND mpr.[UpdateDate] >= @dateS
					AND mpr.[UpdateDate] < @dateE
					AND mp.[IsReset] = 0
		END;
		ELSE
		BEGIN
			-- 取出Wallet
			SELECT @totalPrice = ISNULL(SUM((CAST(NULLIF(mw.[TotalPrice], '') AS decimal(18, 4)))),0 )
				FROM MWallet as mw WITH(NOLOCK)
				INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mw.MemberID
				WHERE ms.[AgentParentMap] LIKE '%' + @newSubAgentParentMap + '%'

			-- 進行WinLose 總計算
			-- 進行TurnOver 總計算
			SELECT @turnOver = ISNULL(SUM((CAST(NULLIF(mpr.[TurnOverMoney], '') AS decimal(18, 4)))),0 ),
				@winLoseMoney = ISNULL(SUM((CAST(NULLIF(mpr.[RecordMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[MPlayerReport] AS mpr WITH(NOLOCK)
					INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
					INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.MemberID
				WHERE mpr.[TypeCode] IN ('Win', 'Loss')
					AND ms.[AgentParentMap] LIKE @newSubAgentParentMap + '%'
					AND ms.AgentLevelSCID = 32
					AND mpr.[UpdateDate] >= @dateS
					AND mpr.[UpdateDate] < @dateE
					AND mp.[IsReset] = 0

			-- 取出用戶相對的Angent
			SELECT @profit = ISNULL(SUM((CAST(NULLIF(mpr.[AgentMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[MPlayerReport] AS mpr WITH(NOLOCK)
				INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
				INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.[AngentMemberID]
				WHERE mpr.[AngentMemberID] = @subMemberID
					AND mpr.[TypeCode] IN ('Angent')
					AND mpr.[UpdateDate] >= @dateS
					AND mpr.[UpdateDate] < @dateE
					AND mp.[IsReset] = 0
				
			-- Upper
			SELECT @layerTotalProfit = ISNULL(SUM((CAST(NULLIF(mpr.[AgentMoney], '') AS decimal(18, 4)))),0 )
				FROM [dbo].[MPlayerReport] AS mpr WITH(NOLOCK)
				INNER JOIN [dbo].[MPlayer] AS mp WITH(NOLOCK) ON mp.ID = mpr.MPlayerID
				INNER JOIN [dbo].[MemberShip] AS ms WITH(NOLOCK)  ON ms.MemberID = mpr.AngentMemberID
				WHERE ms.[AgentParentMap] like @newSubAgentParentMap + '%'
					AND mpr.[TypeCode] IN ('Angent')
					AND mpr.[UpdateDate] >= @dateS
					AND mpr.[UpdateDate] < @dateE
					AND mp.[IsReset] = 0

		END;

		SET @upper = (@winLoseMoney - @layerTotalProfit - @profit);

		IF @turnOver >0 OR @vipTurnOver >0
		BEGIN
			
			--SELECT @subAgentParentID,@subUserName,@upper,@winLoseMoney,@layerTotalProfit,@profit
			
			Select @checkDataCount = Count(*) From [dbo].[WinLoseReport]
			Where [MemberID] = @subMemberID 
				AND [CreateDate] >= @dateS
				AND [CreateDate] < @dateE

			-- 有資料則Update
			IF @checkDataCount > 0
			BEGIN
				UPDATE [dbo].[WinLoseReport] 
					SET [WinLoseMoney] = CAST(ISNULL(NULLIF(CAST(@winLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPWinLoseMoney] = CAST(ISNULL(NULLIF(CAST(@vipWinLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TurnOver] = CAST(ISNULL(NULLIF(CAST(@turnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPTurnOver] = CAST(ISNULL(NULLIF(CAST(@vipTurnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TotalComission] = CAST(ISNULL(NULLIF(CAST(@totalComission AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[Profit] = CAST(ISNULL(NULLIF(CAST(@profit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPProfit] = CAST(ISNULL(NULLIF(CAST(@vipProfit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[UpperTotal] = CAST(ISNULL(NULLIF(CAST(@upper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPUpperTotal] = CAST(ISNULL(NULLIF(CAST(@vipUpper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[InitialCredit] = CAST(ISNULL(NULLIF(CAST(@initialCredit AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[CreditBalance] = CAST(ISNULL(NULLIF(CAST(@totalPrice AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[CashBalance] = CAST(ISNULL(NULLIF(CAST(@cashBalance AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[UpdateDate] = GETDATE()
					WHERE [MemberID] = @subMemberID  
						AND [CreateDate] >= @dateS
						AND [CreateDate] < @dateE

			END;
			-- 沒資料則Add
			ELSE
			BEGIN
				INSERT INTO [dbo].[WinLoseReport] ([MemberID]
						  ,[UserName]
						  ,[AgentParentID]
						  ,[AgentPositionTakingRebate]
						  ,[AgentParentMap]
						  ,[WinLoseMoney]
						  ,[VIPWinLoseMoney]
						  ,[TurnOver]
						  ,[VIPTurnOver]
						  ,[TotalComission]
						  ,[Profit]
						  ,[VIPProfit]
						  ,[UpperTotal]
						  ,[VIPUpperTotal]
						  ,[InitialCredit]
						  ,[CreditBalance]
						  ,[CashBalance]
						  ,[CreateBy]
						  ,[CreateDate]
						  ,[UpdateBy]
						  ,[UpdateDate])
					VALUES (@subMemberID
						  ,@subUserName
						  ,@subAgentParentID
						  ,@subAgentPositionTakingRebate
						  ,@subAgentParentMap
						  ,CAST(ISNULL(NULLIF(CAST(@winLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipWinLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@turnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipTurnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@totalComission AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@profit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipProfit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@upper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipUpper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@initialCredit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@totalPrice AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@cashBalance AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,0
						  ,@dateS
						  ,0
						  ,@dateE
					)
			END;
		END;

		SET @subUserCount = @subUserCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ResetCalculatorWinLoseReportDetail]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- 說明: 
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20201118			Yark				
-- =============================================
CREATE PROCEDURE [dbo].[sp_ResetCalculatorWinLoseReportDetail]
AS
BEGIN
	DECLARE @userName NVARCHAR(200) = 'Admin';						-- 起始的帳號
	DECLARE @memberID INT;											-- 用戶ID
	DECLARE @agentPositionTakingRebate NVARCHAR(200);				-- PositionTaking
	DECLARE @agentParentID INT;										-- 用戶的父層ID
	DECLARE @agentParentMap NVARCHAR(200);							-- 子層用戶Map
	DECLARE @checkDataCount INT;									-- 確認資料筆數							
	DECLARE @userCount INT;											-- 資料筆數						
	DECLARE @subUserCount INT;										-- 子層資料筆數
	DECLARE @subUserName NVARCHAR(200);								-- 子層用戶帳號
	DECLARE @subMemberID INT;										-- 子層用戶ID
	DECLARE @subAgentParentID INT;									-- 子層用戶的父層ID
	DECLARE @subAgentPositionTakingRebate NVARCHAR(200);			-- 子層用戶PositionTaking
	DECLARE @subAgentParentMap NVARCHAR(200);						-- 子層用戶Map
	DECLARE @subProfit DECIMAL(18,4) = 0;
	DECLARE @subVipProfit DECIMAL(18,4) = 0;
	DECLARE @calculatorCount INT;
	DECLARE @nowTypeCode NVARCHAR(200);	
	DECLARE @winLoseMoney DECIMAL(18,4) = 0;
	DECLARE @vipWinLoseMoney DECIMAL(18,4) = 0;
	DECLARE @turnOver DECIMAL(18,4) = 0;
	DECLARE @vipTurnOver DECIMAL(18,4) = 0;
	DECLARE @totalComission DECIMAL(18,4) = 0;
	DECLARE @profit DECIMAL(18,4) = 0;
	DECLARE @vipProfit DECIMAL(18,4) = 0;
	DECLARE @layerTotalProfit DECIMAL(18,4) = 0;
	DECLARE @vipLayerTotalProfit DECIMAL(18,4) = 0;
	DECLARE @upper DECIMAL(18,4) = 0;
	DECLARE @vipUpper DECIMAL(18,4) = 0;
	DECLARE @subUpper DECIMAL(18,4) = 0;
	DECLARE @subVipUpper DECIMAL(18,4) = 0;
	DECLARE @initialCredit DECIMAL(18,4) = 0;
	DECLARE @creditBalance DECIMAL(18,4) = 0;
	DECLARE @cashBalance DECIMAL(18,4) = 0;
	DECLARE @dateS DATETIME;										--查詢區間(起)
	DECLARE @dateE DATETIME;										--查詢區間(訖)

	-- 設定啟始與結束時間
	SELECT @dateS = CAST(CONVERT(VARCHAR, GETDATE(), 111) + ' 00:00:00' AS DATETIME)
		,@dateE = CAST(CONVERT(VARCHAR, GETDATE(), 111) + ' 23:59:59' AS DATETIME);
	--SELECT @dateS = '2020/11/04 00:00:00', @dateE = '2020/11/04 23:59:59';

	SELECT @dateS, @dateE
	
	DROP TABLE IF EXISTS #tempWinLoseReport;
	DROP TABLE IF EXISTS #tempNewMemberShip;

	 --複製當天的投注表
	WITH NewMemberShip AS (
		SELECT main.*
		FROM [dbo].[MemberShip] AS main WITH(NOLOCK) WHERE main.UserName = @userName
		UNION ALL
		--跟 CTE 自身做遞迴 JOIN (A 的上級主管[SuperiorNum]是 EmployeeOrder 的員工編號[EmployeeNum])
		SELECT subJoin.*
		FROM [dbo].[MemberShip] AS subJoin WITH(NOLOCK)
		inner join NewMemberShip ON NewMemberShip.MemberID = subJoin.AgentParentID
	)
	SELECT * INTO #tempNewMemberShip
		FROM [NewMemberShip]

	SELECT * INTO #tempWinLoseReport
		FROM [dbo].[WinLoseReport] WITH(NOLOCK)
		WHERE [CreateDate] >= @dateS
			AND [CreateDate] < @dateE
			AND [SourceMemberID] IS NULL
			AND [SourceUserName] IS NULL
	
	SELECT @userCount = COUNT(*) 
		FROM #tempNewMemberShip
		WHERE [UserType] != '10'
			AND [AgentLevelSCID] < 31

	-- 開始進行計算
	WHILE @userCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT @memberID = MemberID
			,@userName = UserName
			,@agentPositionTakingRebate = AgentPositionTakingRebate
			,@agentParentID = AgentParentID
			FROM #tempNewMemberShip
			WHERE [UserType] != '10'
				AND AgentLevelSCID < 31
			ORDER BY #tempNewMemberShip.MemberID
			OFFSET     (@userCount - 1) ROWS
			FETCH NEXT 1 ROWS ONLY;

		SELECT @subUserCount = COUNT(*) 
			FROM #tempWinLoseReport
			Where AgentParentID = @memberID

		WHILE @subUserCount > 0
		BEGIN
			SELECT @subMemberID = MemberID
				,@subUserName = UserName
				,@subAgentParentID = ISNULL(NULLIF(AgentParentID, ''),0 )
				,@subAgentParentMap = AgentParentMap
				,@subAgentPositionTakingRebate = AgentPositionTakingRebate
				,@subProfit = Profit
				,@subVipProfit = VipProfit
				,@winLoseMoney = WinLoseMoney
				,@vipWinLoseMoney = VipWinLoseMoney
				,@turnOver = TurnOver
				,@vipTurnOver = VIPTurnOver
				,@totalComission = TotalComission
				,@subUpper = [UpperTotal]
				,@subVipUpper = [VipUpperTotal]
				,@cashBalance = [CashBalance]
				,@creditBalance = [CreditBalance]
			FROM #tempWinLoseReport
			Where AgentParentID = @memberID
			ORDER BY #tempWinLoseReport.MemberID
			OFFSET     (@subUserCount - 1) ROWS
			FETCH NEXT 1 ROWS ONLY;

			IF @memberID = @subMemberID
			BEGIN
				SET @subUserCount = @subUserCount - 1;
				CONTINUE;
			END;

			DECLARE @calculatorPT DECIMAL(18,4) = CAST(ISNULL(NULLIF(@agentPositionTakingRebate, ''),0 ) AS DECIMAL(18, 4)) - CAST(ISNULL(NULLIF(@subAgentPositionTakingRebate, ''),0 ) AS DECIMAL(18, 4));
			
			SET @profit = @winLoseMoney * @calculatorPT;
			SET @vipProfit = @totalComission * @calculatorPT;

			SET @upper = @subUpper - @profit;
			SET @vipUpper = (@subVipUpper + @vipProfit);

			Select @checkDataCount = Count(*) From [dbo].[WinLoseReport]
			Where [MemberID] = @memberID 
				AND [SourceMemberID] = @subMemberID 
				AND [CreateDate] >= @dateS
				AND [CreateDate] < @dateE

			IF @checkDataCount > 0
			BEGIN
				UPDATE [dbo].[WinLoseReport] 
					SET [WinLoseMoney] = CAST(ISNULL(NULLIF(CAST(@winLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPWinLoseMoney] = CAST(ISNULL(NULLIF(CAST(@vipWinLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TurnOver] = CAST(ISNULL(NULLIF(CAST(@turnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPTurnOver] = CAST(ISNULL(NULLIF(CAST(@vipTurnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[TotalComission] = CAST(ISNULL(NULLIF(CAST(@totalComission AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[Profit] = CAST(ISNULL(NULLIF(CAST(@profit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPProfit] = CAST(ISNULL(NULLIF(CAST(@vipProfit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[UpperTotal] = CAST(ISNULL(NULLIF(CAST(@upper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[VIPUpperTotal] = CAST(ISNULL(NULLIF(CAST(@vipUpper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						,[InitialCredit] = CAST(ISNULL(NULLIF(CAST(@initialCredit AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[CreditBalance] = CAST(ISNULL(NULLIF(CAST(@creditBalance AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[CashBalance] = CAST(ISNULL(NULLIF(CAST(@cashBalance AS VARCHAR), ''),0 ) AS decimal(18, 4)) 
						,[UpdateDate] = GETDATE()
					WHERE [MemberID] = @memberID 
						AND [SourceMemberID] = @subMemberID 
						AND [CreateDate] >= @dateS
						AND [CreateDate] < @dateE
			END;
			ELSE
			BEGIN
				INSERT INTO [dbo].[WinLoseReport] ([MemberID]
						  ,[UserName]
						  ,[SourceMemberID]
						  ,[SourceUserName]
						  ,[AgentParentID]
						  ,[AgentPositionTakingRebate]
						  ,[AgentParentMap]
						  ,[WinLoseMoney]
						  ,[VIPWinLoseMoney]
						  ,[TurnOver]
						  ,[VIPTurnOver]
						  ,[TotalComission]
						  ,[Profit]
						  ,[VIPProfit]
						  ,[UpperTotal]
						  ,[VIPUpperTotal]
						  ,[InitialCredit]
						  ,[CreditBalance]
						  ,[CashBalance]
						  ,[CreateBy]
						  ,[CreateDate]
						  ,[UpdateBy]
						  ,[UpdateDate])
					VALUES (@memberID
						  ,@userName
						  ,@subMemberID
						  ,@subUserName
						  ,@subAgentParentID
						  ,@subAgentPositionTakingRebate
						  ,@subAgentParentMap
						  ,CAST(ISNULL(NULLIF(CAST(@winLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipWinLoseMoney AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@turnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipTurnOver AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@totalComission AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@profit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipProfit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@upper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@vipUpper AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@initialCredit AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@creditBalance AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,CAST(ISNULL(NULLIF(CAST(@cashBalance AS VARCHAR), ''),0 ) AS decimal(18, 4))
						  ,0
						  ,@dateS
						  ,0
						  ,@dateE
					)
			END;
			
			SET @subUserCount = @subUserCount - 1;
		END;

		SET @userCount = @userCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ResetWinLoseReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20200308			Yark				進行代理費計算
-- 2			20200310			Yark				加入Statement Report
-- 3			20200713			Yark				加入CurrentPeriod
-- 4			20200816			Yark				CashRebate修改為流水不是輸贏
-- 5			20200924			Ben					改為WinLoseReport, 移除Referal,CashBack,CashRebate
-- 6			20201124			Yark				MPlayer改用Update取得資料
-- 7			20210226			Yark				MPlayerReport加入LotteryTypeID,LotteryClassID
-- 8			20210713			Yark				加入判斷Reset欄位(重新計算註單的不能列入一般計算)
-- =============================================
CREATE PROCEDURE [dbo].[sp_ResetWinLoseReport]
AS
BEGIN
	DECLARE @userCount int;										-- 要計算的用戶數
	DECLARE @memberID int;
	DECLARE @mPlayerCount int;
	DECLARE @winMoney decimal(18, 4);
	DECLARE @qty decimal(18, 4);
	DECLARE @price decimal(18, 4);
	DECLARE @mPlayerID int;

	DECLARE @typeCode NVarchar(200) = 'Win';
	DECLARE @Status NVarchar(200) = '';
	DECLARE @recordMoney NVarchar(200) = '';					--WinMoney
	DECLARE @turnOverMoney decimal(18, 4) = 0;					--TO
	DECLARE @sicboRecordMoney NVarchar(200) = '';				--SicboRecordMoney
	DECLARE @agentMoney decimal(18, 4) = 0;
	DECLARE @dateS NVarchar(200) = '';
	DECLARE @dateE NVarchar(200) = '';
	DECLARE @createDate NVarchar(200) = '';
	DECLARE @currentPeriod NVarchar(100) = '';					--期號
	DECLARE @lotteryInfoID INT;									--玩法ID
	DECLARE @lotteryTypeID INT;									--玩法類型ID
	DECLARE @lotteryClassID INT;								--玩法類型ID
	DECLARE @userBalance NVarchar(200);							--用戶餘額
	DECLARE @userWallet DECIMAL(18, 4);							--用戶錢包
	DECLARE @totalBalance DECIMAL(18, 4);						--用戶總餘額
	DECLARE @isWin bit;

	-- 設定啟始與結束時間
	SELECT @dateS = CONVERT(NVarchar, DATEADD(MINUTE, -11, GETDATE()), 120)
		, @dateE=CONVERT(NVarchar, DATEADD(MINUTE, 0, GETDATE()), 120);

	SELECT @dateS, @dateE

	DROP TABLE IF EXISTS #tempMPlayer
	 --複製當天的投注表
	SELECT * INTO #tempMPlayer 
		FROM MPlayer with(nolock)
		WHERE [UpdateDate] >= @dateS 
			AND [UpdateDate] <= @dateE
			AND [MemberID] > 0
			AND [IsReset] = 1

	-- 用戶日計算的用戶數量
	SELECT @userCount = COUNT(*)
		FROM MemberShip WITH(NOLOCK) 

	WHILE @userCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT 
			@memberID = MemberID
			FROM MemberShip WITH(NOLOCK) 
		ORDER BY MemberShip.MemberID
		OFFSET     (@userCount-1) ROWS
		FETCH NEXT 1 ROWS ONLY;
	
		-- Step 2. 取出投注資料
		SET @mPlayerCount = 0;
		SET @winMoney = -1;
		SET @mPlayerID = -1;
		SELECT @mPlayerCount = COUNT(*)  
			FROM #tempMPlayer
			WHERE MemberID = @memberID 
				AND isWin in (0,1)

			WHILE @mPlayerCount > 0
			BEGIN
				SELECT @winMoney = WinMoney
					,@qty = Qty
					,@price = Price
					,@mPlayerID = ID
					--,@cashBackRebateMoney = CashBackMoney
					,@lotteryInfoID = LotteryInfoID
					,@isWin = IsWin
					,@currentPeriod = CurrentPeriod
					,@createDate = CONVERT(NVarchar, [CreateDate], 120)
				FROM #tempMPlayer
					WHERE MemberID = @memberID 
						AND isWin in (0, 1)
					ORDER BY #tempMPlayer.CurrentPeriod,IsWin
				OFFSET     (@mPlayerCount-1) ROWS
				FETCH NEXT 1 ROWS ONLY;
				SET @createDate = CONVERT(NVarchar, DATEADD(SECOND, 1, @createDate), 120);

				--DELETE [Statement] 
				--	WHERE TypeCode = 'Bet'
				--		AND CurrentPeriod = @currentPeriod
				
				SELECT @lotteryTypeID = LotteryTypeID
					, @lotteryClassID = LotteryClassID
					FROM LotteryInfo
					WHERE LotteryInfoID = @lotteryInfoID

				SET @typeCode = 'Win'
					
				DECLARE @checkMemberID int = 0;
				DECLARE @checkMPlayerID int = 0;
				DECLARE @checkTypeCode NVarchar(200) = '';
				
				--SET @turnOverMoney = (@qty * @price);
				-- 計算(日)
				IF @isWin = 0
				BEGIN
					SET @recordMoney = -(@qty * @price);
					SET @typeCode = 'Loss'

					SELECT @checkMemberID = ISNULL(MemberID, 0)
						, @checkMPlayerID =  ISNULL(MPlayerID, 0)
						, @checkTypeCode = TypeCode 
					FROM [MPlayerReport]
					WHERE MemberID = @memberID 
						AND CreateDate = @createDate
						AND MPlayerID = @mPlayerID 
						AND TypeCode = @typeCode

					-- 有找到就都使用Update
					IF @checkMemberID > 0 AND @checkMPlayerID > 0
					BEGIN
						--沒有[AgentMoney]
						UPDATE [MPlayerReport]
						SET [TurnOverMoney] = @turnOverMoney, 
							[TypeCode] = @typeCode, 
							[CurrentPeriod] = @currentPeriod, 
							[RecordMoney] = @recordMoney, 
							[AgentLevelSCID] = 32, 
							[LotteryTypeID] = @lotteryTypeID, 
							[LotteryClassID] = @lotteryClassID,
							[UpdateBy] = 0, 
							[UpdateDate] = GETDATE()
						WHERE MemberID = @memberID 
							AND MPlayerID = @mPlayerID 
							AND TypeCode = 'Loss'
					END;
					ELSE
					BEGIN
						--沒有[AgentMoney]
						INSERT INTO MPlayerReport ([MemberID], [MPlayerID], [LotteryTypeID], [LotteryClassID]
							, [CurrentPeriod], [TurnOverMoney], [TypeCode], [Status], [RecordMoney], [CashRebateMoney]
							, [CashBackRebateMoney], [ReferralMoney], [AgentLevelSCID]
							, [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						values (@memberID, @mPlayerID, @lotteryTypeID, @lotteryClassID
							, @currentPeriod, @turnOverMoney, @typeCode, NULL, @recordMoney, NULL
							, NULL, NULL, 32
							, 0, @createDate, 0, GETDATE() )

						---- 加入Statement--
						--SELECT @userBalance = [TotalBalance]
						--	FROM  MemberShip with(nolock) 
						--	WHERE MemberID = @memberID

						---- 取出用戶錢包
						--SELECT @userWallet = CAST(ISNULL(NULLIF(TotalPrice, ''),0) AS decimal(18, 4))
						--	FROM MWallet WITH(NOLOCK)
						--	WHERE MemberID = @memberID
						--		AND CompanyID = 2

						--SET @userBalance = CAST((CAST(@userBalance AS decimal(18, 4)) - CAST(@recordMoney AS decimal(18, 4))) AS NVarchar(200));
						--SET @totalBalance = CAST((CAST(@userBalance AS decimal(18, 4)) + CAST(@recordMoney AS decimal(18, 4))) AS NVarchar(200));
						--SET @totalBalance = @userWallet;
						--INSERT INTO [Statement] ([MemberID], [CurrentPeriod], [LotteryInfoID], [LotteryTypeID], [LotteryClassID], [Balance], [TypeCode]
						--	, [ValueMoney], [Total], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						--VALUES (@memberID, @currentPeriod, @lotteryInfoID, @lotteryTypeID, @lotteryClassID, @userBalance, 'Loss'
						--	, '0', CAST(@totalBalance AS NVarchar(200)), 0, @createDate, 0, GETDATE())
						
						---- 更新用戶總餘額
						--SET @userBalance = @userWallet + @recordMoney;
						--UPDATE MemberShip SET [TotalBalance] = @userBalance
						--	WHERE MemberID = @memberID

						------ 更新用戶錢包
						--SET @userWallet = CAST(@userBalance AS NVarchar(200));
						--UPDATE MWallet SET TotalPrice = @userWallet
						--	WHERE MemberID = @memberID 
						--		AND CompanyID = 2

					END;
				END;
				Else IF @isWin = 1
				Begin
					SELECT @checkMemberID = ISNULL(MemberID, 0)
						, @checkMPlayerID =  ISNULL(MPlayerID, 0)
						, @checkTypeCode = TypeCode 
					FROM [MPlayerReport]
					WHERE MemberID = @memberID 
						AND MPlayerID = @mPlayerID 
						AND TypeCode = @typeCode
						
					SET @recordMoney = @winMoney;
					SET @sicboRecordMoney = @recordMoney;

					--IF @lotteryTypeID = 7 OR @lotteryTypeID = 8 OR @lotteryTypeID = 9
					--BEGIN
					--	SET @sicboRecordMoney = @sicboRecordMoney + @price
					--END;

					IF @checkMemberID > 0 AND @checkMPlayerID > 0
					BEGIN
						--沒有[AgentMoney]
						UPDATE [MPlayerReport]
						SET [TurnOverMoney] = @turnOverMoney, 
							[TypeCode] = @typeCode, 
							[CurrentPeriod] = @currentPeriod, 
							[RecordMoney] = @sicboRecordMoney, 
							[AgentLevelSCID] = 32, 
							[LotteryTypeID] = @lotteryTypeID, 
							[LotteryClassID] = @lotteryClassID,
							[UpdateBy] = 0, 
							[UpdateDate] = GETDATE()
						WHERE MemberID = @memberID 
							AND MPlayerID = @mPlayerID 
							AND TypeCode = 'Win'
					END;
					ELSE
					BEGIN
						------沒有[AgentMoney]
						INSERT INTO MPlayerReport ([MemberID], [MPlayerID], [LotteryTypeID], [LotteryClassID]
							, [CurrentPeriod], [TurnOverMoney], [TypeCode], [Status], [RecordMoney], [CashRebateMoney]
							, [CashBackRebateMoney], [ReferralMoney], [AgentLevelSCID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						VALUES (@memberID, @mPlayerID, @lotteryTypeID, @lotteryClassID
							, @currentPeriod, @turnOverMoney, @typeCode, NULL, @sicboRecordMoney, NULL
							, NULL, NULL, 32, 0, @createDate, 0, GETDATE())
						
						---- 20210303 加入MplayerReport後就要加上成本，這樣子返回給用戶的錢才會正確
						--SET @sicboRecordMoney = @sicboRecordMoney + @price

						---- 加入Statement--
						--SELECT @userBalance = [TotalBalance]
						--	FROM  MemberShip WITH(NOLOCK) 
						--	WHERE MemberID = @memberID

						---- 取出用戶錢包
						--SELECT @userWallet = CAST(ISNULL(NULLIF(TotalPrice, ''),0) AS DECIMAL(18, 4))
						--	FROM MWallet WITH(NOLOCK)
						--	WHERE MemberID = @memberID 
						--		AND CompanyID = 2

						--SET @totalBalance = CAST((CAST(@userWallet AS DECIMAL(18, 4)) + CAST(@sicboRecordMoney AS DECIMAL(18, 4))) AS NVarchar(200));
						
						--INSERT INTO [Statement] ([MemberID], [CurrentPeriod], [LotteryInfoID], [LotteryTypeID], [LotteryClassID], [Balance], [TypeCode]
						--	, [ValueMoney], [Total], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						--VALUES (@memberID, @currentPeriod, @lotteryInfoID, @lotteryTypeID, @lotteryClassID, @userBalance, 'Win'
						--	, @sicboRecordMoney, CAST(@totalBalance AS NVarchar(200)), 0, @createDate, 0, GETDATE())

						---- 更新用戶總餘額
						--SET @userBalance = @totalBalance;
						--UPDATE MemberShip SET [TotalBalance] = @userBalance
						--	WHERE MemberID = @memberID

						---- 更新用戶錢包
						--SET @userWallet = CAST(@totalBalance AS NVarchar(200));
						--UPDATE MWallet SET TotalPrice = @userWallet
						--	WHERE MemberID = @memberID 
						--		AND CompanyID = 2
						--SET @userWallet = CAST(@userWallet + CAST(@sicboRecordMoney AS decimal(18, 4)) AS NVarchar(200));
						--UPDATE MWallet SET TotalPrice = @userWallet
						--WHERE MemberID = @memberID 
						--	AND CompanyID = 2
					END;
				End;
				
				SET @mPlayerCount = @mPlayerCount - 1;
				CONTINUE  
			END;
		SET @userCount = @userCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SlotAngentReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 說明: 統計用戶的Angent儲存到Report
-- 參數說明: null
-- 範例: exec sp_AngentReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20200308			Yark				進行代理費計算
-- 2			20200310			Yark				加入SlotStatement Report
-- 3			20200418			Ben					修改AgentPositionTaking算法(上層扣下層)
-- =============================================
CREATE PROCEDURE [dbo].[sp_SlotAngentReport]
AS
BEGIN
	DECLARE @userCount INT;								--要計算的用戶數
	DECLARE @memberID INT;								--投注單的用戶
	DECLARE @mPlayerCount INT;							--投注單數量
	DECLARE @mPlayerID INT;								--投注單流水號
	DECLARE @agentPositionTakingRebate DECIMAL(18, 4);		--代理費用占成
	DECLARE @childAgentPositionTakingRebate DECIMAL(18, 4);	--子代理費占成
	DECLARE @winMoney DECIMAL(18, 4);					--輸贏
	DECLARE @qty DECIMAL(18, 4);						--投注數量
	DECLARE @price DECIMAL(18, 4);						--投注單價
	DECLARE @agentLevelSCID INT = 32;					--Member Level
	DECLARE @typeCode NVARCHAR(200) = 'Angent';			--類別
	DECLARE @slotTypeName NVARCHAR(200) = '';			--類別
	DECLARE @Status NVARCHAR(200) = '';					--狀態
	DECLARE @recordMoney NVARCHAR(50) = '';				--暫存記錄的金額
	DECLARE @cashRebateMoney NVARCHAR(200) = '';		--返水率
	DECLARE @agentMoney decimal(18, 4) = 0;				--代理費
	DECLARE @dateS DATETIME;							--查詢區間(起)
	DECLARE @dateE DATETIME;							--查詢區間(訖)
	DECLARE @roundId NVARCHAR(100) = '';			--期號
	DECLARE @lotteryInfoID INT = 0;							--玩法ID
	DECLARE @userBalance NVARCHAR(200);					--用戶餘額
	DECLARE @userWallet DECIMAL(18, 4);					--用戶錢包
	DECLARE @totalBalance DECIMAL(18, 4);				--用戶總餘額
	DECLARE @checkCount DECIMAL(18, 4);					--是否有值存在

	-- 設定啟始與結束時間
	SELECT @dateS = DATEADD(minute, -11, getdate()), @dateE=getdate();

	SELECT @dateS, @dateE

	DROP TABLE IF EXISTS #tempSlotMPlayer
	 --複製當天的投注表
	SELECT * INTO #tempSlotMPlayer FROM SlotMPlayer WITH(NOLOCK)
	WHERE CreateDate >= @dateS and CreateDate <= @dateE

	-- 用戶日計算的用戶數量
	SELECT @userCount = count(*)
		FROM MemberShip WITH(NOLOCK) 
	WHERE AgentLevelSCID = @agentLevelSCID

	WHILE @userCount > 0
	Begin
		-- Step 1. 取出用戶資料
		select @memberID = MemberID
			from MemberShip with(nolock) 
		where AgentLevelSCID = @agentLevelSCID
		ORDER BY MemberShip.MemberID
		OFFSET     (@userCount-1) ROWS
		FETCH NEXT 1 ROWS ONLY;
	
		-- Step 2. 取出投注資料
		set @mPlayerCount = 0;
		set @winMoney = -1;
		set @mPlayerID = -1;
		select @mPlayerCount = COUNT(*)  
			from #tempSlotMPlayer
			where MemberID = @memberID and isWin in (0,1)
			
			WHILE @mPlayerCount > 0
			BEGIN
				SELECT @winMoney = [WinMoney], @qty = [Qty], @price = Price, @mPlayerID = [ID], @cashRebateMoney = [CashBackMoney],
				@roundId = [RoundId], @slotTypeName = [SlotTypeName]
				FROM #tempSlotMPlayer
					WHERE MemberID = @memberID AND isWin in (0,1)
					ORDER BY #tempSlotMPlayer.RoundId
				OFFSET     (@mPlayerCount-1) ROWS
				FETCH NEXT 1 ROWS ONLY;
				
					Set @typeCode = 'Angent'
				
					-- 先進行結算Angent Loop
					DECLARE @angentCount int;
					DECLARE @angentMap nvarchar(200);
					DECLARE @angentUserName nvarchar(200);
					DECLARE @angentUserId int;
					DECLARE @agentLoopLevelSCID int;
					DECLARE @splitStr nvarchar(50) = '/';

					SELECT @angentMap = AgentParentMap, @userBalance = [TotalBalance]
					FROM  MemberShip WITH(NOLOCK) 
					WHERE MemberID = @memberID

					-- 將Angent Map做成temp table
					drop table IF EXISTS #angentMapTemp
					Create Table #angentMapTemp ( ID INT IDENTITY(1, 1) primary key, AngentUserName nvarchar(200));
					INSERT INTO #angentMapTemp SELECT value 'AngentUserName' FROM STRING_SPLIT(@angentMap, '/') WHERE RTRIM(value) <> '';

					SELECT @angentCount = count(*) from #angentMapTemp
					DECLARE @referralLevelTotal int = (@angentCount + 1);--總階

					-- 計算(日)
					IF @winMoney = 0
					BEGIN
						SET @recordMoney = -(@qty * @price);
					END;
					Else IF @winMoney > 0
					BEGIN
						SET @recordMoney = @winMoney;
					END;

					WHILE @angentCount > 0
					BEGIN
						-- Step 1. 取出 MemberID、AngentUserName
						SELECT @angentUserName = AngentUserName
						FROM #angentMapTemp
						ORDER BY #angentMapTemp.ID desc
						OFFSET     (@angentCount-1) ROWS
						FETCH NEXT 1 ROWS ONLY;

						SELECT @angentUserId = MemberID, @agentPositionTakingRebate = (CAST(AgentPositionTakingRebate AS decimal(18, 4))),
						@agentLoopLevelSCID = [AgentLevelSCID]
						FROM MemberShip WITH(NOLOCK)
						WHERE UserName = @angentUserName

						--取子階代理占成
						IF @angentCount >= 2
						BEGIN
							SELECT @angentUserName = AngentUserName
							FROM #angentMapTemp
							ORDER BY #angentMapTemp.ID desc
							OFFSET     (@angentCount-2) ROWS
							FETCH NEXT 1 ROWS ONLY;

							SELECT @childAgentPositionTakingRebate = (CAST(AgentPositionTakingRebate AS decimal(18, 4)))
							FROM MemberShip WITH(NOLOCK)
							WHERE UserName = @angentUserName

							SET @agentPositionTakingRebate = (@agentPositionTakingRebate - @childAgentPositionTakingRebate)
						END
						--取子階代理占成

						SET @agentMoney = ((CAST(@recordMoney AS decimal(18, 4))) * @agentPositionTakingRebate);
						Set @totalBalance = CAST((CAST(@userBalance AS decimal(18, 4)) + CAST(@recordMoney AS decimal(18, 4))) AS NVARCHAR(200));

						-- 檢查是否有資料存在
						SELECT @checkCount = COUNT(*) FROM [SlotMPlayerReport]
						WHERE [MPlayerID] = @mPlayerID AND [MemberID] = @memberID

						IF @checkCount = 0
						BEGIN
							-- 沒有[AgentMoney]
							INSERT INTO [SlotMPlayerReport] ([MemberID], [MPlayerID], [AngentMemberID], [AgentLevelSCID], [TurnOverMoney], [TypeCode], [Status], [RecordMoney], [CashRebateMoney], [CashBackRebateMoney], [AgentMoney], 
							[CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
							VALUES (@memberID, @mPlayerID, @angentUserId, @agentLoopLevelSCID, (@qty * @price), @typeCode, NULL, @recordMoney, 0, @cashRebateMoney, @agentMoney, 
							0, GETDATE(), 0, GETDATE())
						

							-- 加入Statement
							INSERT INTO [SlotStatement] ([MemberID], [RoundId], [LotteryInfoID], [Balance], [SlotTypeName], [ValueMoney], [Total], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
							VALUES (@angentUserId, @roundId, @lotteryInfoID, @userBalance, @slotTypeName, CAST(@agentMoney AS NVARCHAR(200)), CAST(@totalBalance AS NVARCHAR(200)), 0, GETDATE(), 0, GETDATE())

							-- 更新錢包
							SELECT @userWallet = [TotalPrice] FROM [MWallet] Where MemberID = @angentUserId AND CompanyID = 2;
							update [MWallet] Set TotalPrice = CAST((@agentMoney + @userWallet) AS NVARCHAR(200)) Where MemberID = @angentUserId AND CompanyID = 2;

							-- 更新用戶總餘額
							update [MemberShip] Set [TotalBalance] = CAST(@totalBalance AS NVARCHAR(200)) Where MemberID = @angentUserId;
						End;

						SET @angentCount = @angentCount - 1;
					END;
					Set @mPlayerCount = @mPlayerCount - 1;
				CONTINUE  
			END;
		Set @userCount = @userCount - 1;
		CONTINUE  
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SlotReferralReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20200308			Yark				進行代理費計算
-- 2			20200310			Yark				加入Statement Report
-- =============================================
CREATE PROCEDURE [dbo].[sp_SlotReferralReport]
AS
BEGIN
	DECLARE @userCount int; -- 要計算的用戶數
	DECLARE @memberID int;
	DECLARE @referralParentID int;
	DECLARE @mPlayerCount int;
	DECLARE @referralCashRebate decimal(18, 4);
	DECLARE @referralLayerLevel decimal(18, 4);
	DECLARE @winMoney decimal(18, 4);
	DECLARE @qty decimal(18, 4);
	DECLARE @price decimal(18, 4);
	DECLARE @referralPayType int = 34;
	DECLARE @mPlayerID int;

	DECLARE @typeCode varchar(200) = 'Win';
	DECLARE @Status varchar(200) = '';
	DECLARE @recordMoney varchar(200) = ''; --WinMoney
	DECLARE @cashRebateMoney varchar(200) = ''; --CashRebate
	DECLARE @cashBackRebateMoney varchar(200) = ''; --CashBackRebate
	DECLARE @agentMoney decimal(18, 4) = 0;
	DECLARE @referralMoney decimal(18, 4) = 0;
	DECLARE @dateS varchar(200) = '';
	DECLARE @dateE varchar(200) = '';
	DECLARE @roundId NVARCHAR(100) = '';			--期號
	DECLARE @lotteryInfoID INT = 0;						--玩法ID
	DECLARE @slotTypeName NVARCHAR(200);				--遊戲型別
	DECLARE @userBalance NVARCHAR(200);					--用戶餘額
	DECLARE @userWallet DECIMAL(18, 4);					--用戶錢包
	DECLARE @totalBalance DECIMAL(18, 4);				--用戶總餘額
	DECLARE @isWin bit;

	-- 設定啟始與結束時間
	select @dateS = convert(varchar, DATEADD(minute, -2, getdate()), 120), @dateE=convert(varchar, DATEADD(minute, 0, getdate()), 120);

	select @dateS, @dateE

	drop table IF EXISTS #tempSlotMPlayer
	 --複製當天的投注表
	SELECT * INTO #tempSlotMPlayer FROM SlotMPlayer with(nolock)
	where CreateDate >= @dateS and CreateDate <= @dateE

	-- 用戶日計算的用戶數量
	select @userCount = count(*)
		from MemberShip with(nolock) 
	where ReferralPayType = @referralPayType

	WHILE @userCount > 0
	Begin
		-- Step 1. 取出用戶資料
		select 
			@referralCashRebate = (CAST(ISNULL(NULLIF(ReferralCashRebate, ''),0 ) AS decimal(18, 4))),
			@referralLayerLevel = (CAST(ISNULL(NULLIF(ReferralLayerLevel, ''),0 ) AS decimal(18, 4))),
			@memberID = MemberID
			from MemberShip with(nolock) 
		where ReferralPayType = @referralPayType
		ORDER BY MemberShip.MemberID
		OFFSET     (@userCount-1) ROWS
		FETCH NEXT 1 ROWS ONLY;
	
		-- Step 2. 取出投注資料
		SET @mPlayerCount = 0;
		SET @winMoney = -1;
		SET @mPlayerID = -1;
		SELECT @mPlayerCount = COUNT(*)  
			FROM #tempSlotMPlayer
			WHERE MemberID = @memberID and isWin in (0,1)

			WHILE @mPlayerCount > 0
			BEGIN
				SELECT @winMoney = WinMoney, @qty = Qty, @price = Price, @mPlayerID = ID, @cashBackRebateMoney = CashBackMoney,
				@slotTypeName = [SlotTypeName], @isWin = [IsWin], @roundId = RoundId
				FROM #tempSlotMPlayer
					WHERE MemberID = @memberID and isWin in (0, 1)
					ORDER BY #tempSlotMPlayer.RoundId
				OFFSET     (@mPlayerCount-1) ROWS
				FETCH NEXT 1 ROWS ONLY;
				
					SET @typeCode = 'Win';
					
					DECLARE @checkMemberID int = 0;
					DECLARE @checkMPlayerID int = 0;
					DECLARE @checkTypeCode varchar(200) = '';

					-- 計算(日)
					IF @isWin = 0
					BEGIN
						-- 先進行結算Referral
						DECLARE @referralCount int;
						DECLARE @referralMap nvarchar(200);
						DECLARE @referralUserName nvarchar(200);
						DECLARE @referralUserId int;
						DECLARE @splitStr nvarchar(50) = '/';

						SELECT @referralMap = ReferralMap
						FROM  MemberShip with(nolock) 
						WHERE MemberID = @memberID

						DROP TABLE IF EXISTS #referralMapTemp
						CREATE TABLE #referralMapTemp ( ID INT IDENTITY(1, 1) PRIMARY key, ReferralUserName nvarchar(200));

						INSERT INTO #referralMapTemp SELECT value 'ReferralUserName' FROM STRING_SPLIT(@referralMap, '/') WHERE RTRIM(value) <> '';

						---- Referral Calcultor
						select @referralCount = count(*) from #referralMapTemp
						DECLARE @referralLevelTotal int = (@referralCount + 1);--總階
						
						WHILE @referralCount > 0
						BEGIN
							-- Step 1. 取出 MemberID、ReferralRebate
							SELECT @referralUserName = ReferralUserName
							FROM #referralMapTemp
							ORDER BY #referralMapTemp.ID
							OFFSET     (@referralCount-1) ROWS
							FETCH NEXT 1 ROWS ONLY;

							-- 取出用戶總餘額
							SELECT @referralUserId = MemberID, @userBalance = [TotalBalance]
							FROM MemberShip WITH(NOLOCK)
							WHERE UserName = @referralUserName

							-- 取出用戶錢包
							SELECT @userWallet = CAST(ISNULL(NULLIF(TotalPrice, ''),0) AS decimal(18, 4))
							FROM MWallet WITH(NOLOCK)
							WHERE MemberID = @referralUserId AND CompanyID = 2

							-- 第一層時才進行取得Member的ParentID
							IF (@referralLevelTotal - @referralCount) = 1
							BEGIN
								SET @referralParentID = @referralUserId;
							END;
						
							-- 取得GameRoomID
							DECLARE @referralLevelRebate decimal(18, 4) = 0;

							SELECT @referralLevelRebate = CAST(ISNULL(NULLIF(RL.[ReferralPercentage], ''), 0) AS decimal(18, 4)) 
							FROM [LotteryClass] LC
								INNER JOIN LotteryType LT ON LT.LotteryClassID = LC.LotteryClassID
								INNER JOIN LotteryInfo LI ON LI.LotteryTypeID = LT.LotteryTypeID
								INNER JOIN MPlayer MP ON MP.LotteryInfoID = LI.LotteryInfoID
								INNER JOIN ReferralLayer RL ON RL.GameRoomTypeID = LC.GameRoomID
							Where MP.ID = @mPlayerID And RL.ReferralLevel = (@referralLevelTotal - @referralCount);

							DECLARE @referralLevelMoney decimal(18, 4) = 0;
							SET @referralLevelMoney = (@referralLevelRebate * @qty * @price) / 100;
								
							DECLARE @checkReferralMemberID int = 0;
							DECLARE @checkReferralMPlayerID int = 0;
							DECLARE @checkReferralTypeCode varchar(200) = 'Referral';
							SELECT @checkReferralMemberID = ISNULL(NULLIF(MemberID, ''), 0), @checkReferralMPlayerID =  ISNULL(MPlayerID, 0), @checkReferralTypeCode = TypeCode 
							FROM [SlotMPlayerReport]
							WHERE MemberID = @referralUserId AND MPlayerID = @mPlayerID AND TypeCode = 'Referral'

							-- 當查詢到則用Update
							IF @checkReferralMemberID > 0 AND @checkReferralMPlayerID > 0
							BEGIN
								UPDATE [SlotMPlayerReport] 
								SET 
									[ReferralLevel] = CAST((@referralLevelTotal - @referralCount) as nvarchar(100)) + ',' + CAST(@referralLevelRebate as nvarchar(100)), 
									[ReferralParentID] = @referralParentID, 
									[TurnOverMoney] = (@qty * @price), 
									[Status] = NULL, 
									[RecordMoney] = 0, 
									[CashRebateMoney] = 0, 
									[CashBackRebateMoney] = 0, 
									[ReferralMoney] = @referralLevelMoney, 
									[AgentLevelSCID] = 32, 
									[UpdateBy] = 0, 
									[UpdateDate] = GETDATE()
								WHERE MemberID = @referralUserId AND MPlayerID = @mPlayerID AND TypeCode = 'Referral'

								-- 加入Statement--Referral
								SET @totalBalance = CAST(@userBalance AS decimal(18, 4)) + @referralLevelMoney;
								UPDATE [SlotStatement] 
								SET [Balance] = @userBalance, 
									[ValueMoney] = CAST(@referralLevelMoney AS NVARCHAR(200)), 
									[Total] = CAST(@totalBalance AS NVARCHAR(200)), 
									[UpdateBy] = 0, 
									[UpdateDate] = GETDATE()
								WHERE MemberID = @referralUserId AND [RoundId] = @roundId AND [LotteryInfoID] = @lotteryInfoID AND SlotTypeName = 'Referral'
							END;
							ELSE
							BEGIN
								INSERT INTO [SlotMPlayerReport] ([MemberID], [ReferralMemberID], [MPlayerID], [ReferralLevel], [TypeCode], 
								[ReferralParentID], [TurnOverMoney], [Status], [RecordMoney], [CashRebateMoney], [CashBackRebateMoney], [ReferralMoney], [AgentLevelSCID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
								values (@referralUserId, @memberID, @mPlayerID, CAST((@referralLevelTotal - @referralCount) as nvarchar(100)) + ',' + CAST(@referralLevelRebate as nvarchar(100)) , 'Referral',
								@referralParentID, (@qty * @price), NULL, 0, 0, 0, @referralLevelMoney, 32, 0, GETDATE(), 0, GETDATE() )

								-- 加入Statement--Referral
								SET @totalBalance = CAST(@userBalance AS decimal(18, 4)) + @referralLevelMoney;
								INSERT INTO [SlotStatement] ([MemberID], [RoundId], [LotteryInfoID], [Balance], [SlotTypeName], [ValueMoney], [Total], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
								VALUES (@referralUserId, @roundId, @lotteryInfoID, @userBalance, 'Referral', CAST(@referralLevelMoney AS NVARCHAR(200)), CAST(@totalBalance AS NVARCHAR(200)), 0, GETDATE(), 0, GETDATE())

								SET @userWallet = @userWallet + @referralLevelMoney;

								-- 更新用戶總餘額
								SET @userBalance = @totalBalance;
								UPDATE MemberShip SET [TotalBalance] = @userBalance
								WHERE UserName = @referralUserName AND MemberID = @referralUserId

								-- 更新用戶錢包
								UPDATE MWallet SET TotalPrice = @userWallet
								WHERE MemberID = @referralUserId AND CompanyID = 2
							END;

							SET @referralCount = @referralCount - 1;
						End;

						SET @referralMoney = 0;
						SET @recordMoney = -(@qty * @price);
						SELECT @cashRebateMoney = (CAST(CashBackRebate AS decimal(18,4)) * @qty * @price) from [GHL].[dbo].[MCompany]
						SET @typeCode = 'Loss'

						SELECT @checkMemberID = ISNULL(MemberID, 0), @checkMPlayerID =  ISNULL(MPlayerID, 0), @checkTypeCode = TypeCode 
						FROM [SlotMPlayerReport]
						WHERE MemberID = @memberID AND MPlayerID = @mPlayerID AND TypeCode = @typeCode

						-- 有找到就都使用Update
						IF @checkMemberID > 0 AND @checkMPlayerID > 0
						BEGIN
							--沒有[AgentMoney]
							UPDATE [SlotMPlayerReport]
							SET [TurnOverMoney] = (@qty * @price), 
								[TypeCode] = @typeCode, 
								[RecordMoney] = @recordMoney, 
								[CashRebateMoney] = @cashRebateMoney, 
								[CashBackRebateMoney] = @cashBackRebateMoney, 
								[ReferralMoney] = @referralMoney, 
								[AgentLevelSCID] = 32, 
								[UpdateBy] = 0, 
								[UpdateDate] = GETDATE()
							WHERE MemberID = @memberID AND MPlayerID = @mPlayerID AND TypeCode = 'Loss'
						END;
						ELSE
						BEGIN
							--沒有[AgentMoney]
							INSERT INTO [SlotMPlayerReport] ([MemberID], [MPlayerID], [TurnOverMoney], [TypeCode], [Status], [RecordMoney], [CashRebateMoney], [CashBackRebateMoney], [ReferralMoney], [AgentLevelSCID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
							values (@memberID, @mPlayerID, (@qty * @price), @typeCode, NULL, @recordMoney, @cashRebateMoney, @cashBackRebateMoney, @referralMoney, 32, 0, GETDATE(), 0, GETDATE() )

							-- 加入Statement--Referral
							SELECT @userBalance = [TotalBalance]
							FROM  MemberShip with(nolock) 
							WHERE MemberID = @memberID

							-- 取出用戶錢包
							SELECT @userWallet = CAST(ISNULL(NULLIF(TotalPrice, ''),0) AS decimal(18, 4))
							FROM MWallet WITH(NOLOCK)
							WHERE MemberID = @memberID AND CompanyID = 2

							--SET @userBalance = CAST((CAST(@userBalance AS decimal(18, 4)) - CAST(@recordMoney AS decimal(18, 4))) AS NVARCHAR(200));
							--SET @totalBalance = CAST((CAST(@userBalance AS decimal(18, 4)) + CAST(@recordMoney AS decimal(18, 4))) AS NVARCHAR(200));
							SET @totalBalance = @userBalance;
							INSERT INTO [SlotStatement] ([MemberID], [RoundId], [LotteryInfoID], [Balance], [SlotTypeName], [ValueMoney], [Total], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
							VALUES (@memberID, @roundId, @lotteryInfoID, @userBalance, 'Loss', CAST(@recordMoney AS NVARCHAR(200)), CAST(@totalBalance AS NVARCHAR(200)), 0, GETDATE(), 0, GETDATE())
						
							-- CashBack
							SET @userBalance = @totalBalance;
							SET @totalBalance = CAST((CAST(@userBalance AS decimal(18, 4)) + CAST(@cashBackRebateMoney AS decimal(18, 4))) AS NVARCHAR(200));
							INSERT INTO [SlotStatement] ([MemberID], [RoundId], [LotteryInfoID], [Balance], [SlotTypeName], [ValueMoney], [Total], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
							VALUES (@memberID, @roundId, @lotteryInfoID, @userBalance, 'CashBack', @cashBackRebateMoney, CAST(@totalBalance AS NVARCHAR(200)), 0, GETDATE(), 0, GETDATE())

							-- CashRebate
							SET @userBalance = @totalBalance;
							SET @totalBalance = CAST((CAST(@userBalance AS decimal(18, 4)) + CAST(@cashRebateMoney AS decimal(18, 4))) AS NVARCHAR(200));
							INSERT INTO [SlotStatement] ([MemberID], [RoundId], [LotteryInfoID], [Balance], [SlotTypeName], [ValueMoney], [Total], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
							VALUES (@memberID, @roundId, @lotteryInfoID, @userBalance, 'CashRebate', @cashRebateMoney, CAST(@totalBalance AS NVARCHAR(200)), 0, GETDATE(), 0, GETDATE())

							-- 更新用戶總餘額
							SET @userBalance = @totalBalance;
							UPDATE MemberShip SET [TotalBalance] = @userBalance
							WHERE MemberID = @memberID

							-- 更新用戶錢包
							SET @userWallet = CAST((@userWallet + CAST(@cashBackRebateMoney AS decimal(18, 4)) + CAST(@cashRebateMoney AS decimal(18, 4))) AS NVARCHAR(200));
							UPDATE MWallet SET TotalPrice = @userWallet
							WHERE MemberID = @memberID AND CompanyID = 2

						END;
					END;
					Else IF @isWin = 1
					Begin
						SELECT @checkMemberID = ISNULL(MemberID, 0), @checkMPlayerID =  ISNULL(MPlayerID, 0), @checkTypeCode = TypeCode 
						FROM [MPlayerReport]
						WHERE MemberID = @memberID AND MPlayerID = @mPlayerID AND TypeCode = @typeCode
						
						IF @checkMemberID > 0 AND @checkMPlayerID > 0
						BEGIN
							--沒有[AgentMoney]
							UPDATE [MPlayerReport]
							SET [TurnOverMoney] = (@qty * @price), 
								[TypeCode] = @typeCode, 
								[RecordMoney] = @recordMoney, 
								[CashRebateMoney] = @cashRebateMoney, 
								[CashBackRebateMoney] = @cashBackRebateMoney, 
								[ReferralMoney] = @referralMoney, 
								[AgentLevelSCID] = 32, 
								[UpdateBy] = 0, 
								[UpdateDate] = GETDATE()
							WHERE MemberID = @memberID AND MPlayerID = @mPlayerID AND TypeCode = 'Win'
						END;
						ELSE
						BEGIN
							SET @referralMoney = 0;
							SET @recordMoney = @winMoney;
							SET @cashRebateMoney = 0
							------沒有[AgentMoney]
							insert into MPlayerReport ([MemberID], [MPlayerID], [TurnOverMoney], [TypeCode], [Status], [RecordMoney], [CashRebateMoney], [CashBackRebateMoney], [ReferralMoney], [AgentLevelSCID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
							values (@memberID, @mPlayerID, (@qty * @price), @typeCode, NULL, @recordMoney, @cashRebateMoney, @cashBackRebateMoney, @referralMoney, 32, 0, GETDATE(), 0, GETDATE())
					
							-- 加入Statement--Referral
							select @userBalance = [TotalBalance]
							from  MemberShip with(nolock) 
							where MemberID = @memberID

							-- 取出用戶錢包
							SELECT @userWallet = CAST(ISNULL(NULLIF(TotalPrice, ''),0) AS decimal(18, 4))
							FROM MWallet WITH(NOLOCK)
							WHERE MemberID = @memberID AND CompanyID = 2

							SET @totalBalance = CAST((CAST(@userBalance AS decimal(18, 4)) + CAST(@recordMoney AS decimal(18, 4))) AS NVARCHAR(200));
							INSERT INTO [SlotStatement] ([MemberID], [RoundId], [LotteryInfoID], [Balance], [SlotTypeName], [ValueMoney], [Total], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
							VALUES (@memberID, @roundId, @lotteryInfoID, @userBalance, 'Win', @recordMoney, CAST(@totalBalance AS NVARCHAR(200)), 0, GETDATE(), 0, GETDATE())

							-- CashBack
							SET @userBalance = @totalBalance;
							SET @totalBalance = CAST((CAST(@userBalance AS decimal(18, 4)) + CAST(@cashBackRebateMoney AS decimal(18, 4))) AS NVARCHAR(200));
							INSERT INTO [SlotStatement] ([MemberID], [RoundId], [LotteryInfoID], [Balance], [SlotTypeName], [ValueMoney], [Total], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
							VALUES (@memberID, @roundId, @lotteryInfoID, @userBalance, 'CashBack', @cashBackRebateMoney, CAST(@totalBalance AS NVARCHAR(200)), 0, GETDATE(), 0, GETDATE())
							
							-- 更新用戶總餘額
							SET @userBalance = @totalBalance;
							UPDATE MemberShip SET [TotalBalance] = @userBalance
							WHERE MemberID = @memberID

							-- 更新用戶錢包
							SET @userWallet = CAST((@userWallet + CAST(@recordMoney AS decimal(18, 4))+ CAST(@cashBackRebateMoney AS decimal(18, 4))) AS NVARCHAR(200));
							UPDATE MWallet SET TotalPrice = @userWallet
							WHERE MemberID = @memberID AND CompanyID = 2
						END;
					End;
				
					SET @mPlayerCount = @mPlayerCount - 1;
				CONTINUE  
			END;
		SET @userCount = @userCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Update4DLotto]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- 說明: 統計用戶的Angent儲存到Report
-- 參數說明: null
-- 範例: exec sp_AngentReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20210823			Yark				
-- =============================================
CREATE PROCEDURE [dbo].[sp_Update4DLotto](
	-- Add the parameters for the stored procedure here
	@checkLotteryTypeID INT
)
AS
BEGIN
	IF @checkLotteryTypeID = 22
	BEGIN
		UPDATE LotteryType
		SET IsCloseGame = 0, UpdateDate = GETDATE()
		WHERE LotteryTypeID = @checkLotteryTypeID
	END;
	ELSE
	BEGIN
		UPDATE LotteryType
		SET IsCloseGame = 0, UpdateDate = GETDATE()
		WHERE LotteryTypeID in (20,21,23)
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateTotalBalance]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- 說明: 統計用戶的Angent儲存到Report
-- 參數說明: null
-- 範例: exec sp_AngentReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20201008			Yark				每小時檢查登入的在線人數是否沒有活動超過時間
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateTotalBalance]
AS
BEGIN
	DECLARE @userCount INT;											--要計算的用戶數
	DECLARE @memberID INT;											--投注單的用戶
	DECLARE @walletCount INT;										--要計算的用戶數
	DECLARE @totalPrice DECIMAL(18, 4);								--總金額
	DECLARE @walletPrice Nvarchar(200);								--錢包的總金額
	
	DROP TABLE IF EXISTS #tempMemberShip
	-- 複製所有會員層級的用戶
	SELECT * INTO #tempMemberShip 
		FROM MemberShip WITH(NOLOCK) 

	-- 用戶數量
	SELECT @userCount = count(*) 
		FROM #tempMemberShip

	-- 進行
	WHILE @userCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT @memberID = MemberID
			FROM #tempMemberShip
		ORDER BY #tempMemberShip.MemberID
		OFFSET     (@userCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;
		
		SET @totalPrice = 0;

		SELECT @walletCount = count(*)
			FROM MWallet WITH(NOLOCK)
			WHERE [MemberID] = @memberID

		WHILE @walletCount > 0
		BEGIN
			SELECT @walletPrice = ISNULL(NULLIF([TotalPrice], ''),0 )
				FROM MWallet WITH(NOLOCK)
				WHERE [MemberID] = @memberID
			ORDER BY ID
			OFFSET     (@walletCount-1) ROWS
			FETCH NEXT 1 ROWS ONLY;
			SET @totalPrice += (CAST(ISNULL(NULLIF(@walletPrice, ''),0 ) AS decimal(18, 4)))

			SET @walletCount = @walletCount - 1;
		END;

		UPDATE MemberShip 
			SET [TotalBalance] = (CAST(ISNULL(NULLIF(CAST(@totalPrice AS NVARCHAR), ''),0 ) AS NVARCHAR))
			WHERE [MemberID] = @memberID

		SET @userCount = @userCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_winAndLostMostByMonth]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Name: 統計本月份最贏.最輸玩家
-- Create date: 2020/02/11
-- Description:	Ben建置
-- =============================================
CREATE PROCEDURE [dbo].[sp_winAndLostMostByMonth]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DROP TABLE IF Exists #WinMostTemp
	
	SELECT MemberID, Count(WinMoney) as TotalWinMoney
		INTO #WinMostTemp
		FROM [dbo].[MPlayer]
		GROUP BY MemberID
	
	SELECT TOP(3) m.UserName,t.TotalWinMoney FROM #WinMostTemp t
	LEFT JOIN [dbo].[MemberShip] m
	ON t.MemberID = m.MemberID
	ORDER BY t.TotalWinMoney desc
	
	SELECT TOP(3) m.UserName,t.TotalWinMoney FROM #WinMostTemp t
	LEFT JOIN [dbo].[MemberShip] m
	ON t.MemberID = m.MemberID
	ORDER BY t.TotalWinMoney
END
GO
/****** Object:  StoredProcedure [dbo].[sp_WinLoseReport]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20200308			Yark				進行代理費計算
-- 2			20200310			Yark				加入Statement Report
-- 3			20200713			Yark				加入CurrentPeriod
-- 4			20200816			Yark				CashRebate修改為流水不是輸贏
-- 5			20200924			Ben					改為WinLoseReport, 移除Referal,CashBack,CashRebate
-- 6			20201124			Yark				MPlayer改用Update取得資料
-- 7			20210226			Yark				MPlayerReport加入LotteryTypeID,LotteryClassID
-- 8			20210713			Yark				加入判斷Reset欄位(重新計算註單的不能列入一般計算)
-- 9			20210828			Yark				Boss說 2D 3D 4D都不要還本金
-- =============================================
CREATE PROCEDURE [dbo].[sp_WinLoseReport]
AS
BEGIN
	DECLARE @userCount int;										-- 要計算的用戶數
	DECLARE @memberID int;
	DECLARE @mPlayerCount int;
	DECLARE @winMoney decimal(18, 4);
	DECLARE @qty decimal(18, 4);
	DECLARE @price decimal(18, 4);
	DECLARE @discountPrice decimal(18, 4);
	DECLARE @mPlayerID int;
	DECLARE @isReset int;

	DECLARE @typeCode NVarchar(200) = 'Win';
	DECLARE @Status NVarchar(200) = '';
	DECLARE @recordMoney NVarchar(200) = '';					--WinMoney
	DECLARE @sicboRecordMoney NVarchar(200) = '';				--SicboRecordMoney
	DECLARE @agentMoney decimal(18, 4) = 0;
	DECLARE @dateS NVarchar(200) = '';
	DECLARE @dateE NVarchar(200) = '';
	DECLARE @createDate NVarchar(200) = '';
	DECLARE @currentPeriod NVarchar(100) = '';					--期號
	DECLARE @lotteryInfoID INT;									--玩法ID
	DECLARE @drawTypeID INT;									--玩法計算ID
	DECLARE @lotteryTypeID INT;									--玩法類型ID
	DECLARE @lotteryClassID INT;								--玩法類型ID
	DECLARE @userBalance NVarchar(200);							--用戶餘額
	DECLARE @userWallet DECIMAL(18, 4);							--用戶錢包
	DECLARE @totalBalance DECIMAL(18, 4);						--用戶總餘額
	DECLARE @isWin bit;
	DECLARE @showResultDate DateTime;

	-- 設定啟始與結束時間
	SELECT @dateS = CONVERT(NVarchar, DATEADD(MINUTE, -11, GETDATE()), 120)
		, @dateE=CONVERT(NVarchar, DATEADD(MINUTE, 0, GETDATE()), 120);
		
	--SELECT @dateS = '2021-10-30 00:00:00', @dateE = '2021-10-30 23:59:59'

	DROP TABLE IF EXISTS #tempMPlayer_WinLoseReport
	 --複製當天的投注表
	SELECT * INTO #tempMPlayer_WinLoseReport
		FROM MPlayer with(nolock)
		WHERE [UpdateDate] >= @dateS 
			AND [UpdateDate] <= @dateE
			AND [MemberID] > 0

	-- 用戶日計算的用戶數量
	SELECT @userCount = COUNT(*)
		FROM MemberShip WITH(NOLOCK) 

	WHILE @userCount > 0
	BEGIN
		-- Step 1. 取出用戶資料
		SELECT 
			@memberID = MemberID
			FROM MemberShip WITH(NOLOCK) 
		ORDER BY MemberShip.MemberID
		OFFSET     (@userCount-1) ROWS
		FETCH NEXT 1 ROWS ONLY;
	
		-- Step 2. 取出投注資料
		SET @mPlayerCount = 0;
		SET @winMoney = -1;
		SET @isReset = -1;
		SET @mPlayerID = -1;
		SELECT @mPlayerCount = COUNT(*)  
			FROM #tempMPlayer_WinLoseReport
			WHERE MemberID = @memberID 
				AND isWin in (0,1)

			WHILE @mPlayerCount > 0
			BEGIN
				SELECT @winMoney = WinMoney
					,@isReset = IsReset
					,@discountPrice = DiscountPrice
					,@qty = Qty
					,@price = Price
					,@mPlayerID = ID
					--,@cashBackRebateMoney = CashBackMoney
					,@lotteryInfoID = LotteryInfoID
					,@isWin = IsWin
					,@currentPeriod = CurrentPeriod
					,@createDate = CONVERT(NVarchar, [CreateDate], 120)
					,@showResultDate = ShowResultDate
				FROM #tempMPlayer_WinLoseReport
					WHERE MemberID = @memberID 
						AND isWin in (0, 1)
					ORDER BY ID
				OFFSET     (@mPlayerCount-1) ROWS
				FETCH NEXT 1 ROWS ONLY;
				SET @createDate = CONVERT(NVarchar, DATEADD(SECOND, 1, @createDate), 120);

				--DELETE [Statement] 
				--	WHERE TypeCode = 'Bet'
				--		AND CurrentPeriod = @currentPeriod
				
				-- 20210828 Yark Boss說要
				SELECT @lotteryTypeID = LotteryTypeID
					, @lotteryClassID = LotteryClassID
					, @drawTypeID = DrawTypeID
					FROM LotteryInfo
					WHERE LotteryInfoID = @lotteryInfoID

				SET @typeCode = 'Win'
					
				DECLARE @checkMemberID int = 0;
				DECLARE @checkMPlayerID int = 0;
				DECLARE @checkTypeCode NVarchar(200) = '';

				-- 計算(日)
				IF @isWin = 0
				BEGIN
					SET @recordMoney = -(@qty * @discountPrice);
					SET @typeCode = 'Loss'

					--補單金額
					IF @isReset = 1
					BEGIN
						SET @recordMoney = @winMoney
					END

					SELECT @checkMemberID = ISNULL(MemberID, 0)
						, @checkMPlayerID =  ISNULL(MPlayerID, 0)
						, @checkTypeCode = TypeCode 
					FROM [MPlayerReport]
					WHERE MemberID = @memberID 
						AND CreateDate = @createDate
						AND MPlayerID = @mPlayerID 
						AND TypeCode = @typeCode

					-- 有找到就都使用Update
					IF @checkMemberID > 0 AND @checkMPlayerID > 0
					BEGIN
						--沒有[AgentMoney]
						UPDATE [MPlayerReport]
						SET [TurnOverMoney] = (@qty * @price)
							,[DiscountPrice] = @discountPrice
							,[TypeCode] = @typeCode
							,[CurrentPeriod] = @currentPeriod
							,[RecordMoney] = @recordMoney
							,[AgentLevelSCID] = 32
							,[LotteryTypeID] = @lotteryTypeID
							,[LotteryClassID] = @lotteryClassID
							,[UpdateBy] = 0
							,[UpdateDate] = GETDATE()
						WHERE MemberID = @memberID 
							AND MPlayerID = @mPlayerID 
							AND TypeCode = 'Loss'
					END;
					ELSE
					BEGIN
						--沒有[AgentMoney]
						INSERT INTO MPlayerReport ([MemberID], [MPlayerID], [LotteryTypeID], [LotteryClassID]
							, [CurrentPeriod], [TurnOverMoney], [TypeCode], [Status], [RecordMoney], [CashRebateMoney]
							, [CashBackRebateMoney], [DiscountPrice], [ReferralMoney], [AgentLevelSCID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						values (@memberID, @mPlayerID, @lotteryTypeID, @lotteryClassID
							, @currentPeriod, (@qty * @price), @typeCode, NULL, @recordMoney, NULL
							, NULL, @discountPrice, NULL, 32, 0, @createDate, 0, @dateE )

						-- 加入Statement--
						SELECT @userBalance = [TotalBalance]
							FROM  MemberShip with(nolock) 
							WHERE MemberID = @memberID

						-- 取出用戶錢包
						SELECT @userWallet = CAST(ISNULL(NULLIF(TotalPrice, ''),0) AS decimal(18, 4))
							FROM MWallet WITH(NOLOCK)
							WHERE MemberID = @memberID
								AND CompanyID = 2

						--SET @userBalance = CAST((CAST(@userBalance AS decimal(18, 4)) - CAST(@recordMoney AS decimal(18, 4))) AS NVarchar(200));
						--SET @totalBalance = CAST((CAST(@userBalance AS decimal(18, 4)) + CAST(@recordMoney AS decimal(18, 4))) AS NVarchar(200));
						SET @totalBalance = @userBalance;
						INSERT INTO [Statement] ([MemberID], [CurrentPeriod], [LotteryInfoID], [LotteryTypeID], [LotteryClassID], [Balance]
						, [TypeCode], [ValueMoney], [Total], [ShowResultDate], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						VALUES (@memberID, @currentPeriod, @lotteryInfoID, @lotteryTypeID, @lotteryClassID, @userBalance, 'Loss'
							, '0', CAST(@totalBalance AS NVarchar(200)), @showResultDate, 0, @createDate, 0, @dateE)
						
						-- 更新用戶總餘額
						SET @userBalance = @totalBalance;
						UPDATE MemberShip SET [TotalBalance] = @userBalance
							WHERE MemberID = @memberID

						---- 更新用戶錢包
						SET @userWallet = CAST(@userWallet AS NVarchar(200));
						UPDATE MWallet SET TotalPrice = @userWallet
							WHERE MemberID = @memberID 
								AND CompanyID = 2

					END;
				END;
				Else IF @isWin = 1
				Begin
					SELECT @checkMemberID = ISNULL(MemberID, 0)
						, @checkMPlayerID =  ISNULL(MPlayerID, 0)
						, @checkTypeCode = TypeCode 
					FROM [MPlayerReport]
					WHERE MemberID = @memberID 
						AND MPlayerID = @mPlayerID 
						AND TypeCode = @typeCode
						
					SET @recordMoney = @winMoney;
					
					-- 20210828 Boss說 2D 3D 4D都不要還本金
					IF @drawTypeID >= 142 AND @drawTypeID <= 152
					BEGIN
						SET @recordMoney = @recordMoney - @discountPrice;
					END;

					IF @checkMemberID > 0 AND @checkMPlayerID > 0
					BEGIN
						--沒有[AgentMoney]
						UPDATE [MPlayerReport]
						SET [TurnOverMoney] = (@qty * @price), 
							[DiscountPrice] = @discountPrice,
							[TypeCode] = @typeCode, 
							[CurrentPeriod] = @currentPeriod, 
							[RecordMoney] = @recordMoney, 
							[AgentLevelSCID] = 32, 
							[LotteryTypeID] = @lotteryTypeID, 
							[LotteryClassID] = @lotteryClassID,
							[UpdateBy] = 0, 
							[UpdateDate] = GETDATE()
						WHERE MemberID = @memberID 
							AND MPlayerID = @mPlayerID 
							AND TypeCode = 'Win'
					END;
					ELSE
					BEGIN
						------沒有[AgentMoney]
						INSERT INTO MPlayerReport ([MemberID], [MPlayerID], [LotteryTypeID], [LotteryClassID]
							, [CurrentPeriod], [TurnOverMoney], [DiscountPrice], [TypeCode], [Status], [RecordMoney], [CashRebateMoney]
							, [CashBackRebateMoney], [ReferralMoney], [AgentLevelSCID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						VALUES (@memberID, @mPlayerID, @lotteryTypeID, @lotteryClassID
							, @currentPeriod, (@qty * @price), @discountPrice, @typeCode, NULL, @recordMoney, NULL
							, NULL, NULL, 32, 0, @createDate, 0, GETDATE())
						
						SET @recordMoney = @recordMoney + @discountPrice;

						-- 加入Statement--
						SELECT @userBalance = [TotalBalance]
							FROM  MemberShip WITH(NOLOCK) 
							WHERE MemberID = @memberID

						-- 取出用戶錢包
						SELECT @userWallet = CAST(ISNULL(NULLIF(TotalPrice, ''),0) AS DECIMAL(18, 4))
							FROM MWallet WITH(NOLOCK)
							WHERE MemberID = @memberID 
								AND CompanyID = 2

						SET @totalBalance = CAST((CAST(@userBalance AS DECIMAL(18, 4)) + CAST(@recordMoney AS DECIMAL(18, 4))) AS NVarchar(200));
						
						INSERT INTO [Statement] ([MemberID], [CurrentPeriod], [LotteryInfoID], [LotteryTypeID], [LotteryClassID], [Balance], [TypeCode]
							, [ValueMoney], [Total], [ShowResultDate], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						VALUES (@memberID, @currentPeriod, @lotteryInfoID, @lotteryTypeID, @lotteryClassID, @userBalance, 'Win'
							, @recordMoney, CAST(@totalBalance AS NVarchar(200)), @showResultDate, 0, @createDate, 0, GETDATE())


						-- 更新用戶總餘額
						SET @userBalance = @totalBalance;
						UPDATE MemberShip SET [TotalBalance] = @userBalance
							WHERE MemberID = @memberID

						-- 更新用戶錢包
						SET @userWallet = CAST(@userWallet + CAST(@recordMoney AS decimal(18, 4)) AS NVarchar(200));
						UPDATE MWallet SET TotalPrice = @userWallet
							WHERE MemberID = @memberID 
								AND CompanyID = 2
					END;
				End;
				
				SET @mPlayerCount = @mPlayerCount - 1;
				CONTINUE  
			END;
		SET @userCount = @userCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_WinLoseReportByGame]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =====================p========================
-- 說明: 依據每個遊戲統計該遊戲金額報表del
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20210119			Yark				計算遊戲的投注報表
-- 2			20210308			Ben					新增Agent分層PositionTaking
-- 3			20210626			Ben					修改totalLose數字
-- 4			20210630			Ben					移除撈取今天以前資料，建一個新的Procedure來算，否則資料會混雜
-- =============================================
CREATE PROCEDURE [dbo].[sp_WinLoseReportByGame]
AS
BEGIN
	DECLARE @lotteryTypeCount int = 0;							-- 要計算的遊戲數
	DECLARE @lotteryTypeID int = 0;								-- 遊戲類型ID
	DECLARE @checkTypeData int;									-- 確認類型資料是否存在
	DECLARE @lotteryInfoCount int = 0;							-- 要計算的遊戲數
	DECLARE @lotteryInfoID int = 0;								-- 遊戲項目ID
	DECLARE @lotteryInfoName NVARCHAR(200) = '';				-- 投注項目的名稱
	DECLARE @lotterySelectedCount int = 0;						-- 要計算的遊戲數
	DECLARE @selectedNums NVARCHAR(200) = '';					-- 投注項目
	DECLARE @turnOver DECIMAL(18, 4);							-- 總流水
	DECLARE @totalBet DECIMAL(18, 4);							-- 總投注額
	DECLARE @totalDiscountPrice DECIMAL(18, 4);					-- 總投注額
	DECLARE @totalWin DECIMAL(18, 4);							-- 總贏
	DECLARE @totalLose DECIMAL(18, 4);							-- 總輸
	DECLARE @totalPending DECIMAL(18, 4);						-- 未開獎總額
	DECLARE @fourDCapital DECIMAL(18, 4);						-- 4D/3D/2D 本金
	DECLARE @checkData int;										-- 確認資料是否存在
	DECLARE @memberCount int = 0;								-- 要計算的用戶數
	DECLARE @memberID int = 0;					
	DECLARE @userName NVARCHAR(200);					
	DECLARE @mPositionProfitMap NVARCHAR(MAX);					--Agent分潤表
	DECLARE @mPositionProfitMapCount int = 0;
	DECLARE @positionTaking DECIMAL(18, 4);						-- 
	DECLARE @positionTakingProfit DECIMAL(18, 4);				--
	DECLARE @platform  NVARCHAR(200) = 'HKGPLottery';
	DECLARE @platformID int = 0;
	
	DECLARE @dateS NVARCHAR(200) = '';	
	DECLARE @dateE NVARCHAR(200) = '';							-- 
	DECLARE @dateS_4D NVARCHAR(200) = '';							-- 
	--DECLARE @dateS_4D NVARCHAR(200) = '';						-- 
	--DECLARE @createDate NVARCHAR(200) = '';						-- 

	-- 設定啟始與結束時間
	SELECT @dateS = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 00:00:00'
	, @dateE = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 23:59:59'
	, @dateS_4D= CONVERT(varchar, DATEADD(DAY, -7, getdate()), 111)+' 00:00:00';
	
	--SELECT @dateS = '2021-9-16 00:00:00'
	--, @dateE = '2021-9-16 23:59:59';

	--SELECT @dateS, @dateE

	SELECT @platformID = ID FROM PlatformSetting WHERE PlatformName = @platform

	DROP TABLE IF EXISTS #tempMemberShip_WinLoseReportByGame
	 --複製當天的投注表
	SELECT * INTO #tempMemberShip_WinLoseReportByGame 
		FROM [MemberShip] WITH(NOLOCK)
		WHERE [AgentLevelSCID] = 32

	DROP TABLE IF EXISTS #tempVwMPlayer_WinLoseReportByGame
	 --複製當天的投注表
	SELECT * INTO #tempVwMPlayer_WinLoseReportByGame 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [UpdateDate] >= @dateS 
			AND [UpdateDate] <= @dateE
			AND [CompanyID] = @platformID
			AND [MemberID] > 0
			AND [IsReset] = 0

	--DROP TABLE IF EXISTS #tempVwMPlayer_WinLoseReportByGameReport
	-- --複製當天的投注表
	--SELECT * INTO #tempVwMPlayer_WinLoseReportByGameReport
	--	FROM [VwMPlayerReport] WITH(NOLOCK)
	--	WHERE [CreateDate] >= @dateS 
	--		AND [CreateDate] <= @dateE
	--		AND [TypeCode] in ('Win', 'Loss')

	DROP TABLE IF EXISTS #tempVwMPlayer_WinLoseReportByGameBySelected
	SELECT LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums INTO #tempVwMPlayer_WinLoseReportByGameBySelected 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [UpdateDate] >= @dateS 
			AND [UpdateDate] <= @dateE
			AND [CompanyID] = @platformID
			AND [MemberID] > 0
		GROUP BY LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums

	--4D算Pending金額 依照Agent分層
	DROP TABLE IF EXISTS #tempVwMPlayer_WinLoseReportByGameBySelectedAndMember
	SELECT LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums, MemberID, GameDealerMemberID
	INTO #tempVwMPlayer_WinLoseReportByGameBySelectedAndMember 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [UpdateDate] >= @dateS 
			AND [UpdateDate] <= @dateE
			AND [CompanyID] = @platformID
			AND [MemberID] > 0
			AND [IsWin] is null
		GROUP BY LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums, MemberID, GameDealerMemberID

	SELECT @lotteryTypeCount = COUNT(*) 
		FROM [dbo].[LotteryType] WITH(NOLOCK)

	WHILE @lotteryTypeCount > 0
	BEGIN
		SET @lotteryTypeID = 0;
		SET @lotteryInfoID = 0;
		SET @lotteryInfoName = '';
		SET @selectedNums = '';
		SET @totalBet = 0;
		SET @totalWin = 0;
		SET @fourDCapital = 0;
		SET @totalPending = 0;
		SET @memberID = 0;

		-- Step 1. 從Lottery進行大分類的加總
		SELECT @lotteryTypeID = LotteryTypeID
			FROM [dbo].[LotteryType] WITH(NOLOCK) 
		ORDER BY [dbo].[LotteryType].[LotteryTypeID]
		OFFSET     (@lotteryTypeCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;

		SELECT @checkTypeData = COUNT(*)
			FROM #tempVwMPlayer_WinLoseReportByGame
			WHERE LotteryTypeID = @lotteryTypeID
			
		-- 以下處理大項類別
		IF @checkTypeData > 0
		BEGIN
			Select @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 ),
				@totalDiscountPrice = ISNULL(SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer_WinLoseReportByGame
				WHERE LotteryTypeID = @lotteryTypeID

			Select @totalWin = ISNULL(SUM(CAST(NULLIF(WinMoney, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer_WinLoseReportByGame
				WHERE IsWin in (1,0)
					AND LotteryTypeID = @lotteryTypeID

			--計算WinLose 4D/3D/2D須扣除本金
			SELECT @fourDCapital = ISNULL(SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer_WinLoseReportByGame m LEFT JOIN LotteryInfo l ON m.LotteryInfoID = l.LotteryInfoID
				WHERE IsWin = 1
					AND m.LotteryTypeID = @lotteryTypeID AND l.DrawTypeID >= 142 AND l.DrawTypeID <= 152

			Select @totalLose = ISNULL(-SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer_WinLoseReportByGame
				WHERE IsWin = 0
					AND LotteryTypeID = @lotteryTypeID

			Select @totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer_WinLoseReportByGame
				WHERE IsWin IS NULL
					AND LotteryTypeID = @lotteryTypeID
					
			SET @totalBet = ISNULL(@totalBet, 0);
			SET @totalDiscountPrice = ISNULL(@totalDiscountPrice,0);
			SET @totalWin = ISNULL(@totalWin, 0) - ISNULL(@fourDCapital, 0);
			SET @totalPending = ISNULL(@totalPending, 0);

			--SET @totalLose = @totalBet - @totalWin;
			
			SELECT @lotteryTypeID,@totalBet,@totalDiscountPrice,@totalWin,@totalPending,@fourDCapital

			SELECT @checkData = COUNT(*)
				FROM [dbo].[WinLoseReportByGameTotal]
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = 0
					AND MemberID = 0
					AND GameDealerMemberID = 0
					AND CreateDate = @dateS
					AND PlatfromID = @platformID

			IF @checkData > 0
			BEGIN
				UPDATE [dbo].[WinLoseReportByGameTotal]
					SET [TotalBet] = @totalBet
						, [TotalDiscountPrice] = @totalDiscountPrice
						, [TotalWin] = @totalWin
						, [TotalLose] = @totalLose
						, [TotalPending] = @totalPending
						, [UpdateDate] = GETDATE()
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = 0
						AND MemberID = 0
						AND GameDealerMemberID = 0
						AND CreateDate = @dateS
						AND PlatfromID = @platformID
						
				--SELECT @totalPending
				--@totalPending等於0時 更新&刪除之前Pending資料
				IF @totalPending = 0
				BEGIN
					UPDATE [dbo].[WinLoseReportByGameTotal] 
					SET TotalBet = (CASE WHEN CreateDate < @dateS AND TotalPending > 0 
										THEN TotalBet - TotalPending ELSE TotalBet END)
						,TotalPending = 0
						WHERE LotteryTypeID = @lotteryTypeID
							AND PlatfromID = @platformID
							AND CreateDate > @dateS_4D
							AND Totalpending > 0
							
					DELETE [dbo].[WinLoseReportByGameTotal] 
					WHERE LotteryTypeID = @lotteryTypeID
						AND TotalBet = 0
						AND PlatfromID = @platformID
						AND CreateDate > @dateS_4D
						
					UPDATE openrowset('SQLOLEDB', '192.82.60.148'; 'MasterUser'; '@master85092212', [MasterGHL].[dbo].[WinLoseReportByGameTotal])
					SET TotalBet = (CASE WHEN CreateDate < @dateS AND TotalPending > 0 
										THEN TotalBet - TotalPending ELSE TotalBet END)
						,TotalPending = 0
						WHERE LotteryTypeID = @lotteryTypeID
							AND PlatfromID = @platformID
							AND CreateDate > @dateS_4D
							AND Totalpending > 0
							
					DELETE openrowset('SQLOLEDB', '192.82.60.148'; 'MasterUser'; '@master85092212', [MasterGHL].[dbo].[WinLoseReportByGameTotal])
					WHERE LotteryTypeID = @lotteryTypeID
						AND TotalBet = 0
						AND PlatfromID = @platformID
						AND CreateDate > @dateS_4D
				END
			END;
			ELSE IF @totalBet > 0 OR @totalPending > 0
			BEGIN
				INSERT INTO [dbo].[WinLoseReportByGameTotal]
					([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [SelectedNums], [TotalBet], [TotalWin]
					, [TotalLose], [TotalPending], [PlatfromID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
				Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @selectedNums, @totalBet, @totalWin
					, @totalLose, @totalPending, @platformID, 0, @dateS, 0, GETDATE())
			END;
		END;
		-- ./以下處理大項類別

		-- 以下處理遊戲類別
		SELECT @lotteryInfoCount = COUNT(*)
			FROM [dbo].[LotteryInfo] WITH(NOLOCK) 
			WHERE LotteryTypeID = @lotteryTypeID

		WHILE @lotteryInfoCount > 0
		BEGIN
			SET @lotteryInfoName = '';
			SET @selectedNums = '';
			SET @totalBet = 0;
			SET @totalDiscountPrice = 0;
			SET @totalWin = 0;
			SET @totalPending = 0;

			SELECT @lotteryInfoID = [LotteryInfoID]
				FROM [dbo].[LotteryInfo] WITH(NOLOCK) 
				WHERE LotteryTypeID = @lotteryTypeID
			ORDER BY [dbo].[LotteryInfo].[LotteryInfoID]
			OFFSET     (@lotteryInfoCount - 1) ROWS
			FETCH NEXT 1 ROWS ONLY;
			
			SELECT @checkTypeData = COUNT(*)
				FROM #tempVwMPlayer_WinLoseReportByGame
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID

			IF @checkTypeData > 0
			BEGIN
				SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 ),
					@totalDiscountPrice = ISNULL(SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer_WinLoseReportByGame
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID

				SELECT @totalWin = ISNULL(SUM(CAST(NULLIF(WinMoney, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer_WinLoseReportByGame
					WHERE IsWin in (1,0)
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						
				SELECT @totalLose = ISNULL(-SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer_WinLoseReportByGame
					WHERE IsWin = 0
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID

				SELECT @totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer_WinLoseReportByGame
					WHERE IsWin IS NULL
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
					
				SET @totalBet = ISNULL(@totalBet, 0);
				SET @totalDiscountPrice = ISNULL(@totalDiscountPrice, 0);
				SET @totalWin = ISNULL(@totalWin, 0);
				SET @totalPending = ISNULL(@totalPending, 0);

				--SET @totalLose = @totalBet - @totalWin;

				SELECT @checkData = COUNT(*)		
					FROM [dbo].[WinLoseReportByGameTotal]
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND MemberID = 0
						AND GameDealerMemberID = 0
						AND SelectedNums = ''
						AND CreateDate = @dateS
						AND PlatfromID = @platformID

				IF @checkData > 0
				BEGIN
					UPDATE [dbo].[WinLoseReportByGameTotal]
						SET [TotalBet] = @totalBet
							, [TotalDiscountPrice] = @totalDiscountPrice
							, [TotalWin] = @totalWin
							, [TotalLose] = @totalLose
							, [TotalPending] = @totalPending
							, [UpdateDate] = GETDATE()
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND SelectedNums = ''
							AND CreateDate = @dateS
							AND PlatfromID = @platformID
				END;
				ELSE IF @totalBet > 0 OR @totalPending > 0
				BEGIN
					INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [SelectedNums], [TotalBet], [TotalWin]
						, [TotalLose], [TotalPending], [PlatfromID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
					Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @selectedNums, @totalBet, @totalWin
						, @totalLose, @totalPending, @platformID, 0, @dateS, 0, GETDATE())
				END;
			END;

			-- 處理Selected項目
			SELECT @lotterySelectedCount = COUNT(*)
				FROM #tempVwMPlayer_WinLoseReportByGameBySelected
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID

			WHILE @lotterySelectedCount > 0
			BEGIN
				SET @totalBet = 0;
				SET @totalDiscountPrice =0;
				SET @totalPending = 0;

				SELECT @lotteryInfoName = LotteryInfoName
					, @selectedNums = SelectedNums
					FROM #tempVwMPlayer_WinLoseReportByGameBySelected
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
					ORDER BY #tempVwMPlayer_WinLoseReportByGameBySelected.[LotteryInfoID]
					OFFSET     (@lotterySelectedCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;

				SELECT @checkTypeData = COUNT(*)
					FROM #tempVwMPlayer_WinLoseReportByGame
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND LotteryInfoName = @lotteryInfoName
						AND SelectedNums = @selectedNums

				IF @checkTypeData > 0
				BEGIN
					SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 ),
						@totalDiscountPrice = ISNULL(SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer_WinLoseReportByGame
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums

					SELECT @totalWin = ISNULL(SUM(CAST(NULLIF(WinMoney, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer_WinLoseReportByGame
						WHERE IsWin in (1,0)
							AND LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
							
					SELECT @totalLose = ISNULL(-SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer_WinLoseReportByGame
						WHERE IsWin = 0
							AND LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums

					SELECT @totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer_WinLoseReportByGame
						WHERE IsWin IS NULL
							AND LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
					
					SET @totalBet = ISNULL(@totalBet, 0);
					SET @totalDiscountPrice = ISNULL(@totalDiscountPrice,0);
					SET @totalWin = ISNULL(@totalWin, 0);
					SET @totalPending = ISNULL(@totalPending, 0);

					--SET @totalLose = @totalBet - @totalWin;

					SELECT @checkData = COUNT(*)
						FROM [dbo].[WinLoseReportByGameTotal]
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
							AND CreateDate = @dateS
							AND MemberID = 0
							AND GameDealerMemberID = 0
							AND PlatfromID = @platformID

					IF @checkData > 0
					BEGIN
						UPDATE [dbo].[WinLoseReportByGameTotal]
							SET [TotalBet] = @totalBet
								, [TotalDiscountPrice] = @totalDiscountPrice
								, [TotalWin] = @totalWin
								, [TotalLose] = @totalLose
								, [TotalPending] = @totalPending
								, [UpdateDate] = GETDATE()
							WHERE LotteryTypeID = @lotteryTypeID
								AND LotteryInfoID = @lotteryInfoID
								AND LotteryInfoName = @lotteryInfoName
								AND SelectedNums = @selectedNums
								AND CreateDate = @dateS
								AND MemberID = 0
								AND GameDealerMemberID = 0
								AND PlatfromID = @platformID
					END;
					ELSE IF @totalBet > 0 OR @totalPending > 0
					BEGIN
						INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [SelectedNums], [TotalBet], [TotalWin]
							, [TotalLose], [TotalPending], [PlatfromID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @selectedNums, @totalBet, @totalWin
							, @totalLose, @totalPending, @platformID, 0, @dateS, 0, GETDATE())
					END;
				END;

				SET @lotterySelectedCount = @lotterySelectedCount - 1;
			END;
			-- ./處理Selected項目

			
			--2021.3.4 新增Agent分潤相關資料
			SELECT @memberCount = COUNT(*)
				FROM #tempVwMPlayer_WinLoseReportByGameBySelectedAndMember
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID
					AND MemberID > 0

			WHILE @memberCount > 0
			BEGIN
				SET @totalBet = 0;
				SET @totalDiscountPrice =0;
				SET @totalPending = 0;
				SET @totalLose = 0;

				SELECT @memberID = MemberID,
						@lotteryInfoName = LotteryInfoName,
						@selectedNums = SelectedNums
					FROM #tempVwMPlayer_WinLoseReportByGameBySelectedAndMember
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND MemberID > 0
					ORDER BY #tempVwMPlayer_WinLoseReportByGameBySelectedAndMember.[MemberID]
					OFFSET     (@memberCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;
					
				SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 ),
					@totalDiscountPrice = ISNULL(SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 ),
					@totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer_WinLoseReportByGame
					WHERE IsWin IS NULL
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND LotteryInfoName = @lotteryInfoName
						AND SelectedNums = @selectedNums
						AND MemberID = @memberID
				

				IF @totalPending = 0 or @totalPending is null
				BEGIN
					SET @memberCount = @memberCount - 1;
					CONTINUE;
				END

				SELECT @mPositionProfitMap = AgentParentMap FROM #tempMemberShip_WinLoseReportByGame WHERE MemberID = @memberID
				SELECT @mPositionProfitMapCount = COUNT(*) FROM [MPositionProfitMap] WHERE AgentParentMap = @mPositionProfitMap
				
				--SELECT @memberID,@totalBet,@totalPending,@lotteryInfoName,@selectedNums,@mPositionProfitMap

				WHILE @mPositionProfitMapCount > 0
				BEGIN
					SELECT @positionTaking = PositionTakingProfit, @memberID = MemberID
					FROM MPositionProfitMap
					WHERE AgentParentMap = @mPositionProfitMap 
					ORDER BY MPositionProfitMap.ID
					OFFSET     (@mPositionProfitMapCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;
				
					--IF @memberID = 2
					--BEGIN
					--	SELECT @memberID,@totalBet,@totalPending,@lotteryInfoName,@selectedNums
					--END

					IF @positionTaking = 0
					BEGIN
						SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
						continue;
					END

					SET @positionTakingProfit = @totalPending * @positionTaking;

					SELECT @checkData = COUNT(*)
						FROM [dbo].[WinLoseReportByGameTotal]
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
							AND CreateDate = @dateS
							AND MemberID = @memberID
							AND PlatfromID = @platformID

					IF @checkData > 0
					BEGIN
						--SELECT @memberID,@positionTakingProfit
						UPDATE [dbo].[WinLoseReportByGameTotal]
							SET [TotalBet] = @totalBet
								, [TotalDiscountPrice] = @totalDiscountPrice
								, [TotalWin] = @totalWin
								, [TotalLose] = @totalLose
								, [TotalPending] = @positionTakingProfit
								, [UpdateDate] = GETDATE()
							WHERE LotteryTypeID = @lotteryTypeID
								AND LotteryInfoID = @lotteryInfoID
								--AND LotteryInfoName = @lotteryInfoName
								AND SelectedNums = @selectedNums
								AND CreateDate = @dateS
								AND MemberID = @memberID
								AND PlatfromID = @platformID
					END;
					ELSE IF @totalBet > 0 OR @totalPending > 0
					BEGIN
						INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [MemberID], [SelectedNums], [TotalBet], [TotalWin]
							, [TotalLose], [TotalPending], [PlatfromID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @memberID, @selectedNums, @totalBet, @totalWin
							, @totalLose, @positionTakingProfit, @platformID, 0, @dateS, 0, GETDATE())
					END;

						
					SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
				END

				SET @memberCount = @memberCount - 1;
			END			
			--2021.3.4

			SET @lotteryInfoCount = @lotteryInfoCount - 1;
		END;
		-- ./以下處理遊戲類別

		
		-- 以下處理用戶
		SET @memberCount = 0;
		SELECT @memberCount = COUNT(*)
			FROM #tempMemberShip_WinLoseReportByGame

		WHILE @memberCount > 0
		BEGIN
			SET @lotteryInfoName = '';
			SET @selectedNums = '';
			SET @totalBet = 0;
			SET @totalDiscountPrice =0;
			SET @totalWin = 0;
			SET @totalLose = 0;
			SET @totalPending = 0;
			SET @lotteryInfoID = 0;

			SELECT  @memberID = MemberID, @userName = UserName
				FROM #tempMemberShip_WinLoseReportByGame
				ORDER BY #tempMemberShip_WinLoseReportByGame.[MemberID]
				OFFSET     (@memberCount - 1) ROWS
				FETCH NEXT 1 ROWS ONLY;
				
			--SELECT @totalBet = SUM(CAST(ISNULL(NULLIF([TurnOverMoney], ''),0 ) AS DECIMAL(18, 4)))
			--	FROM #tempVwMPlayer_WinLoseReportByGameReport
			--	WHERE [TypeCode] in ('Win', 'Loss')
			--		AND MemberID = @memberID
			--		AND LotteryTypeID = @lotteryTypeID
				
			--SELECT @totalLose = SUM(CAST(ISNULL(NULLIF([RecordMoney], ''),0 ) AS DECIMAL(18, 4)))
			--	FROM #tempVwMPlayer_WinLoseReportByGameReport
			--	WHERE [TypeCode] in ('Loss')
			--		AND MemberID = @memberID
			--		AND LotteryTypeID = @lotteryTypeID

			--SELECT @totalWin = SUM(CAST(ISNULL(NULLIF([RecordMoney], ''),0 ) AS DECIMAL(18, 4)))
			--	FROM #tempVwMPlayer_WinLoseReportByGameReport
			--	WHERE [TypeCode] in ('Win')
			--		AND MemberID = @memberID
			--		AND LotteryTypeID = @lotteryTypeID
			IF (SELECT COUNT(*) FROM #tempVwMPlayer_WinLoseReportByGame
				WHERE MemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID) = 0
			BEGIN
				SET @memberCount = @memberCount - 1;
				continue;
			END

			SELECT @totalBet = SUM(CAST(ISNULL(NULLIF([Price], ''),0 ) AS DECIMAL(18, 4))),
				@totalDiscountPrice = SUM(CAST(ISNULL(NULLIF([DiscountPrice], ''),0 ) AS DECIMAL(18, 4)))
				FROM #tempVwMPlayer_WinLoseReportByGame
				WHERE MemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID

			SELECT @totalPending = ISNULL(SUM(CAST(ISNULL(NULLIF([Price], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer_WinLoseReportByGame
				WHERE IsWin is null
					AND MemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID
				
			SELECT @totalLose = ISNULL(-SUM(CAST(ISNULL(NULLIF([DiscountPrice], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer_WinLoseReportByGame
				WHERE IsWin = 0
					AND MemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID

			SELECT @totalWin = ISNULL(SUM(CAST(ISNULL(NULLIF([WinMoney], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer_WinLoseReportByGame
				WHERE IsWin in (1,0)
					AND MemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID
			
			SELECT @checkData = COUNT(*)
				FROM [dbo].[WinLoseReportByGameTotal]
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = 0
					AND MemberID = @memberID
					AND CreateDate = @dateS
					AND PlatfromID = @platformID


			IF @checkData > 0
			BEGIN
				UPDATE [dbo].[WinLoseReportByGameTotal]
					SET [TotalBet] = @totalBet
						, [TotalDiscountPrice] = @totalDiscountPrice
						, [TotalWin] = @totalWin
						, [TotalLose] = @totalLose
						, [TotalPending] = @totalPending
						, [UpdateDate] = GETDATE()
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = 0
						AND MemberID = @memberID
						AND CreateDate = @dateS
						AND PlatfromID = @platformID
			END;
			ELSE IF @totalBet > 0
			BEGIN
				INSERT INTO [dbo].[WinLoseReportByGameTotal]
				([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [MemberID], [SelectedNums], [TotalBet], [TotalDiscountPrice], [TotalWin]
					, [TotalLose], [TotalPending], [PlatfromID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
				Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @memberID, @selectedNums, @totalBet, @totalDiscountPrice, @totalWin
					, @totalLose, @totalPending, @platformID, 0, @dateS, 0, GETDATE())
			END;

			SET @memberCount = @memberCount - 1;
		END;
		-- ./ 以下處理用戶

		SET @lotteryTypeCount = @lotteryTypeCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_WinLoseReportByGameAgent]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- 說明: 依據每個遊戲統計該遊戲金額報表
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20210119			Yark				計算遊戲的投注報表
-- 2			20210308			Ben					新增Agent分層PositionTaking
-- 3			20210626			Ben					修改totalLose數字
-- 4			20210630			Ben					移除撈取今天以前資料，建一個新的Procedure來算，否則資料會混雜
-- 5			20210825			Ben					將GameDealer單也算進同Table,以PlatformID區分
-- =============================================
CREATE PROCEDURE [dbo].[sp_WinLoseReportByGameAgent]
AS
BEGIN
	DECLARE @lotteryTypeCount int = 0;							-- 要計算的遊戲數
	DECLARE @lotteryTypeID int = 0;								-- 遊戲類型ID
	DECLARE @checkTypeData int;									-- 確認類型資料是否存在
	DECLARE @lotteryInfoCount int = 0;							-- 要計算的遊戲數
	DECLARE @lotteryInfoID int = 0;								-- 遊戲項目ID
	DECLARE @lotteryInfoName NVARCHAR(200) = '';				-- 投注項目的名稱
	DECLARE @lotterySELECTedCount int = 0;						-- 要計算的遊戲數
	DECLARE @SelectedNums NVARCHAR(200) = '';					-- 投注項目
	DECLARE @turnOver DECIMAL(18, 4);							-- 總流水
	DECLARE @totalSMWinLose DECIMAL(18, 4);						-- 總投注額
	DECLARE @totalMWinLose DECIMAL(18, 4);						-- 總贏
	DECLARE @totalAGWinLose DECIMAL(18, 4);						-- 總輸
	DECLARE @totalBet DECIMAL(18, 4);							-- 總投注額
	DECLARE @totalWin DECIMAL(18, 4);							-- 總贏
	DECLARE @totalAgentWin DECIMAL(18, 4);						-- 總贏
	DECLARE @totalLose DECIMAL(18, 4);							-- 總輸
	DECLARE @totalAgentLose DECIMAL(18, 4);						-- 總輸
	DECLARE @totalPending DECIMAL(18, 4);						-- 未開獎總額
	DECLARE @checkData int;										-- 確認資料是否存在
	DECLARE @memberCount int = 0;								-- 要計算的用戶數
	DECLARE @gameDealerMemberCount int = 0;						-- 要計算的用戶數
	DECLARE @memberID int = 0;					
	DECLARE @agentMemberID int = 0;					
	DECLARE @agentLevelID int = 0;					
	DECLARE @gameDealerMemberID int = 0;									
	DECLARE @agentGameDealerMemberID int = 0;					
	DECLARE @userName NVARCHAR(200);					
	DECLARE @mPositionProfitMap NVARCHAR(MAX);					--Agent分潤表
	DECLARE @mPositionProfitMapCount int = 0;
	DECLARE @positionTaking DECIMAL(18, 4);						-- 
	DECLARE @positionTakingProfit DECIMAL(18, 4) = 0;			-- 
	DECLARE @platform  NVARCHAR(200) = 'HKGPLottery';
	DECLARE @platformID int = 0;
	DECLARE @gameDealerPlatform  NVARCHAR(200) = 'HL';
	DECLARE @gameDealerPlatformID int = 0;
	
	DECLARE @dateS NVARCHAR(200) = '';	
	DECLARE @dateE NVARCHAR(200) = '';							-- 
	--DECLARE @dateS_4D NVARCHAR(200) = '';						-- 
	--DECLARE @createDate NVARCHAR(200) = '';						-- 

	-- 設定啟始與結束時間
	SELECT @dateS = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 00:00:00'
	, @dateE = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 23:59:59'
	--, @dateS_4D= CONVERT(varchar, DATEADD(DAY, -3, getdate()), 111)+' 00:00:00';

	--SELECT @dateS = '2021-9-26 00:00:00' , @dateE = '2021-9-26 23:59:59';

	SELECT @dateS, @dateE
	
	SELECT @platformID = ID FROM PlatformSetting WHERE PlatformName = @platform
	SELECT @gameDealerPlatformID = ID FROM PlatformSetting WHERE PlatformName = @gameDealerPlatform
	
	DROP TABLE IF EXISTS #tempVwMPlayer
	 --複製當天的投注表
	SELECT * INTO #tempVwMPlayer 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [UpdateDate] >= @dateS 
			AND [UpdateDate] <= @dateE
			AND [IsReset] = 0
			AND [IsWin] IN (0,1)
			
	DROP TABLE IF EXISTS #tempMPlayerReport
	 --複製當天的投注表
	SELECT * INTO #tempMPlayerReport 
		FROM [MPlayerReport] WITH(NOLOCK)
		WHERE MPlayerID in (SELECT ID FROM #tempVwMPlayer WHERE MemberID > 0)
			AND [TypeCode] in ('Win','Loss')
	
	DROP TABLE IF EXISTS #tempGameDealerMPlayerReport
	 --複製當天的投注表
	SELECT * INTO #tempGameDealerMPlayerReport 
		FROM [GameDealerMPlayerReport] WITH(NOLOCK)
		WHERE MPlayerID in (SELECT ID FROM #tempVwMPlayer WHERE GameDealerMemberID > 0)
			AND [TypeCode] in ('Win','Loss')

	DROP TABLE IF EXISTS #tempVwMPlayerByLotteryType
	SELECT LotteryTypeID, MemberID, GameDealerMemberID INTO #tempVwMPlayerByLotteryType 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [UpdateDate] >= @dateS 
			AND [UpdateDate] <= @dateE
			AND [IsReset] = 0
		GROUP BY LotteryTypeID, MemberID, GameDealerMemberID
		
	DROP TABLE IF EXISTS #tempMemberShip
	SELECT m.MemberID,m.AgentLevelSCID,m.AgentParentMap INTO #tempMemberShip
		FROM #tempVwMPlayer t LEFT JOIN MemberShip m ON t.MemberID = m.MemberID
		GROUP BY m.MemberID,m.AgentLevelSCID,m.AgentParentMap
	
	DROP TABLE IF EXISTS #tempGameDealerAgentMember
	SELECT m.MemberID,m.AgentLevelSCID,m.AgentParentMap INTO #tempGameDealerAgentMember
		FROM #tempVwMPlayer t LEFT JOIN GameDealerMemberShip m ON t.GameDealerMemberID = m.MemberID
		GROUP BY m.MemberID,m.AgentLevelSCID,m.AgentParentMap

	INSERT INTO #tempGameDealerAgentMember
	SELECT MemberID,AgentLevelSCID,AgentParentMap 
		FROM GameDealerMemberShip WHERE AgentLevelSCID < 32

	SELECT @lotteryTypeCount = COUNT(*) 
		FROM [dbo].[LotteryType] WITH(NOLOCK)

	WHILE @lotteryTypeCount > 0
	BEGIN
		SET @lotteryTypeID = 0;
		SET @lotteryInfoID = 0;
		SET @lotteryInfoName = '';
		SET @SelectedNums = '';
		SET @totalBet = 0;
		SET @totalWin = 0;
		SET @totalPending = 0;
		SET @memberID = 0;

		-- Step 1. 從Lottery進行大分類的加總
		SELECT @lotteryTypeID = LotteryTypeID
			FROM [dbo].[LotteryType] WITH(NOLOCK) 
		ORDER BY [dbo].[LotteryType].[LotteryTypeID]
		OFFSET     (@lotteryTypeCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;

		SELECT @checkTypeData = COUNT(*)
			FROM #tempVwMPlayer
			WHERE LotteryTypeID = @lotteryTypeID
			
		-- 以下處理大項類別
		IF @checkTypeData > 0
		BEGIN
			SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(TurnOverMoney, '') AS DECIMAL(18, 4))),0 )
				FROM #tempMPlayerReport
				WHERE LotteryTypeID = @lotteryTypeID
					AND TypeCode in ('Win','Loss')

			SELECT @totalWin = ISNULL(SUM(CAST(NULLIF(RecordMoney, '') AS DECIMAL(18, 4))),0 )
				FROM #tempMPlayerReport
				WHERE LotteryTypeID = @lotteryTypeID
					AND TypeCode = 'Win'

			SELECT @totalLose = ISNULL(SUM(CAST(NULLIF(RecordMoney, '') AS DECIMAL(18, 4))),0 )
				FROM #tempMPlayerReport
				WHERE LotteryTypeID = @lotteryTypeID
					AND TypeCode = 'Loss'

			-- 以下處理用戶
			SET @memberCount = 0;
			SELECT @memberCount = COUNT(*)
				FROM #tempVwMPlayerByLotteryType
				WHERE LotteryTypeID = @lotteryTypeID
					AND  MemberID > 0

			WHILE @memberCount > 0
			BEGIN
				SET @totalAgentWin = 0;
				SET @totalAgentLose = 0;

				SELECT @memberID = MemberID
					FROM #tempVwMPlayerByLotteryType
					WHERE LotteryTypeID = @lotteryTypeID
						AND  MemberID > 0
					ORDER BY #tempVwMPlayerByLotteryType.[MemberID]
					OFFSET     (@memberCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;

				-- 取得該用戶的總Win
				SELECT @totalAgentWin = ISNULL(SUM(CAST(NULLIF(RecordMoney, '') AS DECIMAL(18, 4))),0 )
				FROM #tempMPlayerReport
				WHERE LotteryTypeID = @lotteryTypeID
					AND MemberID = @memberID
					AND TypeCode = 'Win'

				-- 取得該用戶的總Lose
				SELECT @totalAgentLose = ISNULL(SUM(CAST(NULLIF(RecordMoney, '') AS DECIMAL(18, 4))),0 )
				FROM #tempMPlayerReport
				WHERE LotteryTypeID = @lotteryTypeID
					AND  MemberID = @memberID
					AND TypeCode = 'Loss'
							
				SELECT @mPositionProfitMap = AgentParentMap 
					FROM #tempMemberShip 
					WHERE MemberID = @memberID
				
				SELECT @mPositionProfitMapCount = COUNT(*) 
					FROM [MPositionProfitMap] 
					WHERE AgentParentMap = @mPositionProfitMap

				SELECT @lotteryTypeID,@mPositionProfitMapCount
				WHILE @mPositionProfitMapCount > 0
				BEGIN
					SET @totalSMWinLose = 0;
					SET @totalMWinLose = 0;
					SET @totalAGWinLose = 0;
					SELECT @positionTaking = PositionTakingProfit
						, @agentMemberID = MemberID
						FROM MPositionProfitMap With(Nolock)
						WHERE AgentParentMap = @mPositionProfitMap 
						ORDER BY MPositionProfitMap.ID
					OFFSET     (@mPositionProfitMapCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;

					SELECT @agentLevelID = AgentLevelSCID
						FROM #tempMemberShip
						WHERE MemberID = @agentMemberID
						
					IF @positionTaking = 0 or @agentLevelID = 28
					BEGIN
						SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
						continue;
					END
					--SET @positionTakingProfit = (@totalAgentWin - @totalAgentLose) * @positionTaking;
					
					IF @agentLevelID = 31
					BEGIN
						SET @totalAGWinLose = (@totalAgentWin + @totalAgentLose) * @positionTaking;
					END;
					ELSE IF @agentLevelID = 30
					BEGIN
						SET @totalMWinLose = (@totalAgentWin + @totalAgentLose) * @positionTaking;
					END;
					ELSE IF @agentLevelID = 29
					BEGIN
						SET @totalSMWinLose = (@totalAgentWin + @totalAgentLose) * @positionTaking;
					END;
					
					--SELECT '@memberID'=@memberID
					--	, '@totalBet'=@totalBet
					--	, '@totalWin'=@totalWin
					--	, '@totalLose'=@totalLose
					--	, '@mPositionProfitMap'=@mPositionProfitMap
					--	, [TotalBet] = @totalBet
					--	, [SMTotalWinLose] = @totalSMWinLose
					--	, [MTotalWinLose] = @totalMWinLose
					--	, [AGTotalWinLose] = @totalAGWinLose

					SELECT @checkData = COUNT(*)
						FROM [dbo].[WinLoseReportByGameTotal]
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND SELECTedNums = @SelectedNums
							AND CreateDate = @dateS
							AND [MemberID] = @memberID
							AND [AgentMemberID] = @agentMemberID
							AND AgentLevelSCID = @agentLevelID
							AND (SMTotalWinLose > 0
							or MTotalWinLose > 0
							or AGTotalWinLose > 0)
							AND PlatfromID = @platformID
							--AND (SMTotalWinLose = @totalSMWinLose or MTotalWinLose = @totalMWinLose or AGTotalWinLose = @totalAGWinLose)
					
					--SELECT @checkData as 'checkData',@lotteryTypeID as 'lotteryTypeID',@lotteryInfoID as 'lotteryInfoID',@totalBet as 'totalBet',
					--	--@SelectedNums as 'SELECTedNums',@dateS as 'dateS',
					--	@memberID as 'memberID',@agentLevelID as 'agentLevelID', @positionTaking as 'positionTaking',
					--	@totalAgentWin as 'totalAgentWin',@totalAgentLose as 'totalAgentLose', @totalSMWinLose as 'totalSMWinLose',
					--	@totalMWinLose as 'totalMWinLose',@totalAGWinLose as 'totalAGWinLose'

					IF @checkData > 0
					BEGIN
						--SELECT @memberID,@positionTakingProfit
						UPDATE [dbo].[WinLoseReportByGameTotal]
							SET [TotalBet] = @totalBet
								, [SMTotalWinLose] = @totalSMWinLose
								, [MTotalWinLose] = @totalMWinLose
								, [AGTotalWinLose] = @totalAGWinLose
								, [UpdateDate] = GETDATE()
							WHERE LotteryTypeID = @lotteryTypeID
								AND LotteryInfoID = @lotteryInfoID
								AND SELECTedNums = @SelectedNums
								AND CreateDate = @dateS
								AND [MemberID] = @memberID
								AND [AgentMemberID] = @agentMemberID
								AND AgentLevelSCID = @agentLevelID
					END;
					ELSE IF @totalBet > 0 OR @totalPending > 0
					BEGIN
						INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [MemberID], [AgentMemberID], [AgentLevelSCID], [SMTotalWinLose]
						, [MTotalWinLose], [AGTotalWinLose], [SELECTedNums], [TotalBet], [TotalWin]
							, [TotalLose], [TotalPending], [PlatfromID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @memberID, @agentMemberID, @agentLevelID, @totalSMWinLose
						, @totalMWinLose, @totalAGWinLose, @SelectedNums, @totalBet, @totalWin
							, @totalLose, @positionTakingProfit, @platformID, 0, @dateS, 0, GETDATE())

						--SELECT TOP(1) * FROM [WinLoseReportByGameTotal] ORDER BY UpdateDate desc
					END;

					SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
				END

				SET @memberCount = @memberCount - 1;
			END;
			-- ./以下處理用戶
			

			-- 處理GameDealer用戶	
			SET @gameDealerMemberCount = 0;
			SELECT @gameDealerMemberCount = COUNT(*)
				FROM #tempVwMPlayerByLotteryType
				WHERE LotteryTypeID = @lotteryTypeID
					AND  GameDealerMemberID > 0
			
			WHILE @gameDealerMemberCount > 0
			BEGIN
				SET @totalAgentWin = 0;
				SET @totalAgentLose = 0;

				SELECT @gameDealerMemberID = [GameDealerMemberID]
					FROM #tempVwMPlayerByLotteryType
					WHERE LotteryTypeID = @lotteryTypeID
						AND  GameDealerMemberID > 0
					ORDER BY #tempVwMPlayerByLotteryType.[GameDealerMemberID]
					OFFSET     (@gameDealerMemberCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;
					
				-- 取得該用戶的總Bet
				SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(TurnOverMoney, '') AS DECIMAL(18, 4))),0 )
					FROM #tempGameDealerMPlayerReport
					WHERE LotteryTypeID = @lotteryTypeID
						AND TypeCode in ('Win','Loss')
						AND [MemberID] = @gameDealerMemberID

				-- 取得該用戶的總Win
				SELECT @totalAgentWin = ISNULL(SUM(CAST(NULLIF(RecordMoney, '') AS DECIMAL(18, 4))),0 )
				FROM #tempGameDealerMPlayerReport
				WHERE LotteryTypeID = @lotteryTypeID
					AND [MemberID] = @gameDealerMemberID
					AND TypeCode = 'Win'

				-- 取得該用戶的總Lose
				SELECT @totalAgentLose = ISNULL(SUM(CAST(NULLIF(RecordMoney, '') AS DECIMAL(18, 4))),0 )
				FROM #tempGameDealerMPlayerReport
				WHERE LotteryTypeID = @lotteryTypeID
					AND [MemberID] = @gameDealerMemberID
					AND TypeCode = 'Loss'

				SELECT @mPositionProfitMap = AgentParentMap 
					FROM #tempGameDealerAgentMember 
					WHERE [MemberID] = @gameDealerMemberID
				
				SELECT @mPositionProfitMapCount = COUNT(*) 
					FROM [MPositionProfitMap] 
					WHERE AgentParentMap = @mPositionProfitMap

				WHILE @mPositionProfitMapCount > 0
				BEGIN
					SET @totalSMWinLose = 0;
					SET @totalMWinLose = 0;
					SET @totalAGWinLose = 0;
					SELECT @positionTaking = PositionTakingProfit
						, @agentMemberID = GameDealerMemberID
						FROM MPositionProfitMap With(Nolock)
						WHERE AgentParentMap = @mPositionProfitMap 
						ORDER BY MPositionProfitMap.ID
					OFFSET     (@mPositionProfitMapCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;
					
					IF @positionTaking = 0
					BEGIN
						SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
						continue;
					END

					SELECT @agentLevelID = AgentLevelSCID
						FROM #tempGameDealerAgentMember
						WHERE [MemberID] = @agentMemberID

					--SET @positionTakingProfit = (@totalAgentWin - @totalAgentLose) * @positionTaking;
					
					IF @agentLevelID = 31
					BEGIN
						SET @totalAGWinLose = (@totalAgentWin + @totalAgentLose) * @positionTaking;
					END;
					ELSE IF @agentLevelID = 30
					BEGIN
						SET @totalMWinLose = (@totalAgentWin + @totalAgentLose) * @positionTaking;
					END;
					ELSE IF @agentLevelID = 29
					BEGIN
						SET @totalSMWinLose = (@totalAgentWin + @totalAgentLose) * @positionTaking;
					END;

					--SELECT [GameDealerMemberID]=@agentMemberID
					--	, '@totalBet'=@totalBet
					--	, '@totalWin'=@totalWin
					--	, '@totalLose'=@totalLose
					--	, '@mPositionProfitMap'=@mPositionProfitMap
					--	, [TotalBet] = @totalBet
					--	, [SMTotalWinLose] = @totalSMWinLose
					--	, [MTotalWinLose] = @totalMWinLose
					--	, [AGTotalWinLose] = @totalAGWinLose

					--SELECT @lotteryTypeID,@lotteryInfoID,@SelectedNums,@dateS,@gameDealerMemberID,@agentMemberID,@agentLevelID,@gameDealerPlatformID

					SELECT @checkData = COUNT(*)
						FROM [dbo].[WinLoseReportByGameTotal]
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND SELECTedNums = @SelectedNums
							AND CreateDate = @dateS
							AND [GameDealerMemberID] = @gameDealerMemberID
							AND [AgentGameDealerMemberID] = @agentMemberID
							AND AgentLevelSCID = @agentLevelID
							AND PlatfromID = @gameDealerPlatformID

					--SELECT @checkData,@lotteryTypeID,@lotteryInfoID,@totalBet,@SelectedNums,@dateS,@gameDealerMemberID,@agentMemberID,@agentLevelID,@gameDealerPlatformID
					IF @checkData > 0
					BEGIN
						--SELECT @memberID,@positionTakingProfit
						UPDATE [dbo].[WinLoseReportByGameTotal]
							SET [TotalBet] = @totalBet
								, [SMTotalWinLose] = @totalSMWinLose
								, [MTotalWinLose] = @totalMWinLose
								, [AGTotalWinLose] = @totalAGWinLose
								, [UpdateDate] = GETDATE()
							WHERE LotteryTypeID = @lotteryTypeID
								AND LotteryInfoID = @lotteryInfoID
								AND SELECTedNums = @SelectedNums
								AND CreateDate = @dateS
								AND [GameDealerMemberID] = @gameDealerMemberID
								AND [AgentGameDealerMemberID] = @agentMemberID
								AND AgentLevelSCID = @agentLevelID
					END;
					ELSE IF @totalBet > 0 OR @totalPending > 0
					BEGIN
						--SELECT @checkData as 'checkData',@lotteryTypeID as 'lotteryTypeID',@lotteryInfoID as 'lotteryInfoID',@totalBet as 'totalBet',
						--	--@SelectedNums as 'SELECTedNums',@dateS as 'dateS',
						--	@memberID as 'memberID',@agentLevelID as 'agentLevelID', @positionTaking as 'positionTaking',
						--	@totalAgentWin as 'totalAgentWin',@totalAgentLose as 'totalAgentLose', @totalSMWinLose as 'totalSMWinLose',
						--	@totalMWinLose as 'totalMWinLose',@totalAGWinLose as 'totalAGWinLose'

						INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [GameDealerMemberID], [AgentGameDealerMemberID], [AgentLevelSCID], [SMTotalWinLose]
						, [MTotalWinLose], [AGTotalWinLose], [SELECTedNums], [TotalBet], [TotalWin]
							, [TotalLose], [TotalPending], [PlatfromID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @gameDealerMemberID, @agentMemberID, @agentLevelID, @totalSMWinLose
						, @totalMWinLose, @totalAGWinLose, @SelectedNums, @totalBet, @totalAgentWin
							, @totalAgentLose, @positionTakingProfit, @gameDealerPlatformID, 0, @dateS, 0, GETDATE())
					END;

					SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
				END

				SET @gameDealerMemberCount = @gameDealerMemberCount - 1;
			END;
			-- ./處理GameDealer用戶	
			
		END;
		-- ./以下處理大項類別
		SET @lotteryTypeCount = @lotteryTypeCount - 1;
	END;
END


GO
/****** Object:  StoredProcedure [dbo].[sp_WinLoseReportByGameBeforePending]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20210119			Yark				計算遊戲的投注報表
-- 2			20210308			Ben					新增Agent分層PositionTaking
-- 3			20210626			Ben					修改totalLose數字
-- =============================================
CREATE PROCEDURE [dbo].[sp_WinLoseReportByGameBeforePending] (
	@dateS NVARCHAR(200), @dateE NVARCHAR(200)
	)
AS
BEGIN
	DECLARE @lotteryTypeCount int = 0;							-- 要計算的遊戲數
	DECLARE @lotteryTypeID int = 0;								-- 遊戲類型ID
	DECLARE @checkTypeData int;									-- 確認類型資料是否存在
	DECLARE @lotteryInfoCount int = 0;							-- 要計算的遊戲數
	DECLARE @lotteryInfoID int = 0;								-- 遊戲項目ID
	DECLARE @lotteryInfoName NVARCHAR(200) = '';				-- 投注項目的名稱
	DECLARE @lotterySelectedCount int = 0;						-- 要計算的遊戲數
	DECLARE @selectedNums NVARCHAR(200) = '';					-- 投注項目
	DECLARE @turnOver DECIMAL(18, 4);							-- 總流水
	DECLARE @totalBet DECIMAL(18, 4);							-- 總投注額
	DECLARE @totalWin DECIMAL(18, 4);							-- 總贏
	DECLARE @totalLose DECIMAL(18, 4);							-- 總輸
	DECLARE @totalPending DECIMAL(18, 4);						-- 未開獎總額
	DECLARE @checkData int;										-- 確認資料是否存在
	DECLARE @memberCount int = 0;								-- 要計算的用戶數
	DECLARE @gameDealerMemberCount int = 0;								-- 要計算的用戶數
	DECLARE @memberID int = 0;					
	DECLARE @gameDealerMemberID int = 0;									
	DECLARE @userName NVARCHAR(200);					
	DECLARE @mPositionProfitMap NVARCHAR(MAX);					--Agent分潤表
	DECLARE @mPositionProfitMapCount int = 0;
	DECLARE @positionTaking DECIMAL(18, 4);						-- 
	DECLARE @positionTakingProfit DECIMAL(18, 4);						-- 
	
	--DECLARE @dateS NVARCHAR(200) = '';	
	--DECLARE @dateE NVARCHAR(200) = '';							-- 
	--DECLARE @dateS_4D NVARCHAR(200) = '';						-- 
	--DECLARE @createDate NVARCHAR(200) = '';						-- 

	RETURN
	--兩分鐘內有4D更新之注單再執行
	DECLARE @pendingCount int = 0;
	SELECT @pendingCount = COUNT(*) FROM VwMPlayer
		WHERE [UpdateDate] >= CONVERT(NVarchar, DATEADD(MINUTE, -2, GETDATE()), 120)
			AND [CreateDate] >= @dateS 
			AND [CreateDate] <= @dateE
			AND LotteryClassID = 5

	IF @pendingCount = 0
	BEGIN
		return;
	END

	SELECT @dateS, @dateE

	DROP TABLE IF EXISTS #tempMemberShip
	 --複製當天的投注表
	SELECT * INTO #tempMemberShip 
		FROM [MemberShip] WITH(NOLOCK)
		WHERE [AgentLevelSCID] = 32

	DROP TABLE IF EXISTS #tempGameDealerMemberShip
	 --複製當天的投注表
	SELECT * INTO #tempGameDealerMemberShip 
		FROM [GameDealerMemberShip] WITH(NOLOCK)
		WHERE [AgentLevelSCID] = 32

	DROP TABLE IF EXISTS #tempVwMPlayer
	 --複製當天的投注表
	SELECT * INTO #tempVwMPlayer 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [UpdateDate] >= @dateS 
			AND [UpdateDate] <= @dateE

	--DROP TABLE IF EXISTS #tempVwMPlayerReport
	-- --複製當天的投注表
	--SELECT * INTO #tempVwMPlayerReport
	--	FROM [VwMPlayerReport] WITH(NOLOCK)
	--	WHERE [CreateDate] >= @dateS 
	--		AND [CreateDate] <= @dateE
	--		AND [TypeCode] in ('Win', 'Loss')

	DROP TABLE IF EXISTS #tempVwMPlayerBySelected
	SELECT LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums INTO #tempVwMPlayerBySelected 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [UpdateDate] >= @dateS 
			AND [UpdateDate] <= @dateE
		GROUP BY LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums

	--4D算Pending金額 依照Agent分層
	DROP TABLE IF EXISTS #tempVwMPlayerBySelectedAndMember
	SELECT LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums, MemberID, GameDealerMemberID
	INTO #tempVwMPlayerBySelectedAndMember 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [UpdateDate] >= @dateS 
			AND [UpdateDate] <= @dateE
			AND [IsWin] is null
		GROUP BY LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums, MemberID, GameDealerMemberID

	SELECT @lotteryTypeCount = COUNT(*) 
		FROM [LotteryType] WITH(NOLOCK)
		WHERE LotteryTypeID in (16,17,18,19,20,21,22,23)
		
	WHILE @lotteryTypeCount > 0
	BEGIN
		SET @lotteryTypeID = 0;
		SET @lotteryInfoID = 0;
		SET @lotteryInfoName = '';
		SET @selectedNums = '';
		SET @totalBet = 0;
		SET @totalWin = 0;
		SET @totalPending = 0;
		SET @memberID = 0;

		-- Step 1. 從Lottery進行大分類的加總
		SELECT @lotteryTypeID = LotteryTypeID
			FROM [dbo].[LotteryType] WITH(NOLOCK) 
			WHERE LotteryTypeID in (16,17,18,19,20,21,22,23)
		ORDER BY [dbo].[LotteryType].[LotteryTypeID]
		OFFSET     (@lotteryTypeCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;

		SELECT @checkTypeData = COUNT(*)
			FROM #tempVwMPlayer
			WHERE LotteryTypeID = @lotteryTypeID
			
		-- 以下處理大項類別
		IF @checkTypeData > 0
		BEGIN
			Select @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
				 , @totalWin = ISNULL(SUM(CAST(NULLIF(WinMoney, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer
				WHERE IsWin in (1,0)
					AND LotteryTypeID = @lotteryTypeID

			Select @totalLose = ISNULL(-SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer
				WHERE IsWin = 0
					AND LotteryTypeID = @lotteryTypeID

			Select @totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer
				WHERE IsWin IS NULL
					AND LotteryTypeID = @lotteryTypeID
					
			SET @totalBet = ISNULL(@totalBet, 0);
			SET @totalWin = ISNULL(@totalWin, 0);
			SET @totalPending = ISNULL(@totalPending, 0);

			--SET @totalLose = @totalBet - @totalWin;
			
			SELECT @lotteryTypeID,@totalBet,@totalWin,@totalPending

			SELECT @checkData = COUNT(*)
				FROM [dbo].[WinLoseReportByGameTotal]
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = 0
					AND MemberID = 0
					AND GameDealerMemberID = 0
					AND CreateDate = @dateS

			IF @checkData > 0
			BEGIN
				UPDATE [dbo].[WinLoseReportByGameTotal]
					SET [TotalBet] = @totalBet
						, [TotalWin] = @totalWin
						, [TotalLose] = @totalLose
						, [TotalPending] = @totalPending
						, [UpdateDate] = GETDATE()
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = 0
						AND MemberID = 0
						AND GameDealerMemberID = 0
						AND CreateDate = @dateS
						
				--SELECT @totalPending
				--@totalPending等於0時 刪除Pending資料
				IF @totalPending = 0
				BEGIN
					--SELECT @lotteryTypeID,@lotteryInfoID,@selectedNums
					DELETE [dbo].[WinLoseReportByGameTotal] 
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID > 0
						AND (MemberID > 0 or GameDealerMemberID > 0)
						AND SelectedNums != ''
				END
			END;
			ELSE IF @totalBet > 0 OR @totalPending > 0
			BEGIN
				INSERT INTO [dbo].[WinLoseReportByGameTotal]
					([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [SelectedNums], [TotalBet], [TotalWin]
					, [TotalLose], [TotalPending], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
				Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @selectedNums, @totalBet, @totalWin
					, @totalLose, @totalPending, 0, @dateS, 0, GETDATE())
			END;
		END;
		-- ./以下處理大項類別

		-- 以下處理遊戲類別
		SELECT @lotteryInfoCount = COUNT(*)
			FROM [dbo].[LotteryInfo] WITH(NOLOCK) 
			WHERE LotteryTypeID = @lotteryTypeID

		WHILE @lotteryInfoCount > 0
		BEGIN
			SET @lotteryInfoName = '';
			SET @selectedNums = '';
			SET @totalBet = 0;
			SET @totalWin = 0;
			SET @totalPending = 0;

			SELECT @lotteryInfoID = [LotteryInfoID]
				FROM [dbo].[LotteryInfo] WITH(NOLOCK) 
				WHERE LotteryTypeID = @lotteryTypeID
			ORDER BY [dbo].[LotteryInfo].[LotteryInfoID]
			OFFSET     (@lotteryInfoCount - 1) ROWS
			FETCH NEXT 1 ROWS ONLY;
			
			SELECT @checkTypeData = COUNT(*)
				FROM #tempVwMPlayer
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID

			IF @checkTypeData > 0
			BEGIN
				SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					, @totalWin = ISNULL(SUM(CAST(NULLIF(WinMoney, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer
					WHERE IsWin in (1,0)
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						
				SELECT @totalLose = ISNULL(-SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer
					WHERE IsWin = 0
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID

				SELECT @totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer
					WHERE IsWin IS NULL
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
					
				SET @totalBet = ISNULL(@totalBet, 0);
				SET @totalWin = ISNULL(@totalWin, 0);
				SET @totalPending = ISNULL(@totalPending, 0);

				--SET @totalLose = @totalBet - @totalWin;

				SELECT @checkData = COUNT(*)		
					FROM [dbo].[WinLoseReportByGameTotal]
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND MemberID = 0
						AND GameDealerMemberID = 0
						AND SelectedNums = ''
						AND CreateDate = @dateS

				IF @checkData > 0
				BEGIN
					UPDATE [dbo].[WinLoseReportByGameTotal]
						SET [TotalBet] = @totalBet
							, [TotalWin] = @totalWin
							, [TotalLose] = @totalLose
							, [TotalPending] = @totalPending
							, [UpdateDate] = GETDATE()
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND SelectedNums = ''
							AND CreateDate = @dateS
				END;
				ELSE IF @totalBet > 0 OR @totalPending > 0
				BEGIN
					INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [SelectedNums], [TotalBet], [TotalWin]
						, [TotalLose], [TotalPending], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
					Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @selectedNums, @totalBet, @totalWin
						, @totalLose, @totalPending, 0, @dateS, 0, GETDATE())
				END;
			END;

			-- 處理Selected項目
			SELECT @lotterySelectedCount = COUNT(*)
				FROM #tempVwMPlayerBySelected
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID

			WHILE @lotterySelectedCount > 0
			BEGIN
				SET @totalBet = 0;
				SET @totalPending = 0;

				SELECT @lotteryInfoName = LotteryInfoName
					, @selectedNums = SelectedNums
					FROM #tempVwMPlayerBySelected
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
					ORDER BY #tempVwMPlayerBySelected.[LotteryInfoID]
					OFFSET     (@lotterySelectedCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;

				SELECT @checkTypeData = COUNT(*)
					FROM #tempVwMPlayer
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND LotteryInfoName = @lotteryInfoName
						AND SelectedNums = @selectedNums

				IF @checkTypeData > 0
				BEGIN
					SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
						, @totalWin = ISNULL(SUM(CAST(NULLIF(WinMoney, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer
						WHERE IsWin in (1,0)
							AND LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
							
					SELECT @totalLose = ISNULL(-SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer
						WHERE IsWin = 0
							AND LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums

					SELECT @totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer
						WHERE IsWin IS NULL
							AND LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
					
					SET @totalBet = ISNULL(@totalBet, 0);
					SET @totalWin = ISNULL(@totalWin, 0);
					SET @totalPending = ISNULL(@totalPending, 0);

					--SET @totalLose = @totalBet - @totalWin;

					SELECT @checkData = COUNT(*)
						FROM [dbo].[WinLoseReportByGameTotal]
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
							AND CreateDate = @dateS
							AND MemberID = 0
							AND GameDealerMemberID = 0

					IF @checkData > 0
					BEGIN
						UPDATE [dbo].[WinLoseReportByGameTotal]
							SET [TotalBet] = @totalBet
								, [TotalWin] = @totalWin
								, [TotalLose] = @totalLose
								, [TotalPending] = @totalPending
								, [UpdateDate] = GETDATE()
							WHERE LotteryTypeID = @lotteryTypeID
								AND LotteryInfoID = @lotteryInfoID
								AND LotteryInfoName = @lotteryInfoName
								AND SelectedNums = @selectedNums
								AND CreateDate = @dateS
								AND MemberID = 0
								AND GameDealerMemberID = 0
					END;
					ELSE IF @totalBet > 0 OR @totalPending > 0
					BEGIN
						INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [SelectedNums], [TotalBet], [TotalWin]
							, [TotalLose], [TotalPending], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @selectedNums, @totalBet, @totalWin
							, @totalLose, @totalPending, 0, @dateS, 0, GETDATE())
					END;
				END;

				SET @lotterySelectedCount = @lotterySelectedCount - 1;
			END;
			-- ./處理Selected項目

			
			--2021.3.4 新增Agent分潤相關資料
			SELECT @memberCount = COUNT(*)
				FROM #tempVwMPlayerBySelectedAndMember
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID
					AND MemberID > 0

			WHILE @memberCount > 0
			BEGIN
				SET @totalBet = 0;
				SET @totalPending = 0;
				SET @totalLose = 0;

				SELECT @memberID = MemberID,
						@lotteryInfoName = LotteryInfoName,
						@selectedNums = SelectedNums
					FROM #tempVwMPlayerBySelectedAndMember
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
					ORDER BY #tempVwMPlayerBySelectedAndMember.[MemberID]
					OFFSET     (@memberCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;
					
				SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 ),
					@totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer
					WHERE IsWin IS NULL
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND LotteryInfoName = @lotteryInfoName
						AND SelectedNums = @selectedNums
						AND MemberID = @memberID
				

				IF @totalPending = 0 or @totalPending is null
				BEGIN
					SET @memberCount = @memberCount - 1;
					CONTINUE;
				END

				SELECT @mPositionProfitMap = AgentParentMap FROM [MPositionProfitMap] WHERE MemberID = @memberID
				SELECT @mPositionProfitMapCount = COUNT(*) FROM [MPositionProfitMap] WHERE AgentParentMap = @mPositionProfitMap
				
				--SELECT @memberID,@totalBet,@totalPending,@lotteryInfoName,@selectedNums,@mPositionProfitMap

				WHILE @mPositionProfitMapCount > 0
				BEGIN
					SELECT @positionTaking = PositionTakingProfit, @memberID = MemberID
					FROM MPositionProfitMap
					WHERE AgentParentMap = @mPositionProfitMap 
					ORDER BY MPositionProfitMap.ID
					OFFSET     (@mPositionProfitMapCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;
				
					--IF @memberID = 2
					--BEGIN
					--	SELECT @memberID,@totalBet,@totalPending,@lotteryInfoName,@selectedNums
					--END

					IF @positionTaking = 0
					BEGIN
						SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
						continue;
					END

					SET @positionTakingProfit = @totalPending * @positionTaking;

					SELECT @checkData = COUNT(*)
						FROM [dbo].[WinLoseReportByGameTotal]
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
							AND CreateDate = @dateS
							AND MemberID = @memberID

					IF @checkData > 0
					BEGIN
						--SELECT @memberID,@positionTakingProfit
						UPDATE [dbo].[WinLoseReportByGameTotal]
							SET [TotalBet] = @totalBet
								, [TotalWin] = @totalWin
								, [TotalLose] = @totalLose
								, [TotalPending] = @positionTakingProfit
								, [UpdateDate] = GETDATE()
							WHERE LotteryTypeID = @lotteryTypeID
								AND LotteryInfoID = @lotteryInfoID
								--AND LotteryInfoName = @lotteryInfoName
								AND SelectedNums = @selectedNums
								AND CreateDate = @dateS
								AND MemberID = @memberID
					END;
					ELSE IF @totalBet > 0 OR @totalPending > 0
					BEGIN
						INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [MemberID], [SelectedNums], [TotalBet], [TotalWin]
							, [TotalLose], [TotalPending], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @memberID, @selectedNums, @totalBet, @totalWin
							, @totalLose, @positionTakingProfit, 0, @dateS, 0, GETDATE())
					END;

						
					SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
				END

				SET @memberCount = @memberCount - 1;
			END			
			--2021.3.4

			
			
			--2021.3.4 新增GameDealer Agent分潤相關資料
			SELECT @gameDealerMemberCount = COUNT(*)
				FROM #tempVwMPlayerBySelectedAndMember
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID
					AND GameDealerMemberID > 0

			WHILE @gameDealerMemberCount > 0
			BEGIN
				SET @totalBet = 0;
				SET @totalPending = 0;
				SET @totalLose = 0;

				SELECT @gameDealerMemberID = GameDealerMemberID,
						@lotteryInfoName = LotteryInfoName,
						@selectedNums = SelectedNums
					FROM #tempVwMPlayerBySelectedAndMember
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
					ORDER BY #tempVwMPlayerBySelectedAndMember.[MemberID]
					OFFSET     (@gameDealerMemberCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;

				SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 ),
					@totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer
					WHERE IsWin IS NULL
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND LotteryInfoName = @lotteryInfoName
						AND SelectedNums = @selectedNums
						AND GameDealerMemberID = @gameDealerMemberID
				
				IF @totalPending = 0 or @totalPending is null
				BEGIN
					SET @gameDealerMemberCount = @gameDealerMemberCount - 1;
					CONTINUE;
				END

				SELECT @mPositionProfitMap = AgentParentMap FROM [MPositionProfitMap] WHERE GameDealerMemberID = @gameDealerMemberID
				SELECT @mPositionProfitMapCount = COUNT(*) FROM [MPositionProfitMap] WHERE AgentParentMap = @mPositionProfitMap
				
				--SELECT @gameDealerMemberID,@totalBet,@totalPending,@lotteryInfoName,@selectedNums,@mPositionProfitMap
				WHILE @mPositionProfitMapCount > 0
				BEGIN
					SELECT @positionTaking = PositionTakingProfit, @gameDealerMemberID = GameDealerMemberID
					FROM MPositionProfitMap
					WHERE AgentParentMap = @mPositionProfitMap 
					ORDER BY MPositionProfitMap.ID
					OFFSET     (@mPositionProfitMapCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;
				
					--IF @memberID = 2
					--BEGIN
					--	SELECT @memberID,@totalBet,@totalPending,@lotteryInfoName,@selectedNums
					--END

					IF @positionTaking = 0
					BEGIN
						SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
						continue;
					END

					SET @positionTakingProfit = @totalPending * @positionTaking;

					SELECT @checkData = COUNT(*)
						FROM [dbo].[WinLoseReportByGameTotal]
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
							AND CreateDate = @dateS
							AND GameDealerMemberID = @gameDealerMemberID

					IF @checkData > 0
					BEGIN
						--SELECT @memberID,@positionTakingProfit
						UPDATE [dbo].[WinLoseReportByGameTotal]
							SET [TotalBet] = @totalBet
								, [TotalWin] = @totalWin
								, [TotalLose] = @totalLose
								, [TotalPending] = @positionTakingProfit
								, [UpdateDate] = GETDATE()
							WHERE LotteryTypeID = @lotteryTypeID
								AND LotteryInfoID = @lotteryInfoID
								--AND LotteryInfoName = @lotteryInfoName
								AND SelectedNums = @selectedNums
								AND CreateDate = @dateS
								AND GameDealerMemberID = @gameDealerMemberID
					END;
					ELSE IF @totalBet > 0 OR @totalPending > 0
					BEGIN
						INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [GameDealerMemberID], [SelectedNums], [TotalBet], [TotalWin]
							, [TotalLose], [TotalPending], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @gameDealerMemberID, @selectedNums, @totalBet, @totalWin
							, @totalLose, @positionTakingProfit, 0, @dateS, 0, GETDATE())
					END;

						
					SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
				END

				SET @gameDealerMemberCount = @gameDealerMemberCount - 1;
			END			
			--2021.3.4
			
			SET @lotteryInfoCount = @lotteryInfoCount - 1;
		END;
		-- ./以下處理遊戲類別

		
		-- 以下處理用戶
		SET @memberCount = 0;
		SELECT @memberCount = COUNT(*)
			FROM #tempMemberShip

		WHILE @memberCount > 0
		BEGIN
			SET @lotteryInfoName = '';
			SET @selectedNums = '';
			SET @totalBet = 0;
			SET @totalWin = 0;
			SET @totalLose = 0;
			SET @totalPending = 0;
			SET @lotteryInfoID = 0;

			SELECT  @memberID = MemberID, @userName = UserName
				FROM #tempMemberShip
				ORDER BY #tempMemberShip.[MemberID]
				OFFSET     (@memberCount - 1) ROWS
				FETCH NEXT 1 ROWS ONLY;
				
			--SELECT @totalBet = SUM(CAST(ISNULL(NULLIF([TurnOverMoney], ''),0 ) AS DECIMAL(18, 4)))
			--	FROM #tempVwMPlayerReport
			--	WHERE [TypeCode] in ('Win', 'Loss')
			--		AND MemberID = @memberID
			--		AND LotteryTypeID = @lotteryTypeID
				
			--SELECT @totalLose = SUM(CAST(ISNULL(NULLIF([RecordMoney], ''),0 ) AS DECIMAL(18, 4)))
			--	FROM #tempVwMPlayerReport
			--	WHERE [TypeCode] in ('Loss')
			--		AND MemberID = @memberID
			--		AND LotteryTypeID = @lotteryTypeID

			--SELECT @totalWin = SUM(CAST(ISNULL(NULLIF([RecordMoney], ''),0 ) AS DECIMAL(18, 4)))
			--	FROM #tempVwMPlayerReport
			--	WHERE [TypeCode] in ('Win')
			--		AND MemberID = @memberID
			--		AND LotteryTypeID = @lotteryTypeID
			IF (SELECT COUNT(*) FROM #tempVwMPlayer
				WHERE MemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID) = 0
			BEGIN
				SET @memberCount = @memberCount - 1;
				continue;
			END

			SELECT @totalBet = SUM(CAST(ISNULL(NULLIF([Price], ''),0 ) AS DECIMAL(18, 4)))
				FROM #tempVwMPlayer
				WHERE MemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID

			SELECT @totalPending = ISNULL(SUM(CAST(ISNULL(NULLIF([Price], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer
				WHERE IsWin is null
					AND MemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID
				
			SELECT @totalLose = ISNULL(-SUM(CAST(ISNULL(NULLIF([Price], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer
				WHERE IsWin = 0
					AND MemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID

			SELECT @totalWin = ISNULL(SUM(CAST(ISNULL(NULLIF([WinMoney], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer
				WHERE IsWin = 1
					AND MemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID
			
			SELECT @checkData = COUNT(*)
				FROM [dbo].[WinLoseReportByGameTotal]
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = 0
					AND MemberID = @memberID
					AND CreateDate = @dateS

			IF @checkData > 0
			BEGIN
				UPDATE [dbo].[WinLoseReportByGameTotal]
					SET [TotalBet] = @totalBet
						, [TotalWin] = @totalWin
						, [TotalLose] = @totalLose
						, [TotalPending] = @totalPending
						, [UpdateDate] = GETDATE()
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = 0
						AND MemberID = @memberID
						AND CreateDate = @dateS
			END;
			ELSE IF @totalBet > 0
			BEGIN
				INSERT INTO [dbo].[WinLoseReportByGameTotal]
				([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [MemberID], [SelectedNums], [TotalBet], [TotalWin]
					, [TotalLose], [TotalPending], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
				Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @memberID, @selectedNums, @totalBet, @totalWin
					, @totalLose, @totalPending, 0, @dateS, 0, GETDATE())
			END;

			SET @memberCount = @memberCount - 1;
		END;
		-- ./ 以下處理用戶

		-- 處理GameDealer用戶		
		SET @gameDealerMemberCount = 0;
		SELECT @gameDealerMemberCount = COUNT(*)
			FROM #tempGameDealerMemberShip

		WHILE @gameDealerMemberCount > 0
		BEGIN
			SET @lotteryInfoName = '';
			SET @selectedNums = '';
			SET @totalBet = 0;
			SET @totalWin = 0;
			SET @totalLose = 0;
			SET @totalPending = 0;
			SET @lotteryInfoID = 0;

			SELECT @memberID = MemberID, @userName = UserName
				FROM #tempGameDealerMemberShip
				ORDER BY #tempGameDealerMemberShip.[MemberID]
				OFFSET     (@gameDealerMemberCount - 1) ROWS
				FETCH NEXT 1 ROWS ONLY;

			IF (SELECT COUNT(*) FROM #tempVwMPlayer
				WHERE GameDealerMemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID) = 0
			BEGIN
				SET @gameDealerMemberCount = @gameDealerMemberCount - 1;
				continue;
			END

			SELECT @totalBet = SUM(CAST(ISNULL(NULLIF([Price], ''),0 ) AS DECIMAL(18, 4)))
				FROM #tempVwMPlayer
				WHERE GameDealerMemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID

			SELECT @totalPending = ISNULL(SUM(CAST(ISNULL(NULLIF([Price], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer
				WHERE IsWin is null
					AND GameDealerMemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID
				
			SELECT @totalLose = ISNULL(-SUM(CAST(ISNULL(NULLIF([Price], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer
				WHERE IsWin = 0
					AND GameDealerMemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID

			SELECT @totalWin = ISNULL(SUM(CAST(ISNULL(NULLIF([WinMoney], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer
				WHERE IsWin = 1
					AND GameDealerMemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID
			
			SELECT @checkData = COUNT(*)
				FROM [dbo].[WinLoseReportByGameTotal]
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = 0
					AND GameDealerMemberID = @memberID
					AND CreateDate = @dateS


			IF @checkData > 0
			BEGIN
				UPDATE [dbo].[WinLoseReportByGameTotal]
					SET [TotalBet] = @totalBet
						, [TotalWin] = @totalWin
						, [TotalLose] = @totalLose
						, [TotalPending] = @totalPending
						, [UpdateDate] = GETDATE()
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = 0
						AND GameDealerMemberID = @memberID
						AND CreateDate = @dateS
			END;
			ELSE IF @totalBet > 0
			BEGIN
				INSERT INTO [dbo].[WinLoseReportByGameTotal]
				([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [GameDealerMemberID], [SelectedNums], [TotalBet], [TotalWin]
					, [TotalLose], [TotalPending], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
				Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @memberID, @selectedNums, @totalBet, @totalWin
					, @totalLose, @totalPending, 0, @dateS, 0, GETDATE())
			END;

			SET @gameDealerMemberCount = @gameDealerMemberCount - 1;
		END;
		-- 處理GameDealer用戶

		SET @lotteryTypeCount = @lotteryTypeCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_WinLoseReportThirdPartyByGameBeforePending]    Script Date: 8/19/2024 3:43:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20210119			Yark				計算遊戲的投注報表
-- 2			20210308			Ben					新增Agent分層PositionTaking
-- 3			20210626			Ben					修改totalLose數字
-- =============================================
CREATE PROCEDURE [dbo].[sp_WinLoseReportThirdPartyByGameBeforePending] (
	@dateS NVARCHAR(200), @dateE NVARCHAR(200)
	)
AS
BEGIN
	DECLARE @lotteryTypeCount int = 0;							-- 要計算的遊戲數
	DECLARE @lotteryTypeID int = 0;								-- 遊戲類型ID
	DECLARE @checkTypeData int;									-- 確認類型資料是否存在
	DECLARE @lotteryInfoCount int = 0;							-- 要計算的遊戲數
	DECLARE @lotteryInfoID int = 0;								-- 遊戲項目ID
	DECLARE @lotteryInfoName NVARCHAR(200) = '';				-- 投注項目的名稱
	DECLARE @lotterySelectedCount int = 0;						-- 要計算的遊戲數
	DECLARE @selectedNums NVARCHAR(200) = '';					-- 投注項目
	DECLARE @turnOver DECIMAL(18, 4);							-- 總流水
	DECLARE @totalBet DECIMAL(18, 4);							-- 總投注額
	DECLARE @totalWin DECIMAL(18, 4);							-- 總贏
	DECLARE @totalLose DECIMAL(18, 4);							-- 總輸
	DECLARE @totalPending DECIMAL(18, 4);						-- 未開獎總額
	DECLARE @checkData int;										-- 確認資料是否存在
	DECLARE @memberCount int = 0;								-- 要計算的用戶數
	DECLARE @gameDealerMemberCount int = 0;								-- 要計算的用戶數
	DECLARE @memberID int = 0;					
	DECLARE @gameDealerMemberID int = 0;									
	DECLARE @userName NVARCHAR(200);					
	DECLARE @mPositionProfitMap NVARCHAR(MAX);					--Agent分潤表
	DECLARE @mPositionProfitMapCount int = 0;
	DECLARE @positionTaking DECIMAL(18, 4);						-- 
	DECLARE @positionTakingProfit DECIMAL(18, 4);						-- 
	
	--DECLARE @dateS NVARCHAR(200) = '';	
	--DECLARE @dateE NVARCHAR(200) = '';							-- 
	--DECLARE @dateS_4D NVARCHAR(200) = '';						-- 
	--DECLARE @createDate NVARCHAR(200) = '';						-- 
	
	RETURN 

	--兩分鐘內有4D更新之注單再執行
	DECLARE @pendingCount int = 0;
	SELECT @pendingCount = COUNT(*) FROM VwMPlayer
		WHERE [UpdateDate] >= CONVERT(NVarchar, DATEADD(MINUTE, -2, GETDATE()), 120)
			AND [CreateDate] >= @dateS 
			AND [CreateDate] <= @dateE
			AND LotteryClassID = 5

	IF @pendingCount = 0
	BEGIN
		return;
	END

	SELECT @dateS, @dateE

	DROP TABLE IF EXISTS #tempGameDealerMemberShip
	 --複製當天的投注表
	SELECT * INTO #tempGameDealerMemberShip 
		FROM [GameDealerMemberShip] WITH(NOLOCK)
		WHERE [AgentLevelSCID] = 32

	DROP TABLE IF EXISTS #tempVwMPlayer
	 --複製當天的投注表
	SELECT * INTO #tempVwMPlayer 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [CreateDate] >= @dateS 
			AND [CreateDate] <= @dateE
			AND [GameDealerMemberID] > 0

	--DROP TABLE IF EXISTS #tempVwMPlayerReport
	-- --複製當天的投注表
	--SELECT * INTO #tempVwMPlayerReport
	--	FROM [VwMPlayerReport] WITH(NOLOCK)
	--	WHERE [CreateDate] >= @dateS 
	--		AND [CreateDate] <= @dateE
	--		AND [TypeCode] in ('Win', 'Loss')

	DROP TABLE IF EXISTS #tempVwMPlayerBySelected
	SELECT LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums INTO #tempVwMPlayerBySelected 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [CreateDate] >= @dateS 
			AND [CreateDate] <= @dateE
			AND [GameDealerMemberID] > 0
		GROUP BY LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums

	--4D算Pending金額 依照Agent分層
	DROP TABLE IF EXISTS #tempVwMPlayerBySelectedAndMember
	SELECT LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums, MemberID, GameDealerMemberID
	INTO #tempVwMPlayerBySelectedAndMember 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [CreateDate] >= @dateS 
			AND [CreateDate] <= @dateE
			AND [IsWin] is null
			AND [GameDealerMemberID] > 0
		GROUP BY LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums, MemberID, GameDealerMemberID

	SELECT @lotteryTypeCount = COUNT(*) 
		FROM [LotteryType] WITH(NOLOCK)
		WHERE LotteryTypeID in (16,17,18,19,20,21,22,23)
		
	WHILE @lotteryTypeCount > 0
	BEGIN
		SET @lotteryTypeID = 0;
		SET @lotteryInfoID = 0;
		SET @lotteryInfoName = '';
		SET @selectedNums = '';
		SET @totalBet = 0;
		SET @totalWin = 0;
		SET @totalPending = 0;
		SET @memberID = 0;

		-- Step 1. 從Lottery進行大分類的加總
		SELECT @lotteryTypeID = LotteryTypeID
			FROM [dbo].[LotteryType] WITH(NOLOCK) 
			WHERE LotteryTypeID in (16,17,18,19,20,21,22,23)
		ORDER BY [dbo].[LotteryType].[LotteryTypeID]
		OFFSET     (@lotteryTypeCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;

		SELECT @checkTypeData = COUNT(*)
			FROM #tempVwMPlayer
			WHERE LotteryTypeID = @lotteryTypeID
			
		-- 以下處理大項類別
		IF @checkTypeData > 0
		BEGIN
			Select @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
				 , @totalWin = ISNULL(SUM(CAST(NULLIF(WinMoney, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer
				WHERE IsWin in (1,0)
					AND LotteryTypeID = @lotteryTypeID

			Select @totalLose = ISNULL(-SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer
				WHERE IsWin = 0
					AND LotteryTypeID = @lotteryTypeID

			Select @totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer
				WHERE IsWin IS NULL
					AND LotteryTypeID = @lotteryTypeID
					
			SET @totalBet = ISNULL(@totalBet, 0);
			SET @totalWin = ISNULL(@totalWin, 0);
			SET @totalPending = ISNULL(@totalPending, 0);

			--SET @totalLose = @totalBet - @totalWin;
			
			SELECT @lotteryTypeID,@totalBet,@totalWin,@totalPending

			SELECT @checkData = COUNT(*)
				FROM [dbo].[WinLoseReportByGameTotal]
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = 0
					AND MemberID = 0
					AND GameDealerMemberID = 0
					AND CreateDate = @dateS

			IF @checkData > 0
			BEGIN
				UPDATE [dbo].[WinLoseReportByGameTotal]
					SET [TotalBet] = @totalBet
						, [TotalWin] = @totalWin
						, [TotalLose] = @totalLose
						, [TotalPending] = @totalPending
						, [UpdateDate] = GETDATE()
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = 0
						AND MemberID = 0
						AND GameDealerMemberID = 0
						AND CreateDate = @dateS
						
				--SELECT @totalPending
				--@totalPending等於0時 刪除Pending資料
				IF @totalPending = 0
				BEGIN
					--SELECT @lotteryTypeID,@lotteryInfoID,@selectedNums
					DELETE [dbo].[WinLoseReportByGameTotal] 
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID > 0
						AND (MemberID > 0 or GameDealerMemberID > 0)
						AND SelectedNums != ''
				END
			END;
			ELSE IF @totalBet > 0 OR @totalPending > 0
			BEGIN
				INSERT INTO [dbo].[WinLoseReportByGameTotal]
					([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [SelectedNums], [TotalBet], [TotalWin]
					, [TotalLose], [TotalPending], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
				Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @selectedNums, @totalBet, @totalWin
					, @totalLose, @totalPending, 0, @dateS, 0, GETDATE())
			END;
		END;
		-- ./以下處理大項類別

		-- 以下處理遊戲類別
		SELECT @lotteryInfoCount = COUNT(*)
			FROM [dbo].[LotteryInfo] WITH(NOLOCK) 
			WHERE LotteryTypeID = @lotteryTypeID

		WHILE @lotteryInfoCount > 0
		BEGIN
			SET @lotteryInfoName = '';
			SET @selectedNums = '';
			SET @totalBet = 0;
			SET @totalWin = 0;
			SET @totalPending = 0;

			SELECT @lotteryInfoID = [LotteryInfoID]
				FROM [dbo].[LotteryInfo] WITH(NOLOCK) 
				WHERE LotteryTypeID = @lotteryTypeID
			ORDER BY [dbo].[LotteryInfo].[LotteryInfoID]
			OFFSET     (@lotteryInfoCount - 1) ROWS
			FETCH NEXT 1 ROWS ONLY;
			
			SELECT @checkTypeData = COUNT(*)
				FROM #tempVwMPlayer
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID

			IF @checkTypeData > 0
			BEGIN
				SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					, @totalWin = ISNULL(SUM(CAST(NULLIF(WinMoney, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer
					WHERE IsWin in (1,0)
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						
				SELECT @totalLose = ISNULL(-SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer
					WHERE IsWin = 0
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID

				SELECT @totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer
					WHERE IsWin IS NULL
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
					
				SET @totalBet = ISNULL(@totalBet, 0);
				SET @totalWin = ISNULL(@totalWin, 0);
				SET @totalPending = ISNULL(@totalPending, 0);

				--SET @totalLose = @totalBet - @totalWin;

				SELECT @checkData = COUNT(*)		
					FROM [dbo].[WinLoseReportByGameTotal]
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND MemberID = 0
						AND GameDealerMemberID = 0
						AND SelectedNums = ''
						AND CreateDate = @dateS

				IF @checkData > 0
				BEGIN
					UPDATE [dbo].[WinLoseReportByGameTotal]
						SET [TotalBet] = @totalBet
							, [TotalWin] = @totalWin
							, [TotalLose] = @totalLose
							, [TotalPending] = @totalPending
							, [UpdateDate] = GETDATE()
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND SelectedNums = ''
							AND CreateDate = @dateS
				END;
				ELSE IF @totalBet > 0 OR @totalPending > 0
				BEGIN
					INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [SelectedNums], [TotalBet], [TotalWin]
						, [TotalLose], [TotalPending], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
					Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @selectedNums, @totalBet, @totalWin
						, @totalLose, @totalPending, 0, @dateS, 0, GETDATE())
				END;
			END;

			-- 處理Selected項目
			SELECT @lotterySelectedCount = COUNT(*)
				FROM #tempVwMPlayerBySelected
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID

			WHILE @lotterySelectedCount > 0
			BEGIN
				SET @totalBet = 0;
				SET @totalPending = 0;

				SELECT @lotteryInfoName = LotteryInfoName
					, @selectedNums = SelectedNums
					FROM #tempVwMPlayerBySelected
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
					ORDER BY #tempVwMPlayerBySelected.[LotteryInfoID]
					OFFSET     (@lotterySelectedCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;

				SELECT @checkTypeData = COUNT(*)
					FROM #tempVwMPlayer
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND LotteryInfoName = @lotteryInfoName
						AND SelectedNums = @selectedNums

				IF @checkTypeData > 0
				BEGIN
					SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
						, @totalWin = ISNULL(SUM(CAST(NULLIF(WinMoney, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer
						WHERE IsWin in (1,0)
							AND LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
							
					SELECT @totalLose = ISNULL(-SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer
						WHERE IsWin = 0
							AND LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums

					SELECT @totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer
						WHERE IsWin IS NULL
							AND LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
					
					SET @totalBet = ISNULL(@totalBet, 0);
					SET @totalWin = ISNULL(@totalWin, 0);
					SET @totalPending = ISNULL(@totalPending, 0);

					--SET @totalLose = @totalBet - @totalWin;

					SELECT @checkData = COUNT(*)
						FROM [dbo].[WinLoseReportByGameTotal]
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
							AND CreateDate = @dateS
							AND MemberID = 0
							AND GameDealerMemberID = 0

					IF @checkData > 0
					BEGIN
						UPDATE [dbo].[WinLoseReportByGameTotal]
							SET [TotalBet] = @totalBet
								, [TotalWin] = @totalWin
								, [TotalLose] = @totalLose
								, [TotalPending] = @totalPending
								, [UpdateDate] = GETDATE()
							WHERE LotteryTypeID = @lotteryTypeID
								AND LotteryInfoID = @lotteryInfoID
								AND LotteryInfoName = @lotteryInfoName
								AND SelectedNums = @selectedNums
								AND CreateDate = @dateS
								AND MemberID = 0
								AND GameDealerMemberID = 0
					END;
					ELSE IF @totalBet > 0 OR @totalPending > 0
					BEGIN
						INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [SelectedNums], [TotalBet], [TotalWin]
							, [TotalLose], [TotalPending], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @selectedNums, @totalBet, @totalWin
							, @totalLose, @totalPending, 0, @dateS, 0, GETDATE())
					END;
				END;

				SET @lotterySelectedCount = @lotterySelectedCount - 1;
			END;
			-- ./處理Selected項目

			
			--2021.3.4 新增Agent分潤相關資料
			SELECT @memberCount = COUNT(*)
				FROM #tempVwMPlayerBySelectedAndMember
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID
					AND MemberID > 0

			WHILE @memberCount > 0
			BEGIN
				SET @totalBet = 0;
				SET @totalPending = 0;
				SET @totalLose = 0;

				SELECT @memberID = MemberID,
						@lotteryInfoName = LotteryInfoName,
						@selectedNums = SelectedNums
					FROM #tempVwMPlayerBySelectedAndMember
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
					ORDER BY #tempVwMPlayerBySelectedAndMember.[MemberID]
					OFFSET     (@memberCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;
					
				SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 ),
					@totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer
					WHERE IsWin IS NULL
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND LotteryInfoName = @lotteryInfoName
						AND SelectedNums = @selectedNums
						AND MemberID = @memberID
				

				IF @totalPending = 0 or @totalPending is null
				BEGIN
					SET @memberCount = @memberCount - 1;
					CONTINUE;
				END

				SELECT @mPositionProfitMap = AgentParentMap FROM [MPositionProfitMap] WHERE MemberID = @memberID
				SELECT @mPositionProfitMapCount = COUNT(*) FROM [MPositionProfitMap] WHERE AgentParentMap = @mPositionProfitMap
				
				--SELECT @memberID,@totalBet,@totalPending,@lotteryInfoName,@selectedNums,@mPositionProfitMap

				WHILE @mPositionProfitMapCount > 0
				BEGIN
					SELECT @positionTaking = PositionTakingProfit, @memberID = MemberID
					FROM MPositionProfitMap
					WHERE AgentParentMap = @mPositionProfitMap 
					ORDER BY MPositionProfitMap.ID
					OFFSET     (@mPositionProfitMapCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;
				
					--IF @memberID = 2
					--BEGIN
					--	SELECT @memberID,@totalBet,@totalPending,@lotteryInfoName,@selectedNums
					--END

					IF @positionTaking = 0
					BEGIN
						SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
						continue;
					END

					SET @positionTakingProfit = @totalPending * @positionTaking;

					SELECT @checkData = COUNT(*)
						FROM [dbo].[WinLoseReportByGameTotal]
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
							AND CreateDate = @dateS
							AND MemberID = @memberID

					IF @checkData > 0
					BEGIN
						--SELECT @memberID,@positionTakingProfit
						UPDATE [dbo].[WinLoseReportByGameTotal]
							SET [TotalBet] = @totalBet
								, [TotalWin] = @totalWin
								, [TotalLose] = @totalLose
								, [TotalPending] = @positionTakingProfit
								, [UpdateDate] = GETDATE()
							WHERE LotteryTypeID = @lotteryTypeID
								AND LotteryInfoID = @lotteryInfoID
								--AND LotteryInfoName = @lotteryInfoName
								AND SelectedNums = @selectedNums
								AND CreateDate = @dateS
								AND MemberID = @memberID
					END;
					ELSE IF @totalBet > 0 OR @totalPending > 0
					BEGIN
						INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [MemberID], [SelectedNums], [TotalBet], [TotalWin]
							, [TotalLose], [TotalPending], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @memberID, @selectedNums, @totalBet, @totalWin
							, @totalLose, @positionTakingProfit, 0, @dateS, 0, GETDATE())
					END;

						
					SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
				END

				SET @memberCount = @memberCount - 1;
			END			
			--2021.3.4

			
			
			--2021.3.4 新增GameDealer Agent分潤相關資料
			SELECT @gameDealerMemberCount = COUNT(*)
				FROM #tempVwMPlayerBySelectedAndMember
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID
					AND GameDealerMemberID > 0

			WHILE @gameDealerMemberCount > 0
			BEGIN
				SET @totalBet = 0;
				SET @totalPending = 0;
				SET @totalLose = 0;

				SELECT @gameDealerMemberID = GameDealerMemberID,
						@lotteryInfoName = LotteryInfoName,
						@selectedNums = SelectedNums
					FROM #tempVwMPlayerBySelectedAndMember
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
					ORDER BY #tempVwMPlayerBySelectedAndMember.[MemberID]
					OFFSET     (@gameDealerMemberCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;

				SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 ),
					@totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer
					WHERE IsWin IS NULL
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND LotteryInfoName = @lotteryInfoName
						AND SelectedNums = @selectedNums
						AND GameDealerMemberID = @gameDealerMemberID
				
				IF @totalPending = 0 or @totalPending is null
				BEGIN
					SET @gameDealerMemberCount = @gameDealerMemberCount - 1;
					CONTINUE;
				END

				SELECT @mPositionProfitMap = AgentParentMap FROM [MPositionProfitMap] WHERE GameDealerMemberID = @gameDealerMemberID
				SELECT @mPositionProfitMapCount = COUNT(*) FROM [MPositionProfitMap] WHERE AgentParentMap = @mPositionProfitMap
				
				--SELECT @gameDealerMemberID,@totalBet,@totalPending,@lotteryInfoName,@selectedNums,@mPositionProfitMap
				WHILE @mPositionProfitMapCount > 0
				BEGIN
					SELECT @positionTaking = PositionTakingProfit, @gameDealerMemberID = GameDealerMemberID
					FROM MPositionProfitMap
					WHERE AgentParentMap = @mPositionProfitMap 
					ORDER BY MPositionProfitMap.ID
					OFFSET     (@mPositionProfitMapCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;
				
					--IF @memberID = 2
					--BEGIN
					--	SELECT @memberID,@totalBet,@totalPending,@lotteryInfoName,@selectedNums
					--END

					IF @positionTaking = 0
					BEGIN
						SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
						continue;
					END

					SET @positionTakingProfit = @totalPending * @positionTaking;

					SELECT @checkData = COUNT(*)
						FROM [dbo].[WinLoseReportByGameTotal]
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @selectedNums
							AND CreateDate = @dateS
							AND GameDealerMemberID = @gameDealerMemberID

					IF @checkData > 0
					BEGIN
						--SELECT @memberID,@positionTakingProfit
						UPDATE [dbo].[WinLoseReportByGameTotal]
							SET [TotalBet] = @totalBet
								, [TotalWin] = @totalWin
								, [TotalLose] = @totalLose
								, [TotalPending] = @positionTakingProfit
								, [UpdateDate] = GETDATE()
							WHERE LotteryTypeID = @lotteryTypeID
								AND LotteryInfoID = @lotteryInfoID
								--AND LotteryInfoName = @lotteryInfoName
								AND SelectedNums = @selectedNums
								AND CreateDate = @dateS
								AND GameDealerMemberID = @gameDealerMemberID
					END;
					ELSE IF @totalBet > 0 OR @totalPending > 0
					BEGIN
						INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [GameDealerMemberID], [SelectedNums], [TotalBet], [TotalWin]
							, [TotalLose], [TotalPending], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @gameDealerMemberID, @selectedNums, @totalBet, @totalWin
							, @totalLose, @positionTakingProfit, 0, @dateS, 0, GETDATE())
					END;

						
					SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
				END

				SET @gameDealerMemberCount = @gameDealerMemberCount - 1;
			END			
			--2021.3.4
			
			SET @lotteryInfoCount = @lotteryInfoCount - 1;
		END;
		-- ./以下處理遊戲類別

		-- 處理GameDealer用戶		
		SET @gameDealerMemberCount = 0;
		SELECT @gameDealerMemberCount = COUNT(*)
			FROM #tempGameDealerMemberShip

		WHILE @gameDealerMemberCount > 0
		BEGIN
			SET @lotteryInfoName = '';
			SET @selectedNums = '';
			SET @totalBet = 0;
			SET @totalWin = 0;
			SET @totalLose = 0;
			SET @totalPending = 0;
			SET @lotteryInfoID = 0;

			SELECT @memberID = MemberID, @userName = UserName
				FROM #tempGameDealerMemberShip
				ORDER BY #tempGameDealerMemberShip.[MemberID]
				OFFSET     (@gameDealerMemberCount - 1) ROWS
				FETCH NEXT 1 ROWS ONLY;

			IF (SELECT COUNT(*) FROM #tempVwMPlayer
				WHERE GameDealerMemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID) = 0
			BEGIN
				SET @gameDealerMemberCount = @gameDealerMemberCount - 1;
				continue;
			END

			SELECT @totalBet = SUM(CAST(ISNULL(NULLIF([Price], ''),0 ) AS DECIMAL(18, 4)))
				FROM #tempVwMPlayer
				WHERE GameDealerMemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID

			SELECT @totalPending = ISNULL(SUM(CAST(ISNULL(NULLIF([Price], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer
				WHERE IsWin is null
					AND GameDealerMemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID
				
			SELECT @totalLose = ISNULL(-SUM(CAST(ISNULL(NULLIF([Price], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer
				WHERE IsWin = 0
					AND GameDealerMemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID

			SELECT @totalWin = ISNULL(SUM(CAST(ISNULL(NULLIF([WinMoney], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer
				WHERE IsWin = 1
					AND GameDealerMemberID = @memberID
					AND LotteryTypeID = @lotteryTypeID
			
			SELECT @checkData = COUNT(*)
				FROM [dbo].[WinLoseReportByGameTotal]
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = 0
					AND GameDealerMemberID = @memberID
					AND CreateDate = @dateS


			IF @checkData > 0
			BEGIN
				UPDATE [dbo].[WinLoseReportByGameTotal]
					SET [TotalBet] = @totalBet
						, [TotalWin] = @totalWin
						, [TotalLose] = @totalLose
						, [TotalPending] = @totalPending
						, [UpdateDate] = GETDATE()
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = 0
						AND GameDealerMemberID = @memberID
						AND CreateDate = @dateS
			END;
			ELSE IF @totalBet > 0
			BEGIN
				INSERT INTO [dbo].[WinLoseReportByGameTotal]
				([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [GameDealerMemberID], [SelectedNums], [TotalBet], [TotalWin]
					, [TotalLose], [TotalPending], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
				Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @memberID, @selectedNums, @totalBet, @totalWin
					, @totalLose, @totalPending, 0, @dateS, 0, GETDATE())
			END;

			SET @gameDealerMemberCount = @gameDealerMemberCount - 1;
		END;
		-- 處理GameDealer用戶

		SET @lotteryTypeCount = @lotteryTypeCount - 1;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_WinLoseReportThirdPartyByGameTotal]    Script Date: 8/19/2024 3:43:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- 說明: 統計用戶的Referral、Win、Loss、CashBack、CashRebate儲存到Report
-- 參數說明: null
-- 範例: exec sp_ReferralReport
-- 序號			版本號				修改人				修改參數說明
-- 1			20210119			Yark				計算遊戲的投注報表
-- 2			20210308			Ben					新增Agent分層PositionTaking
-- 3			20210626			Ben					修改totalLose數字
-- =============================================
CREATE PROCEDURE [dbo].[sp_WinLoseReportThirdPartyByGameTotal] (@platform NVARCHAR(200) = 'tm')
AS
BEGIN
	DECLARE @lotteryTypeCount int = 0;							-- 要計算的遊戲數
	DECLARE @lotteryTypeID int = 0;								-- 遊戲類型ID
	DECLARE @checkTypeData int;									-- 確認類型資料是否存在
	DECLARE @lotteryInfoCount int = 0;							-- 要計算的遊戲數
	DECLARE @lotteryInfoID int = 0;								-- 遊戲項目ID
	DECLARE @lotteryInfoName NVARCHAR(200) = '';				-- 投注項目的名稱
	DECLARE @lotterySelectedCount int = 0;						-- 要計算的遊戲數
	DECLARE @SelectedNums NVARCHAR(200) = '';					-- 投注項目
	DECLARE @turnOver DECIMAL(18, 4);							-- 總流水
	DECLARE @totalBet DECIMAL(18, 4);							-- 總投注額
	DECLARE @totalDiscountPrice DECIMAL(18, 4);
	DECLARE @totalWin DECIMAL(18, 4);							-- 總贏
	DECLARE @totalLose DECIMAL(18, 4);							-- 總輸
	DECLARE @totalPending DECIMAL(18, 4);						-- 未	開獎總額
	DECLARE @fourDCapital DECIMAL(18, 4);						-- 4D/3D/2D 本金
	DECLARE @checkData int;										-- 確認資料是否存在
	DECLARE @gameDealerMemberCount int = 0;								-- 要計算的用戶數
	DECLARE @gameDealerMemberID int = 0;									
	DECLARE @userName NVARCHAR(200);					
	DECLARE @mPositionProfitMap NVARCHAR(MAX);					--Agent分潤表
	DECLARE @mPositionProfitMapCount int = 0;
	DECLARE @positionTaking DECIMAL(18, 4);						-- 
	DECLARE @positionTakingProfit DECIMAL(18, 4);
	DECLARE @platformID int = 0;
	DECLARE @winLoseReportByGameTotalID int =0;
	
	DECLARE @dateS NVARCHAR(200) = '';	
	DECLARE @dateE NVARCHAR(200) = '';							
	DECLARE @dateS_4D NVARCHAR(200) = '';							-- 

	-- 設定啟始與結束時間
	SELECT @dateS = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 00:00:00'
	, @dateE = CONVERT(NVarchar, DATEADD(minute, -3, getdate()), 111)+' 23:59:59'
	, @dateS_4D= CONVERT(varchar, DATEADD(DAY, -7, getdate()), 111)+' 00:00:00';
	
	SELECT @platformID = ID FROM PlatformSetting WHERE PlatformName = @platform
	--SELECT @dateS = '2021-9-18 00:00:00', @dateE = '2021-9-18 23:59:59';
	
	SELECT @dateS, @dateE, @platform

	--DROP TABLE IF EXISTS #tempMemberShip
	-- --複製當天的投注表
	--SELECT * INTO #tempMemberShip 
	--	FROM [MemberShip] WITH(NOLOCK)
	--	WHERE [AgentLevelSCID] = 32

	DROP TABLE IF EXISTS #tempWinLoseReportByGameTotal
	SELECT * INTO #tempWinLoseReportByGameTotal 
		FROM WinLoseReportByGameTotal WITH(NOLOCK)
		WHERE CreateDate = @dateS

	DROP TABLE IF EXISTS #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
	 --複製當天的投注表
	SELECT * INTO #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [UpdateDate] >= @dateS 
			AND [UpdateDate] <= @dateE
			AND [CompanyID] = @platformID
			AND [GameDealerMemberID] > 0
	
	DROP TABLE IF EXISTS #tmpMemberList
	SELECT GameDealerMemberID,UserName INTO #tmpMemberList
		FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
		GROUP BY GameDealerMemberID,UserName
	--DROP TABLE IF EXISTS #tempVwMPlayer_WinLoseReportThirdPartyByGameTotalReport
	-- --複製當天的投注表
	--SELECT * INTO #tempVwMPlayer_WinLoseReportThirdPartyByGameTotalReport
	--	FROM [VwMPlayerReport] WITH(NOLOCK)
	--	WHERE [CreateDate] >= @dateS 
	--		AND [CreateDate] <= @dateE
	--		AND [TypeCode] in ('Win', 'Loss')

	DROP TABLE IF EXISTS #tempVwMPlayer_WinLoseReportThirdPartyByGameTotalBySelected
	SELECT LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums INTO #tempVwMPlayer_WinLoseReportThirdPartyByGameTotalBySelected 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [UpdateDate] >= @dateS 
			AND [UpdateDate] <= @dateE
			AND [CompanyID] = @platformID
			AND [GameDealerMemberID] > 0
		GROUP BY LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums

	--4D算Pending金額 依照Agent分層
	DROP TABLE IF EXISTS #tempVwMPlayer_WinLoseReportThirdPartyByGameTotalBySelectedAndMember
	SELECT LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums, MemberID, GameDealerMemberID
	INTO #tempVwMPlayer_WinLoseReportThirdPartyByGameTotalBySelectedAndMember 
		FROM [VwMPlayer] WITH(NOLOCK)
		WHERE [UpdateDate] >= @dateS 
			AND [UpdateDate] <= @dateE
			AND [CompanyID] = @platformID
			AND IsWin is null
			AND [GameDealerMemberID] > 0
		GROUP BY LotteryTypeID, LotteryInfoID, LotteryInfoName, SelectedNums, MemberID, GameDealerMemberID

	SELECT @lotteryTypeCount = COUNT(*) 
		FROM [dbo].[LotteryType] WITH(NOLOCK)

	WHILE @lotteryTypeCount > 0
	BEGIN
		SET @lotteryTypeID = 0;
		SET @lotteryInfoID = 0;
		SET @lotteryInfoName = '';
		SET @SelectedNums = '';
		SET @totalBet = 0;
		SET @totalDiscountPrice = 0;
		SET @totalWin = 0;
		SET @fourDCapital = 0;
		SET @totalPending = 0;
		SET @winLoseReportByGameTotalID = 0;

		-- Step 1. 從Lottery進行大分類的加總
		SELECT @lotteryTypeID = LotteryTypeID
			FROM [dbo].[LotteryType] WITH(NOLOCK) 
		ORDER BY [dbo].[LotteryType].[LotteryTypeID]
		OFFSET     (@lotteryTypeCount - 1) ROWS
		FETCH NEXT 1 ROWS ONLY;

		SELECT @checkTypeData = COUNT(*)
			FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
			WHERE LotteryTypeID = @lotteryTypeID
			
		-- 以下處理大項類別
		IF @checkTypeData > 0
		BEGIN
			SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 ),
				@totalDiscountPrice = ISNULL(SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
				WHERE LotteryTypeID = @lotteryTypeID
		
			SELECT @totalWin = ISNULL(SUM(CAST(NULLIF(WinMoney, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
				WHERE IsWin in (1,0)
					AND LotteryTypeID = @lotteryTypeID

			--計算WinLose 4D/3D/2D須扣除本金
			SELECT @fourDCapital = ISNULL(SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal m LEFT JOIN LotteryInfo l ON m.LotteryInfoID = l.LotteryInfoID
				WHERE IsWin = 1
					AND m.LotteryTypeID = @lotteryTypeID AND l.DrawTypeID >= 142 AND l.DrawTypeID <= 152

			SELECT @totalLose = ISNULL(-SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
				WHERE IsWin = 0
					AND LotteryTypeID = @lotteryTypeID

			SELECT @totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
				FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
				WHERE IsWin IS NULL
					AND LotteryTypeID = @lotteryTypeID
					
			SET @totalBet = ISNULL(@totalBet, 0);
			SET @totalDiscountPrice = ISNULL(@totalDiscountPrice,0);
			SET @totalWin = ISNULL(@totalWin, 0) - ISNULL(@fourDCapital, 0);
			SET @totalPending = ISNULL(@totalPending, 0);

			--SET @totalLose = @totalBet - @totalWin;
			
			SELECT @lotteryTypeID,@totalBet,@totalDiscountPrice,@totalWin,@totalPending,@fourDCapital

			SELECT @winLoseReportByGameTotalID = ID
				FROM #tempWinLoseReportByGameTotal
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = 0
					AND MemberID = 0
					AND GameDealerMemberID = 0
					AND CreateDate = @dateS
					AND PlatfromID = @platformID

			IF @winLoseReportByGameTotalID > 0
			BEGIN
				SELECT @winLoseReportByGameTotalID,@lotteryTypeID,@lotteryInfoID,@totalBet
				UPDATE [dbo].[WinLoseReportByGameTotal]
					SET [TotalBet] = @totalBet
						, [TotalDiscountPrice] = @totalDiscountPrice
						, [TotalWin] = @totalWin
						, [TotalLose] = @totalLose
						, [TotalPending] = @totalPending
						, [UpdateDate] = GETDATE()
					WHERE ID = @winLoseReportByGameTotalID
						
				--SELECT @totalPending
				--@totalPending等於0時 刪除Pending資料
				IF @totalPending = 0
				BEGIN
					UPDATE [dbo].[WinLoseReportByGameTotal] 
					SET TotalBet = (CASE WHEN CreateDate < @dateS AND TotalPending > 0 
										THEN TotalBet - TotalPending ELSE TotalBet END)
						,TotalPending = 0
						WHERE LotteryTypeID = @lotteryTypeID
							AND PlatfromID = @platformID
							AND CreateDate > @dateS_4D
							AND Totalpending > 0
							
					DELETE [dbo].[WinLoseReportByGameTotal] 
					WHERE LotteryTypeID = @lotteryTypeID
						AND TotalBet = 0
						AND PlatfromID = @platformID
						AND CreateDate > @dateS_4D
						
					UPDATE openrowset('SQLOLEDB', '192.82.60.148'; 'MasterUser'; '@master85092212', [MasterGHL].[dbo].[WinLoseReportByGameTotal])
					SET TotalBet = (CASE WHEN CreateDate < @dateS AND TotalPending > 0 
										THEN TotalBet - TotalPending ELSE TotalBet END)
						,TotalPending = 0
						WHERE LotteryTypeID = @lotteryTypeID
							AND PlatfromID = @platformID
							AND CreateDate > @dateS_4D
							AND Totalpending > 0
							
					DELETE openrowset('SQLOLEDB', '192.82.60.148'; 'MasterUser'; '@master85092212', [MasterGHL].[dbo].[WinLoseReportByGameTotal])
					WHERE LotteryTypeID = @lotteryTypeID
						AND TotalBet = 0
						AND PlatfromID = @platformID
						AND CreateDate > @dateS_4D

				END
			END;
			ELSE IF @totalBet > 0 OR @totalPending > 0
			BEGIN
				INSERT INTO [dbo].[WinLoseReportByGameTotal]
					([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [SelectedNums], [TotalBet], [TotalDiscountPrice], [TotalWin]
					, [TotalLose], [TotalPending], [PlatfromID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
				Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @SelectedNums, @totalBet, @totalDiscountPrice, @totalWin
					, @totalLose, @totalPending, @platformID, 0, @dateS, 0, GETDATE())
			END;
		END;
		-- ./以下處理大項類別

		-- 以下處理遊戲類別
		SELECT @lotteryInfoCount = COUNT(*)
			FROM [dbo].[LotteryInfo] WITH(NOLOCK) 
			WHERE LotteryTypeID = @lotteryTypeID

		WHILE @lotteryInfoCount > 0
		BEGIN
			SET @lotteryInfoName = '';
			SET @SelectedNums = '';
			SET @totalBet = 0;
			SET @totalDiscountPrice = 0;
			SET @totalWin = 0;
			SET @totalPending = 0;
			SET @winLoseReportByGameTotalID = 0;

			SELECT @lotteryInfoID = [LotteryInfoID]
				FROM [dbo].[LotteryInfo] WITH(NOLOCK) 
				WHERE LotteryTypeID = @lotteryTypeID
			ORDER BY [dbo].[LotteryInfo].[LotteryInfoID]
			OFFSET     (@lotteryInfoCount - 1) ROWS
			FETCH NEXT 1 ROWS ONLY;
			
			SELECT @checkTypeData = COUNT(*)
				FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID

			IF @checkTypeData > 0
			BEGIN
				SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 ),
					@totalDiscountPrice = ISNULL(SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID

				SELECT @totalWin = ISNULL(SUM(CAST(NULLIF(WinMoney, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
					WHERE IsWin in (1,0)
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID

				SELECT @totalLose = ISNULL(-SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
					WHERE IsWin = 0
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID

				SELECT @totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
					WHERE IsWin IS NULL
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
					
				SET @totalBet = ISNULL(@totalBet, 0);
				SET @totalDiscountPrice = ISNULL(@totalDiscountPrice,0);
				SET @totalWin = ISNULL(@totalWin, 0);
				SET @totalPending = ISNULL(@totalPending, 0);

				--SET @totalLose = @totalBet - @totalWin;

				SELECT @winLoseReportByGameTotalID = ID
					FROM #tempWinLoseReportByGameTotal
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND MemberID = 0
						AND GameDealerMemberID = 0
						AND SelectedNums = ''
						AND CreateDate = @dateS
						AND PlatfromID = @platformID
				
				IF @winLoseReportByGameTotalID > 0
				BEGIN
					UPDATE [dbo].[WinLoseReportByGameTotal]
						SET [TotalBet] = @totalBet
							, [TotalDiscountPrice] = @totalDiscountPrice
							, [TotalWin] = @totalWin
							, [TotalLose] = @totalLose
							, [TotalPending] = @totalPending
							, [UpdateDate] = GETDATE()
						WHERE ID = @winLoseReportByGameTotalID
				END;
				ELSE IF @totalBet > 0 OR @totalPending > 0
				BEGIN
					INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [SelectedNums], [TotalBet], [TotalDiscountPrice], [TotalWin]
						, [TotalLose], [TotalPending], [PlatfromID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
					Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @SelectedNums, @totalBet, @totalDiscountPrice, @totalWin
						, @totalLose, @totalPending, @platformID, 0, @dateS, 0, GETDATE())
				END;
			END;

			-- 處理Selected項目
			SELECT @lotterySelectedCount = COUNT(*)
				FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotalBySelected
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID

			WHILE @lotterySelectedCount > 0
			BEGIN
				SET @totalBet = 0;
				SET @totalDiscountPrice = 0;
				SET @totalPending = 0;
				SET @winLoseReportByGameTotalID = 0;

				SELECT @lotteryInfoName = LotteryInfoName
					, @SelectedNums = SelectedNums
					FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotalBySelected
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
					ORDER BY #tempVwMPlayer_WinLoseReportThirdPartyByGameTotalBySelected.[LotteryInfoID]
					OFFSET     (@lotterySelectedCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;

				SELECT @checkTypeData = COUNT(*)
					FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND LotteryInfoName = @lotteryInfoName
						AND SelectedNums = @SelectedNums

				IF @checkTypeData > 0
				BEGIN
				
					SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 ),
						@totalDiscountPrice = ISNULL(SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @SelectedNums

					SELECT @totalWin = ISNULL(SUM(CAST(NULLIF(WinMoney, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
						WHERE IsWin in (1,0)
							AND LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @SelectedNums
							
					SELECT @totalLose = ISNULL(-SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
						WHERE IsWin = 0
							AND LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @SelectedNums

					SELECT @totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
						FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
						WHERE IsWin IS NULL
							AND LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @SelectedNums
					
					SET @totalBet = ISNULL(@totalBet, 0);
					SET @totalDiscountPrice = ISNULL(@totalDiscountPrice,0);
					SET @totalWin = ISNULL(@totalWin, 0);
					SET @totalPending = ISNULL(@totalPending, 0);

					--SET @totalLose = @totalBet - @totalWin;

					SELECT @winLoseReportByGameTotalID = ID
						FROM #tempWinLoseReportByGameTotal
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @SelectedNums
							AND CreateDate = @dateS
							AND MemberID = 0
							AND GameDealerMemberID = 0
							AND PlatfromID = @platformID
					
					IF @winLoseReportByGameTotalID > 0
					BEGIN
						UPDATE [dbo].[WinLoseReportByGameTotal]
							SET [TotalBet] = @totalBet
								, [TotalDiscountPrice] = @totalDiscountPrice
								, [TotalWin] = @totalWin
								, [TotalLose] = @totalLose
								, [TotalPending] = @totalPending
								, [UpdateDate] = GETDATE()
							WHERE ID = @winLoseReportByGameTotalID
					END;
					ELSE IF @totalBet > 0 OR @totalPending > 0
					BEGIN
						INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [SelectedNums], [TotalBet], [TotalWin]
							, [TotalLose], [TotalPending], [PlatfromID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @SelectedNums, @totalBet, @totalWin
							, @totalLose, @totalPending, @platformID, 0, @dateS, 0, GETDATE())
					END;
				END;

				SET @lotterySelectedCount = @lotterySelectedCount - 1;
			END;
			-- ./處理Selected項目
					
			
			--2021.3.4 新增GameDealer Agent分潤相關資料
			SELECT @gameDealerMemberCount = COUNT(*)
				FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotalBySelectedAndMember
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = @lotteryInfoID
					AND GameDealerMemberID > 0

			WHILE @gameDealerMemberCount > 0
			BEGIN
				SET @totalBet = 0;
				SET @totalDiscountPrice = 0;
				SET @totalPending = 0;
				SET @totalLose = 0;
				SET @winLoseReportByGameTotalID = 0;

				SELECT @gameDealerMemberID = GameDealerMemberID,
						@lotteryInfoName = LotteryInfoName,
						@SelectedNums = SelectedNums
					FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotalBySelectedAndMember
					WHERE LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
					ORDER BY #tempVwMPlayer_WinLoseReportThirdPartyByGameTotalBySelectedAndMember.[MemberID]
					OFFSET     (@gameDealerMemberCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;

				SELECT @totalBet = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 ),
					@totalDiscountPrice = ISNULL(SUM(CAST(NULLIF(DiscountPrice, '') AS DECIMAL(18, 4))),0 ),
					@totalPending = ISNULL(SUM(CAST(NULLIF(Price, '') AS DECIMAL(18, 4))),0 )
					FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
					WHERE IsWin IS NULL
						AND LotteryTypeID = @lotteryTypeID
						AND LotteryInfoID = @lotteryInfoID
						AND LotteryInfoName = @lotteryInfoName
						AND SelectedNums = @SelectedNums
						AND GameDealerMemberID = @gameDealerMemberID
				
				IF @totalPending = 0 or @totalPending is null
				BEGIN
					SET @gameDealerMemberCount = @gameDealerMemberCount - 1;
					CONTINUE;
				END

				SELECT @mPositionProfitMap = AgentParentMap FROM [MPositionProfitMap] WHERE GameDealerMemberID = @gameDealerMemberID
				SELECT @mPositionProfitMapCount = COUNT(*) FROM [MPositionProfitMap] WHERE AgentParentMap = @mPositionProfitMap
				
				--SELECT @gameDealerMemberID,@totalBet,@totalPending,@lotteryInfoName,@SelectedNums,@mPositionProfitMap
				WHILE @mPositionProfitMapCount > 0
				BEGIN
					SELECT @positionTaking = PositionTakingProfit, @gameDealerMemberID = GameDealerMemberID
					FROM MPositionProfitMap
					WHERE AgentParentMap = @mPositionProfitMap 
					ORDER BY MPositionProfitMap.ID
					OFFSET     (@mPositionProfitMapCount - 1) ROWS
					FETCH NEXT 1 ROWS ONLY;
				
					--IF @memberID = 2
					--BEGIN
					--	SELECT @memberID,@totalBet,@totalPending,@lotteryInfoName,@SelectedNums
					--END

					IF @positionTaking = 0
					BEGIN
						SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
						continue;
					END

					SET @positionTakingProfit = @totalPending * @positionTaking;

					SELECT @winLoseReportByGameTotalID = ID
						FROM #tempWinLoseReportByGameTotal
						WHERE LotteryTypeID = @lotteryTypeID
							AND LotteryInfoID = @lotteryInfoID
							AND LotteryInfoName = @lotteryInfoName
							AND SelectedNums = @SelectedNums
							AND CreateDate = @dateS
							AND GameDealerMemberID = @gameDealerMemberID
							AND PlatfromID = @platformID
							
					IF @winLoseReportByGameTotalID > 0
					BEGIN
						--SELECT @memberID,@positionTakingProfit
						UPDATE [dbo].[WinLoseReportByGameTotal]
							SET [TotalBet] = @totalBet
								, [TotalDiscountPrice] = @totalDiscountPrice
								, [TotalWin] = @totalWin
								, [TotalLose] = @totalLose
								, [TotalPending] = @positionTakingProfit
								, [UpdateDate] = GETDATE()
							WHERE ID = @winLoseReportByGameTotalID
					END;
					ELSE IF @totalBet > 0 OR @totalPending > 0
					BEGIN
						INSERT INTO [dbo].[WinLoseReportByGameTotal]
						([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [GameDealerMemberID], [SelectedNums], [TotalBet], [TotalWin]
							, [TotalLose], [TotalPending], [PlatfromID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
						Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @gameDealerMemberID, @SelectedNums, @totalBet, @totalWin
							, @totalLose, @positionTakingProfit, @platformID, 0, @dateS, 0, GETDATE())
					END;

						
					SET @mPositionProfitMapCount = @mPositionProfitMapCount - 1;
				END

				SET @gameDealerMemberCount = @gameDealerMemberCount - 1;
			END			
			--2021.3.4
			
			SET @lotteryInfoCount = @lotteryInfoCount - 1;
		END;
		-- ./以下處理遊戲類別

		-- 處理GameDealer用戶		
		SET @gameDealerMemberCount = 0;

		SELECT @gameDealerMemberCount = COUNT(*)
			FROM #tmpMemberList

		WHILE @gameDealerMemberCount > 0
		BEGIN
			SET @lotteryInfoName = '';
			SET @SelectedNums = '';
			SET @totalBet = 0;
			SET @totalDiscountPrice =0;
			SET @totalWin = 0;
			SET @totalLose = 0;
			SET @totalPending = 0;
			SET @lotteryInfoID = 0;
			SET @winLoseReportByGameTotalID = 0;

			SELECT @gameDealerMemberID = GameDealerMemberID, @userName = UserName
				FROM #tmpMemberList
				ORDER BY #tmpMemberList.[GameDealerMemberID]
				OFFSET     (@gameDealerMemberCount - 1) ROWS
				FETCH NEXT 1 ROWS ONLY;
			
			IF (SELECT COUNT(*) FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
				WHERE GameDealerMemberID = @gameDealerMemberID
					AND LotteryTypeID = @lotteryTypeID) = 0
			BEGIN
				SET @gameDealerMemberCount = @gameDealerMemberCount - 1;
				continue;
			END

			SELECT @totalBet = SUM(CAST(ISNULL(NULLIF([Price], ''),0 ) AS DECIMAL(18, 4))),
				@totalDiscountPrice = SUM(CAST(ISNULL(NULLIF([DiscountPrice], ''),0 ) AS DECIMAL(18, 4)))
				FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
				WHERE GameDealerMemberID = @gameDealerMemberID
					AND LotteryTypeID = @lotteryTypeID

			SELECT @totalPending = ISNULL(SUM(CAST(ISNULL(NULLIF([Price], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
				WHERE IsWin is null
					AND GameDealerMemberID = @gameDealerMemberID
					AND LotteryTypeID = @lotteryTypeID
				
			SELECT @totalLose = ISNULL(-SUM(CAST(ISNULL(NULLIF([DiscountPrice], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
				WHERE IsWin = 0
					AND GameDealerMemberID = @gameDealerMemberID
					AND LotteryTypeID = @lotteryTypeID

			SELECT @totalWin = ISNULL(SUM(CAST(ISNULL(NULLIF([WinMoney], ''),0 ) AS DECIMAL(18, 4))),0)
				FROM #tempVwMPlayer_WinLoseReportThirdPartyByGameTotal
				WHERE IsWin in (1,0)
					AND GameDealerMemberID = @gameDealerMemberID
					AND LotteryTypeID = @lotteryTypeID
			
			SELECT @winLoseReportByGameTotalID = ID
				FROM #tempWinLoseReportByGameTotal
				WHERE LotteryTypeID = @lotteryTypeID
					AND LotteryInfoID = 0
					AND GameDealerMemberID = @gameDealerMemberID
					AND CreateDate = @dateS
					AND PlatfromID = @platformID

			IF @winLoseReportByGameTotalID > 0
			BEGIN
				UPDATE [dbo].[WinLoseReportByGameTotal]
					SET [TotalBet] = @totalBet
						, [TotalDiscountPrice] = @totalDiscountPrice
						, [TotalWin] = @totalWin
						, [TotalLose] = @totalLose
						, [TotalPending] = @totalPending
						, [UpdateDate] = GETDATE()
					WHERE ID = @winLoseReportByGameTotalID
			END;
			ELSE IF @totalBet > 0
			BEGIN
				INSERT INTO [dbo].[WinLoseReportByGameTotal]
				([LotteryTypeID], [LotteryInfoID], [LotteryInfoName], [GameDealerMemberID], [SelectedNums], [TotalBet], [TotalDiscountPrice], [TotalWin]
					, [TotalLose], [TotalPending], [PlatfromID], [CreateBy], [CreateDate], [UpdateBy], [UpdateDate])
				Values(@lotteryTypeID, @lotteryInfoID, @lotteryInfoName, @gameDealerMemberID, @SelectedNums, @totalBet, @totalDiscountPrice, @totalWin
					, @totalLose, @totalPending, @platformID, 0, @dateS, 0, GETDATE())
			END;

			SET @gameDealerMemberCount = @gameDealerMemberCount - 1;
		END;
		-- 處理GameDealer用戶

		SET @lotteryTypeCount = @lotteryTypeCount - 1;
	END;
END







GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AreaManagement', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PayMainType支款編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankAcceptable', @level2type=N'COLUMN',@level2name=N'PMTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankAcceptable', @level2type=N'COLUMN',@level2name=N'BankName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankAcceptable', @level2type=N'COLUMN',@level2name=N'BankCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付導向網址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankAcceptable', @level2type=N'COLUMN',@level2name=N'PayMainURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'啟動狀態(0關閉、1開啟、2隱藏)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankAcceptable', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PayMainType支款編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankPayMainType', @level2type=N'COLUMN',@level2name=N'PMTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankPayMainType', @level2type=N'COLUMN',@level2name=N'PMTName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付端代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankPayMainType', @level2type=N'COLUMN',@level2name=N'PMTCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支付方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankPayMainType', @level2type=N'COLUMN',@level2name=N'PMRMethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'啟用狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankPayMainType', @level2type=N'COLUMN',@level2name=N'IsClose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'啟用狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BankPayMainType', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最新消息標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bulletin', @level2type=N'COLUMN',@level2name=N'BulletinTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最新消息內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bulletin', @level2type=N'COLUMN',@level2name=N'BulletinNotice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回水比率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashBackR', @level2type=N'COLUMN',@level2name=N'CashBackRebate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家最少輸多少' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashBackR', @level2type=N'COLUMN',@level2name=N'MinLoss'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家最多輸多少' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashBackR', @level2type=N'COLUMN',@level2name=N'MaxLoss'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pay型態(34.Daily, 35 Weekly, 36 Monthly)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashBackR', @level2type=N'COLUMN',@level2name=N'PayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶VIP級別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashBackR', @level2type=N'COLUMN',@level2name=N'UserLevelID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'遊戲主類別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashBackR', @level2type=N'COLUMN',@level2name=N'GameRoomID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'遊戲大類' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashBackR', @level2type=N'COLUMN',@level2name=N'LotteryClassID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'設定檔ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashR', @level2type=N'COLUMN',@level2name=N'CBRSID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返水比率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashR', @level2type=N'COLUMN',@level2name=N'CashRebate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家最少輸多少' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashR', @level2type=N'COLUMN',@level2name=N'MinLoss'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'玩家最多輸多少' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashR', @level2type=N'COLUMN',@level2name=N'MaxLoss'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pay型態(34.Daily, 35 Weekly, 36 Monthly)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashR', @level2type=N'COLUMN',@level2name=N'PayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶VIP級別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashR', @level2type=N'COLUMN',@level2name=N'UserLevelID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'遊戲主類別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashR', @level2type=N'COLUMN',@level2name=N'GameRoomID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'遊戲大類' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashR', @level2type=N'COLUMN',@level2name=N'LotteryClassID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'遊戲大類' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CashR', @level2type=N'COLUMN',@level2name=N'LotteryTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CBank', @level2type=N'COLUMN',@level2name=N'AccountNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CBank', @level2type=N'COLUMN',@level2name=N'BankNotice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'線上支付的URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CBank', @level2type=N'COLUMN',@level2name=N'BankUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CBank', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最小儲值金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CBank', @level2type=N'COLUMN',@level2name=N'MinAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大儲值金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CBank', @level2type=N'COLUMN',@level2name=N'MaxAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回水設定檔名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CBRS', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'適用期間(起)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CBRS', @level2type=N'COLUMN',@level2name=N'DateS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'適用期間(訖)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CBRS', @level2type=N'COLUMN',@level2name=N'DateE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'啟用狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CBRS', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rebate型態(1. Cash Back, 2. Cash Rebate)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CBRS', @level2type=N'COLUMN',@level2name=N'RebateType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rebate型態(1. All, 2. Game, 3. LotteryClass)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CBRS', @level2type=N'COLUMN',@level2name=N'SettingType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Country', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Country', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否在線' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Country', @level2type=N'COLUMN',@level2name=N'CreateBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PayMainType支款編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Deposit', @level2type=N'COLUMN',@level2name=N'PMTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PayMainType支款編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Deposit', @level2type=N'COLUMN',@level2name=N'PMTLogID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Deposit', @level2type=N'COLUMN',@level2name=N'MemberID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Deposit', @level2type=N'COLUMN',@level2name=N'MBankID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Deposit', @level2type=N'COLUMN',@level2name=N'CBankID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'儲值方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Deposit', @level2type=N'COLUMN',@level2name=N'DepositPayMothed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'儲值方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Deposit', @level2type=N'COLUMN',@level2name=N'PromotionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收據號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Deposit', @level2type=N'COLUMN',@level2name=N'RefCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'儲值金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Deposit', @level2type=N'COLUMN',@level2name=N'Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'總流水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Deposit', @level2type=N'COLUMN',@level2name=N'TotalBonus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'儲值狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Deposit', @level2type=N'COLUMN',@level2name=N'DepositTypeSCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最高儲值金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Deposit', @level2type=N'COLUMN',@level2name=N'MaxAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最低儲值金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Deposit', @level2type=N'COLUMN',@level2name=N'MinAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'儲值狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DepositHistory', @level2type=N'COLUMN',@level2name=N'SystemConfigID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DepositHistory', @level2type=N'COLUMN',@level2name=N'MBankID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DepositHistory', @level2type=N'COLUMN',@level2name=N'CBankID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'儲值方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DepositHistory', @level2type=N'COLUMN',@level2name=N'DepositPayMothed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收據號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DepositHistory', @level2type=N'COLUMN',@level2name=N'RefCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'儲值狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DepositHistory', @level2type=N'COLUMN',@level2name=N'DepositTypeSCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最高儲值金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DepositHistory', @level2type=N'COLUMN',@level2name=N'MaxAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最低儲值金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DepositHistory', @level2type=N'COLUMN',@level2name=N'MinAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'遊戲名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrawType', @level2type=N'COLUMN',@level2name=N'DrawTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公式註解' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrawType', @level2type=N'COLUMN',@level2name=N'DrawTypeNotice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前端顯示Style' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DrawType', @level2type=N'COLUMN',@level2name=N'DrawTypeStyle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網域(可以是JArray)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FieldType', @level2type=N'COLUMN',@level2name=N'DNS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網址的Controller' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FieldType', @level2type=N'COLUMN',@level2name=N'ControllerName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'實際位址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FieldType', @level2type=N'COLUMN',@level2name=N'ActionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否有Signal Page切頁的功能' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FieldType', @level2type=N'COLUMN',@level2name=N'HasPageStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'web畫面位置(tab或有切換畫面用ex:addview,updateview)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FieldType', @level2type=N'COLUMN',@level2name=N'PageStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群組ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FieldType', @level2type=N'COLUMN',@level2name=N'FamilyBigID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群組ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FieldType', @level2type=N'COLUMN',@level2name=N'FamilyMiddelID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群組ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FieldType', @level2type=N'COLUMN',@level2name=N'FamilySmallID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'欄位主名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FieldType', @level2type=N'COLUMN',@level2name=N'FieldKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'欄位的各語系JSON' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FieldType', @level2type=N'COLUMN',@level2name=N'FieldValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'欄位的敍述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FieldType', @level2type=N'COLUMN',@level2name=N'FieldNotice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'幦別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'Currency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'現行密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'Pwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶VIP等級ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'MGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶VIP等級ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'UserLevelID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入使用的Token' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'LoginToken'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'MoneyPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上級帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'AgentParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理費佔比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'AgentPositionTakingRebate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理人地圖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'AgentParentMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶級別(1:Company,2:SM,3:M,4:AG,5:Member)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'AgentLevelSCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上級帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'ReferralParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費發放時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'ReferralPayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費率-公司' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'ReferralLayerLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹人地圖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'ReferralMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹返水-賠率設定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'ReferralCashRebate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'電子信箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手機' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'LoginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是後登入時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'LastLoginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'LoginIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費發放時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'LoginWrongTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'總餘額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'TotalBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月儲值金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'MonthDeposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'總儲值金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'TotalDeposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大獲利' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'MaxWinAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'總投注金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'TotalRealBet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶型態(0:系統管理者、1:後端客服、2:代理)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'UserType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否能多重登入預設不行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'IsMultiLogin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否欠下級錢被鎖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'WalletIsLock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第一次更新的密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'FirstPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第二次更新的密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'SecondPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返水發放時間(1日,2週,3月)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'CashRebatePayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回水發放時間(1日,2週,3月)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'CashBackRebatePayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否能修改手機' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'IsEditPhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email驗證開關' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'IsEmailValidator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否能修改Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'IsEditEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'首次註冊' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'IsFirst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否鎖定帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'IsLock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'IsOnline'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否在線' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMemberShip', @level2type=N'COLUMN',@level2name=N'CreateBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當下期數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayer', @level2type=N'COLUMN',@level2name=N'CurrentPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'期號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayer', @level2type=N'COLUMN',@level2name=N'LotteryInfoName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'選擇組合' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayer', @level2type=N'COLUMN',@level2name=N'SelectedNums'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否追號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayer', @level2type=N'COLUMN',@level2name=N'IsAfter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追號倍數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayer', @level2type=N'COLUMN',@level2name=N'ManualBet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追號期數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayer', @level2type=N'COLUMN',@level2name=N'Multiple'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投注總金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayer', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投注數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayer', @level2type=N'COLUMN',@level2name=N'Qty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'輸贏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayer', @level2type=N'COLUMN',@level2name=N'IsWin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'選擇賠率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayer', @level2type=N'COLUMN',@level2name=N'RebatePro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayer', @level2type=N'COLUMN',@level2name=N'RebateProMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶中獎金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayer', @level2type=N'COLUMN',@level2name=N'WinMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否己寫入到Report' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayer', @level2type=N'COLUMN',@level2name=N'IsWriteReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶投注數量投入百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayerReport', @level2type=N'COLUMN',@level2name=N'LotteryClassID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶投注數量投入百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayerReport', @level2type=N'COLUMN',@level2name=N'LotteryTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當下期數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayerReport', @level2type=N'COLUMN',@level2name=N'CurrentPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayerReport', @level2type=N'COLUMN',@level2name=N'DiscountPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayerReport', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayerReport', @level2type=N'COLUMN',@level2name=N'CashRebateMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayerReport', @level2type=N'COLUMN',@level2name=N'CashRebateMoneyStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayerReport', @level2type=N'COLUMN',@level2name=N'CashBackRebateMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayerReport', @level2type=N'COLUMN',@level2name=N'CashBackRebateMoneyStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayerReport', @level2type=N'COLUMN',@level2name=N'AgentMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶級別(1:Company,2:SM,3:M,4:AG,5:Member)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayerReport', @level2type=N'COLUMN',@level2name=N'AgentLevelSCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費發放時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerMPlayerReport', @level2type=N'COLUMN',@level2name=N'ReferralPayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上級帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerWinLoseReport', @level2type=N'COLUMN',@level2name=N'AgentParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理費佔比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerWinLoseReport', @level2type=N'COLUMN',@level2name=N'AgentPositionTakingRebate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理人地圖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameDealerWinLoseReport', @level2type=N'COLUMN',@level2name=N'AgentParentMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'現行密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GameRoomType', @level2type=N'COLUMN',@level2name=N'GamePwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投注頁面的選項顯示字串(ex:球)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryContent', @level2type=N'COLUMN',@level2name=N'ContentText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投注頁面的選項顯示Style(ex:球)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryContent', @level2type=N'COLUMN',@level2name=N'ContentStyle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投注頁面的選項值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryContent', @level2type=N'COLUMN',@level2name=N'ContentValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投注頁面的顯示圖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryContent', @level2type=N'COLUMN',@level2name=N'ContentImg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'畫面型態(1:投注選項、2:籌碼)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryContent', @level2type=N'COLUMN',@level2name=N'Types'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣(代理出的錢)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryInfo', @level2type=N'COLUMN',@level2name=N'DisCount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群組ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryInfo', @level2type=N'COLUMN',@level2name=N'MinBet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群組ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryInfo', @level2type=N'COLUMN',@level2name=N'MaxBet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群組ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryInfo', @level2type=N'COLUMN',@level2name=N'FamliyBigID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群組ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryInfo', @level2type=N'COLUMN',@level2name=N'FamliyMiddelID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群組ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryInfo', @level2type=N'COLUMN',@level2name=N'FamliySmallID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶投注數量投入百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'LotteryTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'期號間隔(秒)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'PeriodInterval'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'期號間隔(秒)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'RealPlayTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最高獲勝金額-獎金池' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'MaxBonusMoneyPool'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'抽取百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'DrawBonusPercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否維護中' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'IsMaintain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AI啟用運算型態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'AIType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司獲勝率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'CompanyWinPercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者獲勝率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'UserWinPercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司抽成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'CompanyPresetCompensation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者獲勝率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'URL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'家族ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'FamliyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'家族排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'FamliyISort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1. 新推出 2. 熱門投注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'NewOrHot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否為官方彩' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryType', @level2type=N'COLUMN',@level2name=N'IsOfficial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者獲勝率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LotteryTypeRankin', @level2type=N'COLUMN',@level2name=N'URL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MBank', @level2type=N'COLUMN',@level2name=N'MemberID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MBank', @level2type=N'COLUMN',@level2name=N'BankCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MBank', @level2type=N'COLUMN',@level2name=N'BankName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MBank', @level2type=N'COLUMN',@level2name=N'BankNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MCompany', @level2type=N'COLUMN',@level2name=N'CashRebate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MCompany', @level2type=N'COLUMN',@level2name=N'CashBackRebate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'現行密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'Pwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶VIP等級ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'UserLevelID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶VIP等級ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'MGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'Birthday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'銀行密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'MoneyPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'FullName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上級帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'AgentParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理費佔比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'AgentPositionTakingRebate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理人地圖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'AgentParentMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶級別(1:Company,2:SM,3:M,4:AG,5:Member)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'AgentLevelSCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上級帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'ReferralParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費發放時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'ReferralPayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費率-公司' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'ReferralLayerLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹人地圖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'ReferralMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹返水-賠率設定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'ReferralCashRebate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'電子信箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手機' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'LoginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是後登入時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'LastLoginTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'LoginIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費發放時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'LoginWrongTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'總餘額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'TotalBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'月儲值金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'MonthDeposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'總儲值金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'TotalDeposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大獲利' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'MaxWinAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'總投注金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'TotalRealBet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶型態(0:系統管理者、1:後端客服、2:代理)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'UserType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否能多重登入預設不行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'IsMultiLogin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否欠下級錢被鎖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'WalletIsLock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第一次更新的密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'FirstPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第二次更新的密碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'SecondPwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返水發放時間(1日,2週,3月)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'CashRebatePayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回水發放時間(1日,2週,3月)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'CashBackRebatePayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否能修改手機' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'IsEditPhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email驗證開關' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'IsEmailValidator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否能修改Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'IsEditEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'首次註冊' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'IsFirst'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否鎖定帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'IsLock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'IsOnline'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否在線' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip', @level2type=N'COLUMN',@level2name=N'CreateBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MemberShip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能群組ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MGMap', @level2type=N'COLUMN',@level2name=N'FID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶群組ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MGMap', @level2type=N'COLUMN',@level2name=N'MGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶群組名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MGroup', @level2type=N'COLUMN',@level2name=N'MGroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當下期數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'CurrentPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'期號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'LotteryInfoName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'選擇組合' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'SelectedNums'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否追號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'IsAfter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追號倍數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'ManualBet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'追號期數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'Multiple'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'DiscountPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投注金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投注數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'Qty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'輸贏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'IsWin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'選擇賠率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'RebatePro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'RebateProMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶中獎金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'WinMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費發放時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'ReferralPayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'返水發放時間(1日,2週,3月)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'CashRebatePayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回水發放時間(1日,2週,3月)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'CashBackRebatePayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否己寫入到Report 0.否 1.已寫入 2.正在promo不須寫入' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'IsReferralWriteReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否己寫入到Report' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'IsCashRebateWriteReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否己寫入到Report' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'IsCashBackWriteReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否開獎' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayer', @level2type=N'COLUMN',@level2name=N'IsReset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶投注數量投入百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerReport', @level2type=N'COLUMN',@level2name=N'LotteryClassID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶投注數量投入百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerReport', @level2type=N'COLUMN',@level2name=N'LotteryTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當下期數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerReport', @level2type=N'COLUMN',@level2name=N'CurrentPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'折扣金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerReport', @level2type=N'COLUMN',@level2name=N'DiscountPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerReport', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerReport', @level2type=N'COLUMN',@level2name=N'CashRebateMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerReport', @level2type=N'COLUMN',@level2name=N'CashRebateMoneyStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerReport', @level2type=N'COLUMN',@level2name=N'CashBackRebateMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerReport', @level2type=N'COLUMN',@level2name=N'CashBackRebateMoneyStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerReport', @level2type=N'COLUMN',@level2name=N'AgentMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶級別(1:Company,2:SM,3:M,4:AG,5:Member)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerReport', @level2type=N'COLUMN',@level2name=N'AgentLevelSCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費發放時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerReport', @level2type=N'COLUMN',@level2name=N'ReferralPayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否開獎' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerReport', @level2type=N'COLUMN',@level2name=N'IsReset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerTopSort', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否在線' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPlayerTopSort', @level2type=N'COLUMN',@level2name=N'CreateBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理費佔比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPositionProfitMap', @level2type=N'COLUMN',@level2name=N'AgentParentMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否在線' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPositionProfitMap', @level2type=N'COLUMN',@level2name=N'CreateBy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'儲值活動ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPromotion', @level2type=N'COLUMN',@level2name=N'PromotionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPromotion', @level2type=N'COLUMN',@level2name=N'MemberID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'遊戲ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPromotion', @level2type=N'COLUMN',@level2name=N'LotteryTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'總流水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPromotion', @level2type=N'COLUMN',@level2name=N'TotalBonus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'總流水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPromotion', @level2type=N'COLUMN',@level2name=N'TurnOverAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'總輸錢' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPromotion', @level2type=N'COLUMN',@level2name=N'TotalPlayerWinAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'總輸錢' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPromotion', @level2type=N'COLUMN',@level2name=N'TotalPlayerAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投注金驗證可提款金額(投注額*倍數)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPromotion', @level2type=N'COLUMN',@level2name=N'UnlockWithdrawalTask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MPromotion', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶錢包分類' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MWallet', @level2type=N'COLUMN',@level2name=N'CompanyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MWallet', @level2type=N'COLUMN',@level2name=N'MemberID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'哪個遊戲的錢包，預設為主錢包' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MWallet', @level2type=N'COLUMN',@level2name=N'LotteryClassID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動獎勵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MWallet', @level2type=N'COLUMN',@level2name=N'PromotionBonusPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'遊戲ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'LotteryTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始投注時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'CurrentLotteryTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當下期數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'CurrentPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開獎結果' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'Result'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否開獎' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'IsOpen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'關閉投注時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'RealCloseTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'關閉投注時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'CloseTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'動畫結束時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'EndPlayTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開獎註解' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'ResultNotice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否開獎' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'IsReset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否開獎' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'ResetTimes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'CreateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'UpdateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLottery', @level2type=N'COLUMN',@level2name=N'UpdateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始投注時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLotteryHistory', @level2type=N'COLUMN',@level2name=N'CurrentLotteryTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'關閉投注時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLotteryHistory', @level2type=N'COLUMN',@level2name=N'RealCloseTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'動畫結束時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLotteryHistory', @level2type=N'COLUMN',@level2name=N'EndPlayTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開獎註解' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLotteryHistory', @level2type=N'COLUMN',@level2name=N'ResultNotice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否開獎' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OLotteryHistory', @level2type=N'COLUMN',@level2name=N'IsReset'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'利潤狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformProfitLoss', @level2type=N'COLUMN',@level2name=N'ProfitLossType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'PromotionName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動日期(起)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'PromotionPeriodS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動日期(訖)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'PromotionPeriodE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動型態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'SystemConfigTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶等級' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'UserLevelID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動圖檔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'活動圖檔' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'Img'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'儲值下限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'MinDepositMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'紅利%' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'BonusPercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'紅利%' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'MaxBonus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'總流水百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'UnlockWithdrawalMultiple'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投注金驗證可提款金額(投注額*倍數)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'UnlockWithdrawalTask'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'遊戲ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'LotteryTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'首次儲值適用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformPromotion', @level2type=N'COLUMN',@level2name=N'IsFirstPromotion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平台名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformSetting', @level2type=N'COLUMN',@level2name=N'PlatformName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平台位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformSetting', @level2type=N'COLUMN',@level2name=N'ServerIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平台位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformSetting', @level2type=N'COLUMN',@level2name=N'URL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformSetting', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CallBack的URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformSetting', @level2type=N'COLUMN',@level2name=N'CompanyDNS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CallBack的URL' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformSetting', @level2type=N'COLUMN',@level2name=N'APIPath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'API用戶驗證碼明碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformSetting', @level2type=N'COLUMN',@level2name=N'APID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'API用戶驗證碼加密' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformSetting', @level2type=N'COLUMN',@level2name=N'PrivateKeyAPID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'API帳號前餟字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformSetting', @level2type=N'COLUMN',@level2name=N'APICode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用投注OTP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformSetting', @level2type=N'COLUMN',@level2name=N'PlayTokenStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否為測試使用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformSetting', @level2type=N'COLUMN',@level2name=N'IsTest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否為測試使用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformSetting', @level2type=N'COLUMN',@level2name=N'IsMaintain'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所屬類型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlatformSetting', @level2type=N'COLUMN',@level2name=N'TypeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分層' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReferralLayer', @level2type=N'COLUMN',@level2name=N'ReferralLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'pay型態(34.Daily, 35 Weekly, 36 Monthly)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReferralLayer', @level2type=N'COLUMN',@level2name=N'PayType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReferralReport', @level2type=N'COLUMN',@level2name=N'ReferralMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'頁面標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SEO', @level2type=N'COLUMN',@level2name=N'PageTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'頁面網址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SEO', @level2type=N'COLUMN',@level2name=N'PageURL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Meta標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SEO', @level2type=N'COLUMN',@level2name=N'MetaTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'關鍵字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SEO', @level2type=N'COLUMN',@level2name=N'MetaKeyword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當下期數-對應Slot的期數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'RoundId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'遊戲型別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'SlotTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'遊戲代號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'SlotTypeCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'期號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'SlotInfoName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'期號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'RoundDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投注總金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投注數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'Qty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'輸贏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'IsWin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'選擇賠率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'Reference'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'選擇賠率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'RebatePro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'RebateProMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶中獎金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'WinMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否己寫入到Report' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'IsWriteReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回水金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayer', @level2type=N'COLUMN',@level2name=N'CashBackMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當下期數-對應Slot的期數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayerRefund', @level2type=N'COLUMN',@level2name=N'RoundId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayerReport', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayerReport', @level2type=N'COLUMN',@level2name=N'CashRebateMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'反水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayerReport', @level2type=N'COLUMN',@level2name=N'CashRebateMoneyStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayerReport', @level2type=N'COLUMN',@level2name=N'CashBackRebateMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回水' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayerReport', @level2type=N'COLUMN',@level2name=N'CashBackRebateMoneyStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayerReport', @level2type=N'COLUMN',@level2name=N'AgentMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶級別(1:Company,2:SM,3:M,4:AG,5:Member)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotMPlayerReport', @level2type=N'COLUMN',@level2name=N'AgentLevelSCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'當下期數-對應Slot的期數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotTransaction', @level2type=N'COLUMN',@level2name=N'RoundId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投注數量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotTransaction', @level2type=N'COLUMN',@level2name=N'Qty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'輸贏' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotTransaction', @level2type=N'COLUMN',@level2name=N'IsWin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶中獎金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotTransaction', @level2type=N'COLUMN',@level2name=N'Bonus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶中獎金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotTransaction', @level2type=N'COLUMN',@level2name=N'WinMoney'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶投注數量投入百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotType', @level2type=N'COLUMN',@level2name=N'SlotTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'老虎機一次顯示幾行' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotType', @level2type=N'COLUMN',@level2name=N'SlotRows'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'轉的次數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotType', @level2type=N'COLUMN',@level2name=N'Reels'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最高獲勝金額-獎金池' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotType', @level2type=N'COLUMN',@level2name=N'MaxBonusMoneyPool'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'抽取百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotType', @level2type=N'COLUMN',@level2name=N'DrawBonusPercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AI啟用運算型態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotType', @level2type=N'COLUMN',@level2name=N'AIType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公司獲勝率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotType', @level2type=N'COLUMN',@level2name=N'CompanyWinPercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者獲勝率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotType', @level2type=N'COLUMN',@level2name=N'UserWinPercentage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者獲勝率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotType', @level2type=N'COLUMN',@level2name=N'URL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'家族ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotType', @level2type=N'COLUMN',@level2name=N'FamliyID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'家族排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotType', @level2type=N'COLUMN',@level2name=N'FamliySort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1. 新推出 2. 熱門投注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SlotType', @level2type=N'COLUMN',@level2name=N'NewOrHot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SQLLog', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SQLLog', @level2type=N'COLUMN',@level2name=N'CommandStr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶投注數量投入百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statement', @level2type=N'COLUMN',@level2name=N'LotteryClassID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶投注數量投入百分比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Statement', @level2type=N'COLUMN',@level2name=N'LotteryTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'項目名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemConfig', @level2type=N'COLUMN',@level2name=N'ConfigName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'項目代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemConfig', @level2type=N'COLUMN',@level2name=N'ConfigTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemLog', @level2type=N'COLUMN',@level2name=N'ErrorCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'介紹費金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SystemLog', @level2type=N'COLUMN',@level2name=N'ErrorMsg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上級帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TotalWinLoseReport', @level2type=N'COLUMN',@level2name=N'AgentParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理費佔比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TotalWinLoseReport', @level2type=N'COLUMN',@level2name=N'AgentPositionTakingRebate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理人地圖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TotalWinLoseReport', @level2type=N'COLUMN',@level2name=N'AgentParentMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收據號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsHistory', @level2type=N'COLUMN',@level2name=N'RefCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PayMainType支款編碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsHistory', @level2type=N'COLUMN',@level2name=N'PMTID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收款金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsHistory', @level2type=N'COLUMN',@level2name=N'DebitAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'付款金額' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsHistory', @level2type=N'COLUMN',@level2name=N'CreditAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手續費' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsHistory', @level2type=N'COLUMN',@level2name=N'Fees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'交易狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsHistory', @level2type=N'COLUMN',@level2name=N'TransacitonsTypeSCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionsHistory', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等級名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserLevel', @level2type=N'COLUMN',@level2name=N'LevelName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶等級' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserLevel', @level2type=N'COLUMN',@level2name=N'ULevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'等級名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserLevel', @level2type=N'COLUMN',@level2name=N'LevelNotice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'儲值金額界線' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserLevel', @level2type=N'COLUMN',@level2name=N'MinAddCredit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'儲值金額界線' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserLevel', @level2type=N'COLUMN',@level2name=N'MinTotalRealBet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'依據用戶等級返還設定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserLevel', @level2type=N'COLUMN',@level2name=N'SPCashBack'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserLevel', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'遊戲品牌名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSite', @level2type=N'COLUMN',@level2name=N'BrandName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站Title' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSite', @level2type=N'COLUMN',@level2name=N'PageTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站樣式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSite', @level2type=N'COLUMN',@level2name=N'WebsiteStyleSCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Google分析Script' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSite', @level2type=N'COLUMN',@level2name=N'GoogleAnalytics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Footer文字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSite', @level2type=N'COLUMN',@level2name=N'FooterText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手機板Url' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSite', @level2type=N'COLUMN',@level2name=N'MWebsiteUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上級帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WinLoseReport', @level2type=N'COLUMN',@level2name=N'AgentParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理費佔比' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WinLoseReport', @level2type=N'COLUMN',@level2name=N'AgentPositionTakingRebate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代理人地圖' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WinLoseReport', @level2type=N'COLUMN',@level2name=N'AgentParentMap'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶級別(1:Company,2:SM,3:M,4:AG,5:Member)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WinLoseReportByGameTotal', @level2type=N'COLUMN',@level2name=N'AgentLevelSCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶級別(1:Company,2:SM,3:M,4:AG,5:Member)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WinLoseReportByGameTotal', @level2type=N'COLUMN',@level2name=N'AgentMemberID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶級別(1:Company,2:SM,3:M,4:AG,5:Member)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WinLoseReportByGameTotal', @level2type=N'COLUMN',@level2name=N'AgentGameDealerMemberID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'期號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WinLoseReportByGameTotal', @level2type=N'COLUMN',@level2name=N'LotteryInfoName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'選擇組合' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WinLoseReportByGameTotal', @level2type=N'COLUMN',@level2name=N'SelectedNums'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'期號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WinLoseReportThirdPartyByGameTotal', @level2type=N'COLUMN',@level2name=N'LotteryInfoName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'選擇組合' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WinLoseReportThirdPartyByGameTotal', @level2type=N'COLUMN',@level2name=N'SelectedNums'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithDrawal', @level2type=N'COLUMN',@level2name=N'MemberID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶銀行ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithDrawal', @level2type=N'COLUMN',@level2name=N'CBankID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶銀行ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithDrawal', @level2type=N'COLUMN',@level2name=N'MBankID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收據號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithDrawal', @level2type=N'COLUMN',@level2name=N'RefCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提款狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithDrawal', @level2type=N'COLUMN',@level2name=N'WithDrawalTypeSCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提款狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithDrawalHistory', @level2type=N'COLUMN',@level2name=N'SystemConfigID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶銀行ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithDrawalHistory', @level2type=N'COLUMN',@level2name=N'CBankID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用戶銀行ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithDrawalHistory', @level2type=N'COLUMN',@level2name=N'MBankID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收據號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithDrawalHistory', @level2type=N'COLUMN',@level2name=N'RefCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提款狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WithDrawalHistory', @level2type=N'COLUMN',@level2name=N'WithDrawalTypeSCID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CBRS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 279
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "CashBackR"
            Begin Extent = 
               Top = 6
               Left = 241
               Bottom = 275
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCashBackRSetting'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCashBackRSetting'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CBRS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 321
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CashR"
            Begin Extent = 
               Top = 6
               Left = 241
               Bottom = 283
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCashRSetting'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCashRSetting'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Deposit"
            Begin Extent = 
               Top = 12
               Left = 356
               Bottom = 327
               Right = 555
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MemberShip"
            Begin Extent = 
               Top = 14
               Left = 48
               Bottom = 333
               Right = 295
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CBank"
            Begin Extent = 
               Top = 11
               Left = 628
               Bottom = 141
               Right = 810
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "BankAcceptable"
            Begin Extent = 
               Top = 9
               Left = 842
               Bottom = 139
               Right = 1007
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "BankPayMainType"
            Begin Extent = 
               Top = 6
               Left = 1045
               Bottom = 136
               Right = 1210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwDeposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwDeposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwDeposit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "APIDefault"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FGMap"
            Begin Extent = 
               Top = 95
               Left = 231
               Bottom = 225
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FunctionGroup"
            Begin Extent = 
               Top = 6
               Left = 444
               Bottom = 136
               Right = 609
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwFGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwFGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[59] 4[2] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "mp"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 502
               Right = 295
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "li"
            Begin Extent = 
               Top = 18
               Left = 298
               Bottom = 283
               Right = 497
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "lt"
            Begin Extent = 
               Top = 18
               Left = 532
               Bottom = 263
               Right = 793
            End
            DisplayFlags = 280
            TopColumn = 17
         End
         Begin Table = "ol"
            Begin Extent = 
               Top = 9
               Left = 808
               Bottom = 308
               Right = 1005
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwGameDealerMPlayer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwGameDealerMPlayer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "GameDealerMPlayerReport"
            Begin Extent = 
               Top = 6
               Left = 323
               Bottom = 269
               Right = 580
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "SystemConfig"
            Begin Extent = 
               Top = 6
               Left = 618
               Bottom = 136
               Right = 793
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GameDealerMemberShip"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 285
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwGameDealerMPlayerReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwGameDealerMPlayerReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LotteryBetLimitMap"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LotteryBetLimit"
            Begin Extent = 
               Top = 6
               Left = 257
               Bottom = 136
               Right = 422
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LotteryClass"
            Begin Extent = 
               Top = 194
               Left = 235
               Bottom = 324
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2205
         Table = 2115
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwLotteryClassLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwLotteryClassLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "li"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "lc"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 136
               Right = 480
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwLotteryInfoHasGRID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwLotteryInfoHasGRID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LotteryInfo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "LotteryBetLimitMap"
            Begin Extent = 
               Top = 17
               Left = 317
               Bottom = 281
               Right = 485
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LotteryBetLimit"
            Begin Extent = 
               Top = 19
               Left = 531
               Bottom = 256
               Right = 696
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2130
         Alias = 2730
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwLotteryInfoLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwLotteryInfoLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[36] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LotteryType"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 299
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "LotteryBetLimitMap"
            Begin Extent = 
               Top = 6
               Left = 443
               Bottom = 136
               Right = 611
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "LotteryBetLimit"
            Begin Extent = 
               Top = 17
               Left = 692
               Bottom = 147
               Right = 857
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2925
         Alias = 2280
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwLotteryTypeLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwLotteryTypeLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ms"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 291
               Right = 289
            End
            DisplayFlags = 280
            TopColumn = 35
         End
         Begin Table = "sc"
            Begin Extent = 
               Top = 6
               Left = 323
               Bottom = 137
               Right = 498
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "mp"
            Begin Extent = 
               Top = 6
               Left = 536
               Bottom = 102
               Right = 721
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 44
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwMemberShip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwMemberShip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwMemberShip'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MGMap"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MemberShip"
            Begin Extent = 
               Top = 6
               Left = 452
               Bottom = 265
               Right = 699
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MGroup"
            Begin Extent = 
               Top = 6
               Left = 241
               Bottom = 136
               Right = 413
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwMFGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwMFGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ms"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 285
            End
            DisplayFlags = 280
            TopColumn = 44
         End
         Begin Table = "mp"
            Begin Extent = 
               Top = 6
               Left = 323
               Bottom = 136
               Right = 488
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "pfs"
            Begin Extent = 
               Top = 6
               Left = 526
               Bottom = 136
               Right = 698
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VWMPlatform'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VWMPlatform'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[15] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "mp"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 324
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 19
         End
         Begin Table = "li"
            Begin Extent = 
               Top = 138
               Left = 296
               Bottom = 459
               Right = 495
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "lt"
            Begin Extent = 
               Top = 266
               Left = 564
               Bottom = 595
               Right = 794
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "gm"
            Begin Extent = 
               Top = 7
               Left = 545
               Bottom = 171
               Right = 852
            End
            DisplayFlags = 280
            TopColumn = 48
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 899
         Table = 1175
         Output = 726
         Append = 1400
         NewValue = 1170
         SortType = 1348
         SortOrder = 1405
         GroupBy = 1350
         Filter = 1348
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwMPlayer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwMPlayer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MemberShip"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 295
               Right = 285
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MPlayerReport"
            Begin Extent = 
               Top = 6
               Left = 323
               Bottom = 335
               Right = 546
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "SystemConfig"
            Begin Extent = 
               Top = 6
               Left = 584
               Bottom = 258
               Right = 759
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwMPlayerReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwMPlayerReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[50] 4[11] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MPromotion"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 248
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PlatformPromotion"
            Begin Extent = 
               Top = 101
               Left = 317
               Bottom = 415
               Right = 556
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "SystemConfig"
            Begin Extent = 
               Top = 6
               Left = 594
               Bottom = 136
               Right = 769
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwMPromotion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwMPromotion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[31] 4[30] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LotteryClass"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MWallet"
            Begin Extent = 
               Top = 6
               Left = 281
               Bottom = 136
               Right = 491
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2565
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwMWallet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwMWallet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PlatformPromotion"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 248
               Right = 277
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "SystemConfig"
            Begin Extent = 
               Top = 6
               Left = 583
               Bottom = 136
               Right = 758
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwPlatformPromotion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwPlatformPromotion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TransactionsHistory"
            Begin Extent = 
               Top = 24
               Left = 592
               Bottom = 321
               Right = 806
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MBank"
            Begin Extent = 
               Top = 0
               Left = 334
               Bottom = 302
               Right = 531
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CBank"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 266
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "MemberShip"
            Begin Extent = 
               Top = 38
               Left = 883
               Bottom = 340
               Right = 1130
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SystemConfig"
            Begin Extent = 
               Top = 318
               Left = 372
               Bottom = 618
               Right = 547
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Deposit"
            Begin Extent = 
               Top = 6
               Left = 1168
               Bottom = 136
               Right = 1367
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "BankAcceptable"
            Begin Extent = 
               Top = 138
               Left = 1168
               Bottom = 268
               Right = 1333
            End
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwTransactionsHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 27
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2955
         Alias = 1455
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwTransactionsHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwTransactionsHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "WithDrawal"
            Begin Extent = 
               Top = 61
               Left = 147
               Bottom = 335
               Right = 356
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "MBank"
            Begin Extent = 
               Top = 6
               Left = 394
               Bottom = 216
               Right = 591
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "MemberShip"
            Begin Extent = 
               Top = 6
               Left = 629
               Bottom = 313
               Right = 876
            End
            DisplayFlags = 280
            TopColumn = 12
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwWithdrawal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwWithdrawal'
GO
USE [master]
GO
ALTER DATABASE [ThirdM] SET  READ_WRITE 
GO
