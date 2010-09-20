<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="hotodogo" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:schemaLocation="http://www.ncl.org.br/NCL3.0/EDTVProfile
		http://www.ncl.org.br/NCL3.0/profiles/NCL30EDTV.xsd">

<head>
	<regionBase>
		<region id="rgBg" width="100%" height="100%" zIndex="0"/>
		<region id="rgMain" width="100%" height="100%" zIndex="1">
			<region id="rgButton" top="2%" left="25%" height="4%" width="4%"/>
			<region id="rgAd" top="5%" left="70%" height="5%" width="5%"/>
		</region>
		<region id="rgMenu" top="80%" left="0" height="20%" width="100%" zIndex="1">
			<!-- Menu regions -->
			<region id="rgMenuItem1" top="5%" left="10%" height="20%" width="20%"/>
			<region id="rgMenuItem2" top="29%" left="10%" height="20%" width="20%"/>
			<region id="rgMenuItem3" top="53%" left="10%" height="20%" width="20%"/>
			<region id="rgMenuItem4" top="77%" left="10%" height="20%" width="20%"/>
			<!-- Selection regions -->
			<region id="rgMenuItemBack" top="73%" left="72%" height="15%" width="15%" zIndex="2"/>
			<region id="rgMenuItemText" top="12%" left="12%" height="70%" width="80%"/>
			<region id="rgMenuItemBorder" top="5%" left="10%" height="90%" width="80%"/>
		</region>
	</regionBase>
	
	<descriptorBase>
		<descriptor id="dsBg" region="rgBg"/>
		<descriptor id="dsMain" region="rgMain"/>
		<descriptor id="dsButton" region="rgButton"/>
		<descriptor id="dsAd" region="rgAd"/>
				
		<!-- Top Menu descriptors -->
		<descriptor id="dsMenuItem1" region="rgMenuItem1" focusIndex="1" moveUp="4" moveDown="2"/>
		<descriptor id="dsMenuItem2" region="rgMenuItem2" focusIndex="2" moveUp="1" moveDown="3"/>
		<descriptor id="dsMenuItem3" region="rgMenuItem3" focusIndex="3" moveUp="2" moveDown="4"/>
		<descriptor id="dsMenuItem4" region="rgMenuItem4" focusIndex="4" moveUp="3" moveDown="1"/>

		<!-- SubMenu descriptors -->
		<descriptor id="dsSubMenuItem1" region="rgMenuItem1" focusIndex="11" moveUp="14" moveDown="12"/>
		<descriptor id="dsSubMenuItem2" region="rgMenuItem2" focusIndex="12" moveUp="11" moveDown="13"/>
		<descriptor id="dsSubMenuItem3" region="rgMenuItem3" focusIndex="13" moveUp="12" moveDown="14"/>
		<descriptor id="dsSubMenuItem4" region="rgMenuItem4" focusIndex="14" moveUp="13" moveDown="11"/>

		<!-- Selection descriptors -->
		<descriptor id="dsSubMenuBack" region="rgMenuItemBack" focusIndex="21"/>
		<descriptor id="dsSubMenuText" region="rgMenuItemText" scroll="automatic" fontColor="black" fontFamily="arial" fontSize="12" fit="hidden"/>
		<descriptor id="dsSubMenuBorder" region="rgMenuItemBorder"/>
	</descriptorBase>
	
	<connectorBase>
		<importBase documentURI="composerConnectorBase.conn" alias="cb"/>
	</connectorBase>
</head>

