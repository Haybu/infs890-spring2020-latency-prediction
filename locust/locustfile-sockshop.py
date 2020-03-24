import base64

from locust import HttpLocust, TaskSet, task, between
from random import randint, choice

def index(l):
    l.client.get("/")

def login(l):
    user1 = base64.encodebytes(('%s:%s' % ('Eve_Berger', 'eve')).encode()).replace('\n'.encode(), ''.encode()).decode('utf-8')
    user2 = base64.encodebytes(('%s:%s' % ('user', 'password')).encode()).replace('\n'.encode(), ''.encode()).decode('utf-8')
    user3 = base64.encodebytes(('%s:%s' % ('user1', 'password')).encode()).replace('\n'.encode(), ''.encode()).decode('utf-8')
    user4 = base64.encodebytes(('%s:%s' % ('user2', 'password')).encode()).replace('\n'.encode(), ''.encode()).decode('utf-8')
    user5 = base64.encodebytes(('%s:%s' % ('user3', 'password')).encode()).replace('\n'.encode(), ''.encode()).decode('utf-8')
    user6 = base64.encodebytes(('%s:%s' % ('user4', 'password')).encode()).replace('\n'.encode(), ''.encode()).decode('utf-8')
    user7 = base64.encodebytes(('%s:%s' % ('user5', 'password')).encode()).replace('\n'.encode(), ''.encode()).decode('utf-8')
    user8 = base64.encodebytes(('%s:%s' % ('user6', 'password')).encode()).replace('\n'.encode(), ''.encode()).decode('utf-8')
    user9 = base64.encodebytes(('%s:%s' % ('user7', 'password')).encode()).replace('\n'.encode(), ''.encode()).decode('utf-8')
    user10 = base64.encodebytes(('%s:%s' % ('user8', 'password')).encode()).replace('\n'.encode(), ''.encode()).decode('utf-8')
    user11 = base64.encodebytes(('%s:%s' % ('user9', 'password')).encode()).replace('\n'.encode(), ''.encode()).decode('utf-8')
    user12 = base64.encodebytes(('%s:%s' % ('user10', 'password')).encode()).replace('\n'.encode(), ''.encode()).decode('utf-8')
    
    users = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10, user11, user12]
    l.client.get("/login", headers={"Authorization":"Basic %s" % choice(users)}) 

def logout(l):
    l.client.cookies.clear()

def browseProducts(l):
    l.client.get("/category.html")

def selectProduct(l):
    catalogue = l.client.get("/catalogue").json()
    return choice(catalogue)

def viewProductDetails(l):
    item = selectProduct(l)
    l.client.get("/detail.html?id={}".format(item["id"])) 

def deleteCart(l):
    l.client.delete("/cart")

def addToCart(l):
    item = selectProduct(l)
    l.client.post("/cart", json={"id": item["id"], "quantity": choice([1,2])})

def viewCart(l):
    l.client.get("/basket.html")    

def order(l):    
    l.client.post("/orders")

class UserBehavior(TaskSet):

    def on_start(self):
        index(self)

    browse_num = choice([2,3,4,5])
    view_detail_num = browse_num - 1

    select_num = choice([1,2])

    tasks = {
        index: 1,
        browseProducts: browse_num,
        viewProductDetails: view_detail_num,
        selectProduct: select_num,
        login: 1,
        deleteCart: 1,
        addToCart: select_num,
        viewCart: 1,
        order: 1,
        logout: 1
        }

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    wait_time = between(1, 8)
