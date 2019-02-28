# Phoenix Routing
Routes can be configured in the `/lib/<project_name>_web/router.ex`. We can set up individual routes by putting code such as:
```elixir
get "/", PageController, :index
```
The routes are expanded by the `&match/5` function
```elixir
def match(:verb, "path", Controller, :action, options(s): :value)
```