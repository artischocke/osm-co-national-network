<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output type="html"
            encoding="utf-8"
            doctype-system="about:legacy-compat"
            indent="yes" />

<xsl:template match="/osm">
  <html>
    <head>
      <title>co:national network</title>
      <script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous" type="text/javascript"></script>
      <script src="jquery.timeago.js" type="text/javascript"></script>
      <script type="text/javascript">
        jQuery(document).ready(function($) {
          $(".timeago").timeago();
        });
      </script>
      <style type="text/css">
        body {
          font-family: sans-serif;
          font-size: 0.75em;
        }
        span.monospace {
          font-family: monospace;
          font-size: 1.2em;
        }
        table {
          border-collapse: collapse;
        }
        table, th, td {
          border: 1px solid silver;
        }
        th, td {
          padding: 3px;
        }
        .nowrap {
          white-space: nowrap;
        }
        td.error {
          background-color: tomato
        }
      </style>
    </head>
    <body>
      <table>
        <thead>
          <tr>
            <th></th>
            <th>ID</th>
            <th class="nowrap">name</th>
            <th>Description</th>
            <th class="nowrap">ref</th>
            <th class="nowrap">unsigned_ref</th>
            <th>note</th>
            <th>fixme</th>
            <th>Version</th>
            <th>Last changeset</th>
            <th class="nowrap">Last edited on</th>
            <th>Last edited by</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="relation">
            <xsl:sort select="tag[@k='name'][1]/@v"/>
            <tr>
              <td><xsl:value-of select="position()" /></td>
              <td>
                <a>
                  <xsl:attribute name='href'>
                    https://www.osm.org/relation/<xsl:value-of select="@id"/>
                  </xsl:attribute>
                  <xsl:value-of select="@id"/>
                </a>
              </td>
              <td><xsl:value-of select="tag[@k='name'][1]/@v"/></td>
              <td>
                <xsl:if test="not(tag[@k='description'][1])">
                  <xsl:attribute name='class'>error</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="tag[@k='description'][1]/@v"/>
              </td>
              <td><xsl:value-of select="tag[@k='ref'][1]/@v"/></td>
              <td><xsl:value-of select="tag[@k='unsigned_ref'][1]/@v"/></td>
              <td><xsl:value-of select="tag[@k='note'][1]/@v"/></td>
              <td><xsl:value-of select="tag[@k='fixme'][1]/@v"/></td>
              <td><xsl:value-of select="@version"/></td>
              <td>
                <a>
                  <xsl:attribute name='href'>
                    https://www.osm.org/changeset/<xsl:value-of select="@changeset"/>
                  </xsl:attribute>
                  <xsl:value-of select="@changeset"/>
                </a>
              </td>
              <td>
                <time class='timeago'>
                  <xsl:attribute name='datetime'>
                    <xsl:value-of select="@timestamp"/>
                  </xsl:attribute>
                </time>
                </td>
              <td><xsl:value-of select="@user"/></td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>
