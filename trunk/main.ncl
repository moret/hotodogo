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
		</region>
	</regionBase>
	
	<descriptorBase>
		<descriptor
				id="dsMainFull"
				region="rgMainFull"/>
		<descriptor
				id="dsText"
				region="rgText"/>
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
				id="certainPoint"
				begin="5s"/>
		<area
				id="later"
				begin="20s"/>
	</media>
	
	<media
			id="testText"
			src="teste.txt"
			descriptor="dsText">
	</media>

	<link
			xconnector="cb#onBeginStart">
		<bind
				component="sampaClip"
				interface="certainPoint"
				role="onBegin"/>
		<bind
				component="testText"
				role="start"/>
	</link>

	<link
			xconnector="cb#onBeginStop">
		<bind
				component="sampaClip"
				interface="later"
				role="onBegin"/>
		<bind
				component="testText"
				role="stop"/>
	</link>

<!--
	<link xconnector="onBeginStart">
		<bind component="video" interface="arIcone" role="onBegin"/>
		<bind component="icone" role="start"/>
	</link>

	<link xconnector="onEndStop">
		<bind component="video" interface="arIcone" role="onEnd"/>
		<bind component="icone" role="stop"/>
	</link>
	
	<link xconnector="onKeySelectionSetResizeStartStop">
		<bind component="icone" role="onSelection">
			<bindParam name="keyCode" value="RED"/>
		</bind>
		<bind component="video" interface="bounds" role="set">
			<bindParam name="var" value="27.97%, 13.33%, 44.22%, 41.87%"/>
		</bind>
		<bind component="ctxPratos" interface="poEntPratos" role="start"/>
		<bind component="icone" role="stop"/>
	</link>

	<link xconnector="onEndAbort">
		<bind component="video" role="onEnd"/>
		<bind component="ctxPratos" role="abort"/>
	</link>
-->
	
</body>
</ncl>
