# Controllers

### Actions
* Are just functions that accepts request data and params and returns a response.
* Can be named anything but makes life easier if we follow RESTful conventions.
* Gathers data using Ecto.

### Flash Messages
* Useful for showing errors and other non-persistent messages to user.

### Rendering functions:
* render/2
* render/3
* text/2
* json/2
* html/2 - takes in a conn and html string to render html without layout.
* assign/3 - takes in a `conn`, `symbol` and `value` and to pass key-value into the output conn.

### Assigning Layouts:
* put_layout/2 - accepts either a boolean or name of layout.html file to render.

### Overriding Render Formats
* We can configure what format to distribute but adding that format type to the accepts key.