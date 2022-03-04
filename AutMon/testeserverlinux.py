import time

from selenium import webdriver
from selenium.webdriver.chrome.service import Service

service = Service()
service.start()
driver = webdriver.Remote(service.service_url)
driver.get('http://server-linux/');
time.sleep(5) # tempo para visualização da pag!
driver.quit() 