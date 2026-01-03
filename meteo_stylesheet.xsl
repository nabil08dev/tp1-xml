<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    

    
    <xsl:template match="/">
        <html>
            <head>
                <title>Météo</title>
                <style>
                    table { border-collapse: collapse; width: 64%; }
                    th, td { border: 1px solid black; padding: 5px; text-align: left; }
                    th { background-color: #f2f2f2; }
                </style>
            </head>
            <body>
                <h1>Prévisions Météo</h1>
                
                <!-- Boucle sur chaque mesure -->
                <xsl:for-each select="meteo/mesure">
                    <h2>Date : <xsl:value-of select="@date"/></h2>
                    <table>
                        <tr>
                            <th>Ville</th>
                            <th>Température (°C)</th>
                        </tr>
                        <!-- Boucle sur chaque ville -->
                        <xsl:for-each select="ville">
                            <tr>
                                <td><xsl:value-of select="@nom"/></td>
                                <td><xsl:value-of select="@temperature"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
                
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
