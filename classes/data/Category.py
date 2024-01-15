#!/usr/bin/env python
# -*- coding: utf-8 -*-


class Category(object):
    def __init__(self, code, name, icon, companies, owners, main_category):
        self.code = code
        self.name = name
        self.icon = icon
        self.companies = companies # list
        self.owners = owners # list
        self.main_category = main_category


    def get_json(self):
        companies = [ {"Code" : company.code} for company in self.companies]
        owners = [ {"Code" : owner.code} for owner in self.owners]
        json = {
            "Code": self.code,
            "CompanyList": companies,
            "OwnerList": owners
        }
        return json
