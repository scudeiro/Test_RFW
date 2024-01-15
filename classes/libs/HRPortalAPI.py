from APIbasic import APIbasic

class HRPortalAPI(APIbasic):
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, environment):
        super().__init__(environment)

    def get_from_json(self, json, jsonpath, unique=True):
        """Get values from ``Json`` defined by ``Json Path``.

        | JSONPath | Description |
        | $ | the root object/element |
        | @ | the current object/element |
        | . or [] | child operator |
        | .. | recursive descent |
        | * | wildcard. All objects/elements regardless their names |
        | [] | subscript operator. XPath uses it to iterate over element collections and for predicates |
        | [,] | Union operator in XPath results in a combination of node sets. JSONPath allows alternate names or array indices as a set |
        | [start:end:step] | array slice operator |
        | ?() | applies a filter (script) expression |
        | () | script expression, using the underlying script engine |

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | json | Yes | Json structure | <long> | N/A |
        | jsonpath | No | Json path | <int> | N/A |
        | unique | No | Define the return mode | <bool> | `True` |

        *Output Arguments:*
        If ``unique`` is ``False`` return a list of values found.
        If ``unique`` is ``True`` return the first value found.

        *Examples:*
        | @{values}= | Get From Json | ${json} | $.name | ${False} |
        | ${value}= | Get From Json | ${json} | $.name |"""
        # Owner: Bruno Calado
        # Tag: DONE
        return self._get(json=json, jsonpath=jsonpath, unique=unique)

    def change_category_properties_by_api(self, *categories):
        """Uses HR API to change ``category`` properties according to data model.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | categories | Yes | Category object | <Category> | N/A |

        *Output Arguments:*
        N/A

        *Examples:*
        | Change Category Properties By API | ${CategoryNews} | ${CategorySocialClubs} |
        | Change Category Properties By API | ${CategoryNews} |
        """
        # Owner: Bruno Calado
        # Tag: DONE
        categories_json = [category.get_json() for category in categories]
        body = {"CategoryList": categories_json}
        self._post_categories(body)

    def set_article_by_api(self, *articles):
        """Uses HR API to add an ``article`` to the application under test (AUT).

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | articles | Yes | Article object | <Article> | N/A |

        *Output Arguments:*
        | Argument | Summary | Values |
        | articles_code | List of article code | <list> |

        *Examples:*
        | ${article_codes}= | Set Article By API | ${NewsArticle01} | ${NewsArticle02} |
        | ${article_codes}= | Set Article By API | ${NewsArticle01} |
        | Set Article By API | ${NewsArticle01} | ${NewsArticle02} |
        | Set Article By API | ${NewsArticle01} |
        """
        # Owner: Bruno Calado
        # Tag: DONE
        articles_json = [article.get_json() for article in articles]
        body = {"Article": articles_json}
        codes = self._post_articles(body)
        for article, code in zip(articles, codes):
            article.code = code
        return codes

    def delete_article_by_api(self, *articles):
        """Uses HR API to delete an ``article`` from AUT.
        It fails if ``article`` not found

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | articles | Yes | Article object | <Article> | N/A |

        *Output Arguments:*
        N/A

        *Examples:*
        | Delete Article By API | ${NewsArticle01} | ${NewsArticle02} |
        | Delete Article By API | ${NewsArticle01} |
        """
        # Owner: Bruno Calado
        # Tag: DONE
        ids = [article.code for article in articles]
        self._delete_article(ids)
        for article in articles:
            article.code = 0
        return ids

    def change_employee_properties_by_api(self, *employees):
        """Uses HR API to change ``employee`` properties according to data model.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | employees | Yes | Employee object | <Category> | N/A |

        *Output Arguments:*
        | Argument | Summary | Values |
        | employee_codes | List of employees code | <list> |

        *Examples:*
        | ${employee_codes}= | Change Employee Properties By API | ${OSQuayCelia} | ${OSQuayInes} |
        | Change Employee Properties By API | ${OSQuayCelia} |
        """
        # Owner: Bruno Calado
        # Tag: DONE
        employees_json = [employee.get_json() for employee in employees]
        codes = self.post_employees(employees_json)
        return codes

    def count_employee_by_api(self, company=None, associated=None):
        """Uses HR API to count the ``employees``. Can be filtered by a ``company``and ``associated``.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | company | No | Main Company Object | <Company> | None |
        | associated | No | Associated Company Object | <Company> | None |

        *Output Arguments:*
        | Argument | Summary | Values |
        | count | Number of Employees | <int> |

        *Examples:*
        | ${count}= | Count Employee By API | company=${CompanyOSQuay} | associated=${CompanyOSQuay} |
        | ${count}= | Count Employee By API | company=${CompanyOSQuay} |
        | ${count}= | Count Employee By API | associated=${CompanyOSQuay} |
        | ${count}= | Count Employee By API |
        """
        # Owner: Bruno Calado
        # Tag: DONE
        count = 0
        limit = 50
        offset = 0
        is_end = False
        while not(is_end):
            employees = self._get_employees(limit=limit, offset=offset)
            codes = self.get_from_json(employees, "$[*].Code", unique=False)
            filter = set(codes)
            if not(company is None):
                sample = [ employee['Code'] for employee in employees if employee['MainCompany']['Id']==company.code ]
                filter = filter.intersection(sample)
            if not (associated is None):
                sample = [ employee['Code'] for employee in employees if associated.code in self.get_from_json(employee, "$.AssociatedCompanies[*].Id", unique=False) ]
                filter = filter.intersection(sample)
            count += len(filter)
            offset += limit
            is_end = len(codes)!=limit
        return count
