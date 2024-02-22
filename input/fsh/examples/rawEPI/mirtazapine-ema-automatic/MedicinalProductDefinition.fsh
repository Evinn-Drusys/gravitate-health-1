
Instance: mp7a7ff0f4e1993c2fdabba6c8d9931a52
InstanceOf: MedicinalProductDefinitionUvEpi
Title: "Medicinal Product MIRTAZAPINA CINFA 30 mg Coated Tablet"
Description: "MIRTAZAPINA CINFA 30 mg Coated Tablet"
Usage: #inline

 
* identifier[+].system = "https://spor.ema.europa.eu/pmswi"
* identifier[=].value = "67.068" 
* identifier[+].system = "https://www.who-umc.org/phpid"
* identifier[=].value = "0x6c47381b040e5b588db23b2272f28eec"
* type = http://hl7.org/fhir/medicinal-product-type#MedicinalProduct "Medicinal Product"

* domain = http://hl7.org/fhir/medicinal-product-domain#Human "Human use"

* status = http://hl7.org/fhir/publication-status#active "active"





* legalStatusOfSupply = $spor-rms#100000000000 ""


* name
  * productName = "MIRTAZAPINA CINFA 30 mg Coated Tablet"
  * type = $spor-productNamePartType-cs#220000000001 "Full name" 
  
  * part[0]
    * part = "Mirtazapine Cinfa"
    * type = $spor-productNamePartType-cs#220000000002 "Invented name part"
  
  * part[+]
    * part = "Mirtazapine"
    * type = $spor-productNamePartType-cs#220000000003 "Scientific name part"
  
  * part[+]
    * part = "30 mg"
    * type = $spor-productNamePartType-cs#220000000004 "Strength part"
  
  * part[+]
    * part = "coated tablet"
    * type = $spor-productNamePartType-cs#220000000005 "Pharmaceutical dose form part"
  
  * usage
    * country = urn:iso:std:iso:3166#ES "Spain"
    * jurisdiction = urn:iso:std:iso:3166#ES "Spain"
    * language = urn:ietf:bcp:47#en  "English"

