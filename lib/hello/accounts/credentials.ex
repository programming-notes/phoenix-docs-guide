defmodule Hello.Accounts.Credentials do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Accounts.User


  schema "credentials" do
    field :email, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(credentials, attrs) do
    credentials
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
