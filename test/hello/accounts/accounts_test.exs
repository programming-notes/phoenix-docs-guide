defmodule Hello.AccountsTest do
  use Hello.DataCase

  alias Hello.Accounts

  describe "users" do
    alias Hello.Accounts.User

    @valid_attrs %{name: "some name", username: "some username"}
    @update_attrs %{name: "some updated name", username: "some updated username"}
    @invalid_attrs %{name: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.name == "some name"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.name == "some updated name"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "credentials" do
    alias Hello.Accounts.Credentials

    @valid_attrs %{email: "some email"}
    @update_attrs %{email: "some updated email"}
    @invalid_attrs %{email: nil}

    def credentials_fixture(attrs \\ %{}) do
      {:ok, credentials} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_credentials()

      credentials
    end

    test "list_credentials/0 returns all credentials" do
      credentials = credentials_fixture()
      assert Accounts.list_credentials() == [credentials]
    end

    test "get_credentials!/1 returns the credentials with given id" do
      credentials = credentials_fixture()
      assert Accounts.get_credentials!(credentials.id) == credentials
    end

    test "create_credentials/1 with valid data creates a credentials" do
      assert {:ok, %Credentials{} = credentials} = Accounts.create_credentials(@valid_attrs)
      assert credentials.email == "some email"
    end

    test "create_credentials/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_credentials(@invalid_attrs)
    end

    test "update_credentials/2 with valid data updates the credentials" do
      credentials = credentials_fixture()
      assert {:ok, %Credentials{} = credentials} = Accounts.update_credentials(credentials, @update_attrs)
      assert credentials.email == "some updated email"
    end

    test "update_credentials/2 with invalid data returns error changeset" do
      credentials = credentials_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_credentials(credentials, @invalid_attrs)
      assert credentials == Accounts.get_credentials!(credentials.id)
    end

    test "delete_credentials/1 deletes the credentials" do
      credentials = credentials_fixture()
      assert {:ok, %Credentials{}} = Accounts.delete_credentials(credentials)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_credentials!(credentials.id) end
    end

    test "change_credentials/1 returns a credentials changeset" do
      credentials = credentials_fixture()
      assert %Ecto.Changeset{} = Accounts.change_credentials(credentials)
    end
  end
end
