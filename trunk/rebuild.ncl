<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="hotodogo" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:schemaLocation="http://www.ncl.org.br/NCL3.0/EDTVProfile
		http://www.ncl.org.br/NCL3.0/profiles/NCL30EDTV.xsd">

<head>
	<ruleBase>
		<rule id="isPt" var="system.language" comparator="eq" value="pt"/>
		<rule id="isEs" var="system.language" comparator="eq" value="es"/>
	</ruleBase>

	<regionBase>
		<region id="rgHidden" top="0" left="0" height="0" width="0"/>
		<region id="rgBg" width="100%" height="100%" zIndex="0">
			<region id="rgMain" width="100%" height="100%" zIndex="1">
				<region id="rgCenter" top="35%" left="35%" width="30%" height="30%"/>
				<region id="rgButton" top="2%" left="71%" height="8%" width="4.5%"/>
				<region id="rgSyncAd" top="12%" right="20%" height="18%" width="17%"/>
				<region id="rgSyncText" top="12%" left="58%" height="23%" width="32%"/>
				<region id="rgVotingResult" top="70%" left="35%" height="8%" width="30%"/>
			</region>
		</region>
	</regionBase>
	
	<descriptorBase>
		<descriptor id="dsHidden" region="rgHidden"/>
		<descriptor id="dsBg" region="rgBg"/>
		<descriptor id="dsMain" region="rgMain"/>
		<descriptor id="dsCenter" region="rgCenter"/>
		<descriptor id="dsButton" region="rgButton"/>
		<descriptor id="dsSync1" region="rgSyncAd"/>
		<descriptor id="dsSync2" region="rgSyncAd"/>
		<descriptor id="dsSync3" region="rgSyncText">
			<descriptorParam name="transparency" value="0.3"/>
		</descriptor>
		<descriptor id="dsVotingResult" region="rgVotingResult">
			<descriptorParam name="transparency" value="0.5"/>
		</descriptor>
	</descriptorBase>
	
	<connectorBase>
		<importBase documentURI="connectors.conn" alias="cb"/>
	</connectorBase>
</head>

<body>
<!-- ********** :: Body Start :: ********** -->
	<port id="mainPort" component="ctxOpening"/>

	<media id="nodeSettings" type="application/x-ginga-settings">
		<property name="system.language"/>
	</media>
	
<!-- ********** :: Opening :: ********** -->
	<context id="ctxOpening">
		<port id="pOpeningTimer" component="openingTimer"/>
		<port id="pOpeningText" component="openingText"/>
		
		<media id="openingTimer" type="application/x-ncl-time">
			<area id="openingTimerEnd" begin="3s"/>
		</media>
		<media id="openingText" src="opening.html" descriptor="dsCenter"/>
		
		<link xconnector="cb#onBeginStopN">
			<bind role="onBegin" component="openingTimer" interface="openingTimerEnd"/>
			<bind role="stop" component="ctxOpening"/>
		</link>
	</context>

