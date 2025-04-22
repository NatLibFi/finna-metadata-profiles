# Finna’s repository for the application of EAD3 and LIDO formats in Finna

This repository contains application profiles and guidelines for using EAD3 and LIDO metadata formats with Finna. The guidelines are organized into format-specific folders.

## EAD3 Format Template

The folder related to the EAD3 format currently contains an XML-based EAD3 template. This template describes which fields of the [EAD3 schema version 1.1.2](https://www.loc.gov/ead/EAD3taglib/index.html) Finna requires and recommends using, as well as the format in which the information should be presented in these fields. By following this template, you ensure that the data is compatible with Finna's quality requirements and technical requirements. Additional guidelines for using the EAD3 format in Finna can be found in [Finna's customer wiki](https://www.kiwi.fi/x/RhRiBQ).

### The latest version

The version number is included in the end of the file name. The template may be updated, and the latest versions will be added to the EAD3 folder.

## LIDO Format Template and Application Profile

The folder related to the LIDO format contains the LIDO application profile. The LIDO format template will be added to the repository in the future.

The LIDO application profile contains a comprehensive documentation of Finna's guidelines for using LIDO format. The application profile defines which elements and attributes of the LIDO Schema Version 1.1 are mandatory or recommended in Finna, and provides instructions and examples how to use them. Furthermore, it includes recommendations for the use of linked open vocabularies, terminologies and controlled formats. Besides documentation, the application profile contains files that can be used to validate a LIDO record against the profile's requirements and recommendations.

The application profile consists of four documents:
- An HTML document describing the contents of the profile in human-readable format.
- An XSD file (XML Schema Definition) that defines the application profile and can be used to validate LIDO records with XML validation tools. XSD validation can only check the presence and the order of LIDO elements, not their content.
- An SCH file containing the Schematron rules defined in the application profile. Schematron rules include requirements and recommendations for the attributes and contents of LIDO elements. If you are using a XML validation tool that supports SCH, you can use this file directly to validate a LIDO record against the Schematron rules.
- An XSL file, generated from the SCH file, that can also be used to validate a LIDO record against the Schematron rules by applying the XSL file to the LIDO record with a tool that supports XSLT2.

### How to use the application profile

#### Reading the documentation

To read the documentation, download the HTML file and open it in a web browser.

#### Validating a LIDO record

Tools used in examples:
- xmllint (available by default of macOS, on Linux it typically comes with libxml2 or libxml2-utils package
- xslt3 ([SaxonJS](https://www.saxonica.com/html/saxonjs/index.html) node.js CLI package)

To validate a LIDO document against the application profile XSD, you may use the XSD file with any XML validation tool, such as an XML editor with XSD support or a command line validator. Example how to validate a LIDO record lidorecord.xml with command line tool xmllint:

    xmllint --noout --schema lido-v1.1-profile-FINNA-v0.1.xsd lidorecord.xml 

To validate a LIDO document against the Schematron rules defined in the application profile, you may use any tool that supports SCH or XSLT2 validation. Example how to validate a LIDO record lidorecord.xml against all Schematron rules with command line tool xslt3:

    xslt3 -s:lidorecord.xml -xsl:lido-v1.1-profile-FINNA-v0.1.xsl

Schematron rules are divided in two categories by their severity level. Severity level "warning" includes rules that should be followed to pass validation. Using for example command line tools xslt3 and xmllint, running the following command will print a list of warnings:

    xslt3 -s:lidorecord.xml -xsl:lido-v1.1-profile-FINNA-v0.1.xsl | xmllint --xpath "//*[local-name()='schematron-output']/*[local-name()='failed-assert' and @role='WARN']/*[local-name()='text']/text()" -

Schematron rules of severity type "information" contain recommendations that are not necessary to pass validation, but may help to improve the richness and the quality of the data. Using for example command line tools xslt3 and xmllint, running the following command will print a list of recommendations:

    xslt3 -s:lidorecord.xml -xsl:lido-v1.1-profile-FINNA-v0.1.xsl | xmllint --xpath "//*[local-name()='schematron-output']/*[local-name()='failed-assert' and @role='INFO']/*[local-name()='text']/text()" -

### The latest version

The subfolders in the LIDO folder are named by the version number and contain all files related to the specific version. Currently, only the first public beta version of the LIDO application profile is available. When a new version of the profile is published, it will be added to the LIDO folder.
