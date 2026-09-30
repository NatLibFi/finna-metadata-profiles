# FINNA LIDO Profile

An Application Profile for LIDO v1.1

**This Version:** 1.0

**Publication date:** 21 September 2026

**Authors:** FINNA / National Library of Finland

**Publisher:** National Library of Finland

**Licence:** [Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)

---

## Version history

<details>
<summary>0.1</summary>

Public Beta Initial release

</details>

<details>
<summary>0.2</summary>

Public Beta Version 0.2 includes changes to elements lido:repositorySet, lido:workID, lido:actorID, lido:placeID and lido:subjectConcept. Also, there are small improvements to Schematron patterns.

- Element lido:workID is no longer declared mandatory within every lido:repositorySet. Instead, element lido:repositorySet is now declared mandatory and there is a new Schematron rule to check that there is at least one non-empty lido:repositorySet/lido:workID element.
- Attribute liso:source is no longer declared mandatory in lido:actorID, lido:placeID or lido:subjectConcept/lido:conceptID. Instead, the attribute is recommended.
- If a LIDO element is empty, Schematron patterns will no longer check the use of attributes or contents of the element.
- Schematron patterns for lido:inscriptionDescription also allow Finnish versions of the recommended attributes.

</details>

<details>
<summary>1.0</summary>

Live release Version 1.0 includes following additions and changes:

- Element lido:term is now required within lido:eventMethod, lido:extentMeasurements, lido:measurementType, lido:measurementUnit, lido:termMaterialsTech and liso:qualifierMeasurements.
- Element lido:actorInRole is now required within lido:eventActor. Schematron patterns check that there is a non-empty lido:actor/lido:nameActorSet/lido:appellationValue.
- Element lido:actor is now required within lido:subjectActor. Schematron patterns check that there is a non-empty lido:nameActorSet/lido:appellationValue.
- Element lido:applicationProfile is now a recommended element.
- Element skos:Concept is now preferred over lido:conceptID and recommended within lido:eventMethod, lido:subjectConcept and lido:termMaterialsTech.
- Element lido:actorID is now recommended within lido:eventActor/lido:actorInRole/lido:actor and lido:subjectActor/lido:actor.
- Element lido:roleActor is now recommended within lido:actorInRole.
- Elements lido:displayObjectMeasurements and lido:objectMeasurements/lido:measurementsSet are now recommended within lido:objectMeasurementsSet
- Attribute lido:type is now recommended in lido:termMaterialsTech.
- Attribute xml:lang is now recommended in lido:eventMethod/lido:term, lido:extentMeasurements/lido:term, lido:measurementType/lido:term, lido:measurementUnit/lido:term, lido:displayObjectMeasurements, lido:qualifierMeasurements and lido:termMaterialsTech.
- The Terminology for Type of Inscription Description now contains also values "type" and "interpretation".
- Documentation now includes more LIDO examples.

</details>

---

# FINNA LIDO profile version 1.0

## Background

