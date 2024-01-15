#!/usr/bin/env python
# -*- coding: utf-8 -*-

from classes.data.User import User
from companies import *
from job_titles import *
from office_locations import *

#__all__=["autoemployee1", "automanager", "autoadmin", "invaliduser", "autoemployee2", "autoemployee3", "autoemployee4"]

OSQuayBernardo = User(username="bernardo.simoes", password="iohub321", fullname="Bernardo Simões", code=6378)
OSQuayAlexandra = User(username="alexandra.palma",  password="iohub321",   fullname="Alexandra Palma",code=6602)
OSQuayCelia = User(username="celia.roma", password="iohub321", fullname="Celia Roma",code=6524)
OSQuayInes = User(username="ines.peguincha", password="iohub321", fullname="Inês Peguicha", code=6169)
OSQuayVanda = User(username="vanda.miranda", password="iohub321", fullname="Vanda Miranda", code=6498)
OSQuayAnyone = User(username="anyone.people", password="iohub321", fullname="André People", code=6604)
OSQuayEmployeeRole = User(username="employee.role", password="iohub321", fullname="Employee User Role", code=7115)
OSQuayAVieira = User(username="andre.vieira", password="iohub321", fullname="André Vieira", code=6527)

Admin1    = User(username="auto.admin",                        password="123456",                       fullname="Automation Administrator",
                     phone = "918889900",                      email="auto.admin@osquay.com",           role="Admin",
                     organization = "Org OSQuay 2",            job="CEO",                               gender="Male",
                     birthday="1978-04-04",                    entry_date="2022-01-01",                 end_date="2032-01-01",
                     company=CompanyOSQuay,                    country="Portugal",                      state="Porto",
                     location=OfficeLaV,                       type="Internal",                         nif="777888999",
                     iban="PT50000744958650058656017",         salary="2500",                           food_type="Card",
                     food_iban="PT50000744958650058656017",    food_amount="10",                        civil="Married",
                     holders="1",                              dependents="0",                          timesheet=OSQuayBernardo,
                     evaluation=OSQuayBernardo,                co_evaluators=OSQuayBernardo,            code=6843
                     )

Manager1    = User(username="auto.manager",                    password="123456",                       fullname="Automation Manager",
                     phone = "912223344",                      email="auto.manager@osquay.com",         role="Manager",
                     organization = "Org OSQuay 2",            job=JobDeliveryManager,                  gender="Male",
                     birthday="1979-03-03",                    entry_date="2022-01-01",                 end_date="2032-01-01",
                     company=CompanyOSQuay,                    country="Portugal",                      state="Castelo Branco",
                     location=OfficeAzores,                    type="Internal",                         nif="111222333",
                     iban="PT50000744958650058656017",         salary="2000",                           food_type="Card",
                     food_iban="PT50000744958650058656017",    food_amount="10",                        civil="Married",
                     holders="1",                              dependents="1",                          timesheet=Admin1,
                     evaluation=OSQuayBernardo,                co_evaluators=Admin1,                    code=6842,
                     skype="automanager",                      linkedin="automanager"
                     )

SalaryAdmin1    = User(username="salary.admin",                password="iohub321",                     fullname="André People",
                     phone = "919407729",                      email="ines.peguicha@gmail.com",         role="HRSalaryManager",
                     organization = "Org OSQuay 2",            job=JobHRManager,                        gender="Female",
                     birthday="1980-12-17",                    entry_date="2019-07-01",                 end_date="",
                     company=CompanyOSQuay,                    country="Portugal",                      state="Lisboa",
                     location=OfficeLaV,                       type="Internal",                         nif="500000000",
                     iban="PT50078101120112001275790",         salary="2000",                           food_type="cash",
                     food_iban="PT50078101120112001275790",    food_amount="10",                        civil="Married",
                     holders="0",                              dependents="3",                          timesheet=OSQuayInes,
                     evaluation=OSQuayInes,                    co_evaluators=OSQuayVanda,               code=6604
                     )

