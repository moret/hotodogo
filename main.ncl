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
			<region id="rgText"
					top="25%"
					left="25%"
					height="50%"
					width="50%"/>
			<region id="rgAd"
					top="5%"
					left="70%"
					height="5%"
					width="5%"/>
		</region>
	</regionBase>
	
	<descriptorBase>
		<descriptor
				id="dsMainFull"
				region="rgMainFull"/>
		<descriptor
				id="dsText"
				region="rgText"/>
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
			id="bodyPort"
			component="sampaClip"/>
	
	<media
			id="sampaClip"
			src="20100815.mp4"
			descriptor="dsMainFull">
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
			id="adMaionese"
			src="maio_leite.jpg"
			descriptor="dsAd">
	</media>

	<media
			id="adKraft"
			src="kraft-logo.png"
			descriptor="dsAd">
	</media>

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
