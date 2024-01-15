#!/usr/bin/env python
# -*- coding: utf-8 -*-

class Article(object):
    def __init__(self, title, summary, description, category, main_category, companies, code=0, photo=None, links=[]):
        self.code = code  # fill in API creation
        self.main_category = main_category
        self.title = title
        self.summary = summary
        self.description = description
        self.category = category
        self.photo = photo
        self.links = links
        self.companies = companies

    def get_json(self):
        links = [ link.get_json() for link in self.links]
        companies = [{"Code": company.code} for company in self.companies]
        json = {
            "Code" : self.code,
            "Title" : self.title,
            "Description" : self.description,
            "Resume" : self.summary,
            "Category": {
                "Code": self.category.code
            },
            "AssociatedPhotoCode": self.photo,
            "IsActive": True,
            "LinkList": links,
            "CompanyList": companies
        }
        return json

class Link(object):
    def __init__(self, text, url, code=0):
        self.code = code  # fill in API creation
        self.text = text
        self.url = url

    def get_json(self):
        json = {
            "Code": self.code,
            "LinkText": self.text,
            "URL": self.url
        }
        return json
