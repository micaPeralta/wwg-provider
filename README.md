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

Request

`curl --location --request POST 'https://wwg-provider.fly.dev/api/v1/auth/login' \
--form 'email="luismiguel@gmail.com"' \
--form 'password="123abc"'`

Response

`{
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NjY4NTYzNDN9.clTk05r7CLTZAPrXsK-zcSwMva0avyegK4WVHJwFMUE"
}
`

## Materials Catalog

Request

`curl --location --request GET 'https://wwg-provider.fly.dev/api/v1/users' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NjY4NTM2MDZ9.xP-NKG1YxlIv3AGnGIatO1ZXygVwugLBtPlxcwU6MfM'
`

Response

`[
    {
        "id": 1,
        "name": "Plstic",
        "quantity": "500",
        "created_at": "2022-10-20T07:20:42.694Z",
        "updated_at": "2022-10-20T07:20:42.694Z"
    }
]
`