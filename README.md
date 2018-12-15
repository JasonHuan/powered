# Powered

## Setup
1. Install `docker` and `docker-compose`. 
2. run `make build && make run` in the root directory (this one)
3. In another window, run `make init_db` to initialize the database


## Project Organization

Simplified tree diagram
``` /usr/bin/tree
.  # Contains docker setup and Makefile
├── docker-compose.yml  # defines setup of PostgreSQL and Django
├── Dockerfile  # defines powered/backend Docker image
├── initialize.sh  # sets up Django container (runs migrations and then boots server)
├── Makefile  # contains very useful helper commands
└── src  # Contains all Django code
    ├── powered  # Contains code relating to the entire website
    │   ├── keys.py  # put confidential info in here, like server or email keys
    │   ├── settings.py  # global settings (please keep confidential info out of here)
    │   ├── urls.py  # global URLs (usually imports app URLs too)
    └── <app_name>  # Same structure for all apps in project
        ├── admin.py  # sets up /admin pages
        ├── models.py  # contains class declarations and methods
        ├── serializers.py  # contains serializers for classes 
        ├── tests.py  # define necessary tests
        ├── urls.py  # sets up app specific URLs
        └── views.py  # sets up responses to URLs
```

## Makefile commands
- `make build` creates the `powered/backend` image
- `make run` starts up the PostgreSQL and Django containers
- `make restart` restarts the Django container (useful when you edit code)
- `make ssh` starts a bash session in the latest Django container
- `make run_command` runs a command inside the latest Django container
    - `make run_command cmd="echo hi"` will run `echo hi` inside the latest Django container
- `make shell` starts a python shell inside the latest Django container
- `make test` runs test.py use `args=--keepdb` to use previous test database


## How to do authorized requests
1. Login
  - Post to /o/token/ with defined body parameters, including client id and client secret
  - Only the `username` and `password` fields in the input should ever change
  - Only the `access_token` field in the output really matters 
2. Use the `access_token` to do authorized requests
  - HEADER MUST BE `Authorization: Bearer <ACCESS_TOKEN>`
  - Django will automatically identify the user with the token  

### Login
  POST /o/token/ (login)
  ```x-www-form-urlencoded
      grant_type:password
      username:<USER_EMAIL>
      password:<USER_PASSWORD>
      client_id:web
      client_secret:<CLIENT_SECRET> // Note: the CLIENT_SECRET is a hardcoded field you need to get from your backend
  ```
  returns 
  ```
      {
          "access_token": "<ACCESS_TOKEN>",
          "expires_in": 36000,
          "token_type": "Bearer",
          "scope": "read write groups",
          "refresh_token": "<REFRESH_TOKEN>"
      }
  ```

### Authorization
  Authorization done over headers  
  Authorization: "Bearer <ACCESS_TOKEN>"

## Models

### Profile Model
```
{
  "id": <PROFILE_ID>
  "first_name": "<FIRSTNAME>"
  "last_name": "<LASTNAME>"
  "email": "<EMAIL>"
  "phone": "<PHONE>"
}
```

### Category Model
```
{
  "id": <CATEGORY_ID>
  "name": "<CATEGORY_NAME_STRING>""
  "description": "<CATEGORY_DESC_STRING>"
  "parent": <FOREIGN_KEY_TO_PARENT> #Not shown
}
```

### OrderItem Model
```
{
  "id": <ORDERITEM_ID>
  "item_name": "<ITEM_NAME>"
  "description": "<ITEM_DESCRIPTION>"
  "price": <PRICE>
  "place": <FOREIGN_KEY_TO_ORDER_PLACE> 
  "parent_category": <FOREIGN_KEY_TO_PARENT_CATEGORY> #Not shown
}
```

### OrderPlace Model
```
{
  "id": <ORDERPLACE_ID>
  "place_name": "<PLACE_NAME>"
  "address": "<ADDRESS_STRING>"
  "lat": <DECIMAL_LATITUDE>   #Format: xx.xxxxxxx
  "lng": <DECIMAL_LONGITUDE>  #Format: xxx.xxxxxxx 
}
```

### Order Model
```
{
  "id": <ORDER_ID>
  "customer": <FOREIGN_KEY_TO_CUSTOMER_PROFILE>
  "courier": <FOREIGN_KEY_TO_COURIER_PROFILE>
  "delivery_address": "<ADDRESS_STRING>"
  "items": <LIST_OF_ORDERITEMS>
  "delivery_fee": <DECIMAL> #Max 2 digits after decimal point
  "order_status": <ORDER_STATUS_STRING> Options: "OP"=Open, "IP"=In Progress, "CL"=Closed
  "courier_rating": <RATING_INTEGER>
  "order_time": <AUTO_FILLED_TIMESTAMP>
  "completion_time": <AUTO_FILLED_TIMESTAMP>
}
```

## API
### Create new profile
  POST /profiles/new/
  ```
      {
          "email": "<EMAIL>",
          "password": "<PASSWORD>"
          "first_name": "<FIRSTNAME>"
          "last_name": "<LASTNAME>"
          "phone": "<PHONE>"
      }
  ```
  returns resulting profile


### Get own profile
  GET /profiles/me/  
  returns own profile object

### Get specific profile info
  GET /profiles/<PROFILE_ID>/  
  returns specified profile object

### Update own profile info
  PATCH /profiles/me/  
  
  ```
      {
          "field_name": "<DESIRED_VALUE"
      }
  ```

  returns updated Profile object

### Get open orders
  GET /orders/open/  
  returns list of Order objects

### View Order Categories or Items
  GET /categories/view_children/<category_id>
  returns 
  ```
    { 
      "type": <"category" OR "order_item">
      "parent": "<Name of parent category>"
      <"category" OR "order_item">: <LIST OF CATEGORIES OR ORDER ITEMS>
    }
  ```

### Make new order
  POST /orders/new/  

  ```
      {
          "delivery_address": "<ADDRESS_STRING>"
          "items": <LIST_OF_ORDERITEMS>
          "fee": <DECIMAL> #Max 2 digits after decimal point
      }
  ```

  returns new Order object


