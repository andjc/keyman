<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!--
  Version 0.13
  05/08/2011-11:44:29 EST
  
  A Cunningham <andrewc@vicnet.net.au>
  State Library of Victoria
  
  License: LGPL 3.0
-->
  <xsl:output method="text" indent="no" encoding="utf-8"/>
  <xsl:strip-space elements="*" />
  
  <xsl:variable name='newline'>
    <xsl:text>&#10;</xsl:text>
  </xsl:variable>
  
  <xsl:template match="/visualkeyboard">
    <xsl:apply-templates select="header"/>
    <xsl:text>store(&amp;copyright) '© '</xsl:text>
    <xsl:value-of select="$newline"/>
    <xsl:text>c store(&amp;message) ''</xsl:text>
    <xsl:value-of select="$newline"/>
    <xsl:text>c store(&amp;ethnologuecode) ''</xsl:text>
    <xsl:value-of select="$newline"/>
    <xsl:text>c store(&amp;bitmap) ''</xsl:text>
    <xsl:value-of select="$newline"/>
    <xsl:text>begin Unicode &gt; use(main)</xsl:text>
    <xsl:value-of select="$newline"/>
    <xsl:text>group(main) using keys</xsl:text>
    <xsl:value-of select="$newline"/>
    <xsl:apply-templates select="keys"/>
  </xsl:template>
  
  <xsl:template match="header">
    <xsl:apply-templates select="version"/>
    <xsl:apply-templates select="kbdname"/>
  </xsl:template>
  
  <xsl:template match="version">
    <xsl:text disable-output-escaping="yes">store(&amp;Version) "</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>"</xsl:text>
    <xsl:value-of select="$newline"/>
  </xsl:template>
  
  <xsl:template match="kbdname">
    <xsl:text disable-output-escaping="yes">store(&amp;Name) "</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>"</xsl:text>
    <xsl:value-of select="$newline"/>
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
      <xsl:text>+ [</xsl:text>
      <xsl:if test="@shift='S'">
        <xsl:text>SHIFT </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='A'">
        <xsl:text>ALT </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='RA'">
        <xsl:text>RALT </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='LA'">
        <xsl:text>LALT </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='C'">
        <xsl:text>CTRL </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='LC'">
        <xsl:text>LCTRL </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='RC'">
        <xsl:text>RCTRL </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='SA'">
        <xsl:text>SHIFT ALT </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='SRA'">
        <xsl:text>SHIFT RALT </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='SLA'">
        <xsl:text>SHIFT LALT </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='SC'">
        <xsl:text>SHIFT CTRL </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='SRC'">
        <xsl:text>SHIFT RCTRL </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='SLC'">
        <xsl:text>SHIFT LCTRL </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='CA'">
        <xsl:text>CTRL ALT </xsl:text>
      </xsl:if>
      <xsl:if test="@shift='SCA'">
        <xsl:text>SHIFT CTRL ALT </xsl:text>
      </xsl:if>
      <xsl:value-of select="@vkey"/>
      <xsl:text>] &gt; "</xsl:text>
      <xsl:value-of select="@text"/>
      <xsl:text>"</xsl:text>
      <xsl:value-of select="$newline"/>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
