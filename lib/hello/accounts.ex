defmodule Hello.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Hello.Repo

  alias Hello.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    User
    |> Repo.all()
    |> Repo.preload(:credential)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id) do
    User
    |> Repo.get!(id)
    |> Repo.preload(:credential)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Hello.Accounts.Credentials

  @doc """
  Returns the list of credentials.

  ## Examples

      iex> list_credentials()
      [%Credentials{}, ...]

  """
  def list_credentials do
    Repo.all(Credentials)
  end

  @doc """
  Gets a single credentials.

  Raises `Ecto.NoResultsError` if the Credentials does not exist.

  ## Examples

      iex> get_credentials!(123)
      %Credentials{}

      iex> get_credentials!(456)
      ** (Ecto.NoResultsError)

  """
  def get_credentials!(id), do: Repo.get!(Credentials, id)

  @doc """
  Creates a credentials.

  ## Examples

      iex> create_credentials(%{field: value})
      {:ok, %Credentials{}}

      iex> create_credentials(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_credentials(attrs \\ %{}) do
    %Credentials{}
    |> Credentials.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a credentials.

  ## Examples

      iex> update_credentials(credentials, %{field: new_value})
      {:ok, %Credentials{}}

      iex> update_credentials(credentials, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_credentials(%Credentials{} = credentials, attrs) do
    credentials
    |> Credentials.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Credentials.

  ## Examples

      iex> delete_credentials(credentials)
      {:ok, %Credentials{}}

      iex> delete_credentials(credentials)
      {:error, %Ecto.Changeset{}}

  """
  def delete_credentials(%Credentials{} = credentials) do
    Repo.delete(credentials)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking credentials changes.

  ## Examples

      iex> change_credentials(credentials)
      %Ecto.Changeset{source: %Credentials{}}

  """
  def change_credentials(%Credentials{} = credentials) do
    Credentials.changeset(credentials, %{})
  end
end
