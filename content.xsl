<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs"
    version="2.0">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="no" indent="yes"
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    />


    <!-- Named Templates -->
    <xsl:template name="double_blank">
        <xsl:text>
        </xsl:text>
    </xsl:template>



    <!-- Templates -->

    <!-- Surpress unnecessarry strings -->
    <xsl:template match="ns1:title" xmlns:ns1="urn:xmind:xmap:xmlns:content:2.0"></xsl:template>
    
    <xsl:template match="ns1:xmap-content" xmlns:ns1="urn:xmind:xmap:xmlns:content:2.0">
        <html>
            <head>
                <title>
                    <xsl:value-of select="ns1:sheet/ns1:topic/ns1:title"/>
                </title>
            </head>

            <body>
                <xsl:for-each select="ns1:sheet">
                <h1>
                    <xsl:value-of select="ns1:topic/ns1:title"/>
                </h1>
                <!--                    <xsl:apply-templates select="$map_h2"/> -->
                <xsl:apply-templates/>
                </xsl:for-each>

                <xsl:call-template name="double_blank"/>
            </body>
        </html>
    </xsl:template>


    <!-- h2 -->
        <xsl:template match="//ns1:topics[count(ancestor-or-self::ns1:topics)=1]" xmlns:ns1="urn:xmind:xmap:xmlns:content:2.0">
<!--    <xsl:template match="//ns1:topics" xmlns:ns1="urn:xmind:xmap:xmlns:content:2.0">-->
        <xsl:for-each select="ns1:topic">
            <xsl:call-template name="double_blank"/>
            <xsl:call-template name="double_blank"/>
            <h2>
                <xsl:value-of select="ns1:title"/>
            </h2>
            <xsl:apply-templates/>
        </xsl:for-each>
    </xsl:template>

    <!-- h3 -->
    <xsl:template match="//ns1:topics[count(ancestor-or-self::ns1:topics)=2]" xmlns:ns1="urn:xmind:xmap:xmlns:content:2.0">
        <xsl:for-each select="ns1:topic">
<!--            <xsl:call-template name="double_blank"/>-->
            <h3>
                <xsl:value-of select="ns1:title"/>
            </h3>
            <xsl:apply-templates/>
        </xsl:for-each>
    </xsl:template>

    <!-- h4 -->
    <xsl:template match="//ns1:topics[count(ancestor-or-self::ns1:topics)=3]" xmlns:ns1="urn:xmind:xmap:xmlns:content:2.0">
        <xsl:for-each select="ns1:topic">
<!--            <xsl:call-template name="double_blank"/>-->
            <h4>
                <xsl:value-of select="ns1:title"/>
            </h4>
            <xsl:apply-templates/>
        </xsl:for-each>
    </xsl:template>

    <!-- h5 -->
    <xsl:template match="//ns1:topics[count(ancestor-or-self::ns1:topics)=4]" xmlns:ns1="urn:xmind:xmap:xmlns:content:2.0">
        <xsl:for-each select="ns1:topic">
<!--            <xsl:call-template name="double_blank"/>-->
            <h5>
                <xsl:value-of select="ns1:title"/>
            </h5>
            <xsl:apply-templates/>
        </xsl:for-each>
    </xsl:template>

    <!-- h6 -->
    <xsl:template match="//ns1:topics[count(ancestor-or-self::ns1:topics)=5]" xmlns:ns1="urn:xmind:xmap:xmlns:content:2.0">
        <xsl:for-each select="ns1:topic">
<!--            <xsl:call-template name="double_blank"/>-->
            <h6>
                <xsl:value-of select="ns1:title"/>
            </h6>
            <xsl:apply-templates/>
        </xsl:for-each>
    </xsl:template>

    <!-- list: ul -->
    <xsl:template match="//ns1:topics[count(ancestor-or-self::ns1:topics)&gt;=6]" xmlns:ns1="urn:xmind:xmap:xmlns:content:2.0">
        <ul>
            <xsl:for-each select="ns1:topic">
                <!--            <xsl:call-template name="double_blank"/>-->
                <li>
                    <xsl:value-of select="ns1:title"/>
                    <xsl:apply-templates/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>


    <!-- tmp -->
<!--    <xsl:template match="//ns1:topics" xmlns:ns1="urn:xmind:xmap:xmlns:content:2.0">
        <xsl:call-template name="double_blank"/> count(ancestor-or-self::ns1:topics) = <xsl:value-of
            select="count(ancestor-or-self::ns1:topics)"/>
        <xsl:call-template name="double_blank"/>
        <xsl:for-each select="ns1:topic">
            <h2>
                <xsl:value-of select="ns1:title"/>
            </h2> <xsl:apply-templates/> </xsl:for-each>
    </xsl:template>-->


</xsl:stylesheet>
