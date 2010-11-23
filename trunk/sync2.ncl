<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="hotodogo" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:schemaLocation="http://www.ncl.org.br/NCL3.0/EDTVProfile
		http://www.ncl.org.br/NCL3.0/profiles/NCL30EDTV.xsd">

<head>
	<regionBase>
		<region id="rgMain" width="100%" height="100%"/>
	</regionBase>
	
	<descriptorBase>
		<descriptor id="dsMain" region="rgMain"/>
	</descriptorBase>
</head>

<body>
	<port id="adSync2Port" component="adSync2"/>
	<media id="adSync2" src="sync2.png" descriptor="dsMain"/>
</body>
</ncl>
	