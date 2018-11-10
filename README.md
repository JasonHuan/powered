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
    └── users  # One app for just users
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




