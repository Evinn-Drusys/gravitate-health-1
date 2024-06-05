{% if data["data"]|length> 1%}



RuleSet: {{data["dictionary"]["MajorName"] | lower | regex_replace('[^A-Za-z0-9]+', '') | create_hash_id}}ListRuleset


* identifier.system = "{{data["data"].iloc[0]['identifier_system']}}" 
* identifier.value = "{{data["data"].iloc[0]["identifier_value"]|trim}}"

* status = #current
* mode = #working

* title = "List of all ePIs associated with {{data["dictionary"]["MajorName"]}}"



* subject = Reference({{data["references"]["MedicinalProductDefinition"][0][0]}})
* subject.extension[0].url = "http://ema.europa.eu/fhir/extension/medicine-name"
* subject.extension[=].valueCoding = $100000000005#{{data["dictionary"]["MajorName"]}} "{{data["dictionary"]["MajorName"]}}"
* subject.extension[+].url = "http://ema.europa.eu/fhir/extension/marketing-authorization-holder"
* subject.extension[=].valueCoding = $100000000005#mah-code "None"
* subject.extension[+].url = "http://ema.europa.eu/fhir/extension/active-substance"
* subject.extension[=].valueCoding = $100000000005#acive-substance-code "None"
* subject.extension[+].url = "http://ema.europa.eu/fhir/extension/domain"
* subject.extension[=].valueCoding = $100000000004#100000000012 "H"

* date = "2015-02-07T13:28:17Z"


* identifier[0].system = "http://spor.ema.europa.eu/v2/medicine-name"
* identifier[=].value = "{{data["dictionary"]["MajorName"]}}"



{% for index,row in data["data"].iterrows() %}
{% if row["skip"] not in ['y', 'Y', 'x', 'X'] %}

* entry
  * flag = urn:oid:1.2.36.1.2001.1001.101.104.16592#01
  * flag.text = "Unchanged"
  * date = "2015-02-07T13:28:17Z"
  * item = Reference(bundlepackageleaflet-{{row["language"]}}-{{data["dictionary"]["productname"] | lower | regex_replace('[^A-Za-z0-9]+', '') | create_hash_id}}) // {{data["dictionary"]["productname"]}} {{row["language"]}}
  * item.extension[0].url = "http://ema.europa.eu/fhir/extension/documentType"
  * item.extension[=].valueCoding = $100000155531#100000155538 "B. PACKAGE LEAFLET"
  * item.extension[+].url = "http://ema.europa.eu/fhir/extension/language"
  * item.extension[=].valueCoding = $100000072057#100000072147 "{{row["language"]}}"


{% endif %}
{% endfor %}


{% for k,v in data["processed_data"].items() %}
//{{k}}
//{{v}}
{% if k==data["data"].iloc[0]["identifier_value"]|trim %}

* entry
  * flag = urn:oid:1.2.36.1.2001.1001.101.104.16592#02
  * flag.text = "preprocessed"
  * date = "2015-02-07T13:28:17Z"
  * item = Reference({{v[0]}})
  * item.extension[0].url = "http://ema.europa.eu/fhir/extension/documentType"
  * item.extension[=].valueCoding = $100000155531#100000155538 "B. PACKAGE LEAFLET"
  * item.extension[+].url = "http://ema.europa.eu/fhir/extension/language"
  * item.extension[=].valueCoding = $100000072057#100000072147 "{{v[1]}}"
{% endif %}

{% endfor %}



Instance: List-{{data["dictionary"]["productname"] | lower | regex_replace('[^A-Za-z0-9]+', '') | create_hash_id}}
InstanceOf: List

* insert {{data["dictionary"]["MajorName"] | lower | regex_replace('[^A-Za-z0-9]+', '') | create_hash_id}}ListRuleset
{%- endif %}


