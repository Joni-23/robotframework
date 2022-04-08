from shutil import ExecError
from robot.api.deco import library, keyword
import random

@library
class GenerateNumbers:
    def __init__(self):
        print("init")

    @keyword
    def generate_number_between_1_100(self):
        random_number = random.randint(1, 100)
        return random_number

    @keyword
    def generate_number_between_1_10(self):
        random_number = random.randint(1, 10)
        return random_number

    @keyword
    def generate_number_between(self, low, high):
        random_number = random.randint(int(low), int(high))
        return random_number