#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

en = WikiData::Category.new('Category:Members of the Legislative Council of Brunei', 'en').member_titles
ar = WikiData::Category.new('تصنيف:أعضاء المجلس التشريعي البروني', 'ar').member_titles

EveryPolitician::Wikidata.scrape_wikidata(names: { en: en, ar: ar })

