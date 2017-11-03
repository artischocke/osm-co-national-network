<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/osm">
  <html>
    <head>
      <meta charset="utf-8"/>
      <script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
      <script src="jquery.timeago.js" type="text/javascript"></script>
      <script type="text/javascript">
        jQuery(document).ready(function($) {
          $(".timeago").timeago();
        });
      </script>
      <style>
        html {
          font-family: sans-serif;
          font-size: 9px;
        }
        table {
          border-collapse: collapse;
        }
        table, th, td {
          border: 1px solid silver;
        }
        td {
          padding: 3px;
        }
      </style>
    </head>
    <body>
      <table>
        <thead>
          <tr>
            <th></th>
            <th>ID</th>
            <th stye="white-space: nowrap"><tt>name</tt></th>
            <th>Description</th>
            <th>ref</th>
            <th>unsigned_ref</th>
            <th>note</th>
            <th>Version</th>
            <th>Last changeset</th>
            <th stye="white-space: nowrap">Last edited on</th>
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
              <td><xsl:value-of select="tag[@k='description'][1]/@v"/></td>
              <td><xsl:value-of select="tag[@k='ref'][1]/@v"/></td>
              <td><xsl:value-of select="tag[@k='unsigned_ref'][1]/@v"/></td>
              <td><xsl:value-of select="tag[@k='note'][1]/@v"/></td>
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
