from typing import List

from features.account.model.account import Account
from features.transaction.model.transaction import Transaction
from shared.enum.role import Role


class Member(Account):
    def __init__(self, id = 0,name:str = "", email = '', passwd = '', pinNum = '', wallet:float = 0.0, transactions:List[Transaction] = []):
        super().__init__(id, name, email, passwd, Role.MEMBER, pinNum)
        self.wallet = wallet
        self.transactions: List[Transaction] = []

    def get_wallet(self):
        return self.wallet

    def set_wallet(self, value):
        self.wallet = value

    def get_transactions(self):
        return self.transactions

    def set_transactions(self, value):
        self.transactions = value

