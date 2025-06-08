from features.account.model.account import Account
from shared.enum.role import Role

class Admin(Account):
    def __init__(self, id = 0, name:str = "", email = '', passwd = '', pinNum = ''):
        super().__init__(id,name, email, passwd, Role.ADMIN, pinNum)
