defmodule Exmeal.Users.Get do
  alias Exmeal.User
  alias Exmeal.Repo
  alias Exmeal.Error

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build(:not_found, "User not found")}
      %User{} = user -> {:ok, user}
    end
  end
end
