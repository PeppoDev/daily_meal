defmodule Exmeal.Meal do
  use Ecto.Schema

  import Ecto.Changeset

  alias Exmeal.User

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:description, :date, :calories]
  @foreign_key_type :binary_id

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "meals" do
    field(:description, :string)
    field(:date, :date)
    field(:calories, :integer)
    field(:user_id, :binary_id)

    belongs_to(:users, User, define_field: false)

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
