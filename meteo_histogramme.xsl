<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/meteo">
        <svg xmlns="http://www.w3.org/2000/svg" width="900" height="500">
            
            <!-- Définir styles généraux -->
            <style>
                .bar { fill: steelblue; }
                .label { font: bold 12px sans-serif; text-anchor: middle; }
                .date-label { font: bold 14px sans-serif; }
            </style>
            
            <!-- Variables pour positionnement -->
            <xsl:variable name="bar-width" select="50"/>
            <xsl:variable name="gap" select="20"/>
            <xsl:variable name="max-height" select="300"/>
            
            <!-- Boucle sur chaque mesure (chaque date) -->
            <xsl:for-each select="mesure">
                <xsl:variable name="date-index" select="position() - 1"/>
                <xsl:variable name="x-offset" select="($date-index * (count(ville) * ($bar-width + $gap) + 50)) + 50"/>
                
                <!-- Label de la date -->
                <text x="{$x-offset + (count(ville) * ($bar-width + $gap)) div 2}" y="450" class="date-label">
                    <xsl:value-of select="@date"/>
                </text>
                
                <!-- Boucle sur chaque ville -->
                <xsl:for-each select="ville">
                    <xsl:variable name="bar-height" select="number(@temperature) * 10"/> <!-- multiplier pour visuel -->
                    <xsl:variable name="bar-x" select="$x-offset + (position() -1) * ($bar-width + $gap)"/>
                    <xsl:variable name="bar-y" select="400 - $bar-height"/>
                    
                    <!-- barre -->
                    <rect class="bar" x="{$bar-x}" y="400" width="{$bar-width}" height="0">
                        <!-- animation pour "grandir" -->
                        <animate attributeName="height" from="0" to="{$bar-height}" dur="1s" fill="freeze"/>
                        <animate attributeName="y" from="400" to="{$bar-y}" dur="1s" fill="freeze"/>
                    </rect>
                    
                    <!-- Label ville -->
                    <text x="{$bar-x + $bar-width div 2}" y="420" class="label">
                        <xsl:value-of select="@nom"/>
                    </text>
                    
                    <!-- Température au-dessus de la barre -->
                    <text x="{$bar-x + $bar-width div 2}" y="{$bar-y - 5}" class="label">
                        <xsl:value-of select="@temperature"/>
                    </text>
                </xsl:for-each>
            </xsl:for-each>
            
        </svg>
    </xsl:template>
</xsl:stylesheet>
