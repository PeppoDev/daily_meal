defmodule Exmeal.Meals.Update do
  alias Exmeal.Meal
  alias Exmeal.Repo
  alias Exmeal.Error

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build(:not_found, "Meal not found")}
      %Meal{} = meal -> merge_data(meal, params)
    end
  end

  defp merge_data(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
