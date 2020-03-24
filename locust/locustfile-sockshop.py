import base64

from locust import HttpLocust, TaskSet, task, between, TaskSequence, seq_task
from random import randint, choice

class UserBehavior(TaskSequence):
    @seq_task(1)
    @task(1)
    def index(self):
        self.locust.client.get("/")

    @seq_task(2)
    @task(2)
    def browseProducts(self):
        self.locust.client.get("/category.html")

    @seq_task(3)
    @task(2)
    def viewProductDetails(self):
        catalogue = self.locust.client.get("/catalogue").json()
        item = choice(catalogue)
        self.locust.client.get("/detail.html?id={}".format(item["id"]))       

    @seq_task(4)
    @task(1)
    def login(self):
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
        self.locust.client.get("/login", headers={"Authorization":"Basic %s" % choice(users)})  

    @seq_task(5)
    @task(1)
    def deleteCart(self):
        self.locust.client.delete("/cart")

    @seq_task(6)
    @task(1)
    def addToCart(self):
        catalogue = self.locust.client.get("/catalogue").json()
        item = choice(catalogue)
        self.locust.client.post("/cart", json={"id": item["id"], "quantity": choice([1,2])})

    @seq_task(7)
    @task(1)
    def viewCart(self):
        self.locust.client.get("/basket.html")    

    @seq_task(8)
    @task(1)
    def order(self):    
        self.locust.client.post("/orders")

    @seq_task(9)
    @task(1)
    def logout(self):
        self.locust.client.cookies.clear()        

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    wait_time = between(1, 8)  # in seconds
