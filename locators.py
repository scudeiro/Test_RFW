from attrdict import AttrDict


home = AttrDict()
home["close_warning"] = "xpath://button[@id='onetrust-accept-btn-handler']"
home["send_menu"]     = "xpath://li[@class='has-drop drop-grid-3']/a[contains(text(),'Enviar')]"

send = AttrDict()
send["title"]        = "xpath://div[@class='slide-caption-wrap caption-background']//h6[contains(.,'Enviar')]"
send["find_zipcode"] = "(//div[@class='tools']//li)[2]/a"

find_zipcodes = AttrDict()
find_zipcodes["find_address"] = "(//div[@class='content']//li)[2]"
find_zipcodes["zip4"]         = "id:cp4"
find_zipcodes["zip3"]         = "id:cp3"
find_zipcodes["submit"]       = "id:buttonAddressSearch"
find_zipcodes["clean"]        = "id:addressSearchClear"
find_zipcodes["results"]      = "id:postalCodeSearchResult"
find_zipcodes["address"]      = "(//div[@class='highlighted-result']/h4)[1]"
find_zipcodes["city"]         = "(//div[@class='highlighted-result']/h4)[2]"
find_zipcodes["zipcode"]      = "//div[@class='highlighted-result']/h2"
find_zipcodes["all_results"]  = "//div[@class='highlighted-result']"