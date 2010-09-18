<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="hotodogo" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:schemaLocation="http://www.ncl.org.br/NCL3.0/EDTVProfile
		http://www.ncl.org.br/NCL3.0/profiles/NCL30EDTV.xsd">

<head>
	<regionBase>
		<region id="rgMain"
				width="100%"
				height="100%">
			<region id="rgButton"
					top="5%"
					left="25%"
					height="30"
					width="60"/>
			<region id="rgAd"
					top="5%"
					left="70%"
					height="5%"
					width="5%"/>
		</region>
		<region id="rgMenu"
				top="80%"
				left="0%"
				height="20%"
				width="100%">
			<!-- Menu regions -->
			<region id="rgMenuItem1"
					top="00%"
					left="25%"
					height="20"
					width="40"/>
			<region id="rgMenuItem2"
					top="25%"
					left="25%"
					height="20"
					width="40"/>
			<region id="rgMenuItem3"
					top="50%"
					left="25%"
					height="20"
					width="40"/>
			<region id="rgMenuItem4"
					top="75%"
					left="25%"
					height="20"
					width="40"/>
		</region>
	</regionBase>
	
	<descriptorBase>
		<descriptor
				id="dsMain"
				region="rgMain"/>
		<descriptor
				id="dsButton"
				region="rgButton"/>
		<descriptor
				id="dsAd"
				region="rgAd"/>
		<!-- Menu descriptors -->
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
				
		<!-- Menu Buttons -->
		<media
				id="btTopMenu1"
				src="buttons/green1.png"
				descriptor="dsMenuItem1">
		</media>
		<media
				id="btTopMenu2"
				src="buttons/green1.png"
				descriptor="dsMenuItem2">
		</media>
		<media
				id="btTopMenu3"
				src="buttons/green1.png"
				descriptor="dsMenuItem3">
		</media>
		<media
				id="btTopMenu4"
				src="buttons/red.png"
				descriptor="dsMenuItem4">
		</media>
	</context>

	<!-- Accept interaction - open instructions -->
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

	<!-- Dismiss interaction - close instructions -->
	<link
			xconnector="cb#onSelectionStartNStopNSetN">
		<bind
				component="ctxMenu"
				interface="pBtTopMenu4"
				role="onSelection">
		</bind>
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
</body>
</ncl>
