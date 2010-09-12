<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="hotodogo" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:schemaLocation="http://www.ncl.org.br/NCL3.0/EDTVProfile
		http://www.ncl.org.br/NCL3.0/profiles/NCL30EDTV.xsd">

<head>
	<regionBase>
		<region id="rgMainFull"
				width="100%"
				height="100%">
			<region id="rgButton"
					top="5%"
					left="25%"
					height="5%"
					width="5%"/>
			<region id="rgAd"
					top="5%"
					left="70%"
					height="5%"
					width="5%"/>
			<region id="rgAd"
					top="5%"
					left="70%"
					height="5%"
					width="5%"/>
		</region>
		<region id="rgText"
				top="80%"
				left="35%"
				height="20%"
				width="30%"/>
	</regionBase>
	
	<descriptorBase>
		<descriptor
				id="dsMainFull"
				region="rgMainFull"
				focusIndex="0"/>
		<descriptor
				id="dsButton"
				region="rgButton"/>
		<descriptor
				id="dsAd"
				region="rgAd"/>
		<descriptor
				id="dsText"
				region="rgText"
				focusIndex="0"/>
		<descriptor
				id="dsAd"
				region="rgAd"/>
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
			descriptor="dsMainFull">
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
			id="txTeste"
			src="teste.txt"
			descriptor="dsText">
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

	<!-- Accept interaction - open instructions -->
	<link
			xconnector="cb#onKeySelectionStartNSetN">
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
				component="txTeste"
				role="start"/>
	</link>

	<!-- Dismiss interaction - close instructions -->
	<link
			xconnector="cb#onKeySelectionStopNSetN">
		<bind
				component="txTeste"
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
					value="0.0%, 0.0%, 125.0%, 125.0%"/>
		</bind>
		<bind
				component="txTeste"
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
