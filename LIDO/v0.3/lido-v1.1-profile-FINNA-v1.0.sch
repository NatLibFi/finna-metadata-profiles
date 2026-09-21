<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:lido="http://www.lido-schema.org"
            xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xml:lang="en"
            queryBinding="xslt2">
   <sch:title>
	            Schematron Constraints for FINNA LIDO Profile</sch:title>
   <sch:ns uri="http://purl.oclc.org/dsdl/schematron" prefix="sch"/>
   <sch:ns uri="http://www.lido-schema.org" prefix="lido"/>
   <sch:ns uri="http://www.w3.org/2002/07/owl#" prefix="owl"/>
   <sch:ns uri="http://www.w3.org/2004/02/skos/core#" prefix="skos"/>
   <sch:ns uri="http://www.w3.org/1999/02/22-rdf-syntax-ns#" prefix="rdf"/>
   <sch:pattern>
      <sch:title>FINNA Schematron patterns</sch:title>
      <sch:rule context="lido:actorID[starts-with(., 'http://urn.fi/URN:NBN:fi:au:finaf:')]">
         <sch:assert test="@lido:source='finaf' or @lido:source='FINAF'" role="INFO">Missing or invalid source attribute of actorID: For KANTO actors, it is recommended to use the source attribute 'finaf'.</sch:assert>
         <sch:assert test="@lido:type='http://terminology.lido-schema.org/lido00099' or @lido:type='URI'">Missing or invalid type attribute of actorID: For KANTO actor URIs, the type attribute of actorID should be 'URI' or 'http://terminology.lido-schema.org/lido00099'.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:actorID[starts-with(., 'https://isni.org/isni/')]">
         <sch:assert test="@lido:source='isni' or @lido:source='ISNI'" role="INFO">Missing or invalid source attribute of actorID: For ISNI actors, it is recommended to use the source attribute 'isni'.</sch:assert>
         <sch:assert test="@lido:type='http://terminology.lido-schema.org/lido00099' or @lido:type='URI'">Missing or invalid type attribute of actorID: For ISNI actor URIs, the type attribute of actorID should be 'URI' or 'http://terminology.lido-schema.org/lido00099'.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:actorID[(@lido:source='finaf' or @lido:source='FINAF') and string(normalize-space(text()))!='']">
         <sch:assert test="starts-with(., 'http://urn.fi/URN:NBN:fi:au:finaf:')" role="WARN">Possibly invalid actorID: URIs for KANTO actors should begin with 'http://urn.fi/URN:NBN:fi:au:finaf:'</sch:assert>
      </sch:rule>
      <sch:rule context="lido:actorID[(@lido:source='isni' or @lido:source='ISNI') and string(normalize-space(text()))!='']">
         <sch:assert test="starts-with(., 'https://isni.org/isni/')" role="WARN">Possibly invalid actorID: URIs for ISNI actors should begin with 'https://isni.org/isni/'</sch:assert>
      </sch:rule>
      <sch:rule context="lido:actorID[string(normalize-space(text()))!='']">
         <sch:assert test="@lido:source" role="INFO">Missing source attribute of actorID: It is recommended to identify the source for actor ID.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:actorInRole[count(*) &gt; 0]">
         <sch:assert test="count(lido:actor/lido:nameActorSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing actorInRole/actor/nameActorSet/term: The name of the event actor should be described in actorInRole/actor/nameActorSet/term.</sch:assert>
         <sch:assert test="count(lido:actor/lido:actorID[string(normalize-space(text()))]) &gt; 0"
                     role="INFO">Missing actorInRole/actor/actorID: It is recommended to include the identifier of the event actor in actorInRole/actor/actorID.</sch:assert>
         <sch:assert test="count(lido:roleActor/lido:term[string(normalize-space(text()))]) &gt; 0"
                     role="INFO">Missing actorInRole/roleActor/term: It is recommended to include the role of the event actor in actorInRole/roleActor/term.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:classificationWrap">
         <sch:assert test="count(lido:classification) &gt; 0" role="INFO">Missing classifications: Classification is a recommended element.</sch:assert>
         <sch:assert test="count(lido:classification[@lido:type='language']/lido:term) &gt; 0"
                     role="INFO">Missing object language: For textual materials, it is strongly recommended to describe the language(s) of the object in a classification/term element with type 'language'.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:classification[@lido:type='language']/lido:term[normalize-space(text())!='']">
         <sch:assert test="translate(normalize-space(text()), 'bcdefghijklmnopqrstuvxyz', 'aaaaaaaaaaaaaaaaaaaaaaaa')='aaa'"
                     role="WARN">Invalid language code: If the type attribute of classification is "language", the term should contain a three-letter language code.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:classification">
         <sch:assert test="count(lido:term[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing classification/term: Classification should have a non-empty term.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:conceptID[starts-with(., 'http://www.yso.fi/onto/yso/')]">
         <sch:assert test="@lido:source='yso' or @lido:source='YSO'" role="INFO">Missing or invalid source attribute of conceptID: For YSO concepts, it is recommended to use the source attribute 'yso'.</sch:assert>
         <sch:assert test="@lido:type='http://terminology.lido-schema.org/lido00099' or @lido:type='URI'"
                     role="WARN">Missing or invalid type attribute of conceptID: For YSO concept URIs, the type attribute of conceptID should be 'http://terminology.lido-schema.org/lido00099' or 'URI'.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:conceptID[starts-with(., 'http://www.yso.fi/onto/koko/')]">
         <sch:assert test="@lido:source='koko' or @lido:source='KOKO'" role="INFO">Missing or invalid source attribute of conceptID: For KOKO concepts, it is recommended to use the source attribute 'koko'.</sch:assert>
         <sch:assert test="@lido:type='http://terminology.lido-schema.org/lido00099' or @lido:type='URI'"
                     role="WARN">Missing or invalid type attribute of conceptID: For YSO concept URIs, the type attribute of conceptID should be 'http://terminology.lido-schema.org/lido00099' or 'URI'.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:conceptID[(@lido:source='yso' or @lido:source='YSO') and string(normalize-space(text()))!='']">
         <sch:assert test="starts-with(., 'http://www.yso.fi/onto/yso/')" role="WARN">Possibly invalid conceptID: URIs for YSO concepts should begin with 'http://www.yso.fi/onto/yso/'</sch:assert>
      </sch:rule>
      <sch:rule context="lido:conceptID[(@lido:source='koko' or @lido:source='KOKO') and string(normalize-space(text()))!='']">
         <sch:assert test="starts-with(., 'http://www.yso.fi/onto/koko/')" role="WARN">Possibly invalid conceptID: URIs for KOKO concepts should begin with 'http://www.yso.fi/onto/koko/'</sch:assert>
      </sch:rule>
      <sch:rule context="lido:conceptID[string(normalize-space(text())) and not(starts-with(., 'http://www.yso.fi/onto/yso/')) and not(starts-with(., 'http://www.yso.fi/onto/koko/'))]">
         <sch:assert test="@lido:source" role="INFO">Missing source attribute of conceptID: It is recommended to identify the source for the concept ID, e.g. 'yso'.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:displayObjectMeasurements[string(normalize-space(text()))]">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in displayObjectMeasurements: It is recommended to specify the language of the measurements in the lang attribute of displayObjectMeasurements.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:earliestDate[string(normalize-space(text()))!='']">
         <sch:assert test="matches(string(normalize-space(text())), '(^((-|–)?[0-9]{4})$)|(^((-|–)?[0-9]{4})(-|–)(0[1-9]|1[0-2])$)|(^((-|–)?[0-9]{4})(-|–)(0[1-9]|1[0-2])(-|–)([0][1-9]|[12][0-9]|3[01])(T)?)')"
                     role="WARN">
							Invalid earliestDate: The date should comply to the formats [-]CCYY, [-]CCYY-MM, [-]CCYY-MM-DD or [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm].
						</sch:assert>
      </sch:rule>
      <sch:rule context="lido:eventWrap">
         <sch:assert test="count(lido:eventSet[count(*) &gt; 0]) &gt; 0" role="INFO">Missing eventSet: eventSet is a recommended element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:eventSet[count(*) &gt; 0]">
         <sch:assert test="count(lido:event) &gt; 0" role="WARN">Missing eventSet/event: Within eventSet, event is a required element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:event">
         <sch:assert test="count(lido:eventType/lido:term[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing eventType/term: An event should have a non-empty event type term.</sch:assert>
         <sch:assert test="count(lido:eventActor[count(*) &gt; 0]) &gt; 0" role="INFO">Missing event/eventActor: eventActor is a recommended element.</sch:assert>
         <sch:assert test="count(lido:eventDate[count(*) &gt; 0]) &gt; 0" role="INFO">Missing event/eventDate: eventDate is a recommended element.</sch:assert>
         <sch:assert test="count(lido:eventPlace[count(*) &gt; 0]) &gt; 0" role="INFO">Missing event/eventPlace: eventPlace is a recommended element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:eventDate[count(*) &gt; 0]">
         <sch:assert test="count(lido:displayDate[string(normalize-space(text()))]) &gt; 0"
                     role="INFO">Missing eventDate/displayDate: displayDate is a recommended element.</sch:assert>
         <sch:assert test="count(lido:date) &gt; 0" role="INFO">Missing eventDate/date: date is a recommended element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:eventDate/lido:displayDate[string(normalize-space(text()))!='']">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in eventDate/displayDate: It is recommended to specify the language of the date in the lang attribute of displayDate.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:eventMethod[count(*) &gt; 0]">
         <sch:assert test="count(lido:term[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing eventMethod/term: Within eventMethod, term is a required element.</sch:assert>
         <sch:assert test="(count(skos:Concept[@rdf:about!=''])  &gt; 0) or (count(lido:conceptID[string(normalize-space(text()))]) &gt; 0)"
                     role="INFO">Missing eventMethod/skos:Concept or eventMethod/conceptID: Adding an identifier for the concept is recommended.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:eventMethod/lido:term[string(normalize-space(text()))]">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in eventMethod/term: It is recommended to specify the language of the term in the lang attribute of term.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:eventPlace[count(*) &gt; 0]">
         <sch:assert test="count(lido:displayPlace[string(normalize-space(text()))]) &gt; 0"
                     role="INFO">Missing eventPlace/displayPlace: displayPlace is a recommended element.</sch:assert>
         <sch:assert test="count(lido:place) &gt; 0" role="INFO">Missing eventPlace/place: place is a recommended element.</sch:assert>
         <sch:assert test="(count(lido:displayPlace[string(normalize-space(text()))]) &gt; 0) or (count(lido:place/lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0)"
                     role="WARN">Missing eventPlace/displayPlace and eventPlace/place/namePlaceSet/appellationValue: The name of the place should be included either to displayPlace or namePlaceSet.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:extentMeasurements[count(*) &gt; 0]">
         <sch:assert test="count(lido:term[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing extentMeasurements/term: Within extentMeasurements, term is a required element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:extentMeasurements/lido:term[string(normalize-space(text()))]">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in extentMeasurements/term: It is recommended to specify the language of the term in the lang attribute of term.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:inscriptionDescription[count(*) &gt; 0]">
         <sch:assert test="count(lido:descriptiveNoteValue[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing inscriptionDescription/descriptiveNoteValue: Within inscriptionDescription, descriptiveNoteValue is a required element.</sch:assert>
         <sch:assert test="not(@lido:type) or @lido:type='technique' or @lido:type='tekniikka' or @lido:type='location' or @lido:type='sijainti' or @lido:type='description' or @lido:type='kuvailu' or @lido:type='type' or @lido:type='tyyppi' or @lido:type='interpretation' or @lido:type='tulkinta'"
                     role="WARN">Invalid type attribute of inscriptionDescription: If type attribute is in use, it should be one from "technique", "location", "description", "type" or "interpretation".</sch:assert>
      </sch:rule>
      <sch:rule context="lido:inscriptionDescription/lido:descriptiveNoteValue[string(normalize-space(text()))!='']">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in inscriptionDescription/descriptiveNoteValue: It is recommended to specify the language of the description in the lang attribute of descriptiveNoteValue.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:latestDate[string(normalize-space(text()))!='']">
         <sch:assert test="matches(string(normalize-space(text())), '(^((-|–)?[0-9]{4})$)|(^((-|–)?[0-9]{4})(-|–)(0[1-9]|1[0-2])$)|(^((-|–)?[0-9]{4})(-|–)(0[1-9]|1[0-2])(-|–)([0][1-9]|[12][0-9]|3[01])(T)?)')"
                     role="WARN">
							Invalid latestDate: The date should comply to the formats [-]CCYY, [-]CCYY-MM, [-]CCYY-MM-DD or [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm].
						</sch:assert>
      </sch:rule>
      <sch:rule context="lido:lido">
         <sch:assert test="lido:lidoRecID[string(normalize-space(text()))]" role="WARN">Missing lidoRecID: There should be a non-empty record identifier.</sch:assert>
         <sch:assert test="count(lido:lidoRecID[string(normalize-space(text()))]) &lt; 2"
                     role="WARN">lidoRecID: There should be exactly one record identifier.</sch:assert>
         <sch:assert test="lido:applicationProfile[string(normalize-space(text()))]"
                     role="INFO">Missing applicationProfile: applicationProfile is a recommended element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:linkResource[string(normalize-space(text()))!='']">
         <sch:assert test="@lido:formatResource" role="WARN">Missing formatResource attribute of linkResource: It is required to specify the format of the resource.</sch:assert>
         <sch:assert test="starts-with(normalize-space(text()), 'http')" role="WARN">Invalid linkResource: There must be a valid http/https link in linkResource.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:measurementType">
         <sch:assert test="count(lido:term[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing measurementType/term: Within measurementType, term is a required element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:measurementType/lido:term[string(normalize-space(text()))]">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in measurementType/term: It is recommended to specify the language of the term in the lang attribute of term.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:measurementUnit">
         <sch:assert test="count(lido:term[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing measurementUnit/term: Within measurementUnit, term is a required element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:measurementUnit/lido:term[string(normalize-space(text()))]">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in measurementUnit/term: It is recommended to specify the language of the term in the lang attribute of term.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))!='']">
         <sch:assert test="@lido:label" role="INFO">Missing namePlaceSet/appellationValue[@label]: It is recommended to specify the type of place in the label attribute of appellationValue.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:objectDescriptionWrap">
         <sch:assert test="count(lido:objectDescriptionSet) &gt; 0" role="INFO">Missing objectescriptionSet: objectDescriptionSet is a recommended element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:objectDescriptionSet">
         <sch:assert test="count(lido:descriptiveNoteValue[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing objectDescriptionSet/descriptiveNoteValue: Within objectDescriptionSet, descriptiveNoteValue is a required element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:objectDescriptionSet/lido:descriptiveNoteValue[string(normalize-space(text()))!='']">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in objectDescriptionSet/descriptiveNoteValue: It is recommended to specify the language of the descriptive note in the lang attribute of descriptiveNoteValue.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:objectMeasurementsSet[count(*) &gt; 0]">
         <sch:assert test="count(lido:displayObjectMeasurements[string(normalize-space(text()))]) &gt; 0"
                     role="INFO">Missing objectMeasurementsSet/displayObjectMeasurements: displayObjectMeasurements is a recommended element.</sch:assert>
         <sch:assert test="count(lido:objectMeasurements/lido:measurementsSet) &gt; 0"
                     role="INFO">Missing objectMeasurementsSet/objectMeasurements/measurementsSet: It is recommended to include structured measurements in measurementsSet element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:objectNote">
         <sch:assert test="not(@lido:type) or @lido:type='objectWorkType'" role="WARN">Invalid type attribute of objectNote: If type attribute is used for objectNote, it must be "objectWorkType".</sch:assert>
      </sch:rule>
      <sch:rule context="lido:objectType[count(*) &gt; 0]">
         <sch:assert test="count(lido:term[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing objectType/term: Within objectType, term is a required element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:objectWorkTypeWrap">
         <sch:assert test="count(lido:objectWorkType/lido:term[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing objectWorkType/term: At least one object work type term is required.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:partOfPlace[count(*) &gt; 0]">
         <sch:assert test="count(lido:placeID[string(normalize-space(text()))]) &gt; 0"
                     role="INFO">Missing partOfPlace/placeID: Adding an identifier for the place is recommended.</sch:assert>
         <sch:assert test="count(lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0"
                     role="INFO">Missing partOfPlace/namePlaceSet/appellationValue: Describing the name of the place in namePlaceSet is recommended.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:place">
         <sch:assert test="count(lido:placeID[string(normalize-space(text()))]) &gt; 0"
                     role="INFO">Missing place/placeID: Adding an identifier for the place is recommended.</sch:assert>
         <sch:assert test="count(lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0"
                     role="INFO">Missing place/namePlaceSet/appellationValue: Describing the name of the place in namePlaceSet is recommended.</sch:assert>
         <sch:assert test="count(lido:partOfPlace[count(*) &gt; 0]) &gt; 0" role="INFO">Missing partOfPlace: It is recommended to include at least one broader context for the place in partOfPlace element.</sch:assert>
         <sch:assert test="count(lido:gml[count(*) &gt; 0]) &gt; 0" role="INFO">Missing place/gml: Including the coordinates of the place in gml is recommended.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:placeID[starts-with(., 'http://www.yso.fi/onto/yso/')]">
         <sch:assert test="@lido:source='yso' or @lido:source='YSO'" role="INFO">Missing or invalid source attribute of placeID: For YSO places, it is recommended to use the source attribute 'yso'.</sch:assert>
         <sch:assert test="@lido:type='http://terminology.lido-schema.org/lido00099' or @lido:type='URI'"
                     role="WARN">Missing or invalid type attribute of placeID: For YSO place URIs, the type attribute of placeID should be 'URI' or 'http://terminology.lido-schema.org/lido00099'.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:placeID[(@lido:source='yso' or @lido:source='YSO') and string(normalize-space(text()))!='']">
         <sch:assert test="starts-with(., 'http://www.yso.fi/onto/yso/')" role="WARN">Possibly invalid placeID: URIs for YSO places should begin with 'http://www.yso.fi/onto/yso/'</sch:assert>
      </sch:rule>
      <sch:rule context="lido:placeID[(string(normalize-space(text()))!='')]">
         <sch:assert test="@lido:source" role="INFO">Missing source attribute of placeID: It is recommended to identify the source for place ID.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:qualifierMeasurements[count(*) &gt; 0]">
         <sch:assert test="count(lido:term[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing qualifierMeasurements/term: Within qualifierMeasurements, term is a required element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:qualifierMeasurements/lido:term[string(normalize-space(text()))!='']">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in qualifierMeasurements/term: It is recommended to specify the language of the term in the lang attribute of term.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:recordWrap">
         <sch:assert test="(count(lido:recordRights/lido:rightsType/skos:Concept[@rdf:about!=''])  &gt; 0) or (count(lido:recordRights/lido:rightsType/lido:conceptID[string(normalize-space(text()))]) &gt; 0)"
                     role="WARN">Missing recordRights/rightsType/skos:Concept or recordRights/rightsType/conceptID: It is required to specify the license of the LIDO record.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:recordSource">
         <sch:assert test="count(lido:legalBodyName/lido:appellationValue[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing recordSource/legalBodyName/appellationValue: The name of the institution is required.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:relatedWork[count(*) &gt; 0]">
         <sch:assert test="count(lido:displayObject[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing relatedWork/displayObject: Within relatedWork, displayObject is a required element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:relatedWork/lido:displayObject[string(normalize-space(text()))!='']">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in relatedWork/displayObject: It is recommended to specify the language in the lang attribute of displayObject.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:relatedWork/lido:object[(lido:objectType/lido:term='collection' or lido:objectType/lido:term='parent') and lido:objectID[string(normalize-space(text()))]]">
         <sch:assert test="count(lido:objectNote[@lido:type='objectWorkType' and string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing objectNote: If there is a non-empty object/objectID and object/objectType/term is "collection" or "parent", there must be a non-empty object/objectNote with type attribute "objectWorkType".</sch:assert>
      </sch:rule>
      <sch:rule context="lido:relatedWork/lido:object[lido:objectType/lido:term='parent']">
         <sch:assert test="count(lido:objectID[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing objectID: If the object/objectType/term is "parent", there must be a non-empty object/objectID.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:relatedWorkRelType">
         <sch:assert test="count(lido:term[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing relatedWorkRelType/term: A related work should have a non-empty term for the relation type.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:relatedWorksWrap[lido:relatedWorkSet/lido:relatedWork/lido:object/lido:objectType/lido:term='parent']">
         <sch:assert test="count(lido:relatedWorkSet[lido:relatedWork/lido:object/lido:objectType/lido:term='collection']) &gt; 0"
                     role="WARN">Missing relatedWorkSet element for collection record: If there is a relatedWorkSet element for parent record (with relatedWork/object/objectType/term "parent"), there must also ve a relatedWorkSet element for collection record (with relatedWork/object/objectType/term "collection").</sch:assert>
      </sch:rule>
      <sch:rule context="lido:repositoryWrap">
         <sch:assert test="count(lido:repositorySet/lido:workID[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing repositorySet/workID: There should be at least one non-empty workID element including an identification number for the object.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:resourceDescription[string(normalize-space(text()))!='']">
         <sch:assert test="@lido:type" role="INFO">Missing type attribute of resourceDescription: It is recommended to specify the type of resource description.</sch:assert>
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute of resourceDescription: It is recommended to specify the language of resource description.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:resourceRepresentation[not(@lido:type)]">
         <sch:assert test="@lido:type" role="WARN">Missing type attribute of resourceRepresentation: It is required to specify the type of resource representation.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:resourceRepresentation[@lido:type!='image_thumb' and ./lido:linkResource[string(normalize-space(text()))]]">
         <sch:assert test="count(lido:resourceMeasurementsSet) &gt; 0" role="INFO">Missing resourceMeasurementsSet: It is recommended to specify the file size of a downloadable resource in resourceMeasurementsSet.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:rightsResource[lido:rightsType/lido:conceptID[contains(string(normalize-space(text())), 'InC')]]">
         <sch:assert test="count(lido:rightsHolder/lido:legalBodyName/lido:appellationValue[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing rightsResource/rightsHolder/legalBodyName/appellationValue: For resources with rights type https://rightsstatements.org/vocab/InC/1.0/, the name of the rights holder should be specified.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:rightsResource[lido:rightsType/skos:Concept[contains(@rdf:about, 'InC')]]">
         <sch:assert test="count(lido:rightsHolder/lido:legalBodyName/lido:appellationValue[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing rightsResource/rightsHolder/legalBodyName/appellationValue: For resources with rights type https://rightsstatements.org/vocab/InC/1.0/, the name of the rights holder should be specified.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:rightsResource">
         <sch:assert test="(count(lido:rightsType/skos:Concept[@rdf:about!=''])  &gt; 0) or (count(lido:rightsType/lido:conceptID[string(normalize-space(text()))]) &gt; 0)"
                     role="WARN">Missing rightsResource/rightsType/skos:Concept or rightsType/conceptID: It is required to specify the rights statement or license of the resource representation.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:rightsResource/lido:creditLine[string(normalize-space(text()))]">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in rightsResource/creditline: It is recommended to specify the language in the lang attribute of creditLine.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:subjectActor[count(*) &gt; 0]">
         <sch:assert test="count(lido:actor/lido:nameActorSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing subjectActor/actor/nameActorSet/term: IThe name of the subject actor should be included in actor/nameActorSet/term.</sch:assert>
         <sch:assert test="count(lido:actor/lido:actorID[string(normalize-space(text()))]) &gt; 0"
                     role="INFO">Missing subjectActor/actor/actorID: It is recommended to include the identifier of the subject actor in actor/actorID.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:subjectWrap">
         <sch:assert test="(count(lido:subjectSet/lido:subject/lido:subjectConcept[count(*) &gt; 0]) &gt; 0)"
                     role="INFO">Missing subjectConcept: subjectConcept is a recommended element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:subjectConcept[count(*) &gt; 0]">
         <sch:assert test="count(lido:term[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing subjectConcept/term: Within subjectConcept, term is a required element.</sch:assert>
         <sch:assert test="(count(skos:Concept[@rdf:about!=''])  &gt; 0) or (count(lido:conceptID[string(normalize-space(text()))]) &gt; 0)"
                     role="INFO">Missing subjectConcept/skos:Concept or subjectConcept/conceptID: Adding an identifier for the subject concept is recommended.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:subjectConcept/lido:term[string(normalize-space(text()))!='']">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in subjectConcept/term: It is recommended to specify the language of subject concetps by using the lang attribute in term.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:subjectDate[count(*) &gt; 0]">
         <sch:assert test="count(lido:displayDate[string(normalize-space(text()))]) &gt; 0"
                     role="INFO">Missing subjectDate/displayDate: displayDate is a recommended element.</sch:assert>
         <sch:assert test="count(lido:date) &gt; 0" role="INFO">Missing subjectDate/date: date is a recommended element.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:subjectDate/lido:displayDate[string(normalize-space(text()))!='']">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in subjectDate/displayDate: It is recommended to specify the language of the date in the lang attribute of displayDate.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:subjectPlace[count(*) &gt; 0]">
         <sch:assert test="count(lido:displayPlace[string(normalize-space(text()))]) &gt; 0"
                     role="INFO">Missing subjectPlace/displayPlace: displayPlace is a recommended element.</sch:assert>
         <sch:assert test="count(lido:place) &gt; 0" role="INFO">Missing subjectPlace/place: place is a recommended element.</sch:assert>
         <sch:assert test="(count(lido:displayPlace[string(normalize-space(text()))]) &gt; 0) or (count(lido:place/lido:namePlaceSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0)"
                     role="WARN">Missing subjectPlace/displayPlace and subjectPlace/place/namePlaceSet/appellationValue: The name of the place should be included either to displayPlace or namePlaceSet.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:termMaterialsTech[count(*) &gt; 0]">
         <sch:assert test="@lido:type" role="INFO">Missing type attribute in termMaterialsTech: It is recommended to specify the type of the term (e.g. "material", "technique" or "color name").</sch:assert>
         <sch:assert test="count(lido:term[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing termMaterialsTech/term: Within termMaterialsTech, term is a required element.</sch:assert>
         <sch:assert test="(count(skos:Concept[@rdf:about!=''])  &gt; 0) or (count(lido:conceptID[string(normalize-space(text()))]) &gt; 0)"
                     role="INFO">Missing termMaterialsTech/skos:Concept or termMaterialsTech/conceptID: Adding an identifier for the term is recommended.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:termMaterialsTech/lido:term[string(normalize-space(text()))]">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in termMaterialsTech/term: It is recommended to specify the language of the term in the lang attribute of term.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:titleWrap">
         <sch:assert test="count(lido:titleSet/lido:appellationValue[string(normalize-space(text()))]) &gt; 0"
                     role="WARN">Missing titleSet/appellationValue: There should be at least one non-empty title.</sch:assert>
      </sch:rule>
      <sch:rule context="lido:titleSet/lido:appellationVtalue[string(normalize-space(text()))!='']">
         <sch:assert test="@xml:lang" role="INFO">Missing lang attribute in titleSet/appellationValue: It is recommended to specify the languaßge of each title by using the lang attribute in appellationValue.</sch:assert>
         <sch:assert test="string-length(string(normalize-space(text()))) &gt; 3" role="INFO">Very short titleSet/appellationValue: The recommended minimum length is 3 characters.</sch:assert>
         <sch:assert test="string-length(string(normalize-space(text()))) &lt; 180" role="INFO">Very long titleSet/appellationValue: The recommended maximum length is 180 characters.</sch:assert>
      </sch:rule>
   </sch:pattern>
</sch:schema>