Employee1 = User(username="auto.employee1",                    password="123456",                       fullname="Automation Employee1",
                     phone = "915556677",                      email="auto.employee1@osquay.com",       role="Employee",
                     organization = "Org OSQuay 2",            job=JobDeveloper,                         gender="Female",
                     birthday="1980-07-02",                    entry_date="2022-01-01",                 end_date="2032-01-01",
                     company=CompanyOSQuay,                    country="Portugal",                      state="Lisboa",
                     location=OfficeLaV,                       type="Internal",                         nif="444555666",
                     iban="PT50000744958650058656017",         salary="1500",                           food_type="Card",
                     food_iban="PT50000744958650058656017",    food_amount="7",                         civil="Single",
                     holders="0",                              dependents="0",                          timesheet=Manager1,
                     evaluation=Manager1,                      co_evaluators=Manager1,                  code=6840,
                     skype="autoemployee1",                    linkedin="autoemployee1"
                     )


"""
autoemployee2 = User(username="auto.employee2",                password="123456",                       fullname="Automation Employee2",
                     phone = "915556679",                      email="auto.employee2@osquay.com",       role="Employee",
                     organization = "Org OSQuay 2",            job="Developer",                         gender="Female",
                     birthday="1981-08-03",                    entry_date="2022-02-02",                 end_date="2032-02-02",
                     company="OSQuay",                         country="Portugal",                      state="Lisboa",
                     location="LaV",                           type="Internal",                         nif="444555777",
                     iban="PT50000744958650058656017",         salary="1500",                           food_type="Card",
                     food_iban="PT50000744958650058656017",    food_amount="7",                         civil="Single",
                     holders="0",                              dependents="0",                          timesheet="auto.manager",
                     evaluation="auto.manager",                co_evaluators="auto.employee1",              code=6844
                     )

autoemployee3 = User(username="auto.employee3",                password="123456",                       fullname="Automation Employee3",
                     phone = "915556680",                      email="auto.employee3@osquay.com",       role="Employee",
                     organization = "Org OSQuay 2",            job="Developer",                         gender="Male",
                     birthday="1981-04-02",                    entry_date="2022-02-04",                 end_date="2032-02-04",
                     company="OSQuay",                         country="Portugal",                      state="Lisboa",
                     location="LaV",                           type="Internal",                         nif="444555888",
                     iban="PT50000744958650058656017",         salary="1500",                           food_type="Card",
                     food_iban="PT50000744958650058656017",    food_amount="7",                         civil="Married",
                     holders="1",                              dependents="0",                          timesheet="auto.manager",
                     evaluation="auto.admin",                  co_evaluators="auto.employee2",              code=6845
                     )

autoemployee4 = User(username="auto.employee4",                password="123456",                       fullname="Automation Employee4",
                     phone = "915556681",                      email="auto.employee4@osquay.com",       role="Employee",
                     organization = "Org London",              job="Junior Developer",                  gender="Male",
                     birthday="1981-08-04",                    entry_date="2022-02-04",                 end_date="2032-02-04",
                     company="OSQuay",                         country="Portugal",                      state="Lisboa",
                     location="LaV",                           type="Internal",                         nif="444555888",
                     iban="PT50000744958650058656017",         salary="1500",                           food_type="Card",
                     food_iban="PT50000744958650058656017",    food_amount="8",                         civil="Married",
                     holders="1",                              dependents="0",                          code=6846
                     )


User(username="autouser5",                password="",                       fullname="Automation Employee5",
                     phone = "960000057",                      email="a@osquay.com",       role="Trainer",
                     organization = "Org London",              job="",                  gender="",
                     birthday="1981-08-04",                    entry_date="1900-01-01",                 end_date="2022-10-12",
                     company="OSQuay",                         country="Portugal",                      state="Castelo Branco",
                     location="LaV",                           type="Internal",                         nif="",
                     iban="PT50000744958650058656017",         salary="20",                           food_type="Card",
                     food_iban="PT50000744958650058656017",    food_amount="10",                         civil="",
                     holders="1",                              dependents="0",                          code=7009
                     )

"""
