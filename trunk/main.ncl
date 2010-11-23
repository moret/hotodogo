<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="hotodogo" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:schemaLocation="http://www.ncl.org.br/NCL3.0/EDTVProfile
		http://www.ncl.org.br/NCL3.0/profiles/NCL30EDTV.xsd">

<head>
	<ruleBase>
		<rule id="hasNoDev" var="system.devNumber(2)" comparator="eq" value="0"/>
		<rule id="hasDev" var="system.devNumber(2)" comparator="gt" value="0"/>
	</ruleBase>

	<regionBase>
		<region id="rgCenter" top="35%" left="35%" width="30%" height="30%"/>
		
		<region id="rgBg" width="100%" height="100%" zIndex="0"/>
		<region id="rgMain" width="100%" height="100%" zIndex="1">
			<region id="rgHidden" top="0" left="0" height="1" width="1"/>
			<region id="rgButton" top="2%" left="71%" height="8%" width="4.5%"/>
			<region id="rgSync1" top="12%" right="20%" height="18%" width="17%"/>
			<region id="rgSyncText" top="12%" left="58%" height="23%" width="32%"/>
			<region id="rgVotingResult" top="70%" left="35%" height="7%" width="30%"/>
		</region>
		<region id="rgMenu" top="80%" left="0" height="20%" width="100%" zIndex="1">
			<!-- Lua Voting Buttons -->
			<region id="rgVotingOption1" top="73%" left="72%" height="15%" width="15%"/>
			<region id="rgVotingOption2" top="73%" left="78%" height="15%" width="15%"/>
			<!-- Menu regions -->
			<region id="rgMenuItem1" top="5%" left="10%" height="20%" width="11%"/>
			<region id="rgMenuItem2" top="29%" left="10%" height="20%" width="11%"/>
			<region id="rgMenuItem3" top="53%" left="10%" height="20%" width="11%"/>
			<region id="rgMenuItem4" top="77%" left="10%" height="20%" width="11%"/>
			<!-- Selection regions -->
			<region id="rgMenuItemBack" top="73%" left="72%" height="15%" width="15%" zIndex="2"/>
			<region id="rgMenuItemText" top="15%" left="12%" height="71%" width="76%"/>
			<region id="rgMenuItemBorder" top="5%" left="10%" height="90%" width="80%"/>
		</region>
	</regionBase>

	<regionBase device="systemScreen(2)">
		<region id="rgDev"/>
	</regionBase>

	<descriptorBase>
		<descriptor id="dsDev" region="rgDev"/>
		
		<descriptor id="dsCenter" region="rgCenter"/>
		
		<descriptor id="dsBg" region="rgBg"/>
		<descriptor id="dsMain" region="rgMain">
			<descriptorParam name="soundLevel" value="1"/>
		</descriptor>
		<descriptor id="dsHiddenMenu" region="rgHidden"/>
		<descriptor id="dsHiddenVote" region="rgHidden"/>
		<descriptor id="dsButton" region="rgButton"/>
		<descriptor id="dsSync1" region="rgSync1"/>
		<descriptor id="dsSync2" region="rgSync1"/>
		<descriptor id="dsSync3" region="rgSyncText">
			<descriptorParam name="transparency" value="0.3"/>
		</descriptor>

		<!-- Lua Voting -->
		<descriptor id="dsVotingResult" region="rgVotingResult">
			<descriptorParam name="transparency" value="0.5"/>
		</descriptor>
		<descriptor id="dsVotingOption1" region="rgVotingOption1"/>
		<descriptor id="dsVotingOption2" region="rgVotingOption2"/>
				
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
		<descriptor id="dsSubMenuText" region="rgMenuItemText">
			<descriptorParam name="transparency" value="1.0"/>
		</descriptor>
		<descriptor id="dsSubMenuBorder" region="rgMenuItemBorder"/>
	</descriptorBase>
	
	<connectorBase>
		<importBase documentURI="connectors.conn" alias="cb"/>
	</connectorBase>
</head>

