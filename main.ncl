<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="hotodogo" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:schemaLocation="http://www.ncl.org.br/NCL3.0/EDTVProfile
		http://www.ncl.org.br/NCL3.0/profiles/NCL30EDTV.xsd">

<head>
	<regionBase>
		<region id="rgBg"
				width="100%"
				height="100%"
				zIndex="0"/>
		<region id="rgMain"
				width="100%"
				height="100%"
				zIndex="1">
			<region id="rgButton"
					top="2%"
					left="25%"
					height="4%"
					width="4%"/>
			<region id="rgAd"
					top="5%"
					left="70%"
					height="5%"
					width="5%"/>
		</region>
		<region id="rgMenu"
				top="80%"
				left="0"
				height="20%"
				width="100%"
				zIndex="1">
			<!-- Menu regions -->
			<region id="rgMenuItem1"
					top="5%"
					left="10%"
					height="20%"
					width="20%"/>
			<region id="rgMenuItem2"
					top="29%"
					left="10%"
					height="20%"
					width="20%"/>
			<region id="rgMenuItem3"
					top="53%"
					left="10%"
					height="20%"
					width="20%"/>
			<region id="rgMenuItem4"
					top="77%"
					left="10%"
					height="20%"
					width="20%"/>
		</region>
	</regionBase>
	
	<descriptorBase>
		<descriptor
				id="dsBg"
				region="rgBg"/>
		<descriptor
				id="dsMain"
				region="rgMain"/>
		<descriptor
				id="dsButton"
				region="rgButton"/>
		<descriptor
				id="dsAd"
				region="rgAd"/>
				
		<!-- Top Menu descriptors -->
		<descriptor
				id="dsMenuItem1"
				region="rgMenuItem1"
				focusIndex="1"
				moveUp="4"
				moveDown="2"/>
		<descriptor
				id="dsMenuItem2"
				region="rgMenuItem2"
				focusIndex="2"
				moveUp="1"
				moveDown="3"/>
		<descriptor
				id="dsMenuItem3"
				region="rgMenuItem3"
				focusIndex="3"
				moveUp="2"
				moveDown="4"/>
		<descriptor
				id="dsMenuItem4"
				region="rgMenuItem4"
				focusIndex="4"
				moveUp="3"
				moveDown="1"/>

		<!-- SubMenu descriptors -->
		<descriptor
				id="dsSubMenuItem1"
				region="rgMenuItem1"
				focusIndex="11"
				moveUp="14"
				moveDown="12"/>
		<descriptor
				id="dsSubMenuItem2"
				region="rgMenuItem2"
				focusIndex="12"
				moveUp="11"
				moveDown="13"/>
		<descriptor
				id="dsSubMenuItem3"
				region="rgMenuItem3"
				focusIndex="13"
				moveUp="12"
				moveDown="14"/>
		<descriptor
				id="dsSubMenuItem4"
				region="rgMenuItem4"
				focusIndex="14"
				moveUp="13"
				moveDown="11"/>

	</descriptorBase>
	
	<connectorBase>
		<importBase
				documentURI="composerConnectorBase.conn"
				alias="cb"/>
	</connectorBase>
</head>

