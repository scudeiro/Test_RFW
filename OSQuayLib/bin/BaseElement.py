#!/usr/bin/env python
# -*- coding: utf-8 -*-

from OSQuayLib.bin.base import Base
from OSQuayLib.bin.keywords import Keywords

class BaseElement(Base, Keywords):
    def __init__(self, parent=None, xpath=None, id=None, idx=None, txt=None):
        super().__init__()
        self.parent = parent
        self.xpath = xpath
        self.id = id
        self.idx = idx
        #self.txt = txt
        self.xid = self._build_control_locator()
        self.childs=list()

    def _build_control_locator(self):
        if self.id is None and self.xpath is None:
            self.log("error", "*ElementBase*: Element needs a id or xpath")
        if self.parent is None:
            parent = ''
        else:
            parent = self.parent.xid
        if self.id is None:
            locator = f"{parent}{self.xpath}"
        else:
            locator = f"{parent}//*[@id='{self.idx}']"
        if not self.idx is None:
            locator = f"({locator})[{self.idx}]"
        #if not self.txt is None:
        #    predicate=self._build_text_predicate(self.txt, False, True)
        #    locator = f"{locator}{predicate}"
        return locator
            
    def _build_text_predicate(self, txt, contains, spread):
        if not txt is None:
            attr = ['text()', '.'][spread]
            pattern = ["[{attr}='{txt}']", "[contains({attr},'{txt}')]"][contains]
            predicate = pattern.format(attr=attr, txt=txt)
            return predicate

    def translate(self, lang, *lang_dicts):
        transl = list()
        for lang_dict in lang_dicts:
            if not (lang in lang_dict.keys()):
                raise AssertionError(f"*BaseElement*: language '{lang}' not defined in '{lang_dict}'")
            transl.append(lang_dict[lang])
        return transl
