import requests
import sys
from HRPortalAPI_data import DOMAINS
from HRPortalAPI_data import SERVICES
from jsonpath import JSONPath as jpath
import urllib3
urllib3.disable_warnings()


class APIbasic(object):
    AUTH_HEADER = "Authorization"

    def __init__(self, environment):
        if not(environment.lower() in DOMAINS):
            raise AssertionError(f"Environment '{environment}' is not available!")
        self.domain = DOMAINS[environment.lower()]

    def __send(self, service, body, *replaces, **options):
        """
        Send a request and verify the response code.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        if not (service.lower() in SERVICES):
            raise AssertionError(f"Service '{service}' is not available!")
        service_data = SERVICES[service.lower()]
        path = service_data.url.format(*replaces)
        options = service_data.options.format(**options)
        url = f"{self.domain}/{path}?{options}"
        response = requests.request(service_data.method, url, json=body, headers={self.AUTH_HEADER : service_data.token}, verify=False)
        if not (response.ok):
            name = sys._getframe(1).f_code.co_name
            raise AssertionError(f"request '{name}' return {response.status_code} - {response.reason}")
        if len(response.text):
            return response.json()
        return response.text

    def __check_number_argument(self, argument):
        """
        Verify if ``argument`` is a number.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        if isinstance(argument, int):
            return
        if not(len(argument)) or argument.isdigit():
            return
        raise AssertionError(f"Argument '{argument}' is not a number")

    def __check_choice_argument(self, argument, service):
        """
        Verify if ``argument`` is valid according to ``service`` data.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        if argument == "":
            return
        if not isinstance(argument, str):
            raise AssertionError(f"Argument '{argument}' is not a string")
        if not (service.lower() in SERVICES):
            raise AssertionError(f"Service '{service}' is not available!")
        service_data = SERVICES[service.lower()]
        items = argument.split(",")
        for item in items:
            if not (item in service_data.include):
                raise AssertionError(f"Value '{argument}' is not valid!")

    def _get(self, json, jsonpath, unique=True):
        """
        Get values from ``Json`` defined by ``Json Path``.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        if not len(json):
            return []
        values = jpath(jsonpath).parse(json)
        if unique:
            return values[0]
        return values

    ### CATEGORY
    def _get_categories(self, limit=50, offset=0, include=""):
        """
        Retrieve ``categories`` via API.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        self.__check_number_argument(limit)
        self.__check_number_argument(offset)
        self.__check_choice_argument(include, "get_categories")
        return self.__send("get_categories", None, Limit=limit, Offset=offset, Include=include)

    def _get_category(self, category, include=""):
        """
        Retrieve a ``category`` via API.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        self.__check_choice_argument(include, "get_category")
        return self.__send("get_category", None, category, Include=include)

    def _post_categories(self, body):
        """
        Change a ``category`` properties via API.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        return self.__send("post_categories", body)

    def _get_main_categories(self):
        """
        Retrieve ``main categories`` via API.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        return self.__send("get_main_categories", None)

    def _get_main_category(self, category):
        """
        Retrieve a ``main category`` via API.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        self.__check_number_argument(category)
        return self.__send("get_main_category", None, category)

    ### ARTICLE
    def _get_articles(self, limit=50, offset=0, include=""):
        """
        Retrieve ``articles`` via API.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        self.__check_number_argument(limit)
        self.__check_number_argument(offset)
        self.__check_choice_argument(include, "get_articles")
        return self.__send("get_articles", None, Limit=limit, Offset=offset, Include=include)

    def _get_article(self, article, include=""):
        """
        Retrieve a ``article`` via API.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        self.__check_number_argument(article)
        self.__check_choice_argument(include, "get_article")
        return self.__send("get_article", None, article, Include=include)

    def _delete_article(self, body):
        """
        Delete a ``article`` via API. If the article doesn't exist the keyword fails.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        return self.__send("delete_article", body)

    def _post_articles(self, body):
        """
        Change ``articles`` properties via API.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        return self.__send("post_articles", body)

    ### COMPANY
    def _get_companies(self):
        """
        Retrieve ``companies`` via API.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        return self.__send("get_companies", None)

    ### EMPLOYEE
    def _get_employees(self, limit=50, offset=0, include=""):
        """
        Retrieve ``employees`` via API.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        self.__check_number_argument(limit)
        self.__check_number_argument(offset)
        self.__check_choice_argument(include, "get_employees")
        return self.__send("get_employees", None, Limit=limit, Offset=offset, Include=include)

    def _get_employees_construction(self, limit=50, offset=0, include=""):
        """
        Retrieve ``employees`` via API.
        """
        # Owner: Bruno Calado
        # Tag: TODO
        self.__check_number_argument(limit)
        self.__check_number_argument(offset)
        self.__check_choice_argument(include, "get_employees_construction")
        return self.__send("get_employees_construction", None, Limit=limit, Offset=offset, Include=include)

    def _post_employees(self, body):
        """
        Change a ``employees`` properties via API.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        return self.__send("post_employees", None)

    def _get_job_titles(self):
        """
        Retrieve ``job titles`` via API.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        return self.__send("get_job_titles", None)

    def _get_office_locations(self):
        """
        Retrieve ``office locations`` via API.
        """
        # Owner: Bruno Calado
        # Tag: DONE
        return self.__send("get_office_locations", None)
