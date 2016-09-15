#!/usr/bin/env python
import re
import sys
from BeautifulSoup import BeautifulSoup
html = open(sys.argv[1],"r").read()
soup = BeautifulSoup(html)

for i in soup.body.form.findAll('tbody'):
	try:
		if re.match(r"(.*)_",i.get("id")).group(1) == 'normalthread':
			#print i;
			#print '****************************************'
			print re.match(r".*_(\d+)",i.get("id")).group(1),"\t",
			print i.em.a.string,"\t",
			print i.find('a',attrs={"class": "xst"}).string,"\t",
			print i.find('a',attrs={"c": "1"}).string

	#except AttributeError:
		#print 'error'

	#except TypeError:
		#print 'error'

	except:
		pass;

	#else:
		#print '************************************'