<!-- ********** :: Main :: ********** -->
	<context id="ctxMain">
		<port id="pMainBg" component="mainBg"/>
		<port id="pMainVideo" component="mainVideo"/>
		<port id="pMainButton" component="mainButton"/>
		<port id="pMainLuaVote" component="luaVote"/>
		<port id="pMainFocus" component="btFocus"/>

		<media id="mainBg" src="bg.png" descriptor="dsBg"/>
		<media id="mainVideo" src="vidMain.mp4" descriptor="dsMain">
			<property name="bounds"/>
			<area id="mainVideoEnd" end="20s"/>
			<area id="mainVideoSync1" begin="32s" end="36s"/>
			<area id="mainVideoSync2" begin="39s" end="44s"/>
			<area id="mainVideoSync3" begin="70s" end="89s"/>
			<area id="mainVideoVotingPeriod" begin="0s" end="10s"/>
			<area id="mainVideoVotingResult" begin="11s" end="19s"/>
		</media>
		<media id="mainButton" src="novas_imagens/information_icon.png" descriptor="dsButton"/>
		<media id="mainSync1" src="bonecos.gif" descriptor="dsSync1"/>
		<media id="mainSync2" src="sync2.png" descriptor="dsSync2"/>
		<switch id="mainSync3">
			<defaultComponent component="ingredients-pt"/>
			<bindRule constituent="ingredients-pt" rule="isPt"/>
			<bindRule constituent="ingredients-es" rule="isEs"/>
			<media id="ingredients-pt" src="ingredientes_salada.html" descriptor="dsSync3"/>
			<media id="ingredients-es" src="ingredientes_salada_esp.html" descriptor="dsSync3"/>
		</switch>

		<!-- Voting -->
		<media id="btFocus" src="buttons/teal.png" descriptor="dsHidden"/>
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
		
		<link xconnector="cb#onEndStopN">
			<!--<bind role="onEnd" component="mainVideo"/>-->
			<bind role="onEnd" component="mainVideo" interface="mainVideoEnd"/> <!-- Swap for the above line on production -->
			<bind role="stop" component="ctxMain"/>
		</link>

		<!-- ***** Sync 1,2,3 links ***** -->
		<link xconnector="cb#onBeginStart">
			<bind role="onBegin" component="mainVideo" interface="mainVideoSync1"/>
			<bind role="start" component="mainSync1"/>
		</link>
		<link xconnector="cb#onEndStop">
			<bind role="onEnd" component="mainVideo" interface="mainVideoSync1"/>
			<bind role="stop" component="mainSync1"/>
		</link>
		<link xconnector="cb#onBeginStart">
			<bind role="onBegin" component="mainVideo" interface="mainVideoSync2"/>
			<bind role="start" component="mainSync2"/>
		</link>
		<link xconnector="cb#onEndStop">
			<bind role="onEnd" component="mainVideo" interface="mainVideoSync2"/>
			<bind role="stop" component="mainSync2"/>
		</link>
		<link xconnector="cb#onBeginStart">
			<bind role="onBegin" component="mainVideo" interface="mainVideoSync3"/>
			<bind role="start" component="mainSync3"/>
		</link>
		<link xconnector="cb#onEndStop">
			<bind role="onEnd" component="mainVideo" interface="mainVideoSync3"/>
			<bind role="stop" component="mainSync3"/>
		</link>

		<!-- ***** Voting cast links ***** -->
		<link xconnector="cb#onKeySelectionStart">
			<bind role="onSelection" component="btFocus">
				<bindParam name="keyCode" value="YELLOW"/>
			</bind>
			<bind role="start" component="luaVote" interface="luaCastVote1"/>
		</link>
		<link xconnector="cb#onKeySelectionStart">
			<bind role="onSelection" component="btFocus">
				<bindParam name="keyCode" value="BLUE"/>
			</bind>
			<bind role="start" component="luaVote" interface="luaCastVote2"/>
		</link>
	
		<!-- ***** Voting Results links ***** -->
		<link xconnector="cb#onBeginAttNodeTestStartN">
			<linkParam name="value" value="0"/>
			<bind role="onBegin" component="mainVideo" interface="mainVideoVotingResult"/>
			<bind role="attNodeTest" component="luaVote" interface="luaVoteResult"/>
			<bind role="start" component="tie"/>
		</link>
		<link xconnector="cb#onBeginAttNodeTestStartN">
			<linkParam name="value" value="1"/>
			<bind role="onBegin" component="mainVideo" interface="mainVideoVotingResult"/>
			<bind role="attNodeTest" component="luaVote" interface="luaVoteResult"/>
			<bind role="start" component="vote1winsLandslide"/>
		</link>
		<link xconnector="cb#onBeginAttNodeTestStartN">
			<linkParam name="value" value="2"/>
			<bind role="onBegin" component="mainVideo" interface="mainVideoVotingResult"/>
			<bind role="attNodeTest" component="luaVote" interface="luaVoteResult"/>
			<bind role="start" component="vote1wins"/>
		</link>
		<link xconnector="cb#onBeginAttNodeTestStartN">
			<linkParam name="value" value="3"/>
			<bind role="onBegin" component="mainVideo" interface="mainVideoVotingResult"/>
			<bind role="attNodeTest" component="luaVote" interface="luaVoteResult"/>
			<bind role="start" component="vote2winsLandslide"/>
		</link>
		<link xconnector="cb#onBeginAttNodeTestStartN">
			<linkParam name="value" value="4"/>
			<bind role="onBegin" component="mainVideo" interface="mainVideoVotingResult"/>
			<bind role="attNodeTest" component="luaVote" interface="luaVoteResult"/>
			<bind role="start" component="vote2wins"/>
		</link>

		<!-- ***** Main Menu links ***** -->
		<link xconnector="cb#onKeySelectionSet">
			<bind role="onSelection" component="btFocus">
				<bindParam name="keyCode" value="INFO"/>
			</bind>
			<bind role="set" component="mainVideo" interface="bounds">
				<bindParam name="var" value="10.0%, 0.0%, 80.0%, 80.0%"/>
			</bind>
		</link>
	</context>

<!-- ********** :: Credits :: ********** -->
	<context id="ctxCredits">
		<port id="pCreditsVideo" component="creditsVideo"/>
		
		<media id="creditsVideo" src="creditos.mp4" descriptor="dsCenter"/>
		<media id="creditsTimer" type="application/x-ncl-time">
			<area id="creditsTimerEnd" begin="5s"/>
		</media>
		<media id="creditsText" src="credits.html" descriptor="dsCenter"/>
		
		<link xconnector="cb#onEndStartN">
			<bind role="onEnd" component="creditsVideo"/>
			<bind role="start" component="creditsTimer"/>
			<bind role="start" component="creditsText"/>
		</link>
		<link xconnector="cb#onBeginStopN">
			<bind role="onBegin" component="creditsTimer" interface="creditsTimerEnd"/>
			<bind role="stop" component="ctxCredits"/>
		</link>
	</context>

<!-- ********** :: Opening-Main-Credits Links :: ********** -->
	<link xconnector="cb#onEndStart">
		<bind role="onEnd" component="ctxOpening"/>
		<bind role="start" component="ctxMain"/>
	</link>
	<link xconnector="cb#onEndStart">
		<bind role="onEnd" component="ctxMain"/>
		<bind role="start" component="ctxCredits"/>
	</link>

</body>
</ncl>
