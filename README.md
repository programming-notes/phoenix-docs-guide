# Endpoint

Endpoint is started as a supervised process. You can find Endpoint being added to the supervision tree inside lib/hello/applications.ex. For this application, every request starts and ends it's lifecycle inside an endpoint. 

Before even getting to the router, Endpoint will apply several transformations to the request via Plugs.

