from typing import List
from Model.foodBeverageStatus import FoodBeverageStatus
from Model.itemType import ItemType
from Model.foodBeverage import FoodBeverage
from Model.transaction import Transaction


class TransactionFoodBeverage(Transaction):
    def __init__(self, id, items:List[FoodBeverage], nominal, status:FoodBeverageStatus = FoodBeverageStatus.UNREDEEMED, memberId = 0):
        super().__init__(id, nominal, ItemType.FOOD_AND_BEVERAGE, memberId)
        self.item:List[FoodBeverage] = items
        self.status:FoodBeverageStatus = status