<body>
	<port id="mainPort" component="ctxOpening"/>

	<media id="nodeSettings" type="application/x-ginga-settings">
		<property name="system.language"/>
	</media>
	
	<!-- Opening -->
	<context id="ctxOpening">
		<port id="pOpeningText" component="textOpening"/>
		<port id="pOpeningTimer" component="openingTimer"/>
		<media id="textOpening" src="opening.html" descriptor="dsCenter"/>
		<media id="openingTimer" type="application/x-ncl-time">
			<area id="end" begin="3s"/>
		</media>
		<link xconnector="cb#onBeginStopN">
			<bind component="openingTimer" interface="end" role="onBegin"/>
			<bind component="ctxOpening" role="stop"/>
		</link>
	</context>
	
	<!-- Main -->
	<media id="btRed" src="novas_imagens/information_icon.png" descriptor="dsButton"/>

	<media id="vidMain" src="vidMain.mp4" descriptor="dsMain">
		<property name="bounds"/>
		<area id="start" begin="0s"/>
		<area id="startSync1" begin="3s"/>
		<!--<area id="startSync1" begin="32s"/>-->
		<area id="endSync1" begin="36s"/>
		<area id="startSync2" begin="39s"/>
		<area id="endSync2" begin="44s"/>
		<area id="startSync3" begin="70s"/>
		<area id="endSync3" begin="89s"/>
		<area id="endVoting" begin="140s"/>
		<area id="showVotingResult" begin="150s"/>
		<!--<area id="end" begin="412s"/>-->
	</media>

	<!-- Ad Medias -->
	<switch id="adSync1">
		<defaultComponent component="adSync1-main"/>
		<bindRule constituent="adSync1-main" rule="hasNoDev"/>
		<bindRule constituent="adSync1-dev" rule="hasDev"/>
		<media id="adSync1-main" src="bonecos-felizes.ncl" descriptor="dsSync1"/>
		<media id="adSync1-dev" src="bonecos-felizes.ncl" descriptor="dsDev"/>
	</switch>
	<switch id="adSync2">
		<defaultComponent component="adSync2-main"/>
		<bindRule constituent="adSync2-main" rule="hasNoDev"/>
		<bindRule constituent="adSync2-dev" rule="hasDev"/>
		<media id="adSync2-main" src="sync2.ncl" descriptor="dsSync2"/>
		<media id="adSync2-dev" src="sync2.ncl" descriptor="dsDev"/>
	</switch>
	<switch id="adSync3">
		<defaultComponent component="adSync3-main"/>
		<bindRule constituent="adSync3-main" rule="hasNoDev"/>
		<bindRule constituent="adSync3-dev" rule="hasDev"/>
		<media id="adSync3-main" src="ingredientes.ncl" descriptor="dsSync3"/>
		<media id="adSync3-dev" src="ingredientes.ncl" descriptor="dsDev"/>
	</switch>
	
	<!-- Voting -->
	<media id="btFocusVote" src="buttons/teal.png" descriptor="dsHiddenVote"/>
	<media id="btFocusMenu" src="buttons/lavender.png" descriptor="dsHiddenMenu"/>
	<media id="luaVote" src="vote/vote.lua">
		<area id="luaCastVote1" label="luaVote1"/>
		<area id="luaCastVote2" label="luaVote2"/>
		<area id="luaTrigVoteEnds" label="luaVoteEnds"/>
		<property name="luaVoteResult"/>
	</media>
	<media id="tie" src="vote/tie.html" descriptor="dsVotingResult"/>
	<media id="vote1winsLandslide" src="vote/vote1winsLandslide.html" descriptor="dsVotingResult"/>
	<media id="vote1wins" src="vote/vote1wins.html" descriptor="dsVotingResult"/>
	<media id="vote2winsLandslide" src="vote/vote2winsLandslide.html" descriptor="dsVotingResult"/>
	<media id="vote2wins" src="vote/vote2wins.html" descriptor="dsVotingResult"/>
	
	<!-- Credits -->
	<context id="ctxCredits">
		<port id="pCreditsVideo" component="videoCredits"/>
		<port id="pCreditsTimer" component="creditsTimer"/>
		<media id="videoCredits" src="creditos.mp4" descriptor="dsCenter"/>
		<media id="textCredits" src="credits.html" descriptor="dsCenter"/>
		<media id="creditsTimer" type="application/x-ncl-time">
			<area id="endCredits" begin="8s"/>
		</media>
		<link xconnector="cb#onEndStartN">
			<bind component="videoCredits" role="onEnd"/>
			<bind component="textCredits" role="start"/>
			<bind component="creditsTimer" role="start"/>
		</link>
		<link xconnector="cb#onBeginStopN">
			<bind component="creditsTimer" interface="endCredits" role="onBegin"/>
			<bind component="ctxCredits" role="stop"/>
		</link>
	</context>
	
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
		<media id="btSub1Menu1Text" src="menu/sub1menu1.html" descriptor="dsSubMenuText"/>
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
		<media id="btSub1Menu2Text" src="menu/sub1menu2.html" descriptor="dsSubMenuText"/>
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
		<media id="btSub1Menu3Text" src="menu/sub1menu3.html" descriptor="dsSubMenuText"/>
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
		<media id="btSub2Menu1Text" src="menu/sub2menu1.html" descriptor="dsSubMenuText"/>
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
		<media id="btSub2Menu2Text" src="menu/sub2menu2.html" descriptor="dsSubMenuText"/>
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
		<media id="btSub2Menu3Text" src="menu/sub2menu3.html" descriptor="dsSubMenuText"/>
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
		<media id="btSub3Menu1Text" src="menu/sub3menu1.html" descriptor="dsSubMenuText"/>
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
		<media id="btSub3Menu2Text" src="menu/sub3menu2.html" descriptor="dsSubMenuText"/>
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
		<media id="btSub3Menu3Text" src="menu/sub3menu3.html" descriptor="dsSubMenuText"/>
		<media id="btSub3Menu3Border" src="destaque.png" descriptor="dsSubMenuBorder"/>
	</context>

	<!-- Opening Ends Open Main -->
	<link xconnector="cb#onEndStartN">
		<bind component="ctxOpening" role="onEnd"/>
		<bind component="vidMain" interface="start" role="start"/>
		<bind component="btFocusVote" role="start"/>
		<bind component="btFocusMenu" role="start"/>
		<bind component="btRed" role="start"/>
		<bind component="luaVote" role="start"/>
	</link>

	<!-- Main Video End Closes All Open Credits -->
	<link xconnector="cb#onEndStopNStartN">
		<bind component="vidMain" role="onEnd"/>
		<bind component="ctxCredits" role="start"/>
		<bind component="vidMain" role="stop"/>
		<bind component="btRed" role="stop"/>
		<bind component="btFocusVote" role="stop"/>
		<bind component="btFocusMenu" role="stop"/>
		<bind component="luaVote" role="stop"/>
		<bind component="tie" role="stop"/>
		<bind component="vote1winsLandslide" role="stop"/>
		<bind component="vote1wins" role="stop"/>
		<bind component="vote2winsLandslide" role="stop"/>
		<bind component="vote2wins" role="stop"/>
	</link>

	<!-- Close menus before showing voting results -->
	<link xconnector="cb#onBeginStopNSetN">
		<bind component="vidMain" interface="endVoting" role="onBegin"/>
		<bind component="ctxMenu" role="stop"/>
		<bind component="ctxSub1Menu" role="stop"/>
		<bind component="ctxSub1Menu1" role="stop"/>
		<bind component="ctxSub1Menu2" role="stop"/>
		<bind component="ctxSub1Menu3" role="stop"/>
		<bind component="ctxSub2Menu" role="stop"/>
		<bind component="ctxSub2Menu1" role="stop"/>
		<bind component="ctxSub2Menu2" role="stop"/>
		<bind component="ctxSub2Menu3" role="stop"/>
		<bind component="ctxSub3Menu" role="stop"/>
		<bind component="ctxSub3Menu1" role="stop"/>
		<bind component="ctxSub3Menu2" role="stop"/>
		<bind component="ctxSub3Menu3" role="stop"/>		
		<bind component="btRed" role="stop"/>
		<bind component="vidMain" interface="bounds" role="set">
			<bindParam name="var" value="0.0%, 0.0%, 125.0%, 125.0%"/>
			<!--<bindParam name="duration" value="1s"/>-->
		</bind>
	</link>

	<!-- Voting Option1 -->
	<link xconnector="cb#onKeySelectionStart">
		<bind component="btFocusVote" role="onSelection">
			<bindParam name="keyCode" value="YELLOW"/>
		</bind>
		<bind component="luaVote" interface="luaCastVote1" role="start"/>
	</link>

	<!-- Voting Option2 -->
	<link xconnector="cb#onKeySelectionStart">
		<bind component="btFocusVote" role="onSelection">
			<bindParam name="keyCode" value="BLUE"/>
		</bind>
		<bind component="luaVote" interface="luaCastVote2" role="start"/>
	</link>

	<!-- Voting Result - Tie -->
	<link xconnector="cb#onBeginAttNodeTestStartN">
		<linkParam name="value" value="0"/>
		<bind component="vidMain" interface="showVotingResult" role="onBegin"/>
		<bind component="luaVote" interface="luaVoteResult" role="attNodeTest"/>
		<bind component="tie" role="start"/>
	</link>

	<!-- Voting Result - Option1 Landslide -->
	<link xconnector="cb#onBeginAttNodeTestStartN">
		<linkParam name="value" value="1"/>
		<bind component="vidMain" interface="showVotingResult" role="onBegin"/>
		<bind component="luaVote" interface="luaVoteResult" role="attNodeTest"/>
		<bind component="vote1winsLandslide" role="start"/>
	</link>

	<!-- Voting Result - Option1 Simple Win -->
	<link xconnector="cb#onBeginAttNodeTestStartN">
		<linkParam name="value" value="2"/>
		<bind component="vidMain" interface="showVotingResult" role="onBegin"/>
		<bind component="luaVote" interface="luaVoteResult" role="attNodeTest"/>
		<bind component="vote1wins" role="start"/>
	</link>

	<!-- Voting Result - Option2 Landslide -->
	<link xconnector="cb#onBeginAttNodeTestStartN">
		<linkParam name="value" value="3"/>
		<bind component="vidMain" interface="showVotingResult" role="onBegin"/>
		<bind component="luaVote" interface="luaVoteResult" role="attNodeTest"/>
		<bind component="vote2winsLandslide" role="start"/>
	</link>

	<!-- Voting Result - Option2 Simple Win -->
	<link xconnector="cb#onBeginAttNodeTestStartN">
		<linkParam name="value" value="4"/>
		<bind component="vidMain" interface="showVotingResult" role="onBegin"/>
		<bind component="luaVote" interface="luaVoteResult" role="attNodeTest"/>
		<bind component="vote2wins" role="start"/>
	</link>

	<!-- Sync1 Ad -->
	<link xconnector="cb#onBeginStart">
		<bind component="vidMain" interface="startSync1" role="onBegin"/>
		<bind component="adSync1" role="start"/>
	</link>
	<link xconnector="cb#onBeginStop">
		<bind component="vidMain" interface="endSync1" role="onBegin"/>
		<bind component="adSync1" role="stop"/>
	</link>

	<!-- Sync2 Ad -->
	<link xconnector="cb#onBeginStart">
		<bind component="vidMain" interface="startSync2" role="onBegin"/>
		<bind component="adSync2" role="start"/>
	</link>
	<link xconnector="cb#onBeginStop">
		<bind component="vidMain" interface="endSync2" role="onBegin"/>
		<bind component="adSync2" role="stop"/>
	</link>
	
	<!-- Sync3 Ad -->
	<link xconnector="cb#onBeginStart">
		<bind component="vidMain" interface="startSync3" role="onBegin"/>
		<bind component="adSync3" role="start"/>
	</link>
	<link xconnector="cb#onBeginStop">
		<bind component="vidMain" interface="endSync3" role="onBegin"/>
		<bind component="adSync3" role="stop"/>
	</link>
	
	<!-- Open main menu -->
	<link xconnector="cb#onKeySelectionStartNStopNSetN">
		<bind component="btFocusMenu" role="onSelection">
			<bindParam name="keyCode" value="INFO"/>
		</bind>
		<bind component="vidMain" interface="bounds" role="set">
			<bindParam name="var" value="10.0%, 0.0%, 80.0%, 80.0%"/>
			<!--<bindParam name="duration" value="1s"/>-->
		</bind>
		<bind component="ctxMenu" role="start"/>
		<bind component="btFocusMenu" role="stop"/>
		<bind component="btRed" role="stop"/>
	</link>
	
	<!-- Close main menu -->
	<link xconnector="cb#onSelectionStartNStopNSetN">
		<bind component="ctxMenu" interface="pBtTopMenu4" role="onSelection"/>
		<bind component="vidMain" interface="bounds" role="set">
			<bindParam name="var" value="0.0%, 0.0%, 125.0%, 125.0%"/>
			<!--<bindParam name="duration" value="1s"/>-->
		</bind>
		<bind component="btRed" role="start"/>
		<bind component="btFocusMenu" role="start"/>
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
