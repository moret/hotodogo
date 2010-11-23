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
		<region id="rgMain" width="100%" height="100%"/>
	</regionBase>
	
	<descriptorBase>
		<descriptor id="dsMain" region="rgMain"/>
	</descriptorBase>
</head>

<body>
	<media id="nodeSettings" type="application/x-ginga-settings">
		<property name="system.language"/>
	</media>
	
	<port id="adSync3Port" component="adSync3"/>
	<switch id="adSync3">
		<defaultComponent component="ingredients-pt"/>
		<bindRule constituent="ingredients-pt" rule="isPt"/>
		<bindRule constituent="ingredients-es" rule="isEs"/>
		<media id="ingredients-pt" src="ingredientes_salada.png" descriptor="dsMain"/>
		<media id="ingredients-es" src="ingredientes_salada_esp.png" descriptor="dsMain"/>
	</switch>
</body>
</ncl>
	