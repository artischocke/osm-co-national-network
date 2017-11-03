wget -O relations.xml --remote-encoding=utf-8 http://www.overpass-api.de/api/xapi_meta?relation[network=co:national]
xsltproc transformation.xsl relations.xml > index.html
xsltproc model-transform.xsl relations.xml > routes.xml