The FINNA LIDO profile is designed for Finnish institutions and system providers [aiming to publish their data in Finna](https://www.kiwi.fi/x/6wkXAw) using the [LIDO (Lightweight Information Describing Objects) format](http://lido-schema.org/schema/v1.1/lido-v1.1.html).

Finna.fi is a search service that brings together materials from hundreds of Finnish cultural heritage institutions in one easy search. In addition, Finna offers tools for institutions to build their own web service on the Finna platform. For enabling data reuse, Finna maintains APIs and the National Europeana Aggregation service. Finna was launched in 2013 and is maintained by The National Library of Finland and funded by The Ministry of Education and Culture.

In the beginning of 2025, there are over 100 institutions and over 10 different collection management systems providing heterogenous data to Finna in LIDO format. Many records are not fully compliant with the latest version of the LIDO schema, and normalization and complex mapping rules are needed to make all data searchable and displayable.

The FINNA LIDO profile contains a structured documentation of Finna's requirements and recommendations for LIDO records. The profile also offers tools for validating LIDO records against the requirements and recommendations. The purpose of the profile is to improve the consistency of LIDO records and to raise the quality of the metadata available in Finna.fi. By using this profile, institutions can make sure that their data complies with the technical requirements and the quality standards of the service.

When defining requirements and recommendations, we have used the recommendations of the [LIDO Primer](https://lido-schema.org/documents/primer/latest/lido-primer.html) and the [Minimum Record Recommendation for Museums and Collections](https://deutsche-digitale-bibliothek.atlassian.net/wiki/spaces/DFD/pages/48103806/English+Translation+Minimum+Record+Recommendation+for+Museums+and+Collections+MDS+v1.1) as a starting point, while also taking into account the technical conditions of the Finna service and the cataloguing practices in Finnish museums. Since the National Library of Finland is an accredited aggregator for Europeana and maintains a mapping from LIDO to [Europeana Data Model](https://europeana.atlassian.net/wiki/spaces/EF/pages/987791389/EDM+-+Mapping+guidelines) (EDM), we have also taken into account the recommendations and requirements of Europeana.

## Acknowledgments

Special thanks are due to to

- The [Generic LIDO Application Profile Workflow](https://gitlab.gwdg.de/lido/profiles) for providing the tools used to create the profile
- The [LIDO development GitLab repository](https://gitlab.gwdg.de/lido/development/-/tree/develop) for providing materials and example validation workflows
- The LIDO Working Group for useful advice on the application of LIDO
- The Finnish Heritage Agency, especially Helena Ojala and Terhi Aho, for collaboration on the application of LIDO and on creating and maintaining the LIDO Format Template
- The TAKOTech working group of The Museum Documentation and Collections Collaboration Network TAKO ry for collaboration on the Finnish translations of the LIDO Terminology

## Resources

The latest version of the FINNA LIDO profile is available at the finna-metadata-profiles GitHub repository: [https://github.com/NatLibFi/finna-metadata-profiles](https://github.com/NatLibFi/finna-metadata-profiles).

The profile includes following resources:

- An HTML document describing the contents of the profile in human-readable format.
- An XSD file (XML Schema Definition) that defines the application profile and can be used to validate LIDO records with XML validation tools. XSD validation can only check the presence or the order of LIDO elements, not their content.
- An SCH file containing the Schematron rules defined in the application profile. Schematron rules include requirements and recommendations for the attributes and contents of LIDO elements.
- An XSL file, generated from the SCH file, that can be used to validate a LIDO record against the Schematron rules.

Instructions for using the resources for validating LIDO records are included in the GitHub repository. [The Preview Tool](https://www.kiwi.fi/x/3IFTBw) of Finna.fi is the easiest way to validate LIDO records against the latest version of the FINNA LIDO profile.

## Documenting changes to the schema

This section contains information about the mandatory elements, recommended elements and Schematron rules included in the FINNA LIDO profile. All LIDO elements containing changes to the LIDO 1.1 schema are documented in alphabetical order in the section All changes to the schema. The documentation contains following information:

- **Description**: The description of the element and a link to the LIDO 1.1 schema for further instructions and comparisons.
- **Technical information** containing details about the structure and use of the element:
  - **Contained by**: LIDO elements that may contain the current element.
  - **May contain**: LIDO elements that the current element may contain; elements are declared either optional, optional - recommended or required.
  - **Attributes**: LIDO attributes that the current element may use; attributes are declared either optional or required.
  - **Cardinality**: The number of times the current element may be repeated within the containing element.
  - **Recording notes**: Instructions how to use the element.
  - **Divergence from LIDO**: Specifying how the requirements differ from the LIDO 1.1 schema.
  - **Additional Schematron rules**: A list of [Schematron rules](#Schematron-rules) included in the FINNA LIDO profile regarding the current element.
- **Examples**: LIDO XML examples of how to use the element.

### Mandatory elements

There are only few mandatory elements in the LIDO 1.1 schema. The FINNA LIDO profile contains additional requirements for the mandatory elements and declares two more elements mandatory.

As the content type of an object described by a certain record defines what metadata is most important, only LIDO elements that are essential to all content types are declared mandatory by the FINNA LIDO profile. However, since Finna's search functionalities and the needs of end users require rich metadata, LIDO records containing only the mandatory elements are of low usability. Therefore, we strongly recommend providing more information than just the mandatory elements.

Mandatory elements in the LIDO 1.1 schema are:

- [lido:lidoRecID](#lidoRecID)  
  - Also, the FINNA LIDO profile requires that there is exactly 1 [lido:lidoRecID](#lidoRecID) element.
- [lido:objectWorkType](#objectWorkType)  
  - Also, the FINNA LIDO profile requires that the lido:term element contained by lido:objectWorkType is not empty.
- [lido:titleSet](#titleSet)  
  - Also, the FINNA LIDO profile requires that there is at least one [lido:titleSet](#titleSet) containing a lido:appellationValue element that is not empty.
- lido:recordID
- lido:recordType
- [lido:recordSource](#recordSource)  
  - Also, the FINNA LIDO profile requires that [lido:recordSource](#recordSource) contains at least one lido:legalBodyName element with a lido:appellationValue element that is not empty.

Further elements declared mandatory by the FINNA LIDO profile are:

- [lido:repositorySet](#repositorySet)  
  - Also, the FINNA LIDO profile requires that there is at least one [lido:repositorySet](#repositorySet) containing a lido:workID element that is not empty.
- [lido:recordRights](#recordRights)

In addition to elements that are always mandatory, there are elements that are mandatory when the super-element (parent-element in XML) is used. In LIDO 1.1 schema, these are:

- lido:actor is mandatory within [lido:actorInRole](#actorInRole)
- lido:appellationValue is mandatory within:
  - lido:eventName
  - lido:legalBodyName
  - lido:nameActorSet
  - lido:namePlaceSet
  - lido:objectName
  - [lido:titleSet](#titleSet)
- [lido:eventType](#eventType) is mandatory within [lido:event](#event)
- [lido:linkResource](#linkResource) is mandatory within [lido:resourceRepresentation](#resourceRepresentation)
- [lido:measurementType](#measurementType) is mandatory within:
  - lido:measurementsSet
  - lido:resourceMeasurementsSet
- [lido:measurementUnit](#measurementUnit) is mandatory within:
  - lido:measurementsSet
  - lido:resourceMeasurementsSet
- lido:measurementValue is mandatory within:
  - lido:measurementsSet
  - lido:resourceMeasurementsSet
- lido:nameActorSet is mandatory within lido:actor

Some elements may also become mandatory if a sub-element (child-element in XML) is used. A full list can be found in the [LIDO Primer](https://lido-schema.org/documents/primer/latest/lido-primer.html#mandatory-elements).

The FINNA LIDO profile specifies these additional rules:

- lido:actor is mandatory within [lido:subjectActor](#subjectActor)
- [lido:actorInRole](#actorInRole) is mandatory within [lido:eventActor](#eventActor)
- lido:descriptiveNoteValue is mandatory within:
  - [lido:inscriptionDescription](#inscriptionDescription)
  - [lido:objectDescriptionSet](#objectDescriptionSet)
- lido:displayObject is mandatory within [lido:relatedWork](#relatedWork)
- [lido:event](#event) is mandatory within [lido:eventSet](#eventSet)
- lido:legalBodyName is mandatory within [lido:recordSource](#recordSource)
- [lido:relatedWork](#relatedWork) is mandatory within [lido:relatedWorkSet](#relatedWorkSet)
- [lido:relatedWorkRelType](#relatedWorkRelType) is mandatory within [lido:relatedWorkSet](#relatedWorkSet)
- lido:rightsType is mandatory within:
  - [lido:recordRights](#recordRights)
  - [lido:rightsResource](#rightsResource)
- lido:term is mandatory within:
  - [lido:classification](#classification)
  - [lido:extentMeasurements](#extentMeasurements)
  - [lido:eventMethod](#eventMethod)
  - [lido:eventType](#eventType)
  - [lido:measurementType](#measurementType)
  - [lido:measurementUnit](#measurementUnit)
  - [lido:objectType](#objectType)
  - [lido:objectWorkType](#objectWorkType)
  - [lido:qualifierMeasurements](#qualifierMeasurements)
  - [lido:relatedWorkRelType](#relatedWorkRelType)
  - [lido:termMaterialsTech](#termMaterialsTech)

### Recommended elements

In addition to the mandatory elements, it is advisable to include all LIDO fields that contain relevant information. The most relevant fields may vary depending on the item and its content type, so the recommendations given here only provide general guidelines for all different content types.

LIDO elements recommended by the FINNA LIDO profile are:

- [lido:applicationProfile](#applicationProfile)
- [lido:classification](#classification)
- [lido:eventSet](#eventSet)
- [lido:objectDescriptionSet](#objectDescriptionSet)
- [lido:subjectConcept](#subjectConcept)

Furthermore, the following LIDO elements are recommended by the FINNA LIDO profile when the super-element is used:

- [lido:actorID](#actorID) is recommended within [lido:actorInRole](#actorInRole)/lido:actor and [lido:subjectActor](#subjectActor)/lido:actor.
- skos:Concept or [lido:conceptID](#conceptID) is recommended within [lido:eventMethod](#eventMethod), lido:subjectConcept and [lido:termMaterialsTech](#termMaterialsTech)
- lido:displayObjectMeasurements is recommended within [lido:objectMeasurementsSet](#objectMeasurementsSet)
- lido:displayPlace is recommended within [lido:eventPlace](#eventPlace) and [lido:subjectPlace](#subjectPlace)
- [lido:eventActor](#eventActor) is recommended within [lido:event](#event)
- [lido:eventDate](#eventDate) is recommended within [lido:event](#event)
- [lido:eventPlace](#eventPlace) is recommended within [lido:event](#event)
- lido:gml is recommended within [lido:place](#place)
- lido:namePlaceSet is recommended within [lido:place](#place)
- lido:objectID is recommended within [lido:relatedWork](#relatedWork)/lido:object
- [lido:objectMeasurements](#objectMeasurements) is recommended within [lido:objectMeasurementsSet](#objectMeasurementsSet)
- [lido:partOfPlace](#partOfPlace) is recommended within [lido:place](#place)
- [lido:place](#place) is recommended within [lido:eventPlace](#eventPlace) and [lido:subjectPlace](#subjectPlace)
- [lido:placeID](#placeID) is recommended within [lido:place](#place)
- lido:resourceMeasurementsSet is recommended within [lido:resourceRepresentation](#resourceRepresentation)
- lido:roleActor is recommended within [lido:actorInRole](#actorInRole)

### Schematron rules

In addition to declaring elements mandatory or recommended, the FINNA LIDO profile contains requirements and recommendations for the attributes and the contents of some LIDO elements. These rules are listed in the section All changes to the schema under the elements affected by the rules. Rules are also included in machine-readable format in the XSD, SCH and XSL files included in the FINNA LIDO profile.

The Schematron rules are divided in two categories by their severity level:

- Severity level "warning" means that the rule should be followed to pass validation.
- Severity level "information" means that the rule contains recommendations. Following the recommendations helps to improve the richness and the quality of the data but is not necessary to pass validation.

It is possible to validate records only against the Schematron rules of a chosen severity level, allowing distinction between actual errors and data improvement suggestions. Instructions for Schematron validations are included in the GitHub repository containing the up-to-date version of the FINNA LIDO profile.

---

# Terminology recommendations

## Linked open vocabularies and authority files

It is recommended to refer to linked open vocabularies and authority files, whenever a suitable vocabulary exists. Linked open vocabularies and authority files are used e.g. to enrich data with language versions or variant names.

The [LIDO Terminology Recommendation](http://lido-schema.org/documents/terminology-recommendation.html) includes recommendations for vocabularies to be used with specific LIDO elements and attributes. We encourage following the recommendations especially for elements and attributes with an existing suitable term in the [LIDO Terminology](http://terminology-view.lido-schema.org/). Finnish labels have been integrated to the LIDO Terminology in 2026.

Other vocabularies supported by Finna include:

- [YSO – General Finnish Ontology](http://www.yso.fi/onto/yso/) and [KOKO Ontology](http://www.yso.fi/onto/koko/) for:
  - subject concepts ([lido:subjectConcept](#subjectConcept))
  - event methods ([lido:eventMethod](#eventMethod))
  - materials/techniques ([lido:termMaterialsTech](#termMaterialsTech))
  - measurement type ([lido:measurementType](#measurementType))
- [the Metadata thesaurus](http://urn.fi/URN:NBN:fi:au:mts:) for:
  - object/work types ([lido:objectWorkType](#objectWorkType))
  - measurement type ([lido:measurementType](#measurementType))
- [YSO places](http://www.yso.fi/onto/yso/places) for place identifiers ([lido:placeID](#placeID)) of:
  - event places ([lido:eventPlace](#eventPlace))
  - subject places ([lido:subjectPlace](#subjectPlace))
  - repository locations ([lido:repositoryLocation](https://lido-schema.org/schema/v1.1/lido-v1.1.html#repositoryLocation))
- [KANTO – National Agent Data](http://urn.fi/URN:NBN:fi:au:finaf:) and [ISNI](https://isni.org/) for actor identifiers ([lido:actorID](#actorID)) of:
  - event actors ([lido:eventActor](#eventActor))
  - subject actors ([lido:subjectActor](#subjectActor))

References to linked open vocabularies or authority files can be included in LIDO elements of [lido:identifierComplexType](http://lido-schema.org/schema/v1.1/lido-v1.1.html#identifierComplexType), e.g. [lido:actorID](#actorID), [lido:placeID](#placeID) and [lido:conceptID](#conceptID). It is recommended to specify the source of the identifier (e.g. "yso") in the [lido:source](http://lido-schema.org/schema/v1.1/lido-v1.1.html#source) attribute. LIDO schema 1.1 recommends to use [skos:Concept](https://www.w3.org/2009/08/skos-reference/skos.html#Concept) instead of [lido:conceptID](#conceptID) when referring to linked open vocabularies. Although Finna supports both, skos:Concept is thus preferred. Note that whether using [lido:conceptID](#conceptID) or skos:Concept for the URI of the concept, the FINNA LIDO profile recommends (and in some contexts requires) to include the label of the concept in lido:term.

## FINNA terminologies and extensions to LIDO terminologies

LIDO schema allows some terminologies to be determined by application profiles. Terminologies defined by the FINNA LIDO profile are described in this section.

### Terminology for Object Type

When referring to hierarchical entities, the FINNA LIDO profile requires the object type ([lido:objectType](#objectType)) within [relatedWorkSet](#relatedWorkSet)/[relatedWork](#relatedWork)/object. The allowed terms are:

- [collection](http://terminology.lido-schema.org/lido01053) for the collection (the record at the top of the hierarchical structure).
- **parent** for the closest parent record in a hierarchical structure, e.g. the series or sub collection the object belongs to.

### Terminology for Type of Inscription Description

For the type of inscription description ([lido:inscriptionDescription](#inscriptionDescription)), following values are allowed:

- **technique** for the technique used to make the inscription (e.g. carving or embroidery)
- **location** for the location of the inscription (e.g. the bottom of the vase)
- **description** for the general description of the inscription (e.g. a lion head inside a circle)
- **type** for the general type of the inscription (e.g. a signature)
- **interpretation** for the interpretation of the inscription (e.g. old inventory number)

### Terminology for Type of Object Description Set

For the type of object description set ([lido:objectDescriptionSet](#objectDescriptionSet)), it is recommended to use following values:

- **description** for descriptive information about the object
- **introduction** for more general descriptions of the object in its wider context (e.g. texts written for exhibitions or blogs)

### Terminology for Type of Object Note

For the type of object note ([lido:objectNote](#objectNote)), there is currently only one allowed value:

- **objectWorkType** for the type of the object, usually more specifc than the type in [lido:objectType](#objectType)

### Terminology for Type of Resource Description

For the type of resource description ([lido:resourceDescription](#resourceDescription)), it is recommended to use following values:

- **description** for the generic description of the resource
- **displayLink** for the name of the resource (e.g. file name, used as link text for the resource in Finna)
- **colour content** for the colour content of the resource (e.g. black and white)

### Extended terminology for Type of Resource Representation

For the type of resource representations ([lido:resourceRepresentation](#resourceRepresentation)), it is recommended to use the [LIDO Terminology for Type of Resource Representation](http://lido-schema.org/documents/terminology-recommendation.html#resourceRepresentation_type). Because of the need to provide images in several different sizes and file formats for different purposes, Finna also supports following type attributes:

- **image_thumb** for small thumbnail images
- **image_large** for large display images
- **image_master** for full resolution display images
- **image_original** for full resolution download-only images like tiff files

## Other controlled terminologies and formats

The FINNA LIDO profile also recommends the use of following controlled terminologies and controlled formats:

- [IANA media types](http://www.iana.org/assignments/media-types/) for the media formats of digital resources (lido:formatResource attribute of [lido:linkResource](#linkResource)).
- [Creative Common Licenses](https://creativecommons.org/about/cclicenses/) and [Rights Statements](https://rightsstatements.org/) for rights of digital resources ([lido:rightsResource](#rightsResource)).
- [ISO 8601: Date and time format](https://www.iso.org/iso-8601-date-and-time-format.html) for index elements of dates ([lido:earliesDate](#earliestDate) and [lido:latestDate](#latestDate)). The specific recommended formats are:
  - [-]CCYY (year only),
  - [-]CCYY-MM (year and month),
  - [-]CCYY-MM-DD (year, month and day) and
  - [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm] (year, month, day and time).
- [ISO 639-1 two-letter language codes](https://www.iso.org/iso-639-language-code) for the language of the metadata (xml:lang)
- [ISO 639-2 or ISO-639-3 three-letter language codes](https://www.iso.org/iso-639-language-code) for the language of the object

---

# Languages

## Language of the metadata

Finna.fi is a multilingual platform, and it is strongly recommended to provide the metadata in all available languages. Although Finna.fi is currently available in four languages, Finnish, Swedish, English and Northern Sami, metadata in other languages can still be displayed and made available to users e.g. via [Finna API](https://api.finna.fi/).

In LIDO Schema v1.1, it is mandatory to specify the language of the metadata in the xml:lang attribute of [lido:descriptiveMetadata](http://lido-schema.org/schema/v1.1/lido-v1.1.html#descriptiveMetadata), which aggregates the descriptive metadata of the record and can be repeated for fully multilingual resources, once for each language. In Finna, materials are typically only partly multilingual, which is why we recommend to always specify the language in the xml:lang attribute of each individual LIDO element containing displayable text or other language-specific information.

The value of the xml:lang attribute should be a [ISO 639-1 two-letter language code](https://www.iso.org/iso-639-language-code).

## Language of the object

If the cultural heritage object itself contains text or other information in one or several languages, it is recommended to specify each language within [lido:classification](#classification), marked with attribute type="language". While this type is not provided in LIDO Terminology, there is currently no more appropriate way to describe the language of the object in LIDO. The lido:term element should contain a [ISO 639-2 or ISO-639-3 three-letter language code](https://www.iso.org/iso-639-language-code).

## Language of digital resources

Links to the digital representations of the object and other web resources provided in LIDO elements of [lido:webResourceComplexType](http://lido-schema.org/schema/v1.1/lido-v1.1.html#webResourceComplexType) may also be available in multiple languages. The xml:lang attribute may be included to specify the language of the resource, allowing users to view the resources in their preferred language.

---

# All changes to the schema

The following sections document changes and recommendations for specific LIDO elements.

---

## actorID

### Description

An identifier for the actor.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#actorID)

### Technical information

**Contained by**

- actor in actorInRoleComplexType
- actor in actorSetComplexType

**May contain**

- xs:string (required)

**Attributes**

- pref (optional)
- **type (required)**  
  - See [LIDO Terminology for Type of Identifier](http://lido-schema.org/documents/terminology-recommendation.html#identifier_type).
- source (optional – recommended)  
  - The source of the actor identifier. Usually the source code of the authority file, chosen for example from the list of [Name and Title Authority Source Codes](https://www.loc.gov/standards/sourcelist/name-title.html).
- encodinganalog (optional)
- label (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- It is recommended to choose a URI from the [KANTO – National Agent Data](http://urn.fi/URN:NBN:fi:au:finaf:), the [ISNI Database](https://isni.org/) or another linked open authority file.
- It is recommended to use the source attribute to specify the source. For KANTO actor URIs, use source attribute "finaf" and for ISNI actor URIs, use source attribute "isni".

**Divergence from LIDO**

- –

**Additional Schematron rules**

Severity: warning

- For KANTO actors with source attribute "finaf", the ID should begin with "http://urn.fi/URN:NBN:fi:au:finaf:".
- For ISNI actors with source attribute "isni", the ID should begin with "https://isni.org/isni/".
- For KANTO and ISNI actor URIs, the type attribute [URI](http://terminology.lido-schema.org/lido00099) should be used.

Severity: information

- It is recommended to use the source attribute to identify the source for the ID.
- For KANTO actor URIs, the source attribute "finaf" is recommended.
- For ISNI actor URIs, the source attribute "isni" is recommended.

### Examples

```xml
<lido:actorID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="finaf">http://urn.fi/URN:NBN:fi:au:finaf:000057712</lido:actorID>
```

```xml
<lido:actorID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="isni">https://isni.org/isni/0000000121478925</lido:actorID>
```

---

## actorInRole

### Description

A wrapper for information about an actor and the role or activity performed by this actor in context of the event.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#actorInRole)

### Technical information

**Contained by**

- [eventActor](#eventActor)

**May contain**

- actor (required)
- roleActor (optional – recommended)
- attributionQualifierActor (optional)
- extentActor (optional)
- souceActorInRole (optional)

**Attributes**

- –

**Cardinality**

- 1

**Recording notes**

- It is required to specify the name of the actor in actor/nameActorSet/appellationValue.
- It is recommended to use actor/[actorID](#actorID) for the identifier of the actor.
- It is recommended to specify the role of the actor roleActor/term.

**Divergence from LIDO**

- Cardinality (LIDO: 0–1).

**Additional Schematron rules**

Severity: warning

- There should be a non-empty actor/nameActorSet/appellationValue.

Severity: information

- roleActor/term is a recommended element.
- actor/[actorID](#actorID) is a recommended element.

### Examples

```xml
<lido:eventActor>
  <lido:actorInRole>
    <lido:actor>
      <lido:actorID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="finaf">http://urn.fi/URN:NBN:fi:au:finaf:000057712</lido:actorID>
      <lido:nameActorSet>
        <lido:appellationValue>Eliel Saarinen</lido:appellationValue>
      </lido:nameActorSet>
    </lido:actor>
    <lido:roleActor>
      <lido:term>taiteilija</lido:term>
    </lido:roleActor>
  </lido:actorInRole>
</lido:eventActor>
```

---

## applicationProfile

### Description

A unique identification of the application profile used to create the LIDO record.

[Link to the LIDO schema](https://lido-schema.org/schema/v1.1/lido-v1.1.html#applicationProfile)

### Technical information

**Contained by**

- lido

**May contain**

- xs:string (required)

**Attributes**

- pref (optional)
- **type (required)**  
  - See [LIDO Terminology for Type of Identifier](http://lido-schema.org/documents/terminology-recommendation.html#identifier_type)
- source (optional)
- encodinganalog (optional)
- label (optional)

**Cardinality**

- 0–1

**Recording notes**

- It is recommended to specify the URI of the LIDO application profile used to create the LIDO record. When using FINNA LIDO profile, use the URL to the GitHub folder of the applied version.

**Divergence from LIDO**

- –

**Additional Schematron rules**

Severity: information

- applicationProfile is a recommended element.

### Examples

```xml
<lido:applicationProfile lido:type="http://terminology.lido-schema.org/lido00099">https://github.com/NatLibFi/finna-metadata-profiles/tree/main/LIDO/v1.0</lido:applicationProfile>
```

---

## classification

### Description

An index element assigning an object/work to a classification or other vocabulary scheme that groups similar objects together on the basis of defined characteristics.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#classification)

### Technical information

**Contained by**

- classificationWrap

**May contain**

- skos:Concept (optional)
- conceptID (optional)
- **term (required)**

**Attributes**

- type (optional)
- sortorder (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- For the language of the object, use type attribute "language"; the term should contain a [ISO 639-2 or ISO-639-3 three-letter language code](https://www.iso.org/iso-639-language-code). It is strongly recommended to describe the language of textual materials.
- Otherwise, type attribute is optional and chosen from the [LIDO Terminology for Type of Classification](http://lido-schema.org/documents/terminology-recommendation.html#classification_type).

**Divergence from LIDO**

- Required elements (LIDO: term is optional).
- Values of type attribute (LIDO: no type exists for the language of the object).

**Additional Schematron rules**

Severity: warning

- Term is a required element within classification.
- If the type attribute of the classification element is "language", the term element should contain a three-letter language code.

Severity: information

- classification is a recommended element.
- A classification element with type "language" is strongly recommended for textual objects.

### Examples

```xml
<lido:classification lido:type="language">
  <lido:term>fin</lido:term>
</lido:classification>
```

---

## conceptID

### Description

An identifier for the concept.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#conceptID)

### Technical information

**Contained by**

- attributionQualifierActor
- category
- [classification](#classification)
- culture
- [eventMethod](#eventMethod)
- [eventType](#eventType)
- extentActor
- extentMaterialsTech
- [extentMeasurements](#extentMeasurements)
- extentSubject
- formatMeasurements
- genderActor
- [measurementType](#measurementType)
- [measurementUnit](#measurementUnit)
- nationalityActor
- [objectType](#objectType)
- [objectWorkType](#objectWorkType)
- periodName
- placeClassification
- [qualifierMeasurements](#qualifierMeasurements)
- recordType
- relatedEventRelType
- [relatedWorkRelType](#relatedWorkRelType)
- resourcePerspective
- resourceRelType
- resourceType
- rightsType
- roleActor
- roleInEvent
- scaleMeasurements
- shapeMeasurements
- [subjectConcept](#subjectConcept)
- [termMaterialsTech](#termMaterialsTech)

**May contain**

- xs:string (required)

**Attributes**

- pref (optional)
- **type (required)**  
  - See [LIDO Terminology for Type of Identifier](http://lido-schema.org/documents/terminology-recommendation.html#identifier_type)
- source (optional)
- encodinganalog (optional)
- label (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- When referring to linked open vocabularies, element skos:Concept is recommended instead of conceptID (see the examples in [subjectConcept](#subjectConcept)).
- It is recommended to specify the source for the ID in the source attribute of conceptID. Usually the source code of the vocabulary, chosen for example from the list of [Subject Heading and Term Source Codes](https://www.loc.gov/standards/sourcelist/subject.html).

**Divergence from LIDO**

- –

**Additional Schematron rules**

Severity: warning

- conceptIDs with source attribute "yso" should begin with "http://www.yso.fi/onto/yso/".
- conceptIDs with source attribute "koko" should begin with "http://www.yso.fi/onto/koko/".
- For YSO, KOKO or other concept URIs, the conceptID should have the type attribute [URI](http://terminology.lido-schema.org/lido00099).

Severity: information

- It is recommended to use the source attribute of conceptID to identify the source for the ID.
- For YSO conceptIDs, the source attribute "yso" is recommended.
- For KOKO conceptIDs, the source attribute "koko" is recommended.

### Examples

```xml
<lido:subjectConcept>
  <lido:conceptID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="koko">http://www.yso.fi/onto/koko/p34718</lido:conceptID>
  <lido:term xml:lang="fi">kirkkorakennukset</lido:term>
  <lido:term xml:lang="en">church buildings</lido:term>
  <lido:term xml:lang="sv">kyrkobyggnader</lido:term>
  <lido:term xml:lang="se">girkovisttit</lido:term>
</lido:subjectConcept>
```

---

## earliestDate

### Description

An index element for the expression of an exact or estimated date, for instance a year or calendar date, that delimits the beginning of a date span.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#earliestDate)

### Technical information

**Contained by**

- date
- rightsDate
- vitalDatesActor

**May contain**

- xs:string (required)

**Attributes**

- **type (required)**  
  - See [LIDO Terminology for Type of Earliest Date](http://lido-schema.org/documents/terminology-recommendation.html#earliestDate_type).
- source (optional)
- encodinganalog (optional)
- label (optional)

**Cardinality**

- 0–1

**Recording notes**

- The date should comply to the ISO 8601 formats:
  - [-]CCYY (year only)
  - [-]CCYY-MM (year and month)
  - [-]CCYY-MM-DD (year, month and day)
  - [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm] (year, month, day and time)

**Divergence from LIDO**

- Allowed formats (LIDO: ISO 8601 recommended).

**Additional Schematron rules**

Severity: warning

- Allowed formats:
  - [-]CCYY
  - [-]CCYY-MM
  - [-]CCYY-MM-DD
  - [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]

### Examples

```xml
<lido:earliestDate lido:type="http://terminology.lido-schema.org/lido00528">2024-09-01</lido:earliestDate>
```

---

## event

### Description

A wrapper for information about the event the object/work participated in or was present at, for example, its creation or acquisition.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#event)

### Technical information

**Contained by**

- [eventSet](#eventSet)
- relatedEvent
- subjectEvent

**May contain**

- eventID (optional)
- owl:sameAs (optional)
- **[eventType](#eventType) (required)**
- roleInEvent (optional)
- eventName (optional)
- [eventActor](#eventActor) (optional - recommended)
- culture (optional)
- [eventDate](#eventDate) (optional - recommended)
- periodName (optional)
- [eventPlace](#eventPlace) (optional - recommended)
- [eventMethod](#eventMethod) (optional)
- eventMaterialsTech (optional)
- thingPresent (optional)
- relatedEventSet (optional)
- eventDescriptionSet (optional)

**Attributes**

- –

**Cardinality**

- 1

**Recording notes**

- It is recommended to include at least 1 [eventSet](#eventSet) containing 1 event, describing the object history.
- The type of the event should be specified in [eventType](#eventType).
- It is recommended to describe:
  - persons or entities participating at the event using [eventActor](#eventActor).
  - when the event took place using [eventDate](#eventDate).
  - where the event took place using [eventPlace](#eventPlace).

**Divergence from LIDO**

- Cardinality (LIDO: 0–1)

**Additional Schematron rules**

Severity: warning

- An event should have a non-empty event type term.

Severity: information

- eventActor is a recommended element.
- eventDate is a recommended element.
- eventPlace is a recommended element.

### Examples

```xml
<lido:event>
  <lido:eventType>
    <skos:Concept rdf:about="http://terminology.lido-schema.org/lido00012"/>
    <lido:term xml:lang="fi">valmistus</lido:term>
  </lido:eventType>
  <lido:eventActor>
    <lido:actorInRole>
      <lido:actor>
        <lido:actorID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="finaf">http://urn.fi/URN:NBN:fi:au:finaf:000057712</lido:actorID>
        <lido:nameActorSet>
          <lido:appellationValue>Eliel Saarinen</lido:appellationValue>
        </lido:nameActorSet>
      </lido:actor>
      <lido:roleActor>
        <lido:term>taiteilija</lido:term>
      </lido:roleActor>
    </lido:actorInRole>
  </lido:eventActor>
  <lido:eventDate>
    <lido:displayDate xml:lang="fi">1910–1912, 1915</lido:displayDate>
    <lido:date>
      <lido:earliestDate lido:type="http://terminology.lido-schema.org/lido00528">1910-01-01</lido:earliestDate>
      <lido:latestDate lido:type="http://terminology.lido-schema.org/lido00528">1915-12-31</lido:latestDate>
    </lido:date>
  </lido:eventDate>
  <lido:eventPlace>
    <lido:displayPlace>Käenkuja 3, Helsinki</lido:displayPlace>
    <lido:place>
      <lido:namePlaceSet>
        <lido:appellationValue lido:label="katuosoite" xml:lang="fi">Käenkuja 3</lido:appellationValue>
      </lido:namePlaceSet>
      <lido:gml>
        <gml:Point>
          <gml:pos>60.1852702 24.9618065</gml:pos>
        </gml:Point>
      </lido:gml>
      <lido:partOfPlace>
        <lido:placeID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="yso">http://www.yso.fi/onto/yso/p94137</lido:placeID>
        <lido:namePlaceSet>
          <lido:appellationValue lido:label="kunta" xml:lang="fi">Helsinki</lido:appellationValue>
        </lido:namePlaceSet>
      </lido:partOfPlace>
    </lido:place>
  </lido:eventPlace>
</lido:event>
```

---

## eventActor

### Description

A set of display and index elements for an actor participating in or being present at the event, including role information.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#eventActor)

### Technical information

**Contained by**

- [event](#event)

**May contain**

- displayActorInRole (optional)
- **[actorInRole](#actorInRole) (required)**

**Attributes**

- sortorder

**Cardinality**

- 0–unbounded

**Recording notes**

- It is required to specify the name of the actor in [actorInRole](#actorInRole)/actor/nameActorSet/appellationValue.
- It is recommended to use [actorInRole](#actorInRole)/actor/[actorID](#actorID) for the identifier of the actor.
- It is recommended to specify the role of the actor in [actorInRole](#actorInRole)/roleActor/term.

**Divergence from LIDO**

- Mandatory elements (LIDO: actorInRole is optional).

**Additional Schematron rules**

- –

### Examples

```xml
<lido:eventActor>
  <lido:actorInRole>
    <lido:actor>
      <lido:actorID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="finaf">http://urn.fi/URN:NBN:fi:au:finaf:000057712</lido:actorID>
      <lido:nameActorSet>
        <lido:appellationValue>Eliel Saarinen</lido:appellationValue>
      </lido:nameActorSet>
    </lido:actor>
    <lido:roleActor>
      <lido:term>taiteilija</lido:term>
    </lido:roleActor>
  </lido:actorInRole>
</lido:eventActor>
```

---

## eventDate

### Description

A wrapper for structured information about the date or range of dates the event in focus took place.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#eventDate)

### Technical information

**Contained by**

- [event](#event)

**May contain**

- displayDate (optional - recommended)
- date (optional - recommended)

**Attributes**

- –

**Cardinality**

- 0–1

**Recording notes**

- It is recommended to provide the date both as human-readable text in displayDate and in machine-readable form in date.
- The lang attribute is recommended in displayDate.
- Within date, use [earliestDate](#earliestDate) for the beginning of the timespan and [latestDate](#latestDate) for the end of the timespan.
- Note that eventDate or date elements cannot be repeated. If the event took place in several successive periods of time, they can be described in displayDate, but the timespan in date element should cover all periods.

**Divergence from LIDO**

- –

**Additional Schematron rules**

Severity: information

- eventDate/displayDate is a recommended element.
- The lang attribute is recommended in eventDate/displayDate.
- eventDate/date is a recommended element.

### Examples

```xml
<lido:eventDate>
  <lido:displayDate xml:lang="fi">1910–1912, 1915</lido:displayDate>
  <lido:date>
    <lido:earliestDate lido:type="http://terminology.lido-schema.org/lido00528">1910-01-01</lido:earliestDate>
    <lido:latestDate lido:type="http://terminology.lido-schema.org/lido00528">1915-12-31</lido:latestDate>
  </lido:date>
</lido:eventDate>
```

Example with single date:

```xml
<lido:eventDate>
  <lido:displayDate xml:lang="fi">23.1.2025</lido:displayDate>
  <lido:date>
    <lido:earliestDate lido:type="http://terminology.lido-schema.org/lido00528">2025-23-01</lido:earliestDate>
    <lido:latestDate lido:type="http://terminology.lido-schema.org/lido00528">2025-23-01</lido:latestDate>
  </lido:date>
</lido:eventDate>
```

---

## eventMethod

### Description

An index element for the method by which the event is or was carried out.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#eventMethod)

### Technical information

**Contained by**

- [event](#event)

**May contain**

- skos:Concept (optional – recommended)
- conceptID (optional)
- **term (required)**

**Attributes**

- sortorder (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- It is recommended to choose a concept from [YSO](http://www.yso.fi/onto/yso/), [KOKO](http://www.yso.fi/onto/koko/) or another linked open vocabulary.
- It is recommended to specify the language of the term by using the lang attribute in term.

**Divergence from LIDO**

- Required elements (LIDO: term is optional)

**Additional Schematron rules**

Severity: warning

- A non-empty term is required.

Severity: information

- Type attribute is recommended.
- It is recommended to use skos:Concept (or [lido:conceptID](#conceptID)) within eventMethod.

### Examples

```xml
<lido:eventMethod>
  <skos:Concept rdf:about="http://www.yso.fi/onto/koko/p72332"/>
  <lido:term xml:lang="fi">kankaankudonta</lido:term>
</lido:eventMethod>
```

---

## eventPlace

### Description

A set of structured information indicating the place or location where an object/work was associated with a particular event.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#eventPlace)

### Technical information

**Contained by**

- [event](#event)

**May contain**

- displayPlace (optional - recommended)
- [place](#place) (optional - recommended)

**Attributes**

- type (optional)
- sortorder (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- It is required to include the name of the place either in displayPlace or in [place](#place)/namePlaceSet/appellationValue. Using both is recommended.
- It is recommended to provide both a displayPlace element gathering information from all [place](#place) and [partOfPlace](#partOfPlace) elements, and a [place](#place) element with more granular information.

**Divergence from LIDO**

- Required elements (LIDO: displayPlace and place/namePlaceSet are both optional).

**Additional Schematron rules**

Severity: warning

- It is required to have either a non-empty displayPlace element, or a non-empty place/namePlaceSet/appellationValue.

Severity: information

- displayPlace is a recommended element.
- place is a recommended element.

### Examples

```xml
<lido:eventPlace>
  <lido:displayPlace>Käenkuja 3, Helsinki</lido:displayPlace>
  <lido:place>
    <lido:namePlaceSet>
      <lido:appellationValue lido:label="katuosoite" xml:lang="fi">Käenkuja 3</lido:appellationValue>
    </lido:namePlaceSet>
    <lido:gml>
      <gml:Point>
        <gml:pos>60.1852702 24.9618065</gml:pos>
      </gml:Point>
    </lido:gml>
    <lido:partOfPlace>
      <lido:placeID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="yso">http://www.yso.fi/onto/yso/p94137</lido:placeID>
      <lido:namePlaceSet>
        <lido:appellationValue lido:label="kunta" xml:lang="fi">Helsinki</lido:appellationValue>
      </lido:namePlaceSet>
    </lido:partOfPlace>
  </lido:place>
</lido:eventPlace>
```

---

## eventSet

### Description

A set of display and index elements for an event the object/work participated in or was present at.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#eventSet)

### Technical information

**Contained by**

- eventWrap

**May contain**

- displayEvent (optional)
- **[event](#event) (required)**

**Attributes**

- sortorder (optional)
- mostNotableEvent (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- –

**Divergence from LIDO**

- Required elements (LIDO: event is optional)

**Additional Schematron rules**

Severity: warning

- event is a required element within eventSet.

Severity: information

- eventSet is a recommended element.

### Examples

```xml
<lido:eventSet>
  <lido:event>
    ...
  </lido:event>
</lido:eventSet>
```

---

## eventType

### Description

An index element for the particular kind of event the object/work participated in or was present at.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#eventType)

### Technical information

**Contained by**

- [event](#event)

**May contain**

- skos:Concept (optional)
- conceptID (optional)
- **term (required)**

**Attributes**

- –

**Cardinality**

- 1

**Recording notes**

- Choose an event type from [LIDO Terminology for Event Type](http://lido-schema.org/documents/terminology-recommendation.html#eventType).
- It is recommended to specify the language of the term by using the lang attribute in term.

**Divergence from LIDO**

- Required elements (LIDO: term is optional)

**Additional Schematron rules**

Severity: warning

- An event should have a non-empty event type term.

### Examples

```xml
<lido:eventType>
  <skos:Concept rdf:about="http://terminology.lido-schema.org/lido00007"/>
  <lido:term xml:lang="fi">valmistus</lido:term>
</lido:eventType>
```

---

## extentMeasurements

### Description

An index element specifying the part of the object/work to which the dimensions or measurements in focus apply.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#extentMeasurements)

### Technical information

**Contained by**

- [objectMeasurements](#objectMeasurements)

**May contain**

- skos:Concept (optional)
- conceptID (optional)
- **term (required)**

**Attributes**

- –

**Cardinality**

- 0–unbounded

**Recording notes**

- It is recommended to specify the language of the term by using the lang attribute in term.

**Divergence from LIDO**

- Required elements (LIDO: term is optional).

**Additional Schematron rules**

- A non-empty term is required.
- The lang attribute in term element is recommended.

### Examples

```xml
<lido:extentMeasurements>
  <lido:term xml:lang="en">the lid</lido:term>
  <lido:term xml:lang="fi">kansi</lido:term>
</lido:extentMeasurements>
```

---

## inscriptionDescription

### Description

A text element for a description of an inscription, including description identifier, descriptive note of the inscription and sources.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#inscriptionDescription)

### Technical information

**Contained by**

- inscription

**May contain**

- descriptiveNoteID (optional)
- **descriptiveNoteValue (required)**
- sourceDescriptiveNote (optional)

**Attributes**

- type (optional)
- sortorder (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- If type attribute is in use, it should be one from the [terminology for type of inscription description](#Terminology-for-Type-of-Inscription-Description).
- It is recommended to specify the language of the description by using the lang attribute of descriptiveNoteValue.

**Divergence from LIDO**

- Required elements (LIDO: descriptiveNoteValue is optional).

**Additional Schematron rules**

Severity: warning

- A non-empty descriptiveNoteValue is required.
- If type attribute is is use, it should be one of "technique", "location", "description", "type" or "interpretation".

Severity: information

- The lang attribute in descriptiveNoteValue element is recommended.

### Examples

```xml
<lido:inscriptionDescription lido:type="technique">
  <lido:descriptiveNoteValue xml:lang="en">carving</lido:descriptiveNoteValue>
</lido:inscriptionDescription>
```

```xml
<lido:inscriptionDescription lido:type="location">
  <lido:descriptiveNoteValue xml:lang="en">the handle</lido:descriptiveNoteValue>
</lido:inscriptionDescription>
```

```xml
<lido:inscriptionDescription lido:type="description">
  <lido:descriptiveNoteValue xml:lang="en">letters AW inside a circle</lido:descriptiveNoteValue>
</lido:inscriptionDescription>
```

---

## latestDate

### Description

An index element for the expression of the exact or approximate date, for instance a year or calendar date, that delimits the end of a date span.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#latestDate)

### Technical information

**Contained by**

- date
- rightsDate
- vitalDatesActor

**May contain**

- xs:string (required)

**Attributes**

- **type (required)**  
  - See [LIDO Terminology for Type of Latest Date](http://lido-schema.org/documents/terminology-recommendation.html#latestDate_type)
- source (optional)
- encodinganalog (optional)
- label (optional)

**Cardinality**

- 0–1

**Recording notes**

- The date should comply to the ISO 8601 formats:
  - [-]CCYY (year only)
  - [-]CCYY-MM (year and month)
  - [-]CCYY-MM-DD (year, month and day)
  - [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm] (year, month, day and time)

**Divergence from LIDO**

- Allowed formats (LIDO: ISO 8601 recommended).

**Additional Schematron rules**

Severity: warning

- Allowed formats:
  - [-]CCYY
  - [-]CCYY-MM
  - [-]CCYY-MM-DD
  - [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm]

### Examples

```xml
<lido:latestDate lido:type="http://terminology.lido-schema.org/lido00528">2000-12-31</lido:latestDate>
```

---

## lidoRecID

### Description

A unique LIDO record identification.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#lidoRecID)

### Technical information

**Contained by**

- lido

**May contain**

- xs:string (required)

**Attributes**

- pref (optional)
- **type (required)**  
  - See [LIDO Terminology for Type of Identifier](http://lido-schema.org/documents/terminology-recommendation.html#identifier_type)
- source (optional)
- encodinganalog (optional)
- label (optional)

**Cardinality**

- 1

**Recording notes**

- The identifier must be unique in the local system.

**Divergence from LIDO**

- Cardinality (LIDO: 1–unbounded).

**Additional Schematron rules**

Severity: warning

- Non-empty value is required.

### Examples

```xml
<lido:lidoRecID lido:type="http://terminology.lido-schema.org/lido00100">023-2341497100974374083498</lido:lidoRecID>
```

---

## linkResource

### Description

A text element providing a reference to the resource in the worldwide web environment, usually a stable URI/URL.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#linkResource)

### Technical information

**Contained by**

- [resourceRepresentation](#resourceRepresentation)

**May contain**

- xs:string (required)

**Attributes**

- codecResource (optional)
- pref (optional)
- **formatResource (required)**
  - Refer to [IANA media types](http://www.iana.org/assignments/media-types/)
- xml:lang (optional)
- encodinganalog (optional)
- label (optional)

**Cardinality**

- 1

**Recording notes**

- The linkResource element must contain a valid URI/URL.

**Divergence from LIDO**

- Attributes (LIDO: formatResource is optional).

**Additional Schematron rules**

Severity: warning

- It is required to specify the format of the resource in formatResource attribute.
- The value of linkResource should start with "http" or "https".

### Examples

```xml
<lido:linkResource lido:formatResource="image/jpeg">https://linktoimagefile</lido:linkResource>
```

---

## objectDescriptionSet

### Description

A set of descriptive information about the object/work, including description identifier, descriptive note and source of the description.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#objectDescriptionSet)

### Technical information

**Contained by**

- objectDescriptionWrap

**May contain**

- descriptiveNoteID (optional)
- **descriptiveNoteValue (required)**
- sourceDescriptiveNote (optional)
- objectDescriptionRights (optional)

**Attributes**

- type (optional)
- sortorder (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- The value of the type attribute should be chosen from the [terminology for type of object description set](#Terminology-for-Type-of-Object-Description-Set).
- It is recommended to specify the language of the description by using the lang attribute in descriptiveNoteValue.

**Divergence from LIDO**

- Required elements (LIDO: descriptiveNoteValue is optional).

**Additional Schematron rules**

Severity: warning

- objectDescriptionSet must contain at least one non-empty descriptiveNoteValue.

Severity: information

- objectDescriptionSet is a recommended element.
- The lang attribute in descriptiveNoteValue element is recommended.

### Examples

```xml
<lido:objectDescriptionSet type="description">
  <lido:descriptiveNoteValue xml:lang="en">This is a description of the object.</lido:descriptiveNoteValue>
  <lido:descriptiveNoteValue xml:lang="fi">Tämä on objektin kuvaus suomeksi.</lido:descriptiveNoteValue>
</lido:objectDescriptionSet>
```

```xml
<lido:objectDescriptionSet type="introduction">
  <lido:descriptiveNoteValue xml:lang="en">A more extensive introductory text about the object</lido:descriptiveNoteValue>
</lido:objectDescriptionSet>
```

---

## measurementType

### Description

An index element for the kind of dimension, like height or width, or other measurements of the object/work, such as volume or running time.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#measurementType)

### Technical information

**Contained by**

- measurementsSet
- resourceMeasurementsSet

**May contain**

- skos:Concept (optional)
- conceptID (optional)
- **term (required)**

**Attributes**

- –

**Cardinality**

- 1–unbounded

**Recording notes**

- It is recommended to choose a concept from [the Metadata thesaurus](http://urn.fi/URN:NBN:fi:au:mts:), [YSO](http://www.yso.fi/onto/yso/) or [KOKO](http://www.yso.fi/onto/koko/) or another linked open vocabulary.
- It is recommended to specify the language of the term by using the lang attribute in term.

**Divergence from LIDO**

- Required elements (LIDO: term is optional).

**Additional Schematron rules**

Severity: warning

- A non-empty term is required.

Severity: information

- The lang attribute in term element is recommended.

### Examples

```xml
<lido:measurementType>
  <skos:Concept rdf:about="http://www.yso.fi/onto/yso/p18542"/>
  <lido:term xml:lang="en">width</lido:term>
</lido:measurementType>
```

```xml
<lido:measurementType>
  <skos:Concept rdf:about="http://urn.fi/URN:NBN:fi:au:mts:m8"/>
  <lido:term xml:lang="fi">laajuus</lido:term>
</lido:measurementType>
```

---

## measurementUnit

### Description

An index element for the unit of the measurements.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#measurementUnit)

### Technical information

**Contained by**

- measurementsSet
- resourceMeasurementsSet

**May contain**

- skos:Concept (optional)
- conceptID (optional)
- **term (required)**

**Attributes**

- –

**Cardinality**

- 1–unbounded

**Recording notes**

- It is recommended to specify the language of the term by using the lang attribute in term.

**Divergence from LIDO**

- Required elements (LIDO: term is optional).

**Additional Schematron rules**

Severity: warning

- A non-empty term is required.

Severity: information

- The lang attribute in term element is recommended.

### Examples

```xml
<lido:measurementUnit>
  <lido:term xml:lang="en">cm</lido:term>
</lido:measurementUnit>
```

---

## objectMeasurementsSet

### Description

A set of display and index elements for dimensions, or other measurements, of the object/work in focus.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#objectMeasurementsSet)

### Technical information

**Contained by**

- objectMeasurementsWrap

**May contain**

- displayObjectMeasurements (optional – recommended)
- [objectMeasurements](#objectMeasurements) (optional – recommended)

**Attributes**

- type (optional)
- measurementsGroup (optional)
- sortorder (optional)

**Cardinality**

- 1–unbounded

**Recording notes**

- It is recommended to include a displayObjectMeasurements element containing measurements in displayable form. Using lang attribute in displayObjectMeasurements is recommended.
- It is also recommended to include an [objectMeasurements](#objectMeasurements) element containing a measurementsSet with structured information.

**Divergence from LIDO**

- –

**Additional Schematron rules**

Severity: information

- displayObjectMeasurements is a recommended element.
- The lang attribute in displayObjectMeasurements is recommended.
- objectMeasurements/measurementsSet is a recommended element.

### Examples

```xml
<lido:objectMeasurementsSet>
  <lido:displayObjectMeasurements xml:lang="en">length: 15 cm, width: 3 cm</lido:displayObjectMeasurements>
  <lido:objectMeasurements>
    <lido:measurementsSet>
      <lido:measurementType>
        <skos:Concept rdf:about="http://www.yso.fi/onto/yso/p12461"/>
        <lido:term xml:lang="en">length</lido:term>
      </lido:measurementType>
      <lido:measurementUnit>
        <lido:term xml:lang="en">cm</lido:term>
      </lido:measurementUnit>
      <lido:measurementValue>15</lido:measurementValue>
    </lido:measurementsSet>
    <lido:measurementsSet>
      <lido:measurementType>
        <skos:Concept rdf:about="http://www.yso.fi/onto/yso/p18542"/>
        <lido:term xml:lang="en">width</lido:term>
      </lido:measurementType>
      <lido:measurementUnit>
        <lido:term xml:lang="en">cm</lido:term>
      </lido:measurementUnit>
      <lido:measurementValue>3</lido:measurementValue>
    </lido:measurementsSet>
  </lido:objectMeasurements>
</lido:objectMeasurementsSet>
```

---

## objectMeasurements

### Description

A wrapper for information about the dimensions, or other measurements, of the object/work in focus.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#objectMeasurements)

### Technical information

**Contained by**

- eventObjectMeasurements
- [objectMeasurementsSet](#objectMeasurementsSet)

**May contain**

- measurementsSet (optional – recommended)
- [extentMeasurements](#extentMeasurements) (optional)
- [qualifierMeasurements](#qualifierMeasurements) (optional)
- formatMeasurements (optional)
- shapeMeasurements (optional)
- scaleMeasurements (optional)

**Attributes**

- –

**Cardinality**

- 0–1

**Recording notes**

- It is recommended to include a measurementsSet element with structured elements [measurementType](#measurementType), [measurementUnit](#measurementUnit) and measurementValue.

**Divergence from LIDO**

- –

**Additional Schematron rules**

Severity: information

- measurementsSet is a recommended element.

### Examples

(See [objectMeasurementsSet](#objectMeasurementsSet) example above — objectMeasurements is used inside objectMeasurementsSet.)

---

## objectNote

### Description

A text element for further descriptive information about the object/work in focus, including actor, and other information as necessary for clarity.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#objectNote)

### Technical information

**Contained by**

- object

**May contain**

- xs:string (required)

**Attributes**

- type (optional)
- xml:lang (optional)
- encodinganalog (optional)
- label (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- The element is required when the object refers to a hierarchical entity (see [relatedWork](#relatedWork)).
- Use the type attribute "objectWorkType" for the type of the object, usually more specific than the type in [objectType](#objectType).
- The lang attribute is recommended.

**Divergence from LIDO**

- Values of type attribute (LIDO: no recommended values).

**Additional Schematron rules**

Severity: warning

- If type attribute is used, it should be "objectWorkType".

Severity: information

- The lang attribute is recommended.

### Examples

```xml
<lido:objectNote lido:type="objectWorkType" xml:lang="en">series</lido:objectNote>
```

---

## objectPublishedID

### Description

A published identifier of the object or work in focus.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#objectPublishedID)

### Technical information

**Contained by**

- lido

**May contain**

- xs:string (required)

**Attributes**

- pref (optional)
- **type (required)**  
  - See [LIDO Terminology for Type of Identifier](http://lido-schema.org/documents/terminology-recommendation.html#identifier_type)
- source (optional)
- encodinganalog (optional)
- label (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- Use objectPublishedID for ISBN numbers assigned to the work in focus.

**Divergence from LIDO**

- –

**Additional Schematron rules**

- –

### Examples

```xml
<lido:objectPublishedID lido:label="isbn" lido:type="http://terminology.lido-schema.org/lido00099">URN:ISBN:951-771-872-1</lido:objectPublishedID>
```

---

## objectType

### Description

An index element for the particular kind of object or work in focus.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#objectType)

### Technical information

**Contained by**

- object

**May contain**

- skos:Concept (optional)
- conceptID (optional)
- **term (required)**

**Attributes**

- –

**Cardinality**

- 0–unbounded

**Recording notes**

- The element is required when the object refers to a hierarchical entity (see [relatedWork](#relatedWork)).
- If the object refers to a collection, use object type [collection](http://terminology.lido-schema.org/lido01053).
- If the object refers to the closest parent in a hierarchical structure, use object type "parent".

**Divergence from LIDO**

- Required elements (LIDO: term is optional).
- Data values (LIDO: no type for "parent").

**Additional Schematron rules**

Severity: warning

- A non-empty term is required.

### Examples

```xml
<lido:objectType>
  <skos:Concept rdf:about="http://terminology.lido-schema.org/lido01053"/>
  <lido:term xml:lang="en">collection</lido:term>
</lido:objectType>
```

```xml
<lido:objectType>
  <lido:term xml:lang="en">parent</lido:term>
</lido:objectType>
```

---

## objectWorkType

### Description

An index element for the specific kind of the object/work in focus.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#objectWorkType)

### Technical information

**Contained by**

- objectWorkTypeWrap

**May contain**

- skos:Concept (optional)
- conceptID (optional)
- **term (required)**

**Attributes**

- type (optional)
- sortorder (optional)

**Cardinality**

- 1–unbounded

**Recording notes**

- It is recommended to choose a concept from [the Metadata thesaurus](http://urn.fi/URN:NBN:fi:au:mts:) when possible. The label of the concept should be provided in term element.
- It is recommended to place the most specific term in the first objectWorkType element.

**Divergence from LIDO**

- Required elements (LIDO: term is optional).

**Additional Schematron rules**

Severity: warning

- At least one objectWorkType with a non-empty term is required.

### Examples

```xml
<lido:objectWorkType>
  <skos:Concept rdf:about="http://urn.fi/URN:NBN:fi:au:mts:m5022"/>
  <lido:term xml:lang="fi">esine</lido:term>
</lido:objectWorkType>
```

```xml
<lido:objectWorkType>
  <lido:term xml:lang="fi">3D-malli</lido:term>
</lido:objectWorkType>
```

```xml
<lido:objectWorkType>
  <skos:Concept rdf:about="http://urn.fi/URN:NBN:fi:au:mts:m5028"/>
  <lido:term xml:lang="fi">malli</lido:term>
</lido:objectWorkType>
```

---

## partOfPlace

### Description

A set of structured information about a place that is the broader context for the place in focus, such as the district, state, or nation to which a city belongs.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#partOfPlace)

### Technical information

**Contained by**

- [partOfPlace](#partOfPlace)
- [place](#place)
- repositoryLocation
- vitalPlaceActor

**May contain**

- [placeID](#placeID) (optional - recommended)
- owl:sameAs (optional)
- namePlaceSet (optional - recommended)
- gml (optional)
- [partOfPlace](#partOfPlace) (optional)
- placeClassification (optional)

**Attributes**

- politicalEntity (optional)
- geographicalEntity (optional)

**Cardinality**

- 0–1

**Recording notes**

- It is recommended to include the URI of the place in [placeID](#placeID). Make sure that [placeID](#placeID) is used in the actual level ([place](#place) or partOfPlace) the URI describes.
- The name of the place in namePlaceSet/appellationValue should reflect the broader context of the location described by this partOfPlace element (e.g. the name of the city or country).
- It is recommended to use the label attribute of namePlaceSet/appellationValue for the type of the place (e.g. "city" or "country"). The type may be repeated in placeClassification as well.
- If there are precise coordinates for the place, they should be included in the gml element of the containing [place](#place) element, not in the gml element of partOfPlace.
- It is not allowed to repeat partOfPlace element, but partOfPlace may contain another partOfPlace for even broader contexts of the place.

**Divergence from LIDO**

- Cardinality (LIDO: 0–unbounded).
- Values of label attribute (LIDO: no recommendation for the label attribute of namePlaceSet/appellationValue).

**Additional Schematron rules**

Severity: information

- partOfPlace is a recommended element within place.
- placeID is a recommended element.
- namePlaceSet is a recommended element.
- The label attribute of namePlaceSet/apellationValue is recommended.

### Examples

```xml
<lido:place>
  <lido:namePlaceSet>
    <lido:appellationValue lido:label="katuosoite" xml:lang="fi">Käenkuja 3</lido:appellationValue>
  </lido:namePlaceSet>
  <lido:gml>
    <gml:Point>
      <gml:pos>60.1852702 24.9618065</gml:pos>
    </gml:Point>
  </lido:gml>
  <lido:partOfPlace>
    <lido:placeID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="yso">http://www.yso.fi/onto/yso/p94137</lido:placeID>
    <lido:namePlaceSet>
      <lido:appellationValue lido:label="kunta" xml:lang="fi">Helsinki</lido:appellationValue>
    </lido:namePlaceSet>
    <lido:partOfPlace>
      <lido:placeID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="yso">http://www.yso.fi/onto/yso/p94426</lido:placeID>
      <lido:namePlaceSet>
        <lido:appellationValue lido:label="valtio" xml:lang="fi">Suomi</lido:appellationValue>
      </lido:namePlaceSet>
      <lido:partOfPlace/>
    </lido:partOfPlace>
  </lido:partOfPlace>
</lido:place>
```

---

## place

### Description

A wrapper for identifying and indexing a place.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#place)

### Technical information

**Contained by**

- [eventPlace](#eventPlace)
- [subjectPlace](#subjectPlace)

**May contain**

- [placeID](#placeID) (optional - recommended)
- owl:sameAs (optional)
- namePlaceSet (optional - recommended)
- gml (optional - recommended)
- [partOfPlace](#partOfPlace) (optional - recommended)
- placeClassification (optional)

**Attributes**

- politicalEntity (optional)
- geographicalEntity (optional)

**Cardinality**

- 0–1

**Recording notes**

- It is recommended to include the URI of the place in [placeID](#placeID). Make sure that [placeID](#placeID) is used in the actual level (place or [partOfPlace](#partOfPlace)) the URI describes.
- The name of the place in namePlaceSet/appellationValue should reflect the most precise location only (e.g. street address). Use [partOfPlace](#partOfPlace) for the broader names of the location (i.e. the name of the city or country).
- It is recommended to use namePlaceSet even if the name of the place is also included in the displayPlace element of the containing [eventPlace](#eventPlace) or [subjectPlace](#subjectPlace). Either displayPlace or namePlaceSet is required.
- It is recommended to use the label attribute of namePlaceSet/appellationValue for the type of the place (e.g. "city" or "country"). The type may be repeated in placeClassification as well.
- It is recommended to include the coordinates of the place in gml.
- It is recommended to include at least one broader context for the place in [partOfPlace](#partOfPlace) element.

**Divergence from LIDO**

- Required elements (LIDO: namePlaceSet and displayPlace are both optional).
- Values of label attribute (LIDO: no recommendation for the label attribute of namePlaceSet/appellationValue).

**Additional Schematron rules**

Severity: warning

- If the containing eventPlace/subjectPlace element has no displayPlace element, at least one namePlaceSet/appellationValue is required.

Severity: information

- place is a recommended element.
- placeID is a recommended element.
- namePlaceSet is a recommended element.
- The label attribute of namePlaceSet/apellationValue is recommended.
- gml is a recommended element.
- partOfPlace is a recommended element.

### Examples

```xml
<lido:place>
  <lido:namePlaceSet>
    <lido:appellationValue lido:label="katuosoite" xml:lang="fi">Käenkuja 3</lido:appellationValue>
  </lido:namePlaceSet>
  <lido:gml>
    <gml:Point>
      <gml:pos>60.1852702 24.9618065</gml:pos>
    </gml:Point>
  </lido:gml>
  <lido:partOfPlace>
    <lido:placeID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="yso">http://www.yso.fi/onto/yso/p94137</lido:placeID>
    <lido:namePlaceSet>
      <lido:appellationValue lido:label="kunta" xml:lang="fi">Helsinki</lido:appellationValue>
    </lido:namePlaceSet>
  </lido:partOfPlace>
</lido:place>
```

---

## placeID

### Description

An identifier for the place.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#placeID)

### Technical information

**Contained by**

- [partOfPlace](#partOfPlace)
- [place](#place)
- repositoryLocation
- vitalPlaceActor

**May contain**

- xs:string (required)

**Attributes**

- pref (optional)
- **type (required)**  
  - See [LIDO Terminology for Type of Identifier](http://lido-schema.org/documents/terminology-recommendation.html#identifier_type).
- source (optional – recommended)  
  - The source of the place identifier. Usually the source code of the open authority file, chosen for example from the lists of [Subject Heading and Term Source Codes](https://www.loc.gov/standards/sourcelist/subject.html) or [Cartographic Data Source Codes](https://www.loc.gov/standards/sourcelist/cartographic-data.html).
  - For the Finnish Herigage Agency's register of archaeological sites (muinaisjäännösrekisteri) use source code "mjr" and for the register of built heritage (rakennusperintörekisteri) use code "rpr".
- encodinganalog (optional)
- label (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- It is recommended to choose a URI from the [YSO places vocabulary](http://www.yso.fi/onto/yso/places) or another linked open authority file.
- It is recommended to use the source attribute to specify the source. For YSO place URIs, use source attribute "yso".

**Divergence from LIDO**

- –

**Additional Schematron rules**

Severity: warning

- For YSO places with source attribute "yso", the ID should begin with "http://www.yso.fi/onto/yso/".
- For YSO place URIs, the type attribute [URI](http://terminology.lido-schema.org/lido00099/) should be used.

Severity: information

- placeID is a recommended element.
- It is recommended to use the source attribute to identify the source for the ID.
- For YSO place URIs, the source attribute "yso" is recommended.

### Examples

```xml
<lido:placeID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="yso">http://www.yso.fi/onto/yso/p109572</lido:placeID>
```

---

## qualifierMeasurements

### Description

An index element qualifying the dimensions, or other measurements, of an object/work, indicating the kind or precision of measurement results. Examples may include approximate, average, maximum, or variable.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#qualifierMeasurements)

### Technical information

**Contained by**

- [objectMeasurements](#objectMeasurements)

**May contain**

- skos:Concept (optional)
- conceptID (optional)
- **term (required)**

**Attributes**

- –

**Cardinality**

- 1–unbounded

**Recording notes**

- It is recommended to specify the language of the term by using the lang attribute in term.

**Divergence from LIDO**

- Required elements (LIDO: term is optional).

**Additional Schematron rules**

- A non-empty term is required.
- The lang attribute in term element is recommended.

### Examples

```xml
<lido:qualifierMeasurements>
  <lido:term xml:lang="en">estimate</lido:term>
  <lido:term xml:lang="fi">arvio</lido:term>
</lido:qualifierMeasurements>
```

---

## recordRights

### Description

A set of structured information about rights regarding the content provided in this LIDO record.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#recordRights)

### Technical information

**Contained by**

- recordWrap

**May contain**

- **rightsType (required)**
- rightsDate (optional)
- rightsHolder (optional)
- creditLine (optional)

**Attributes**

- sortorder (optional)

**Cardinality**

- 1

**Recording notes**

- The license of the LIDO record should be specified in the skos:Concept (or [lido:conceptID](#conceptID)) of lido:rightsType. For records to be published in Finna, the license [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/) is required.

**Divergence from LIDO**

- Cardinality (LIDO: 0–unbounded).
- Required elements (LIDO: rightsType is optional).

**Additional Schematron rules**

Severity: warning

- There must be a rightsType with a non-empty skos:Concept (or lido:conceptID).

### Examples

```xml
<lido:recordRights>
  <lido:rightsType>
    <skos:Concept rdf:about="https://creativecommons.org/publicdomain/zero/1.0/"/>
    <lido:term>CC0</lido:term>
  </lido:rightsType>
</lido:recordRights>
```

---

## recordSource

### Description

A set of elements identifying the source of information in this LIDO record, generally the repository or other institution.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#recordSource)

### Technical information

**Contained by**

- recordWrap

**May contain**

- legalBodyID (optional)
- owl:sameAS (optional)
- **legalBodyName (required)**
- legalBodyWeblink (optional)

**Attributes**

- type (optional)
- sortorder (optional)

**Cardinality**

- 1–unbounded

**Recording notes**

- –

**Divergence from LIDO**

- Required elements (LIDO: legalBodyName is optional).

**Additional Schematron rules**

Severity: warning

- There should be at least one non-empty legalBodyName/appellationValue.

### Examples

```xml
<lido:recordSource>
  <lido:legalBodyName>
    <lido:appellationValue xml:lang="fi">Museovirasto</lido:appellationValue>
  </lido:legalBodyName>
</lido:recordSource>
```

---

## relatedWork

### Description

A wrapper for display and reference elements of an object or work related to the object/work in focus.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#relatedWork)

### Technical information

**Contained by**

- [relatedWorkSet](#relatedWorkSet)

**May contain**

- **displayObject (required)**
- object (optional; **required for hierarchical related objects**)

**Attributes**

- –

**Cardinality**

- 1

**Recording notes**

- It is recommended to specify the language of the display name by using the lang attribute in displayObject.
- It is recommended to describe the object identifier in object/objectID.
- For hierarchical related objects, the object element is required with following information:
  - objectID for the identifier of the related object.
  - [objectType](#objectType)/term for the type of the related object.
  - [objectNote](#objectNote) with type attribute "objectWorkType" for the work type of the related object.

**Divergence from LIDO**

- Cardinality (LIDO: 0-1)
- Required elements (LIDO: displayObject and object are optional).

**Additional Schematron rules**

Severity: warning

- A non-empty displayObject is required.
- If there is a non-empty object/objectID and object/objectType/term is "collection" or "parent", there must be a non-empty object/objectNote with type attribute "objectWorkType".
- If the object/objectType/term is "parent", there must be a non-empty object/objectID.

Severity: information

- The lang attribute in displayObject is recommended.
- The object/objectID element is recommended.

### Examples

```xml
<lido:relatedWork>
  <lido:displayObject xml:lang="fi">Memoria 2 = Ensimmäinen juhlapuku</lido:displayObject>
  <lido:object>
    <lido:objectID lido:type="http://terminology.lido-schema.org/lido00099">URN:ISBN:951-771-872-1</lido:objectID>
  </lido:object>
</lido:relatedWork>
```

Hierarchical example:

```xml
<lido:relatedWork>
  <lido:displayObject xml:lang="en">Letters sent by Jean Sibelius</lido:displayObject>
  <lido:displayObject xml:lang="fi">Jean Sibeliuksen lähettämät kirjeet</lido:displayObject>
  <lido:object>
    <lido:objectID lido:type="http://terminology.lido-schema.org/lido00100">7886c89d-8ded-4478-1951c8</lido:objectID>
    <lido:objectType>
      <lido:term xml:lang="en">parent</lido:term>
    </lido:objectType>
    <lido:objectNote lido:type="objectWorkType" xml:lang="en">series</lido:objectNote>
    <lido:objectNote lido:type="objectWorkType" xml:lang="fi">sarja</lido:objectNote>
  </lido:object>
</lido:relatedWork>
```

---

## relatedWorkRelType

### Description

An index element for the kind of relationship between the object/work in focus and the related object or work.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#relatedWorkRelType)

### Technical information

**Contained by**

- [relatedWorkSet](#relatedWorkSet)

**May contain**

- skos:Concept (optional)
- conceptID (optional)
- **term (required)**

**Attributes**

- –

**Cardinality**

- 1

**Recording notes**

- Choose a concept from [LIDO Terminology for Related Work Relation Type](http://lido-schema.org/documents/terminology-recommendation.html#relatedWorkRelType). The label of the concept should be provided in term element.
- Use the most appropriate relation type. If you wish to display the relationship in other terms, you can use the label attribute of displayObject (see [relatedWork](#relatedWork)).
- For hierarchical relationships, use the relationship type [is part of](http://terminology.lido-schema.org/lido00574) to refer to parent records.

**Divergence from LIDO**

- Cardinality (LIDO: 0-1)
- Required elements (LIDO: term is optional).

**Additional Schematron rules**

Severity: warning

- A relatedWorkRelType should have a non-empty term.

### Examples

```xml
<lido:relatedWorkRelType>
  <skos:Concept rdf:about="http://terminology.lido-schema.org/lido00574"/>
  <lido:term xml:lang="en">is part of</lido:term>
  <lido:term xml:lang="fi">on osa</lido:term>
</lido:relatedWorkRelType>
```

```xml
<lido:relatedWorkRelType>
  <skos:Concept rdf:about="http://terminology.lido-schema.org/lido00626"/>
  <lido:term xml:lang="en">is reproduced in</lido:term>
  <lido:term xml:lang="fi">on toisinnettu</lido:term>
</lido:relatedWorkRelType>
```

---

## relatedWorkSet

### Description

A set of structured information about an object or work, or a group of objects or works related to the object/work in focus, including the kind of relationship between them. May include bibliographic objects in which the object/work is documented or mentioned.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#relatedWorkSet)

### Technical information

**Contained by**

- relatedWorksWrap

**May contain**

- displayRelatedWork (optional)
- **[relatedWork](#relatedWork) (required)**
- **[relatedWorkRelType](#relatedWorkRelType) (required)**
- sourceRelatedWorkSet (optional)

**Attributes**

- sortorder (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- Use [relatedWork](#relatedWork)/displayObject for the name of the related work.
- Use [relatedWork](#relatedWork)/object for the identifier and the type of the related work. For hierarchical related objects, these are required.
- Use [relatedWorkRelType](#relatedWorkRelType) for the type of the relationship.
- For hierarchical related objects, include two relatedWorkSet elements:
  - a relatedWorkSet with [relatedWork](#relatedWork)/object/[objectType](#objectType)/term "parent" that refers to the closest parent record in the hierarchy
  - a relatedWorkSet with [relatedWork](#relatedWork)/object/[objectType](#objectType)/term "collection" that refers to the record in the top of the hierarchy (might be the same as parent)
- Note that if the object itself is at the top of the hierarchy, it is still necessary to include a relatedWorkSet with [relatedWork](#relatedWork)/object/objectType/term "collection" that refers to the record itself.

**Divergence from LIDO**

- Required elements (LIDO: relatedWork and relatedWorkRelType are optional; no requirements for hierarchical related objects)

**Additional Schematron rules**

Severity: warning

- If there is a relatedWorkSet with relatedWork/object/objectType/term "parent", there must also be a relatedWorkSet with relatedWork/object/objectType/term "collection".

### Examples

```xml
<lido:relatedWorkSet>
  <lido:relatedWork>
    <lido:displayObject xml:lang="en">Letters sent by Jean Sibelius</lido:displayObject>
    <lido:displayObject xml:lang="fi">Jean Sibeliuksen lähettämät kirjeet</lido:displayObject>
    <lido:object>
      <lido:objectID lido:type="http://terminology.lido-schema.org/lido00100">7886c89d-8ded-4478-1951c8</lido:objectID>
      <lido:objectType>
        <lido:term xml:lang="en">parent</lido:term>
      </lido:objectType>
      <lido:objectNote lido:type="objectWorkType" xml:lang="en">series</lido:objectNote>
      <lido:objectNote lido:type="objectWorkType" xml:lang="fi">sarja</lido:objectNote>
    </lido:object>
  </lido:relatedWork>
  <lido:relatedWorkRelType>
    <skos:Concept rdf:about="http://terminology.lido-schema.org/lido00574"/>
    <lido:term xml:lang="en">is part of</lido:term>
  </lido:relatedWorkRelType>
</lido:relatedWorkSet>
```

---

## repositorySet

### Description

A set of elements for the identification, name and location of the repository that is responsible for the object/work in focus, or the geographic place where a stationary object/work, such as a building, is currently or was formerly located.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#repositorySet)

### Technical information

**Contained by**

- repositoryWrap

**May contain**

- displayRepository (optional)
- repositoryName (optional)
- workID (optional)
- repositoryLocation (optional)
- sourceRepositorySet (optional)

**Attributes**

- type (optional)
- sortorder (optional)

**Cardinality**

- 1–unbounded

**Recording notes**

- There should be one repositorySet including a workID element, containing an unambiguous identification number assigned to the object.
- Note that workID element should not be used for ISBN or ISSN numbers assigned to the work. Instead, use [objectPublishedID](#objectPublishedID) for ISBN numbers and [relatedWork](#relatedWork)/object/objectID within a [relatedWorkSet](#relatedWorkSet) of [relatedWorkRelType](#relatedWorkRelType) "has broader conceptual context" for ISSN numbers.
- When repeating repositorySet, choose a type attribute from the [LIDO Terminology for Type of Repository Set](http://lido-schema.org/documents/terminology-recommendation.html#repositorySet_type). For the current location of the object such as a public immovable work of art, use type attribute [Current location](http://terminology.lido-schema.org/lido01018).

**Divergence from LIDO**

- Cardinality (LIDO: 0–unbounded).

**Additional Schematron rules**

Severity: warning

- At least one repositorySet with a non-empty workID is required.

### Examples

```xml
<lido:repositorySet>
  <lido:workID lido:type="http://terminology.lido-schema.org/lido00113">AG2004:10</lido:workID>
</lido:repositorySet>
```

```xml
<lido:repositorySet lido:type="http://terminology.lido-schema.org/lido01018">
  <lido:displayRepository xml:lang="en">The work is situated in the main lobby of the Parliament House (Mannerheimintie 30, Helsinki).</lido:displayRepository>
  <repositoryLocation>
    <lido:namePlaceSet>
      <lido:appellationValue lido:label="katuosoite" xml:lang="fi">Mannerheimintie 30</lido:appellationValue>
    </lido:namePlaceSet>
    <lido:partOfPlace>
      <lido:placeID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="yso">http://www.yso.fi/onto/yso/p94137</lido:placeID>
      <lido:namePlaceSet>
        <lido:appellationValue lido:label="kunta" xml:lang="fi">Helsinki</lido:appellationValue>
      </lido:namePlaceSet>
    </lido:partOfPlace>
  </repositoryLocation>
</lido:repositorySet>
```

---

## resourceDescription

### Description

A text element for the description of the spatial, chronological, or contextual aspects of the object/work as captured in the resource in focus.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#resourceDescription)

### Technical information

**Contained by**

- resourceSet

**May contain**

- xs:string (required)

**Attributes**

- type (optional)
- sortorder (optional)
- xml:lang (optional)
- encodinganalog (optional)
- label (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- Choose the type attribute from the [Terminology for type of resource description](#Terminology-for-Type-of-Resource-Description)
- Element resourceDescription with type attribute "colour content" can be used for the colour content of the resource (e.g. black and white) if this differs from the colour content of the original object. For the colour content of the original object, use [termMaterialsTech](#termMaterialsTech) (within objectMaterialsTechSet/materialsTech).

**Divergence from LIDO**

- Attributes (LIDO: no recommendations for type attribute).

**Additional Schematron rules**

Severity: information

- type and lang are recommended attributes.

### Examples

```xml
<lido:resourceDescription lido:type="colour content" xml:lang="fi">mustavalkoinen</lido:resourceDescription>
```

---

## resourceRepresentation

### Description

A set of structured information about the digital representation of a resource for online presentation.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#resourceRepresentation)

### Technical information

**Contained by**

- resourceSet

**May contain**

- **[linkResource](#linkResource) (required)**
- resourceMeasurementsSet (optional)

**Attributes**

- **type (required)**
  - [LIDO Terminology for Type of Resource Representation](http://lido-schema.org/documents/terminology-recommendation.html#resourceRepresentation_type) extended by four image types (see [Extended terminology for Type of Resource Representation](#Extended-terminology-for-Type-of-Resource-Representation)).

**Cardinality**

- 0–unbounded

**Recording notes**

- For downloadable resources, it is recommended to specify the file size in the resourceMeasurementsSet element.

**Divergence from LIDO**

- Attributes (LIDO: type is optional and chosen from LIDO Terminology for Type of Resource Representation).

**Additional Schematron rules**

Severity: warning

- Type attribute is required for resourceRepresentation.

Severity: information

- If resource type is not thumbnail, resourceMeasurementsSet is a recommended element.

### Examples

```xml
<lido:resourceRepresentation lido:type="image_original">
  <lido:linkResource lido:formatResource="image/jpeg">https://linktoimagefile</lido:linkResource>
  <lido:resourceMeasurementsSet>
    <lido:measurementType>
      <skos:Concept rdf:about="http://www.yso.fi/onto/yso/p4902"/>
      <lido:term xml:lang="en">size</lido:term>
    </lido:measurementType>
    <lido:measurementUnit>
      <lido:term xml:lang="en">MB</lido:term>
    </lido:measurementUnit>
    <lido:measurementValue>10</lido:measurementValue>
  </lido:resourceMeasurementsSet>
</lido:resourceRepresentation>
```

---

## rightsResource

### Description

A set of structured information about rights regarding the image or other resource.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#rightsResource)

### Technical information

**Contained by**

- resourceSet

**May contain**

- **rightsType (required)**
- rightsDate (optional)
- rightsHolder (optional)
- creditLine (optional)

**Attributes**

- sortorder (optional)

**Cardinality**

- 1

**Recording notes**

- The rights statement or license of the resource should be specified in the skos:Concept (or [lido:conceptID](#conceptID)) of rightsType element.
- The rights type of the resource is recommended to be chosen from Creative Common Licenses or Rights Statements.
- If the rights statement [In Copyright](https://rightsstatements.org/vocab/InC/1.0/) is used, it is required to specify the name of the rights holder in rightsHolder/legalBodyName/appellationValue.
- Element creditLine can be used for acknowledgements such as the name of the creator of the resource.
- Use element creditLine with label "usage" for further instructions concerning use, e.g. information about citing or permissions.
- It is recommended to specify the language of the acknowledgements and/or usage instructions by using the lang attribute in creditLine.

**Divergence from LIDO**

- Cardinality (LIDO: 0–unbounded).
- Required elements (LIDO: rightsType is optional).

**Additional Schematron rules**

Severity: warning

- There must be a rightsType with a non-empty skos:Concept (or lido:conceptID).
- If the skos:Concept or lido:conceptID refers to "https://rightsstatements.org/vocab/InC/1.0/", there must be a non-empty rightsHolder/legalBodyName/appellationValue.

Severity: information

- The lang attribute in creditLine element is recommended.

### Examples

```xml
<lido:rightsResource>
  <lido:rightsType>
    <skos:Concept rdf:about="https://rightsstatements.org/vocab/InC/1.0/"/>
    <lido:term>InC</lido:term>
  </lido:rightsType>
  <lido:rightsHolder>
    <lido:legalBodyName>
      <lido:appellationValue>Tove Jansson</lido:appellationValue>
    </lido:legalBodyName>
  </lido:rightsHolder>
  <lido:creditLine xml:lang="en">Photographed by A. Berg</lido:creditLine>
  <lido:creditLine xml:lang="en" lido:label="usage">
    Contact the providing organisation for acquiring permits concerning the people and works represented. When using the image, cite the name of the author, the photographer and the organisation.
  </lido:creditLine>
</lido:rightsResource>
```

---

## subjectActor

### Description

A set of display and index elements for a person, or a group of persons, depicted by an object/work, or what it is about.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#subjectActor)

### Technical information

**Contained by**

- subject

**May contain**

- displayActor (optional)
- **actor (required)**

**Attributes**

- sortorder

**Cardinality**

- 0–unbounded

**Recording notes**

- It is required to specify the name of the actor in actor/nameActorSet/appellationValue.
- It is recommended to use actor/[actorID](#actorID) for the identifier of the actor.

**Divergence from LIDO**

- Mandatory elements (LIDO: actor is optional).

**Additional Schematron rules**

Severity: warning

- There should be a non-empty actor/nameActorSet/appellationValue.

Severity: information

- actor/actorID is a recommended element.

### Examples

```xml
<lido:subjectActor>
  <lido:actor>
    <lido:actorID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="finaf">http://urn.fi/URN:NBN:fi:au:finaf:000057712</lido:actorID>
    <lido:nameActorSet>
      <lido:appellationValue>Eliel Saarinen</lido:appellationValue>
    </lido:nameActorSet>
  </lido:actor>
</lido:subjectActor>
```

---

## subjectConcept

### Description

An index element for the subject matter of the object/work expressed by generic concepts.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#subjectConcept)

### Technical information

**Contained by**

- subject

**May contain**

- skos:Concept (optional – recommended)
- [conceptID](#conceptID) (optional)
- **term (required)**

**Attributes**

- sortorder (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- It is recommended to choose a concept URI from [YSO](http://www.yso.fi/onto/yso/) or [KOKO](http://www.yso.fi/onto/koko/) or another linked open vocabulary.
- If using [conceptID](#conceptID) element, it is recommended to specify the source for the ID in the source attribute of [conceptID](#conceptID). Usually the source code of the vocabulary, chosen for example from the list of [Subject Heading and Term Source Codes](https://www.loc.gov/standards/sourcelist/subject.html).
- It is recommended to specify the language of the term by using the lang attribute in term.

**Divergence from LIDO**

- –

**Additional Schematron rules**

Severity: warning

- A non-empty term is required.
- skos:Concept should only include URIs beginning with "http".
- References to YSO and KOKO concepts in skos:Concept should start with "http:" and not with "https:".
- conceptIDs with source attribute "yso" should begin with "http://www.yso.fi/onto/yso/".
- conceptIDs with source attribute "koko" should begin with "http://www.yso.fi/onto/koko/".
- For YSO, KOKO or other concept URIs, the conceptID should have the type attribute [URI](http://terminology.lido-schema.org/lido00099).

Severity: information

- subjectConcept is a recommended element.
- skos:Concept (or lido:conceptID) is a recommended element within subjectConcept.
- For subjectConcept/conceptID, it is recommended to use the source attribute of conceptID to identify the source for the ID.
- For YSO conceptIDs, the source attribute "yso" is recommended.
- For KOKO conceptIDs, the source attribute "koko" is recommended.
- The lang attribute in term element is recommended.

### Examples

```xml
<lido:subjectConcept>
  <skos:Concept rdf:about="http://www.yso.fi/onto/yso/p3227"/>
  <lido:term xml:lang="fi">puistot</lido:term>
  <lido:term xml:lang="en">parks</lido:term>
</lido:subjectConcept>
```

```xml
<lido:subjectConcept>
  <lido:conceptID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="koko">http://www.yso.fi/onto/koko/p34718</lido:conceptID>
  <lido:term xml:lang="fi">kirkkorakennukset</lido:term>
  <lido:term xml:lang="en">church buildings</lido:term>
  <lido:term xml:lang="sv">kyrkobyggnader</lido:term>
  <lido:term xml:lang="se">girkovisttit</lido:term>
</lido:subjectConcept>
```

---

## subjectDate

### Description

A set of display and index elements for the date or range of dates referred to by an object/work, or what it is about.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#subjectDate)

### Technical information

**Contained by**

- subject

**May contain**

- displayDate (optional - recommended)
- date (optional - recommended)

**Attributes**

- sortorder

**Cardinality**

- 0–unbounded

**Recording notes**

- It is recommended to provide the date both as human-readable text in displayDate and in machine-readable form in date.
- The lang attribute is recommended in displayDate.
- Within date, use [earliestDate](#earliestDate) for the beginning of the timespan and [latestDate](#latestDate) for the end of the timespan.

**Divergence from LIDO**

- –

**Additional Schematron rules**

Severity: information

- subjectDate/displayDate is a recommended element.
- The lang attribute is recommended in subjectDate/displayDate.
- subjectDate/date is a recommended element.

### Examples

```xml
<lido:subjectDate>
  <lido:displayDate xml:lang="fi">1910–1912</lido:displayDate>
  <lido:date>
    <lido:earliestDate lido:type="http://terminology.lido-schema.org/lido00528">1910-01-01</lido:earliestDate>
    <lido:latestDate lido:type="http://terminology.lido-schema.org/lido00528">1912-12-31</lido:latestDate>
  </lido:date>
</lido:subjectDate>
```

```xml
<lido:subjectDate>
  <lido:displayDate xml:lang="fi">23.1.2025</lido:displayDate>
  <lido:date>
    <lido:earliestDate lido:type="http://terminology.lido-schema.org/lido00528">2025-23-01</lido:earliestDate>
    <lido:latestDate lido:type="http://terminology.lido-schema.org/lido00528">2025-23-01</lido:latestDate>
  </lido:date>
</lido:subjectDate>
```

---

## subjectPlace

### Description

A set of display and index elements for a place depicted by the object/work in focus, or what it is about.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#subjectPlace)

### Technical information

**Contained by**

- subject

**May contain**

- displayPlace (optional - recommended)
- [place](#place) (optional - recommended)

**Attributes**

- type (optional)
- sortorder (optional)

**Cardinality**

- 0–unbounded

**Recording notes**

- It is required to include the name of the place either in displayPlace or in event/namePlaceSet/appellationValue. Using both is recommended.
- It is recommended to provide both a displayPlace element gathering information from all [place](#place) and [partOfPlace](#partOfPlace) elements, and a [place](#place) element with more granular information.

**Divergence from LIDO**

- Required elements (LIDO: displayPlace and place/namePlaceSet are both optional).

**Additional Schematron rules**

Severity: warning

- It is required to have either a non-empty displayPlace element, or a non-empty place/namePlaceSet/appellationValue.

Severity: information

- displayPlace is a recommended element.
- place is a recommended element.

### Examples

```xml
<lido:subjectPlace>
  <lido:displayPlace>Käenkuja 3, Helsinki</lido:displayPlace>
  <lido:place>
    <lido:namePlaceSet>
      <lido:appellationValue lido:label="katuosoite" xml:lang="fi">Käenkuja 3</lido:appellationValue>
    </lido:namePlaceSet>
    <lido:gml>
      <gml:Point>
        <gml:pos>60.1852702 24.9618065</gml:pos>
      </gml:Point>
    </lido:gml>
    <lido:partOfPlace>
      <lido:placeID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="yso">http://www.yso.fi/onto/yso/p94137</lido:placeID>
      <lido:namePlaceSet>
        <lido:appellationValue lido:label="kunta" xml:lang="fi">Helsinki</lido:appellationValue>
      </lido:namePlaceSet>
    </lido:partOfPlace>
  </lido:place>
</lido:subjectPlace>
```

---

## termMaterialsTech

### Description

An index element for materials and techniques detected in an object/work.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#termMaterialsTech)

### Technical information

**Contained by**

- materialsTech

**May contain**

- skos:Concept (optional – recommended)
- [conceptID](#conceptID) (optional)
- **term (required)**

**Attributes**

- type (optional – recommended)  
  - See [LIDO Terminology for Type of Term Materials/Techniques](https://lido-schema.org/documents/terminology-recommendation.html#termMaterialsTech_type).
- sortorder (optional)

**Cardinality**

- 1–unbounded

**Recording notes**

- It is recommended to choose a concept from YSO, KOKO or the Metadata thesaurus or another linked open vocabulary.
- It is recommended to specify the language of the term by using the lang attribute in term.
- For the colour of the object (in objectMaterialsTechSet/materialsTech/termMaterialsTech), use type attribute [Color name](http://terminology.lido-schema.org/lido00479).

**Divergence from LIDO**

- Required elements (LIDO: term is optional)

**Additional Schematron rules**

Severity: warning

- A non-empty term is required.

Severity: information

- The lang attribute in term element is recommended.
- Type attribute is recommended.
- skos:Concept (or lido:conceptID) is a recommended element within termMaterialsTech.

### Examples

Object materials example:

```xml
<lido:objectMaterialsTech>
  <lido:materialsTech>
    <lido:termMaterialsTech type="http://terminology.lido-schema.org/lido00479">
      <skos:Concept rdf:about="http://www.yso.fi/onto/koko/p54358"/>
      <lido:term xml:lang="fi">punainen</lido:term>
      <lido:term xml:lang="en">red</lido:term>
    </lido:termMaterialsTech>
  </lido:materialsTech>
</lido:objectMaterialsTech>
```

Event materials example:

```xml
<lido:eventMaterialsTech>
  <lido:materialsTech>
    <lido:termMaterialsTech type="http://terminology.lido-schema.org/lido00132">
      <lido:conceptID lido:type="http://terminology.lido-schema.org/lido00099" lido:source="yso">http://www.yso.fi/onto/yso/p10435</lido:conceptID>
      <lido:term xml:lang="fi">puuvilla</lido:term>
      <lido:term xml:lang="en">cotton</lido:term>
    </lido:termMaterialsTech>
  </lido:materialsTech>
</lido:eventMaterialsTech>
```

---

## titleSet

### Description

A set of structured information about one or more titles or object names with source information.

[Link to the LIDO schema](http://lido-schema.org/schema/v1.1/lido-v1.1.html#titleSet)

### Technical information

**Contained by**

- titleWrap

**May contain**

- **appellationValue (required)**
- sourceAppellation (optional)

**Attributes**

- type (optional)
- sortorder (optional)
- pref (optional)

**Cardinality**

- 1–unbounded

**Recording notes**

- It is recommended not to use extremely short or long titles.
- It is recommended to specify the language of the title by using the lang attribute in appellationValue.

**Divergence from LIDO**

- –

**Additional Schematron rules**

Severity: warning

- At least one titleSet with a non-empty appellationValue is required.

Severity: information

- The lang attribute in appellationValue element is recommended.
- It is recommended that appellationValue has at least 3 and not more than 180 characters.

### Examples

```xml
<lido:titleSet>
  <lido:appellationValue xml:lang="fi" pref="http://terminology.lido-schema.org/lido00169">Ensisijainen otsikko</lido:appellationValue>
  <lido:appellationValue xml:lang="en" pref="http://terminology.lido-schema.org/lido00169">Preferred title</lido:appellationValue>
  <lido:appellationValue xml:lang="sv" pref="http://terminology.lido-schema.org/lido00169">Titel</lido:appellationValue>
  <lido:appellationValue xml:lang="se" pref="http://terminology.lido-schema.org/lido00169">Bajilčálus</lido:appellationValue>
  <lido:appellationValue xml:lang="fi" pref="http://terminology.lido-schema.org/lido00170">Vaihtoehtoinen otsikko</lido:appellationValue>
  <lido:appellationValue xml:lang="en" pref="http://terminology.lido-schema.org/lido00170">Alternate title</lido:appellationValue>
</lido:titleSet>
```

---
