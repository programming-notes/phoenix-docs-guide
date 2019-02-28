# Phoenix Routing
Routes can be configured in the `/lib/<project_name>_web/router.ex`. We can set up individual routes by putting code such as:
```elixir
get "/", PageController, :index
```
The routes are expanded by the `&match/5` function
```elixir
def match(:verb, "path", Controller, :action, options(s): :value)
```

We can see all available routes by running `mix phx.routes` in the CLI.
We can also define routes in `routes.ex` using:
```elixir
resources "/users", UserController
```
which will create 8 RESTful routes. Resources can take in options if we only want some, not all of the RESTful routes.

#### Fowards
Routes all requests that match the stazrt of a path to a plug. This could be used to run background jobs.

#### Path Helpers
Similar to ruby path helpers. Returns the RESTful URL of a route.
```elixir
alias HelloWeb.Router.Helpers, as: Routes
alias HelloWeb.Endpoint

Routes.user_path(Endpoint, :index)
Routes.user_path(Endpoint, :show, 17)
```

#### Scoped Routes
* Routes can be scoped to give name spacing for particular resources.
* Scope can take in optional arguments to point to different namespaced controllers.
* Scopes can also take in optional arguments to namespace route helpers.
* Each scope can have their own unique set of pipelines (which customizes and transforms requests before getting to the route).

#### The Endpoint Plugs
* Is the default set of plugs which Transforms, Logs and Parses incoming requests.

#### Channels