<body>
	<port id="sampaClipPort" component="sampaClip"/>
	<port id="btRedPort" component="btRed"/>
	
	<media id="sampaClip" src="20100815.mp4" descriptor="dsMain">
		<property name="bounds"/>
		<area id="start" begin="0s"/>
		<area id="startKraft" begin="5s"/>
		<area id="endKraft" begin="10s"/>
		<area id="startMaionese" begin="12s"/>
		<area id="endMaionese" begin="20s"/>
	</media>

	<media id="btRed" src="buttons/red.png" descriptor="dsButton"/>

	<!-- Ad Medias -->	
	<media id="adMaionese" src="maio_leite.jpg" descriptor="dsAd"/>
	<media id="adKraft" src="kraft-logo.png" descriptor="dsAd"/>

	<!-- TopMenu -->
	<context id="ctxMenu">
		<port id="pBtTopMenu1" component="btTopMenu1"/>
		<port id="pBtTopMenu2" component="btTopMenu2"/>
		<port id="pBtTopMenu3" component="btTopMenu3"/>
		<port id="pBtTopMenu4" component="btTopMenu4"/>
		<port id="pBgTop" component="bgTop"/>
				
		<media id="bgTop" src="bg.png" descriptor="dsBg"/>
		<media id="btTopMenu1" src="menu/topmenu1.png" descriptor="dsMenuItem1"/>
		<media id="btTopMenu2" src="menu/topmenu2.png" descriptor="dsMenuItem2"/>
		<media id="btTopMenu3" src="menu/topmenu3.png" descriptor="dsMenuItem3"/>
		<media id="btTopMenu4" src="menu/topmenu4.png" descriptor="dsMenuItem4"/>
	</context>

	<!-- ::: Sub Menu 1 Contexts ::: -->
	
	<!-- SubMenu 1 -->
	<context id="ctxSub1Menu">
		<port id="pBtSub1Menu1" component="btSub1Menu1"/>
		<port id="pBtSub1Menu2" component="btSub1Menu2"/>
		<port id="pBtSub1Menu3" component="btSub1Menu3"/>
		<port id="pBtSub1Menu4" component="btSub1Menu4"/>
		<port id="pBg1Sub" component="bg1Sub"/>
				
		<media id="bg1Sub" src="bg.png" descriptor="dsBg"/>
		<media id="btSub1Menu1" src="menu/sub1menu1.png" descriptor="dsSubMenuItem1"/>
		<media id="btSub1Menu2" src="menu/sub1menu2.png" descriptor="dsSubMenuItem2"/>
		<media id="btSub1Menu3" src="menu/sub1menu3.png" descriptor="dsSubMenuItem3"/>
		<media id="btSub1Menu4" src="menu/sub1menu4.png" descriptor="dsSubMenuItem4"/>
	</context>

	<!-- SubMenu 1 Option 1 -->
	<context id="ctxSub1Menu1">
		<port id="pBtSub1Menu1Back" component="btSub1Menu1Back"/>
		<port id="pBtSub1Menu1Text" component="btSub1Menu1Text"/>
		<port id="pBtSub1Menu1Border" component="btSub1Menu1Border"/>
		<port id="pBg1Sub1" component="bg1Sub1"/>
				
		<media id="bg1Sub1" src="bg.png" descriptor="dsBg"/>
		<media id="btSub1Menu1Back" src="menu/sub1menu4.png" descriptor="dsSubMenuBack"/>
		<media id="btSub1Menu1Text" src="menu/sub1menu1.txt" descriptor="dsSubMenuText"/>
		<media id="btSub1Menu1Border" src="destaque.png" descriptor="dsSubMenuBorder"/>
	</context>

	<!-- SubMenu 1 Option 2 -->
	<context id="ctxSub1Menu2">
		<port id="pBtSub1Menu2Back" component="btSub1Menu2Back"/>
		<port id="pBtSub1Menu2Text" component="btSub1Menu2Text"/>
		<port id="pBtSub1Menu2Border" component="btSub1Menu2Border"/>
		<port id="pBg1Sub2" component="bg1Sub2"/>
				
		<media id="bg1Sub2" src="bg.png" descriptor="dsBg"/>
		<media id="btSub1Menu2Back" src="menu/sub1menu4.png" descriptor="dsSubMenuBack"/>
		<media id="btSub1Menu2Text" src="menu/sub1menu2.txt" descriptor="dsSubMenuText"/>
		<media id="btSub1Menu2Border" src="destaque.png" descriptor="dsSubMenuBorder"/>
	</context>

	<!-- SubMenu 1 Option 3 -->
	<context id="ctxSub1Menu3">
		<port id="pBtSub1Menu3Back" component="btSub1Menu3Back"/>
		<port id="pBtSub1Menu3Text" component="btSub1Menu3Text"/>
		<port id="pBtSub1Menu3Border" component="btSub1Menu3Border"/>
		<port id="pBg1Sub3" component="bg1Sub3"/>
				
		<media id="bg1Sub3" src="bg.png" descriptor="dsBg"/>
		<media id="btSub1Menu3Back" src="menu/sub1menu4.png" descriptor="dsSubMenuBack"/>
		<media id="btSub1Menu3Text" src="menu/sub1menu3.txt" descriptor="dsSubMenuText"/>
		<media id="btSub1Menu3Border" src="destaque.png" descriptor="dsSubMenuBorder"/>
	</context>

	<!-- ::: Sub Menu 2 Contexts ::: -->
	
	<!-- SubMenu 2 -->
	<context id="ctxSub2Menu">
		<port id="pBtSub2Menu1" component="btSub2Menu1"/>
		<port id="pBtSub2Menu2" component="btSub2Menu2"/>
		<port id="pBtSub2Menu3" component="btSub2Menu3"/>
		<port id="pBtSub2Menu4" component="btSub2Menu4"/>
		<port id="pBg2Sub" component="bg2Sub"/>
				
		<media id="bg2Sub" src="bg.png" descriptor="dsBg"/>
		<media id="btSub2Menu1" src="menu/sub2menu1.png" descriptor="dsSubMenuItem1"/>
		<media id="btSub2Menu2" src="menu/sub2menu2.png" descriptor="dsSubMenuItem2"/>
		<media id="btSub2Menu3" src="menu/sub2menu3.png" descriptor="dsSubMenuItem3"/>
		<media id="btSub2Menu4" src="menu/sub2menu4.png" descriptor="dsSubMenuItem4"/>
	</context>

	<!-- SubMenu 2 Option 1 -->
	<context id="ctxSub2Menu1">
		<port id="pBtSub2Menu1Back" component="btSub2Menu1Back"/>
		<port id="pBtSub2Menu1Text" component="btSub2Menu1Text"/>
		<port id="pBtSub2Menu1Border" component="btSub2Menu1Border"/>
		<port id="pBg2Sub1" component="bg2Sub1"/>
				
		<media id="bg2Sub1" src="bg.png" descriptor="dsBg"/>
		<media id="btSub2Menu1Back" src="menu/sub2menu4.png" descriptor="dsSubMenuBack"/>
		<media id="btSub2Menu1Text" src="menu/sub2menu1.txt" descriptor="dsSubMenuText"/>
		<media id="btSub2Menu1Border" src="destaque.png" descriptor="dsSubMenuBorder"/>
	</context>

	<!-- SubMenu 2 Option 2 -->
	<context id="ctxSub2Menu2">
		<port id="pBtSub2Menu2Back" component="btSub2Menu2Back"/>
		<port id="pBtSub2Menu2Text" component="btSub2Menu2Text"/>
		<port id="pBtSub2Menu2Border" component="btSub2Menu2Border"/>
		<port id="pBg2Sub2" component="bg2Sub2"/>
				
		<media id="bg2Sub2" src="bg.png" descriptor="dsBg"/>
		<media id="btSub2Menu2Back" src="menu/sub2menu4.png" descriptor="dsSubMenuBack"/>
		<media id="btSub2Menu2Text" src="menu/sub2menu2.txt" descriptor="dsSubMenuText"/>
		<media id="btSub2Menu2Border" src="destaque.png" descriptor="dsSubMenuBorder"/>
	</context>

	<!-- SubMenu 2 Option 3 -->
	<context id="ctxSub2Menu3">
		<port id="pBtSub2Menu3Back" component="btSub2Menu3Back"/>
		<port id="pBtSub2Menu3Text" component="btSub2Menu3Text"/>
		<port id="pBtSub2Menu3Border" component="btSub2Menu3Border"/>
		<port id="pBg2Sub3" component="bg2Sub3"/>
				
		<media id="bg2Sub3" src="bg.png" descriptor="dsBg"/>
		<media id="btSub2Menu3Back" src="menu/sub2menu4.png" descriptor="dsSubMenuBack"/>
		<media id="btSub2Menu3Text" src="menu/sub2menu3.txt" descriptor="dsSubMenuText"/>
		<media id="btSub2Menu3Border" src="destaque.png" descriptor="dsSubMenuBorder"/>
	</context>

	<!-- ::: Sub Menu 3 Contexts ::: -->
	
	<!-- SubMenu 3 -->
	<context id="ctxSub3Menu">
		<port id="pBtSub3Menu1" component="btSub3Menu1"/>
		<port id="pBtSub3Menu2" component="btSub3Menu2"/>
		<port id="pBtSub3Menu3" component="btSub3Menu3"/>
		<port id="pBtSub3Menu4" component="btSub3Menu4"/>
		<port id="pBg3Sub" component="bg3Sub"/>
				
		<media id="bg3Sub" src="bg.png" descriptor="dsBg"/>
		<media id="btSub3Menu1" src="menu/sub3menu1.png" descriptor="dsSubMenuItem1"/>
		<media id="btSub3Menu2" src="menu/sub3menu2.png" descriptor="dsSubMenuItem2"/>
		<media id="btSub3Menu3" src="menu/sub3menu3.png" descriptor="dsSubMenuItem3"/>
		<media id="btSub3Menu4" src="menu/sub3menu4.png" descriptor="dsSubMenuItem4"/>
	</context>
	<!-- SubMenu 3 Option 1 -->
	<context id="ctxSub3Menu1">
		<port id="pBtSub3Menu1Back" component="btSub3Menu1Back"/>
		<port id="pBtSub3Menu1Text" component="btSub3Menu1Text"/>
		<port id="pBtSub3Menu1Border" component="btSub3Menu1Border"/>
		<port id="pBg3Sub1" component="bg3Sub1"/>
				
		<media id="bg3Sub1" src="bg.png" descriptor="dsBg"/>
		<media id="btSub3Menu1Back" src="menu/sub3menu4.png" descriptor="dsSubMenuBack"/>
		<media id="btSub3Menu1Text" src="menu/sub3menu1.txt" descriptor="dsSubMenuText"/>
		<media id="btSub3Menu1Border" src="destaque.png" descriptor="dsSubMenuBorder"/>
	</context>

	<!-- SubMenu 2 Option 2 -->
	<context id="ctxSub3Menu2">
		<port id="pBtSub3Menu2Back" component="btSub3Menu2Back"/>
		<port id="pBtSub3Menu2Text" component="btSub3Menu2Text"/>
		<port id="pBtSub3Menu2Border" component="btSub3Menu2Border"/>
		<port id="pBg3Sub2" component="bg3Sub2"/>
				
		<media id="bg3Sub2" src="bg.png" descriptor="dsBg"/>
		<media id="btSub3Menu2Back" src="menu/sub3menu4.png" descriptor="dsSubMenuBack"/>
		<media id="btSub3Menu2Text" src="menu/sub3menu2.txt" descriptor="dsSubMenuText"/>
		<media id="btSub3Menu2Border" src="destaque.png" descriptor="dsSubMenuBorder"/>
	</context>

	<!-- SubMenu 2 Option 3 -->
	<context id="ctxSub3Menu3">
		<port id="pBtSub3Menu3Back" component="btSub3Menu3Back"/>
		<port id="pBtSub3Menu3Text" component="btSub3Menu3Text"/>
		<port id="pBtSub3Menu3Border" component="btSub3Menu3Border"/>
		<port id="pBg3Sub3" component="bg3Sub3"/>
				
		<media id="bg3Sub3" src="bg.png" descriptor="dsBg"/>
		<media id="btSub3Menu3Back" src="menu/sub3menu4.png" descriptor="dsSubMenuBack"/>
		<media id="btSub3Menu3Text" src="menu/sub3menu3.txt" descriptor="dsSubMenuText"/>
		<media id="btSub3Menu3Border" src="destaque.png" descriptor="dsSubMenuBorder"/>
	</context>

	<!-- Kraft Ad -->
	<link xconnector="cb#onBeginStart">
		<bind component="sampaClip" interface="startKraft" role="onBegin"/>
		<bind component="adKraft" role="start"/>
	</link>
	<link xconnector="cb#onBeginStop">
		<bind component="sampaClip" interface="endKraft" role="onBegin"/>
		<bind component="adKraft" role="stop"/>
	</link>

	<!-- Maionese Ad -->
	<link xconnector="cb#onBeginStart">
		<bind component="sampaClip" interface="startMaionese" role="onBegin"/>
		<bind component="adMaionese" role="start"/>
	</link>
	<link xconnector="cb#onBeginStop">
		<bind component="sampaClip" interface="endMaionese" role="onBegin"/>
		<bind component="adMaionese" role="stop"/>
	</link>
	
	<!-- Open main menu -->
	<link xconnector="cb#onKeySelectionStartNStopNSetN">
		<bind component="btRed" role="onSelection">
			<bindParam name="keyCode" value="RED"/>
		</bind>
		<bind component="sampaClip" interface="bounds" role="set">
			<bindParam name="var" value="10.0%, 0.0%, 80.0%, 80.0%"/>
		</bind>
		<bind component="ctxMenu" role="start"/>
		<bind component="btRed" role="stop"/>
	</link>

	<!-- Close main menu -->
	<link xconnector="cb#onSelectionStartNStopNSetN">
		<bind component="ctxMenu" interface="pBtTopMenu4" role="onSelection"/>
		<bind component="sampaClip" interface="bounds" role="set">
			<bindParam name="var" value="0.0%, 0.0%, 125.0%, 125.0%"/>
		</bind>
		<bind component="btRed" role="start"/>
		<bind component="ctxMenu" role="stop"/>
	</link>

	<!-- ::: Sub Menu 1 Links ::: -->
	
	<!-- Open sub1Menu -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxMenu" interface="pBtTopMenu1" role="onSelection"/>
		<bind component="ctxSub1Menu" role="start"/>
		<bind component="ctxMenu" role="stop"/>
	</link>

	<!-- Close sub1Menu -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub1Menu" interface="pBtSub1Menu4" role="onSelection"/>
		<bind component="ctxMenu" role="start"/>
		<bind component="ctxSub1Menu" role="stop"/>
	</link>

	<!-- Open sub1Menu1 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub1Menu" interface="pBtSub1Menu1" role="onSelection"/>
		<bind component="ctxSub1Menu1" role="start"/>
		<bind component="ctxSub1Menu" role="stop"/>
	</link>

	<!-- Close sub1Menu1 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub1Menu1" interface="pBtSub1Menu1Back" role="onSelection"/>
		<bind component="ctxSub1Menu" role="start"/>
		<bind component="ctxSub1Menu1" role="stop"/>
	</link>

	<!-- Open sub1Menu2 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub1Menu" interface="pBtSub1Menu2" role="onSelection"/>
		<bind component="ctxSub1Menu2" role="start"/>
		<bind component="ctxSub1Menu" role="stop"/>
	</link>

	<!-- Close sub1Menu2 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub1Menu2" interface="pBtSub1Menu2Back" role="onSelection"/>
		<bind component="ctxSub1Menu" role="start"/>
		<bind component="ctxSub1Menu2" role="stop"/>
	</link>

	<!-- Open sub1Menu3 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub1Menu" interface="pBtSub1Menu3" role="onSelection"/>
		<bind component="ctxSub1Menu3" role="start"/>
		<bind component="ctxSub1Menu" role="stop"/>
	</link>

	<!-- Close sub1Menu3 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub1Menu3" interface="pBtSub1Menu3Back" role="onSelection"/>
		<bind component="ctxSub1Menu" role="start"/>
		<bind component="ctxSub1Menu3" role="stop"/>
	</link>

	<!-- ::: Sub Menu 2 Links ::: -->
	
	<!-- Open sub2Menu -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxMenu" interface="pBtTopMenu2" role="onSelection"/>
		<bind component="ctxSub2Menu" role="start"/>
		<bind component="ctxMenu" role="stop"/>
	</link>

	<!-- Close sub2Menu -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub2Menu" interface="pBtSub2Menu4" role="onSelection"/>
		<bind component="ctxMenu" role="start"/>
		<bind component="ctxSub2Menu" role="stop"/>
	</link>
	
	<!-- Open sub2Menu1 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub2Menu" interface="pBtSub2Menu1" role="onSelection"/>
		<bind component="ctxSub2Menu1" role="start"/>
		<bind component="ctxSub2Menu" role="stop"/>
	</link>

	<!-- Close sub2Menu1 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub2Menu1" interface="pBtSub2Menu1Back" role="onSelection"/>
		<bind component="ctxSub2Menu" role="start"/>
		<bind component="ctxSub2Menu1" role="stop"/>
	</link>

	<!-- Open sub2Menu2 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub2Menu" interface="pBtSub2Menu2" role="onSelection"/>
		<bind component="ctxSub2Menu2" role="start"/>
		<bind component="ctxSub2Menu" role="stop"/>
	</link>

	<!-- Close sub2Menu2 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub2Menu2" interface="pBtSub2Menu2Back" role="onSelection"/>
		<bind component="ctxSub2Menu" role="start"/>
		<bind component="ctxSub2Menu2" role="stop"/>
	</link>

	<!-- Open sub2Menu3 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub2Menu" interface="pBtSub2Menu3" role="onSelection"/>
		<bind component="ctxSub2Menu3" role="start"/>
		<bind component="ctxSub2Menu" role="stop"/>
	</link>

	<!-- Close sub2Menu3 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub2Menu3" interface="pBtSub2Menu3Back" role="onSelection"/>
		<bind component="ctxSub2Menu" role="start"/>
		<bind component="ctxSub2Menu3" role="stop"/>
	</link>

	<!-- ::: Sub Menu 3 Links ::: -->
	
	<!-- Open sub3Menu -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxMenu" interface="pBtTopMenu3" role="onSelection"/>
		<bind component="ctxSub3Menu" role="start"/>
		<bind component="ctxMenu" role="stop"/>
	</link>

	<!-- Close sub3Menu -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub3Menu" interface="pBtSub3Menu4" role="onSelection"/>
		<bind component="ctxMenu" role="start"/>
		<bind component="ctxSub3Menu" role="stop"/>
	</link>

	<!-- Open sub3Menu1 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub3Menu" interface="pBtSub3Menu1" role="onSelection"/>
		<bind component="ctxSub3Menu1" role="start"/>
		<bind component="ctxSub3Menu" role="stop"/>
	</link>

	<!-- Close sub3Menu1 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub3Menu1" interface="pBtSub3Menu1Back" role="onSelection"/>
		<bind component="ctxSub3Menu" role="start"/>
		<bind component="ctxSub3Menu1" role="stop"/>
	</link>

	<!-- Open sub3Menu2 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub3Menu" interface="pBtSub3Menu2" role="onSelection"/>
		<bind component="ctxSub3Menu2" role="start"/>
		<bind component="ctxSub3Menu" role="stop"/>
	</link>

	<!-- Close sub3Menu2 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub3Menu2" interface="pBtSub3Menu2Back" role="onSelection"/>
		<bind component="ctxSub3Menu" role="start"/>
		<bind component="ctxSub3Menu2" role="stop"/>
	</link>

	<!-- Open sub3Menu3 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub3Menu" interface="pBtSub3Menu3" role="onSelection"/>
		<bind component="ctxSub3Menu3" role="start"/>
		<bind component="ctxSub3Menu" role="stop"/>
	</link>

	<!-- Close sub3Menu3 -->
	<link xconnector="cb#onSelectionStartNStopN">
		<bind component="ctxSub3Menu3" interface="pBtSub3Menu3Back" role="onSelection"/>
		<bind component="ctxSub3Menu" role="start"/>
		<bind component="ctxSub3Menu3" role="stop"/>
	</link>

</body>
</ncl>
