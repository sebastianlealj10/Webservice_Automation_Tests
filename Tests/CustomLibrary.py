from robot.libraries.BuiltIn import BuiltIn
import random


class CustomLibrary(object):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        self.selenium_lib = BuiltIn().get_library_instance('ExtendedSelenium2Library')
        # This is where you initialize any other global variables you might want to use in the code.
        # I import BuiltIn and Extended Selenium2 Library to gain access to their keywords.

    def generate_random_number(self):
        for x in range(10):
            return self.random.randint(1, 101)
