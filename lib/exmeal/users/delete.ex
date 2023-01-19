defmodule Exmeal.Users.Delete do
  alias Exmeal.{Repo, User, Error}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build(:not_found, "User not found")}
      %User{} = user -> Repo.delete(user)
    end
  end
end
