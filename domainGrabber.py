#!/usr/bin/env python3

import sys, threading, time, os, urllib, re, requests, pymysql
from html.parser import HTMLParser
from urllib import request
from xml.dom import minidom
from bs4 import BeautifulSoup
from xml.dom.minidom import parse
import xml.etree.ElementTree as ET
from datetime import datetime, date

# HEADER CONF
headers = {
        'User-Agent': 'Mozilla/5.1 (Macintosh; Intel Mac OS X 10.9; rv:43.0) Gecko/20100101 Firefox/43.0'
      }

#db = pymysql.connect(host='localhost', user='db_user', passwd='db_pass', db='db_name', charset='utf8')
#conn = db.cursor()

# DETECT DATES
#datesStart = date.today().strftime("%d-%m-%Y")
#conn.execute("SELECT auction_end FROM auction_date WHERE auction_state = '' ORDER BY id desc LIMIT 1")
#findDatesEnd = conn.fetchone()
#for de in findDatesEnd:
#	datesEnd = de

# PARSING FUNCTION
def check(domain, output):
	try:
		#datesStart = date.today().strftime("%d-%m-%Y")

	
		page = 'https://auction.cctld.by/domains/'+str(domain)+'/'
		r = requests.get(page, headers = headers)
		data = BeautifulSoup(r.text)
		name = data.find('b', {'id': 'domain_name'}).text
		if name:
			data = ET.fromstring(requests.get('http://bar-navig.yandex.ru/u?ver=2&url=http://'+name+'&show=1').content)
			for item in data.iter('tcy'):
				cy_result = item.attrib.get('value')

			yaca = []
			dmoz = ""
			
			for yacaCatalog in data.iter('topic'):
				try:
					yaca_result = yacaCatalog.attrib.get('title')
					yaca = yaca_result
				except Exception as e:
					yaca = "false"
			yaca = str(yaca)

			alexaCheck = requests.get('http://www.alexa.com/siteinfo/'+name, headers = headers)
			alexaFind = BeautifulSoup(alexaCheck.text)
			alexaRank = alexaFind.find('strong', {'class': 'metrics-data align-vmiddle'}).text
			if cy_result != "0":
				cy = cy_result.replace("\n", "").replace(" ", "")
			else:
				cy = cy_result.replace("\n", "").replace(" ", "")

			if alexaRank != "- ":
				alexa = alexaRank.replace(" ", "").replace("\n", "").replace(",", "").replace("-", "0")
			elif alexaRank == "- ":
				alexa = "0"

			dmozCheck = requests.get('http://www.dmoz.org/search?q='+name, headers = headers)
			try:
				dmozFind = BeautifulSoup(dmozCheck.text)
				dmozCatalog = dmozFind.find('div', {'class': 'site-title'}).text
				if dmozCatalog:
					dmoz = "true"
			except Exception as e:
					dmoz = "false"

			#output.write(page+" - Domain found: "+name+" - [тИЦ: "+cy+"] - {Alexa: "+alexa+"} - "+dmoz+" - "+yaca+"\n")
			output.write(name+" [TIC: "+cy+"] - [Alexa: "+alexa+"]\n")
			#print(str(cy.group(1)))
		else:
			print("Nothing found! "+page)
	except Exception as e:
		print(e)

# BEGIN CHECKS
try:
	output = open('domains.txt', 'w')
	for domain in range(31720, 40000):
		#for domain in range(range1, range2):
		t = threading.Thread(target=check, args=(domain, output,))
		t.start()
		time.sleep(0.2)
except Exception as e:
	print(e)
