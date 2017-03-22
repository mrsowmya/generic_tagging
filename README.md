# Generic Tagging

## API Endpoints and Sample Requests

---------------------------------------------------------------------------------------

### 1. [POST] Create an Entity

---------------------------------------------------------------------------------------

`curl -v -H "Content-Type: application/json" -X POST http://localhost:3000/tags -d '{"entity" : {"entity_type" : "Article", "identifier" : "2" , "tags" : ["Van", "Car"]} }'`

### Sample Response
===============================================
```javascript
HTTP/1.1 200 OK

{
  "message":"ok"
}

```
---------------------------------------------------------------------------------------

### 2. [GET] Retrive an Entity

---------------------------------------------------------------------------------------

`curl -v -H "Content-Type: application/json" -X GET http://localhost:3000/tags/:entity_type/:entity_identifier`

### Sample Response
===============================================
```javascript
HTTP/1.1 200 OK

{
  "entity": {
    "id":2,
    "entity_type":"Product",
    "identifier":"1",
    "tags":["Bike","Car"],
    "created_at":"2017-03-22T17:33:26.000Z",
    "updated_at":"2017-03-22T17:33:26.000Z"
  }
}

```

---------------------------------------------------------------------------------------

### 3. [DELETE] Remove an Entity

---------------------------------------------------------------------------------------

`curl -v -H "Content-Type: application/json" -X DELETE http://localhost:3000/tags/:entity_type/:entity_identifier`

### Sample Response
===============================================
```javascript
HTTP/1.1 200 OK

{
  "message" : "ok"
}

```

---------------------------------------------------------------------------------------

### 4. [GET] Retrive stats of all Tags

---------------------------------------------------------------------------------------

`curl -v -H "Content-Type: application/json" -X GET http://localhost:3000/stats`

### Sample Response
===============================================
```javascript
HTTP/1.1 200 OK

{
 "tags":[
  {"tag":"Bike","count":1},
  {"tag":"Car","count":2},
  {"tag":"Van","count":1}
  ]
}

```

---------------------------------------------------------------------------------------

### 5. [GET] Retrive stats of specific entity

---------------------------------------------------------------------------------------

`curl -v -H "Content-Type: application/json" -X GET http://localhost:3000/stats/:entity_type/:entity_identifier`

### Sample Response
===============================================
```javascript
HTTP/1.1 200 OK

{
  "tags":[
    {"tag":"Car","count":2},
    {"tag":"Van","count":1}
  ]
}
```

---------------------------------------------------------------------------------------