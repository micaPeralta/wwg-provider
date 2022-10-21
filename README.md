
# README

A mock api for DSSD 2022 subject 

* Ruby version **3.0.0p0**
* Rails version **Rails 7.0.4**

* Database creation

   ` rails db:create`

* Database initialization

    `rails db:migration`
* Database reset

  `rails db:reset`

* Start app

   `rails server`

## Authentication

Default user
    **email**: luismiguel@gmail.com
    **password**: 123abc


**Request**

```
curl --location --request POST 'https://wwg-provider.fly.dev/api/v1/auth/login' \
--form 'email="luismiguel@gmail.com"' \
--form 'password="123abc"'
```

**Response**
```
{
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NjY4NTYzNDN9.clTk05r7CLTZAPrXsK-zcSwMva0avyegK4WVHJwFMUE"
}
```

## Materials Catalog

**Request**

```
curl --location --request GET 'https://wwg-provider.fly.dev/api/v1/materials' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NjY4NTYzNDN9.clTk05r7CLTZAPrXsK-zcSwMva0avyegK4WVHJwFMUE'
```

**Response**

```
[
    {
        "id": 1,
        "name": "Plstic",
        "quantity": "500",
        "created_at": "2022-10-20T07:20:42.694Z",
        "updated_at": "2022-10-20T07:20:42.694Z"
    }
]
```

## Reserve Materials

**Request**

```
curl --location --request PUT 'http://localhost:3000/api/v1/materials/1/book' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NjY5Mjc5ODF9.oWJ0Vj_Qmr_Z9K616maRjzOzGgbolTv8o4o4gyDrREU' \
--header 'Content-Type: application/json' \
--data-raw '{
"quantity": 1
}'
```

**Response**

## Find materials
**Request**
```
curl --location -g --request GET 'http://localhost:3000/api/v1/materials/find?ids[]=1&ids[]=2' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NjY4NTYzNDN9.clTk05r7CLTZAPrXsK-zcSwMva0avyegK4WVHJwFMUE'
```
**Response**


```
[
    {
        "id": 1,
        "name": "vidrio",
        "quantity": "1",
        "created_at": "2022-10-20T07:20:42.694Z",
        "updated_at": "2022-10-21T04:49:55.300Z"
    },
    {
        "id": 2,
        "name": "Plastic",
        "quantity": "22",
        "created_at": "2022-10-21T04:50:41.520Z",
        "updated_at": "2022-10-21T04:50:41.520Z"
    }
]

```