<body>
	<port
			id="sampaClipPort"
			component="sampaClip"/>
	
	<port
			id="btRedPort"
			component="btRed"/>
	
	<media
			id="sampaClip"
			src="20100815.mp4"
			descriptor="dsMain">
		<property
				name="bounds"/>
		<area
				id="start"
				begin="0s"/>
		<area
				id="startKraft"
				begin="5s"/>
		<area
				id="endKraft"
				begin="10s"/>
		<area
				id="startMaionese"
				begin="12s"/>
		<area
				id="endMaionese"
				begin="20s"/>
	</media>

	<media
			id="btRed"
			src="buttons/red.png"
			descriptor="dsButton">
	</media>

	<!-- Ad Medias -->	
	<media
			id="adMaionese"
			src="maio_leite.jpg"
			descriptor="dsAd">
	</media>

	<media
			id="adKraft"
			src="kraft-logo.png"
			descriptor="dsAd">
	</media>

	<context
			id="ctxMenu">
		<port
				id="pBtTopMenu1"
				component="btTopMenu1"/>
		<port
				id="pBtTopMenu2"
				component="btTopMenu2"/>
		<port
				id="pBtTopMenu3"
				component="btTopMenu3"/>
		<port
				id="pBtTopMenu4"
				component="btTopMenu4"/>
		<port
				id="pBgTop"
				component="bgTop"/>
				
		<media
				id="bgTop"
				src="bg.png"
				descriptor="dsBg">
		</media>
		<!-- Menu Buttons -->
		<media
				id="btTopMenu1"
				src="menu/topmenu1.png"
				descriptor="dsMenuItem1">
		</media>
		<media
				id="btTopMenu2"
				src="menu/topmenu2.png"
				descriptor="dsMenuItem2">
		</media>
		<media
				id="btTopMenu3"
				src="menu/topmenu3.png"
				descriptor="dsMenuItem3">
		</media>
		<media
				id="btTopMenu4"
				src="menu/topmenu4.png"
				descriptor="dsMenuItem4">
		</media>
	</context>

	<context
			id="ctxSubMenu1">
		<port
				id="pBtSub1Menu1"
				component="btSub1Menu1"/>
		<port
				id="pBtSub1Menu2"
				component="btSub1Menu2"/>
		<port
				id="pBtSub1Menu3"
				component="btSub1Menu3"/>
		<port
				id="pBtSub1Menu4"
				component="btSub1Menu4"/>
		<port
				id="pBgSub1"
				component="bgSub1"/>
				
		<media
				id="bgSub1"
				src="bg.png"
				descriptor="dsBg">
		</media>
		<!-- Menu Buttons -->
		<media
				id="btSub1Menu1"
				src="menu/sub1menu1.png"
				descriptor="dsSubMenuItem1">
		</media>
		<media
				id="btSub1Menu2"
				src="menu/sub1menu2.png"
				descriptor="dsSubMenuItem2">
		</media>
		<media
				id="btSub1Menu3"
				src="menu/sub1menu3.png"
				descriptor="dsSubMenuItem3">
		</media>
		<media
				id="btSub1Menu4"
				src="menu/sub1menu4.png"
				descriptor="dsSubMenuItem4">
		</media>
	</context>

	<context
			id="ctxSubMenu2">
		<port
				id="pBtSub2Menu1"
				component="btSub2Menu1"/>
		<port
				id="pBtSub2Menu2"
				component="btSub2Menu2"/>
		<port
				id="pBtSub2Menu3"
				component="btSub2Menu3"/>
		<port
				id="pBtSub2Menu4"
				component="btSub2Menu4"/>
		<port
				id="pBgSub2"
				component="bgSub2"/>
				
		<media
				id="bgSub2"
				src="bg.png"
				descriptor="dsBg">
		</media>
		<!-- Menu Buttons -->
		<media
				id="btSub2Menu1"
				src="menu/sub2menu1.png"
				descriptor="dsSubMenuItem1">
		</media>
		<media
				id="btSub2Menu2"
				src="menu/sub2menu2.png"
				descriptor="dsSubMenuItem2">
		</media>
		<media
				id="btSub2Menu3"
				src="menu/sub2menu3.png"
				descriptor="dsSubMenuItem3">
		</media>
		<media
				id="btSub2Menu4"
				src="menu/sub2menu4.png"
				descriptor="dsSubMenuItem4">
		</media>
	</context>

	<context
			id="ctxSubMenu3">
		<port
				id="pBtSub3Menu1"
				component="btSub3Menu1"/>
		<port
				id="pBtSub3Menu2"
				component="btSub3Menu2"/>
		<port
				id="pBtSub3Menu3"
				component="btSub3Menu3"/>
		<port
				id="pBtSub3Menu4"
				component="btSub3Menu4"/>
		<port
				id="pBgSub3"
				component="bgSub3"/>
				
		<media
				id="bgSub3"
				src="bg.png"
				descriptor="dsBg">
		</media>
		<!-- Menu Buttons -->
		<media
				id="btSub3Menu1"
				src="menu/sub3menu1.png"
				descriptor="dsSubMenuItem1">
		</media>
		<media
				id="btSub3Menu2"
				src="menu/sub3menu2.png"
				descriptor="dsSubMenuItem2">
		</media>
		<media
				id="btSub3Menu3"
				src="menu/sub3menu3.png"
				descriptor="dsSubMenuItem3">
		</media>
		<media
				id="btSub3Menu4"
				src="menu/sub3menu4.png"
				descriptor="dsSubMenuItem4">
		</media>
	</context>

	<!-- Kraft Ad -->
	<link
			xconnector="cb#onBeginStart">
		<bind
				component="sampaClip"
				interface="startKraft"
				role="onBegin"/>
		<bind
				component="adKraft"
				role="start"/>
	</link>
	<link
			xconnector="cb#onBeginStop">
		<bind
				component="sampaClip"
				interface="endKraft"
				role="onBegin"/>
		<bind
				component="adKraft"
				role="stop"/>
	</link>

	<!-- Maionese Ad -->
	<link
			xconnector="cb#onBeginStart">
		<bind
				component="sampaClip"
				interface="startMaionese"
				role="onBegin"/>
		<bind
				component="adMaionese"
				role="start"/>
	</link>
	<link
			xconnector="cb#onBeginStop">
		<bind
				component="sampaClip"
				interface="endMaionese"
				role="onBegin"/>
		<bind
				component="adMaionese"
				role="stop"/>
	</link>
	
	<!-- Open main menu -->
	<link
			xconnector="cb#onKeySelectionStartNStopNSetN">
		<bind
				component="btRed"
				role="onSelection">
			<bindParam
					name="keyCode"
					value="RED"/>
		</bind>
		<bind
				component="sampaClip"
				interface="bounds"
				role="set">
			<bindParam
					name="var"
					value="10.0%, 0.0%, 80.0%, 80.0%"/>
		</bind>
		<bind
				component="ctxMenu"
				role="start"/>
		<bind
				component="btRed"
				role="stop"/>
	</link>

	<!-- Close main menu -->
	<link
			xconnector="cb#onSelectionStartNStopNSetN">
		<bind
				component="ctxMenu"
				interface="pBtTopMenu4"
				role="onSelection"/>
		<bind
				component="sampaClip"
				interface="bounds"
				role="set">
			<bindParam
					name="var"
					value="0.0%, 0.0%, 125.0%, 125.0%"/>
		</bind>
		<bind
				component="btRed"
				role="start"/>
		<bind
				component="ctxMenu"
				role="stop"/>
	</link>

	<!-- Open subMenu1 -->
	<link
			xconnector="cb#onSelectionStartNStopN">
		<bind
				component="ctxMenu"
				interface="pBtTopMenu1"
				role="onSelection"/>
		<bind
				component="ctxSubMenu1"
				role="start"/>
		<bind
				component="ctxMenu"
				role="stop"/>
	</link>

	<!-- Close subMenu1 -->
	<link
			xconnector="cb#onSelectionStartNStopN">
		<bind
				component="ctxSubMenu1"
				interface="pBtSub1Menu4"
				role="onSelection"/>
		<bind
				component="ctxMenu"
				role="start"/>
		<bind
				component="ctxSubMenu1"
				role="stop"/>
	</link>

	<!-- Open subMenu2 -->
	<link
			xconnector="cb#onSelectionStartNStopN">
		<bind
				component="ctxMenu"
				interface="pBtTopMenu2"
				role="onSelection"/>
		<bind
				component="ctxSubMenu2"
				role="start"/>
		<bind
				component="ctxMenu"
				role="stop"/>
	</link>

	<!-- Close subMenu2 -->
	<link
			xconnector="cb#onSelectionStartNStopN">
		<bind
				component="ctxSubMenu2"
				interface="pBtSub2Menu4"
				role="onSelection"/>
		<bind
				component="ctxMenu"
				role="start"/>
		<bind
				component="ctxSubMenu2"
				role="stop"/>
	</link>

	<!-- Open subMenu3 -->
	<link
			xconnector="cb#onSelectionStartNStopN">
		<bind
				component="ctxMenu"
				interface="pBtTopMenu3"
				role="onSelection"/>
		<bind
				component="ctxSubMenu3"
				role="start"/>
		<bind
				component="ctxMenu"
				role="stop"/>
	</link>

	<!-- Close subMenu3 -->
	<link
			xconnector="cb#onSelectionStartNStopN">
		<bind
				component="ctxSubMenu3"
				interface="pBtSub3Menu4"
				role="onSelection"/>
		<bind
				component="ctxMenu"
				role="start"/>
		<bind
				component="ctxSubMenu3"
				role="stop"/>
	</link>

</body>
</ncl>
