#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

# I can't find a way to target only the names, as they're inconsistently
# expressed, so let's just get _all_ the links, and then remove anything
# that's in <small> tags (there's almost certainly a way to do that in
# one XPath expression too), and let the Wikidata-fetcher just skip all
# the other things that aren't people (explanations of prefixes and
# titles etc)

all_links = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://en.wikipedia.org/wiki/Legislative_Council_of_Brunei',
  after: '//span[@id="Members"]',
  before: '//span[@id="International_and_regional_meetings"]',
  xpath: '//li//a[not(@class="new")]/@title',
)

ignore = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://en.wikipedia.org/wiki/Legislative_Council_of_Brunei',
  after: '//span[@id="Members"]',
  before: '//span[@id="International_and_regional_meetings"]',
  xpath: '//li//small//a[not(@class="new")]/@title',
)

EveryPolitician::Wikidata.scrape_wikidata(names: { en: all_links - ignore }, output: false)

