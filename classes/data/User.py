#!/usr/bin/env python
# -*- coding: utf-8 -*-


class User(object):
    def __init__(self, username, password, code=None, fullname=None, phone=None, email=None, role=None,
                 organization=None, job=None, gender=None, birthday=None, entry_date=None, end_date=None, company=None,
                 country=None, state=None, location=None, type=None, nif=None, iban=None, salary=None, food_type=None,
                 food_iban=None, food_amount=None, civil=None, holders=None, dependents=None, timesheet=None,
                 evaluation=None, co_evaluators=None, skype=None, linkedin=None, picture=None):
        self.username = username
        self.password = password
        self.code = code
        self.fullname = fullname
        self.phone = phone
        self.email = email
        self.role = role
        self.organization = organization
        self.job = job
        self.gender = gender
        self.birthday = birthday
        self.entry_date = entry_date
        self.end_date = end_date
        self.company = company
        self.country = country
        self.state = state
        self.location = location
        self.type = type
        self.nif = nif
        self.iban = iban
        self.salary = salary
        self.food_type = food_type
        self.food_iban = food_iban
        self.food_amount = food_amount
        self.civil = civil
        self.holders = holders
        self.dependents = dependents
        self.timesheet = timesheet
        self.evaluation = evaluation
        self.co_evaluators = co_evaluators
        self.skype = skype
        self.linkedin = linkedin

    def get_json(self):
        json = {
            "Code": self.code,
            #"CompanyCode": self.company.code,
            "Birthday": self.birthday,
            "EntryDate": self.entry_date,
            "EndedOn": self.end_date
        }
        return json
