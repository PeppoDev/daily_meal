defmodule Exmeal.Meals.Delete do
  alias Exmeal.{Repo, Meal, Error}

  def call(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build(:not_found, "Meal not found")}
      %Meal{} = meal -> Repo.delete(meal)
    end
  end
end
