from attrdict import AttrDict

TOKEN1 = "s9b1vPVO7MU5jATX6O74LoZn6BycwOfHGZ5!Oz4U8WkfnndPRgMUoMNtebPloWqM9t67POXBwYmTXcVqh8IMdhiQox/G=52xAuGv?Fekfa49bVKg35qeBow8LzDEPwB8sWlcOw5REtH6v4XszsY7oBwYBo4AJv5gdmaxLT?rJWM-uuGR6mVB=YdM/oyo8ZMeb=wzOuVcnUIPamlLC2Mr?kkx61rIRZqJKgsE1gjzoAaecpmuCUlGHhlDg4rafhkd"
TOKEN2 = "Xh3VEdVbgjH9WCaMtQbFSYQsfu-TxfO7Gx4WU=J2n!v5xU7BJPJLWKOW3N=inf8Eg5/0-Ded8!dw5AwpLxmJwqzLCBcSPY!4C1m0A1D3ZhtxexQyBdoUHAzeoekb9mQ!z-/=h2brPh4fzerHrUL!lwyJMRNjNd=HH-ZzDZbFDGaNj87dUnGRqf6!k6ec!HNPxr2BlL394p2B?RlYNw8RLo9-ZsYW0WEBlVa=sj94P09H!nOd-e=/LNOhMgOH?wLi"

DOMAINS = {
    "dev"  : "https://hrportaldev.iohub.pt/HR_Portal_API/rest",
    "prod" : "https://hrportal.iohub.pt/HR_Portal_API/rest",
}

SERVICES = {
    "delete_article": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/News/#!/News/Articles_Delete",
        method="DELETE",
        url="News/Articles",
        options="",
        token=TOKEN1,
        include=[],
    ),
    "post_articles": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/News/#!/News/Article_CreateOrUpdate",
        method="POST",
        url="News/Articles",
        options="",
        token=TOKEN1,
        include=[],
    ),
    "get_articles": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/News/#!/News/Articles_Get",
        method="GET",
        url="News/Articles",
        options="Limit={Limit}&Offset={Offset}&Include={Include}",
        token=TOKEN1,
        include=["Links", "Photos"],
    ),
    "get_article": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/News/#!/News/Articles_GetById",
        method="GET",
        url="News/Articles/{}",
        options="Include={Include}",
        token=TOKEN1,
        include=["Links", "Photos"],
    ),
    "get_categories": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/News/#!/News/Categories_Get",
        method="GET",
        url="News/Categories",
        options="Limit={Limit}&Offset={Offset}&Include={Include}",
        token=TOKEN1,
        include=["MainCategory", "Companies", "Owners", "Photos"],
    ),
    "post_categories": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/News/#!/News/Categories_Update",
        method="POST",
        url="News/Categories",
        options="",
        token=TOKEN1,
        include=[],
    ),
    "get_category": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/News/#!/News/Categories_GetById",
        method="GET",
        url="News/Categories/{}",
        options="Include={Include}",
        token=TOKEN1,
        include=["MainCategory", "Companies", "Owners", "Photos"],
    ),
    "get_main_categories": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/News/#!/News/MainCategories_Get",
        method="GET",
        url="News/MainCategories",
        options="",
        token=TOKEN1,
        include=[],
    ),
    "get_main_category": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/News/#!/News/MainCategories_GetById",
        method="GET",
        url="News/MainCategories/{}",
        options="",
        token=TOKEN1,
        include=[],
    ),
    "get_companies": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/Directory/#!/Directory/Companies_Get",
        method="GET",
        url="Directory/Companies",
        options="Limit={Limit}&Offset={Offset}&Include={Include}",
        token=TOKEN2,
        include=["Links", "Photos"],
    ),
    "get_employees": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/Directory/#!/Directory/Employees_Get",
        method="GET",
        url="Directory/Employees",
        options="Limit={Limit}&Offset={Offset}&Include={Include}",
        token=TOKEN2,
        include=["Picture"],
    ),
    "get_employees_construction": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/Directory/#!/Directory/Employees_Get_UnderConstruction",
        method="GET",
        url="Directory/Employees/Construction",
        options="Limit={Limit}&Offset={Offset}&Include={Include}",
        token=TOKEN2,
        include=["Picture"],
     ),
    "post_employees": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/Directory/#!/Directory/Employee_Post",
        method="POST",
        url="Directory/Employees",
        options="",
        token=TOKEN2,
        include=[],
    ),
    "get_job_titles": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/Directory/#!/Directory/JobTitles_Get",
        method="GET",
        url="Directory/JobTitles",
        options="",
        token=TOKEN2,
        include=[],
    ),
    "get_office_locations": AttrDict(
        doc="https://hrportaldev.iohub.pt/HR_Portal_API/rest/Directory/#!/Directory/OfficeLocations_Get",
        method="GET",
        url="Directory/OfficeLocations",
        options="",
        token=TOKEN2,
        include=[],
    ),
}


