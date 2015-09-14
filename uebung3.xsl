<?xml version="1.0" encoding="UTF-8" ?>
<!--
    uebung3
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--<xsl:output encoding="UTF-8" indent="yes" method="xml" />-->

  <xsl:template match="/person">
  	<html>
  		<head>
  			<title>Personenbeschreibung</title>
  		</head>
  		<body>
  			<h1>Personensteckbrief</h1>
  			<table border="1">
  				<tr>
  					<td>
  						<xsl:apply-templates select="name" />
  					</td>
  				</tr>
  				<tr>
  					<td>Jahrgang:</td>
  					<td><xsl:value-of select="geburtsjahr" /></td>
  				</tr>
  				<tr>
  					<td>Lebenslauf:</td>
  					<td>
  						<ul>
  							<xsl:apply-template select="werdengang" />
  						</ul>
  					</td>
  				</tr>
  			</table>
  		</body>
  	</html>
  </xsl:template>
  
  <xsl:template match="name">
  	
  	<xsl:value-of select="@titel" />
  	<xsl:text> </xsl:text>
  	
  	<xsl:value-of select="@anrede" />
  	<xsl:text> </xsl:text>
  	
  	<xsl:for-each select="name">
  		<xsl:value-of select="." />
  	<xsl:text> </xsl:text>
  	</xsl:for-each>
  	
  	<xsl:value-of select="nachname" />
  </xsl:template>
  
  <xsl:template match="werdegang">
  	<xsl:apply-templates />
  </xsl:template>
  
  <xsl:template match="ausbildung">
  	<li><xsl:value-of select="." /> (Ausbildung)</li>
  </xsl:template>
  
  <xsl:template match="beruf">
  	<li><xsl:value-of select="." /> (Beruf)</li>
  </xsl:template>
  
</xsl:stylesheet>