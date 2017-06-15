import requests 

def get_ip():
	return requests.get('http://wtfismyip.com/json').content

def get_mac_vendor(mac_addr):
	return requests.get('http://api.macvendors.com/%s' % str(mac_addr)).content

