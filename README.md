# Ecto
- Bring in query functions from `Ecto.Repo`.
- Set the `otp_app` name to equal our application name.
- Configure our database adapter.

### The Schema
Maps elixir values into external data sources and visa versa. This is also where relationships are established. Also handles data validation and type casting with changesets.
* We can add validations and required attributes of our structs in the changeset/2 function.
* We can interact with the database using <SchemaName>.Repo module.