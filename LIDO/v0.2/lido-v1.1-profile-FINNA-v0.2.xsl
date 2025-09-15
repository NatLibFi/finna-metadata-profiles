<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:error="https://doi.org/10.5281/zenodo.1495494#error" xmlns:lido="http://www.lido-schema.org" xmlns:owl="http://www.w3.org/2002/07/owl#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:schxslt-api="https://doi.org/10.5281/zenodo.1495494#api" xmlns:schxslt="https://doi.org/10.5281/zenodo.1495494" xmlns:skos="http://www.w3.org/2004/02/skos/core#" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
   <rdf:Description xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dct="http://purl.org/dc/terms/">
      <dct:creator>
         <dct:Agent>
            <skos:prefLabel>SchXslt/1.10.1 SaxonJS/2.7</skos:prefLabel>
            <schxslt.compile.typed-variables xmlns="https://doi.org/10.5281/zenodo.1495494#">true</schxslt.compile.typed-variables>
         </dct:Agent>
      </dct:creator>
      <dct:created>2025-09-15T14:24:41.071+03:00</dct:created>
   </rdf:Description>
   <xsl:output indent="yes"/>
   <xsl:param name="schxslt.validate.initial-document-uri" as="xs:string?"/>
   <xsl:template name="schxslt.validate">
      <xsl:apply-templates select="document($schxslt.validate.initial-document-uri)"/>
   </xsl:template>
   <xsl:template match="root()">
      <xsl:param name="schxslt.validate.recursive-call" as="xs:boolean" select="false()"/>
      <xsl:choose>
         <xsl:when test="not($schxslt.validate.recursive-call) and (normalize-space($schxslt.validate.initial-document-uri) != '')">
            <xsl:apply-templates select="document($schxslt.validate.initial-document-uri)">
               <xsl:with-param name="schxslt.validate.recursive-call" as="xs:boolean" select="true()"/>
            </xsl:apply-templates>
         </xsl:when>
         <xsl:otherwise>
            <xsl:variable name="metadata" as="element()?"/>
            <xsl:variable name="report" as="element(schxslt:report)">
               <schxslt:report>
                  <xsl:call-template name="d79aN"/>
               </schxslt:report>
            </xsl:variable>
            <xsl:variable name="schxslt:report" as="node()*">
               <xsl:sequence select="$metadata"/>
               <xsl:for-each select="$report/schxslt:document">
                  <xsl:for-each select="schxslt:pattern">
                     <xsl:sequence select="node()"/>
                     <xsl:sequence select="../schxslt:rule[@pattern = current()/@id]/node()"/>
                  </xsl:for-each>
               </xsl:for-each>
            </xsl:variable>
            <svrl:schematron-output xmlns:svrl="http://purl.oclc.org/dsdl/svrl" xml:lang="en">
               <xsl:sequence select="$schxslt:report"/>
            </svrl:schematron-output>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="text() | @*" mode="#all" priority="-10"/>
   <xsl:template match="/" mode="#all" priority="-10">
      <xsl:apply-templates mode="#current" select="node()"/>
   </xsl:template>
   <xsl:template match="*" mode="#all" priority="-10">
      <xsl:apply-templates mode="#current" select="@*"/>
      <xsl:apply-templates mode="#current" select="node()"/>
   </xsl:template>
   <xsl:template name="d79aN">
      <schxslt:document>
         <schxslt:pattern id="d79aN">
            <xsl:if test="exists(base-uri(root()))">
               <xsl:attribute name="documents" select="base-uri(root())"/>
            </xsl:if>
            <xsl:for-each select="root()"/>
         </schxslt:pattern>
         <xsl:apply-templates mode="d79aN" select="root()"/>
      </schxslt:document>
   </xsl:template>
   <xsl:template match="lido:actorID[starts-with(., 'http://urn.fi/URN:NBN:fi:au:finaf:')]" priority="58" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@lido:source='finaf')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@lido:source='finaf'</xsl:attribute>
                     <svrl:text>Missing or invalid source attribute of actorID: For KANTO actors, it is recommended to use the source attribute 'finaf'.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(@lido:type='http://terminology.lido-schema.org/lido00099' or @lido:type='URI')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" xml:lang="en">
                     <xsl:attribute name="test">@lido:type='http://terminology.lido-schema.org/lido00099' or @lido:type='URI'</xsl:attribute>
                     <svrl:text>Missing or invalid type attribute of actorID: For KANTO actor URIs, the type attribute of actorID should be 'URI' or 'http://terminology.lido-schema.org/lido00099'.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:actorID[@lido:source='finaf' and string(normalize-space(text()))!='']" priority="57" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(starts-with(., 'http://urn.fi/URN:NBN:fi:au:finaf:'))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">starts-with(., 'http://urn.fi/URN:NBN:fi:au:finaf:')</xsl:attribute>
                     <svrl:text>Possibly invalid actorID: URIs for KANTO actors should begin with 'http://urn.fi/URN:NBN:fi:au:finaf:'</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:actorID[string(normalize-space(text()))!='']" priority="56" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@lido:source)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@lido:source</xsl:attribute>
                     <svrl:text>Missing source attribute of actorID: It is recommended to identify the source for actor ID.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:classificationWrap" priority="55" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:classification) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:classification) &gt; 0</xsl:attribute>
                     <svrl:text>Missing classifications: Classification is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(lido:classification[@lido:type='language']/lido:term) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:classification[@lido:type='language']/lido:term) &gt; 0</xsl:attribute>
                     <svrl:text>Missing object language: For textual materials, it is strongly recommended to describe the language(s) of the object in a classification/term element with type 'language'.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:classification[@lido:type='language']/lido:term[normalize-space(text())!='']" priority="54" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(translate(normalize-space(text()), 'bcdefghijklmnopqrstuvxyz', 'aaaaaaaaaaaaaaaaaaaaaaaa')='aaa')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">translate(normalize-space(text()), 'bcdefghijklmnopqrstuvxyz', 'aaaaaaaaaaaaaaaaaaaaaaaa')='aaa'</xsl:attribute>
                     <svrl:text>Invalid language code: If the type attribute of classification is "language", the term should contain a three-letter language code.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:classification" priority="53" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:term[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:term[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing classification/term: Classification should have a non-empty term.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:earliestDate[string(normalize-space(text()))!='']" priority="52" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(matches(string(normalize-space(text())), '(^((-|–)?[0-9]{4})$)|(^((-|–)?[0-9]{4})(-|–)(0[1-9]|1[0-2])$)|(^((-|–)?[0-9]{4})(-|–)(0[1-9]|1[0-2])(-|–)([0][1-9]|[12][0-9]|3[01])(T)?)'))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">matches(string(normalize-space(text())), '(^((-|–)?[0-9]{4})$)|(^((-|–)?[0-9]{4})(-|–)(0[1-9]|1[0-2])$)|(^((-|–)?[0-9]{4})(-|–)(0[1-9]|1[0-2])(-|–)([0][1-9]|[12][0-9]|3[01])(T)?)')</xsl:attribute>
                     <svrl:text>
							Invalid earliestDate: The date should comply to the formats [-]CCYY, [-]CCYY-MM, [-]CCYY-MM-DD or [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm].
						</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:eventWrap" priority="51" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:eventSet) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:eventSet) &gt; 0</xsl:attribute>
                     <svrl:text>Missing eventSet: eventSet is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:eventSet" priority="50" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:event) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:event) &gt; 0</xsl:attribute>
                     <svrl:text>Missing eventSet/event: Within eventSet, event is a required element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:event" priority="49" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:eventType/lido:term[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:eventType/lido:term[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing eventType/term: An event should have a non-empty event type term.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(lido:eventActor) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:eventActor) &gt; 0</xsl:attribute>
                     <svrl:text>Missing event/eventActor: eventActor is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(lido:eventDate) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:eventDate) &gt; 0</xsl:attribute>
                     <svrl:text>Missing event/eventDate: eventDate is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(lido:eventPlace) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:eventPlace) &gt; 0</xsl:attribute>
                     <svrl:text>Missing event/eventPlace: eventPlace is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:eventDate" priority="48" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:displayDate[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:displayDate[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing eventDate/displayDate: displayDate is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(lido:date) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:date) &gt; 0</xsl:attribute>
                     <svrl:text>Missing eventDate/date: date is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:eventDate/lido:displayDate[string(normalize-space(text()))!='']" priority="47" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@xml:lang)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@xml:lang</xsl:attribute>
                     <svrl:text>Missing lang attribute in eventDate/displayDate: It is recommended to specify the language of the date in the lang attribute of displayDate.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:eventPlace" priority="46" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:displayPlace[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:displayPlace[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing eventPlace/displayPlace: displayPlace is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(lido:place) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:place) &gt; 0</xsl:attribute>
                     <svrl:text>Missing eventPlace/place: place is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(lido:displayPlace[string(normalize-space(text()))]) &gt; 0) or (count(lido:place/lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">(count(lido:displayPlace[string(normalize-space(text()))]) &gt; 0) or (count(lido:place/lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0)</xsl:attribute>
                     <svrl:text>Missing eventPlace/displayPlace and eventPlace/place/namePlaceSet/appellationValue: It is required to include the name of the place either to displayPlace or namePlaceSet.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:inscriptionDescription" priority="45" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:descriptiveNoteValue[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:descriptiveNoteValue[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing inscriptionDescription/descriptiveNoteValue: A non-empty descriptiveNoteValue is required.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(not(@lido:type) or @lido:type='technique' or @lido:type='tekniikka' or @lido:type='location' or @lido:type='sijainti' or @lido:type='description' or @lido:type='kuvailu')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">not(@lido:type) or @lido:type='technique' or @lido:type='tekniikka' or @lido:type='location' or @lido:type='sijainti' or @lido:type='description' or @lido:type='kuvailu'</xsl:attribute>
                     <svrl:text>Invalid type attribute of inscriptionDescription: If type attribute is in use, it should be one from "technique", "location" or "description".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:inscriptionDescription/lido:descriptiveNoteValue[string(normalize-space(text()))!='']" priority="44" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@xml:lang)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@xml:lang</xsl:attribute>
                     <svrl:text>Missing lang attribute in inscriptionDescription/descriptiveNoteValue: It is recommended to specify the language of the description in the lang attribute of descriptiveNoteValue.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:latestDate[string(normalize-space(text()))!='']" priority="43" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(matches(string(normalize-space(text())), '(^((-|–)?[0-9]{4})$)|(^((-|–)?[0-9]{4})(-|–)(0[1-9]|1[0-2])$)|(^((-|–)?[0-9]{4})(-|–)(0[1-9]|1[0-2])(-|–)([0][1-9]|[12][0-9]|3[01])(T)?)'))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">matches(string(normalize-space(text())), '(^((-|–)?[0-9]{4})$)|(^((-|–)?[0-9]{4})(-|–)(0[1-9]|1[0-2])$)|(^((-|–)?[0-9]{4})(-|–)(0[1-9]|1[0-2])(-|–)([0][1-9]|[12][0-9]|3[01])(T)?)')</xsl:attribute>
                     <svrl:text>
							Invalid latestDate: The date should comply to the formats [-]CCYY, [-]CCYY-MM, [-]CCYY-MM-DD or [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm].
						</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:lido" priority="42" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(lido:lidoRecID[string(normalize-space(text()))])">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">lido:lidoRecID[string(normalize-space(text()))]</xsl:attribute>
                     <svrl:text>Missing lidoRecID: There should be a non-empty record identifier.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(lido:lidoRecID[string(normalize-space(text()))]) &lt; 2)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:lidoRecID[string(normalize-space(text()))]) &lt; 2</xsl:attribute>
                     <svrl:text>lidoRecID: There should be exactly one record identifier.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:linkResource[string(normalize-space(text()))!='']" priority="41" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@lido:formatResource)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">@lido:formatResource</xsl:attribute>
                     <svrl:text>Missing formatResource attribute of linkResource: It is required to specify the format of the resource.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(starts-with(normalize-space(text()), 'http'))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">starts-with(normalize-space(text()), 'http')</xsl:attribute>
                     <svrl:text>Invalid linkResource: There must be a valid http/https link in linkResource.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))!='']" priority="40" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@lido:label)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@lido:label</xsl:attribute>
                     <svrl:text>Missing namePlaceSet/appellationValue[@label]: It is recommended to specify the type of place in the label attribute of appellationValue.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:objectDescriptionWrap" priority="39" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:objectDescriptionSet) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:objectDescriptionSet) &gt; 0</xsl:attribute>
                     <svrl:text>Missing objectescriptionSet: objectDescriptionSet is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:objectDescriptionSet" priority="38" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:descriptiveNoteValue[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:descriptiveNoteValue[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing objectDescriptionSet/descriptiveNoteValue: objectDescriptionSet should have a non-empty descriptiveNoteValue.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:objectDescriptionSet/lido:descriptiveNoteValue[string(normalize-space(text()))!='']" priority="37" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@xml:lang)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@xml:lang</xsl:attribute>
                     <svrl:text>Missing lang attribute in objectDescriptionSet/descriptiveNoteValue: It is recommended to specify the language of the descriptive note in the lang attribute of descriptiveNoteValue.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:objectNote" priority="36" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(not(@lido:type) or @lido:type='objectWorkType')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">not(@lido:type) or @lido:type='objectWorkType'</xsl:attribute>
                     <svrl:text>Invalid type attribute of objectNote: If type attribute is used for objectNote, it must be "objectWorkType".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:objectType" priority="35" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:term[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:term[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing objectType/term: A non-empty term is required.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:objectWorkTypeWrap" priority="34" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:objectWorkType/lido:term[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:objectWorkType/lido:term[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing objectWorkType/term: At least one object work type term is required.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:partOfPlace" priority="33" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:placeID[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:placeID[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing partOfPlace/placeID: Adding an identifier for the place is recommended.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing partOfPlace/namePlaceSet/appellationValue: Describing the name of the place in namePlaceSet is recommended.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:place" priority="32" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:placeID[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:placeID[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing place/placeID: Adding an identifier for the place is recommended.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing place/namePlaceSet/appellationValue: Describing the name of the place in namePlaceSet is recommended.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(lido:partOfPlace) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:partOfPlace) &gt; 0</xsl:attribute>
                     <svrl:text>Missing partOfPlace: It is recommended to include at least one broader context for the place in partOfPlace element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(lido:gml) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:gml) &gt; 0</xsl:attribute>
                     <svrl:text>Missing place/gml: Including the cordinates of the place in gml is recommended.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:placeID[starts-with(., 'http://www.yso.fi/onto/yso/')]" priority="31" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@lido:source='yso')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@lido:source='yso'</xsl:attribute>
                     <svrl:text>Missing or invalid source attribute of placeID: For YSO places, it is recommended to use the source attribute 'yso'.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(@lido:type='http://terminology.lido-schema.org/lido00099' or @lido:type='URI')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">@lido:type='http://terminology.lido-schema.org/lido00099' or @lido:type='URI'</xsl:attribute>
                     <svrl:text>Missing or invalid type attribute of placeID: For YSO place URIs, the type attribute of placeID should be 'URI' or 'http://terminology.lido-schema.org/lido00099'.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:placeID[@lido:source='yso' and string(normalize-space(text()))!='']" priority="30" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(starts-with(., 'http://www.yso.fi/onto/yso/'))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">starts-with(., 'http://www.yso.fi/onto/yso/')</xsl:attribute>
                     <svrl:text>Possibly invalid placeID: URIs for YSO places should begin with 'http://www.yso.fi/onto/yso/'</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:placeID[string(normalize-space(text()))!='']" priority="29" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@lido:source)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@lido:source</xsl:attribute>
                     <svrl:text>Missing source attribute of placeID: It is recommended to identify the source for place ID.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:qualifierMeasurements" priority="28" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:term[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:term[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing qualifierMeasurements/term: A non-empty term is required.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:qualifierMeasurements/lido:term[string(normalize-space(text()))!='']" priority="27" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@xml:lang)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@xml:lang</xsl:attribute>
                     <svrl:text>Missing lang attribute in qualifierMeasurements/term: It is recommended to specify the language of the term in the lang attribute of term.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:recordWrap" priority="26" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:recordRights/lido:rightsType/lido:conceptID[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:recordRights/lido:rightsType/lido:conceptID[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing recordRights/rightsType/conceptID: It is required to specify the license of the LIDO record.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:recordSource" priority="25" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:legalBodyName/lido:appellationValue[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:legalBodyName/lido:appellationValue[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing recordSource/legalBodyName/appellationValue: The name of the institution is required.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:relatedWork" priority="24" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:displayObject[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:displayObject[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing relatedWork/displayObject: relatedWork should have a non-empty displayObject.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:relatedWork/lido:displayObject[string(normalize-space(text()))!='']" priority="23" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@xml:lang)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@xml:lang</xsl:attribute>
                     <svrl:text>Missing lang attribute in relatedWork/displayObject: It is recommended to specify the language in the lang attribute of displayObject.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:relatedWork/lido:object[(lido:objectType/lido:term='collection' or lido:objectType/lido:term='parent') and lido:objectID[string(normalize-space(text()))]]" priority="22" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:objectNote[@lido:type='objectWorkType' and string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:objectNote[@lido:type='objectWorkType' and string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing objectNote: If there is a non-empty object/objectID and object/objectType/term is "collection" or "parent", there must be a non-empty object/objectNote with type attribute "objectWorkType".</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:relatedWork/lido:object[lido:objectType/lido:term='parent']" priority="21" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:objectID[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:objectID[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing objectID: If the object/objectType/term is "parent", there must be a non-empty object/objectID.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:relatedWorkRelType" priority="20" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:term[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:term[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing relatedWorkRelType/term: A related work should have a non-empty term for the relation type.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:relatedWorksWrap[lido:relatedWorkSet/lido:relatedWork/lido:object/lido:objectType/lido:term='parent']" priority="19" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:relatedWorkSet[lido:relatedWork/lido:object/lido:objectType/lido:term='collection']) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:relatedWorkSet[lido:relatedWork/lido:object/lido:objectType/lido:term='collection']) &gt; 0</xsl:attribute>
                     <svrl:text>Missing relatedWorkSet element for collection record: If there is a relatedWorkSet element for parent record (with relatedWork/object/objectType/term "parent"), there must also ve a relatedWorkSet element for collection record (with relatedWork/object/objectType/term "collection").</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:repositoryWrap" priority="18" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:repositorySet/lido:workID[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:repositorySet/lido:workID[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing repositorySet/workID: There should be at least one non-empty workID element including an identification number for the object.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:resourceDescription[string(normalize-space(text()))!='']" priority="17" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@lido:type)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@lido:type</xsl:attribute>
                     <svrl:text>Missing resourceDescription[@type]: It is recommended to specify the type of resource description.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(@xml:lang)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@xml:lang</xsl:attribute>
                     <svrl:text>Missing resourceDescription[@lang]: It is recommended to specify the language of resource description.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:resourceRepresentation[not(@lido:type)]" priority="16" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@lido:type)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">@lido:type</xsl:attribute>
                     <svrl:text>Missing resourceRepresentation[@type]: It is required to specify the type of resource representation.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:resourceRepresentation[@lido:type!='image_thumb']" priority="15" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:resourceMeasurementsSet) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:resourceMeasurementsSet) &gt; 0</xsl:attribute>
                     <svrl:text>Missing resourceMeasurementsSet: It is recommended to specify the file size of a downloadable resource in resourceMeasurementsSet.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:rightsResource[lido:rightsType/lido:conceptID[contains(string(normalize-space(text())), 'InC')]]" priority="14" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:rightsHolder/lido:legalBodyName/lido:appellationValue[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:rightsHolder/lido:legalBodyName/lido:appellationValue[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing rightsResource/rightsHolder/legalBodyName/appellationValue: For resources with rights type https://rightsstatements.org/vocab/InC/1.0/, the name of the rights holder should be specified.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:rightsResource" priority="13" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:rightsType/lido:conceptID[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:rightsType/lido:conceptID[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing rightsResource/rightsType/conceptID: It is required to specify the rights statement or license of the resource representation.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:subjectWrap" priority="12" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not((count(lido:subjectSet/lido:subject/lido:subjectConcept) &gt; 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">(count(lido:subjectSet/lido:subject/lido:subjectConcept) &gt; 0)</xsl:attribute>
                     <svrl:text>Missing subjectConcept: subjectConcept is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:subjectConcept" priority="11" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:conceptID[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:conceptID[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing subjectConcept/conceptID: Adding an identifier for the subject concept is recommended.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:subjectConcept/lido:conceptID[starts-with(., 'http://www.yso.fi/onto/yso/')]" priority="10" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@lido:source='yso')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@lido:source='yso'</xsl:attribute>
                     <svrl:text>Missing or invalid source attribute of conceptID: For YSO concepts, it is recommended to use the source attribute 'yso'.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(@lido:type='http://terminology.lido-schema.org/lido00099' or @lido:type='URI')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">@lido:type='http://terminology.lido-schema.org/lido00099' or @lido:type='URI'</xsl:attribute>
                     <svrl:text>Missing or invalid type attribute of conceptID: For YSO concept URIs, the type attribute of conceptID should be 'http://terminology.lido-schema.org/lido00099' or 'URI'.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:subjectConcept/lido:conceptID[starts-with(., 'http://www.yso.fi/onto/koko/')]" priority="9" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@lido:source='koko')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@lido:source='koko'</xsl:attribute>
                     <svrl:text>Missing or invalid source attribute of conceptID: For KOKO concepts, it is recommended to use the source attribute 'koko'.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(@lido:type='http://terminology.lido-schema.org/lido00099' or @lido:type='URI')">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">@lido:type='http://terminology.lido-schema.org/lido00099' or @lido:type='URI'</xsl:attribute>
                     <svrl:text>Missing or invalid type attribute of conceptID: For YSO concept URIs, the type attribute of conceptID should be 'http://terminology.lido-schema.org/lido00099' or 'URI'.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:subjectConcept/lido:conceptID[@lido:source='yso' and string(normalize-space(text()))!='']" priority="8" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(starts-with(., 'http://www.yso.fi/onto/yso/'))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">starts-with(., 'http://www.yso.fi/onto/yso/')</xsl:attribute>
                     <svrl:text>Possibly invalid conceptID: URIs for YSO concepts should begin with 'http://www.yso.fi/onto/yso/'</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:subjectConcept/lido:conceptID[@lido:source='koko' and string(normalize-space(text()))!='']" priority="7" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(starts-with(., 'http://www.yso.fi/onto/koko/'))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">starts-with(., 'http://www.yso.fi/onto/koko/')</xsl:attribute>
                     <svrl:text>Possibly invalid conceptID: URIs for KOKO concepts should begin with 'http://www.yso.fi/onto/koko/'</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:subjectConcept/lido:conceptID[string(normalize-space(text()))!='']" priority="6" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@lido:source)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@lido:source</xsl:attribute>
                     <svrl:text>Missing source attribute of subjectConcept/conceptID: It is recommended to identify the source for subject concept ID.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:subjectConcept/lido:term[string(normalize-space(text()))!='']" priority="5" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@xml:lang)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@xml:lang</xsl:attribute>
                     <svrl:text>Missing lang attribute in subjectConcept/term: It is recommended to specify the language of subject concetps by using the lang attribute in term.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:subjectDate" priority="4" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:displayDate[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:displayDate[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing subjectDate/displayDate: displayDate is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(lido:date) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:date) &gt; 0</xsl:attribute>
                     <svrl:text>Missing subjectDate/date: date is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:subjectDate/lido:displayDate[string(normalize-space(text()))!='']" priority="3" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@xml:lang)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@xml:lang</xsl:attribute>
                     <svrl:text>Missing lang attribute in subjectDate/displayDate: It is recommended to specify the language of the date in the lang attribute of displayDate.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:subjectPlace" priority="2" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:displayPlace[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:displayPlace[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing subjectPlace/displayPlace: displayPlace is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(lido:place) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">count(lido:place) &gt; 0</xsl:attribute>
                     <svrl:text>Missing subjectPlace/place: place is a recommended element.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not((count(lido:displayPlace[string(normalize-space(text()))]) &gt; 0) or (count(lido:place/lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">(count(lido:displayPlace[string(normalize-space(text()))]) &gt; 0) or (count(lido:place/lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0)</xsl:attribute>
                     <svrl:text>Missing subjectPlace/displayPlace and subjectPlace/place/namePlaceSet/appellationValue: It is required to include the name of the place either to displayPlace or namePlaceSet.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:titleWrap" priority="1" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(count(lido:titleSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="WARN" xml:lang="en">
                     <xsl:attribute name="test">count(lido:titleSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0</xsl:attribute>
                     <svrl:text>Missing titleSet/appellationValue: There should be at least one non-empty title.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="lido:titleSet/lido:appellationValue[string(normalize-space(text()))!='']" priority="0" mode="d79aN">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd79aN']">
            <schxslt:rule pattern="d79aN"/>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d79aN">
               <xsl:if test="not(@xml:lang)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">@xml:lang</xsl:attribute>
                     <svrl:text>Missing lang attribute in titleSet/appellationValue: It is recommended to specify the language of each title by using the lang attribute in appellationValue.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(string(normalize-space(text()))) &gt; 3)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">string-length(string(normalize-space(text()))) &gt; 3</xsl:attribute>
                     <svrl:text>Very short titleSet/appellationValue: The recommended minimum length is 3 characters.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(string-length(string(normalize-space(text()))) &lt; 180)">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl" location="{schxslt:location(.)}" role="INFO" xml:lang="en">
                     <xsl:attribute name="test">string-length(string(normalize-space(text()))) &lt; 180</xsl:attribute>
                     <svrl:text>Very long titleSet/appellationValue: The recommended maximum length is 180 characters.</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched" as="xs:string*" select="($schxslt:patterns-matched, 'd79aN')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:function name="schxslt:location" as="xs:string">
      <xsl:param name="node" as="node()"/>
      <xsl:variable name="segments" as="xs:string*">
         <xsl:for-each select="($node/ancestor-or-self::node())">
            <xsl:variable name="position">
               <xsl:number level="single"/>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test=". instance of element()">
                  <xsl:value-of select="concat('Q{', namespace-uri(.), '}', local-name(.), '[', $position, ']')"/>
               </xsl:when>
               <xsl:when test=". instance of attribute()">
                  <xsl:value-of select="concat('@Q{', namespace-uri(.), '}', local-name(.))"/>
               </xsl:when>
               <xsl:when test=". instance of processing-instruction()">
                  <xsl:value-of select="concat('processing-instruction(&#34;', name(.), '&#34;)[', $position, ']')"/>
               </xsl:when>
               <xsl:when test=". instance of comment()">
                  <xsl:value-of select="concat('comment()[', $position, ']')"/>
               </xsl:when>
               <xsl:when test=". instance of text()">
                  <xsl:value-of select="concat('text()[', $position, ']')"/>
               </xsl:when>
               <xsl:otherwise/>
            </xsl:choose>
         </xsl:for-each>
      </xsl:variable>
      <xsl:value-of select="concat('/', string-join($segments, '/'))"/>
   </xsl:function>
</xsl:transform>