#!/usr/bin/env python
# -*- coding: utf-8 -*-

from classes.data.Category import Category
from companies import *
from users import *
from main_categories import *

CategoryNews = Category(code=13,                            name="News",
                        icon = "fa-newspaper-o",            companies=[CompanyITUpPortugal, CompanyITUpSingapore, CompanyOSQuay],
                        main_category=MainCategoryNews,     owners=[OSQuayBernardo, OSQuayCelia, OSQuayAnyone, OSQuayEmployeeRole, Admin1],
                        )

CategoryProcedures = Category(code=14,                      name="Procedures",
                        icon = "fa-users",                  companies=[CompanyITUpPortugal, CompanyOSQuay],
                        main_category=MainCategoryNews,     owners=[OSQuayCelia, OSQuayAnyone, OSQuayAVieira, Admin1],
                        )

CategoryProceduresOwner = Category(code=14,                 name="Procedures",
                        icon = "fa-users",                  companies=[CompanyITUpPortugal, CompanyOSQuay],
                        main_category=MainCategoryNews,     owners=[OSQuayCelia, OSQuayAnyone, OSQuayAVieira, Admin1, Employee1],
                        )

CategoryProceduresCompany = Category(code=14,               name="Procedures",
                        icon = "fa-users",                  companies=[CompanyOSQuay],
                        main_category=MainCategoryNews,     owners=[OSQuayCelia, OSQuayAnyone, OSQuayAVieira, Admin1],
                        )

CategorySocialClub = Category(code=1,                       name="Social Club",
                        icon = "fa-group",                  companies=[CompanyITUpPortugal, CompanyITUpSingapore, CompanyOSQuay],
                        main_category=MainCategoryClubs,    owners=[OSQuayAlexandra, Admin1],
                        )

CategorySocialClubOwner = Category(code=1,                  name="Social Club",
                        icon = "fa-group",                  companies=[CompanyITUpPortugal, CompanyITUpSingapore, CompanyOSQuay],
                        main_category=MainCategoryClubs,    owners=[OSQuayAlexandra, Admin1, Employee1],
                        )

CategorySocialClubCompany = Category(code=1,                name="Social Club",
                        icon = "fa-group",                  companies=[CompanyOSQuay],
                        main_category=MainCategoryClubs,    owners=[OSQuayAlexandra, Admin1],
                        )

CategoryIOHUBTalkSessions = Category(code=4,                name="IOHUB Talk Sessions",
                        icon = "fa-microphone",             companies=[CompanyOSQuay],
                        main_category=MainCategoryCareer,   owners=[Admin1],
                        )

CategoryIOHUBTalkSessionsOwner = Category(code=4,           name="IOHUB Talk Sessions",
                        icon = "fa-microphone",             companies=[CompanyOSQuay],
                        main_category=MainCategoryCareer,   owners=[Admin1, Employee1],
                        )