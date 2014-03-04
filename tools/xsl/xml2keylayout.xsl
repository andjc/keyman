<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!--
  Version 0.10
  2011-08-08
  
  A Cunningham <andrewc@vicnet.net.au>
  State Library of Victoria
  
  License: LGPL 3.0
-->
  <xsl:output method="xml" indent="yes" encoding="utf-8"/>
  <xsl:strip-space elements="*" />
  

  
  <xsl:template match="/visualkeyboard">
    <xsl:apply-templates select="header"/>
    <xsl:apply-templates select="keys"/>
  </xsl:template>
  
  <xsl:template match="header">
    <xsl:apply-templates select="version"/>
    <xsl:apply-templates select="kbdname"/>
  </xsl:template>
  
  <xsl:template match="version">
    
  </xsl:template>
  
  <xsl:template match="kbdname">
   
  </xsl:template>
  
  <xsl:template match="keys">
    <xsl:apply-templates select="key"/>
  </xsl:template>
  
  <!--
   
    S = SHIFT
    A = ALT
    RA = RALT
    LA = LALT
    C = CTRL
    LC = LCTRL
    RC = RCTRL
    
    SA = SHIFT ALT
    SRA = SHIFT RALT
    SLA = SHIFT LALT
    
    SC = SHIFT CTRL
    SRC = SHIFT RCTRL
    SLC = SHIFT LCTRL
    
    CA = CTRL ALT
    SCA = SHIFT CTRL ALT
    
  -->
  
  <xsl:template match="key">
    <xsl:for-each select=".">
		
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
