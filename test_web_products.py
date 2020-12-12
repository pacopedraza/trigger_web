#!/usr/bin/python3
"""
Script to retrieve web products each 5 minutes
"""
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium import webdriver
import os

class SearchProduct:
    def __init__(self, user, password, product):
        self.user = user
        self.password = password
        self.product = product
        self.driver = "chromedriver"
# The Web is dirty, will fix later
        self.web2 = "https://www.amazon.com/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2F%3Fref_%3Dnav_ya_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=usflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&"


    def search(self):
        path = os.getcwd()
        full_path = os.path.join(path, self.driver)

        chrome_driver = webdriver.Chrome(full_path)
        chrome_driver.get(self.web2)

        user_input = chrome_driver.find_element_by_id("ap_email")
        user_input.send_keys(self.user)

        continue_button = chrome_driver.find_element_by_id("continue")
        continue_button.click()

        password_input = chrome_driver.find_element_by_id("ap_password")
        password_input.send_keys(self.password)

        login_button = chrome_driver.find_element_by_id("signInSubmit")
        login_button.click()

        search_txt = chrome_driver.find_element_by_id("twotabsearchtextbox")
        search_txt.send_keys(self.product)

        nav_search = chrome_driver.find_element_by_id("nav-search-submit-text")
        nav_search.click()

user = ""
password = ""
product = ""

obj_search = SearchProduct(user, password, product)
obj_search.search()
