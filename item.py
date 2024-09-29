from fastapi import FastAPI

app = FastAPI()

@app.get("/api/data")
async def get_data():
    return {"message": "Hello from Python backend!"}

import pandas as pd

class Item:
    def __init__(self, item_name: str, prod_num: str, date_recalled: str):
        self.item_name = item_name
        self.prod_num = prod_num
        self.date_recalled = date_recalled


    def csv_to_items(filename: str):
        items = []
        df = pd.read_csv(filename)
        for index, row in df.iterrows():
            item = Item(row['item_name'], row['prod_num'], row['date_recalled'])
            items.append(item)
        return items

    items = csv_to_items('your_file.csv') # database -> python items arrays, UCP from barcode and compare it to UCP in csv.
    def compare_prod_num(items, s):
        matching_items_names = [] 
        matching_bools = [] # false for not in recalled. true for in recalled.
        matching_date_recalled = [] #N/A for not in recalled. date for in recalled.
        for element in s: #element is barcode
            for item in items: #item is a product's information
                if item.prod_num == element: #compares barcode
                    matching_items_names.append(item)
            bool match = false
            if (len(matching_items) >= 1){
                return true;
            }

    


