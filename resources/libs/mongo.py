from pymongo import MongoClient

client = MongoClient('mongodb://qaninja:qaninja123@ds035664.mlab.com:35664/spotdb?retryWrites=true&w=majority')
db = client['spotdb']

def remove_company(company):
    sposts = db['spots']
    sposts.delete_many({'company': company})