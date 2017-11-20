<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/osm">
      <routes>
        <xsl:for-each select="relation">
          <xsl:sort select="tag[@k='name'][1]/@v"/>
          <route>
            <xsl:attribute name="osm_relation_id">
              <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:attribute name="name">
              <xsl:value-of select="tag[@k='name'][1]/@v"/>
            </xsl:attribute>
            <xsl:attribute name="description">
              <xsl:value-of select="tag[@k='description'][1]/@v"/>
            </xsl:attribute>
            <xsl:attribute name="ref">
              <xsl:value-of select="tag[@k='ref'][1]/@v"/>
            </xsl:attribute>
            <xsl:attribute name="unsigned_ref">
              <xsl:value-of select="tag[@k='unsigned_ref'][1]/@v"/>
            </xsl:attribute>
            <xsl:attribute name="osm_element_version">
              <xsl:value-of select="@version"/>
            </xsl:attribute>
            <last_changeset>
                <id><xsl:value-of select="@changeset"/></id>
                <user><xsl:value-of select="@user"/></user>
                <timestamp><xsl:value-of select="@timestamp"/></timestamp>
            </last_changeset>
            <xsl:if test="tag[@k='note'][1]/@v">
              <note>
                <xsl:value-of select="tag[@k='note'][1]/@v"/>
              </note>
            </xsl:if>
          </route>
        </xsl:for-each>
      </routes>
    </xsl:template>

</xsl:stylesheet>
