defmodule Exmeal.Users.Update do
  alias Exmeal.User
  alias Exmeal.Repo
  alias Exmeal.Error

  def call(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build(:not_found, "User not found")}
      %User{} = user -> merge_data(user, params)
    end
  end

  defp merge_data(user, params) do
    user
    |> User.changeset(params)
    |> Repo.update()
  end
end
