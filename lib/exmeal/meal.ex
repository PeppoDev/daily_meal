defmodule Exmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:description, :date, :calories]

  @derive {Jason.Encoder, only: [:id, :date, :calories, :description]}

  schema "meals" do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
