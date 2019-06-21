defmodule TableOrderAPI.Repo.Migrations.CreateRestaurants do
  use Ecto.Migration

  def change do
    create table(:restaurants) do
      add :name, :string, null: false
      add :address, :string, null: false
      add :city, :string, null: false, size: 100
      add :neighborhood, :string, null: false
      add :zipCode, :string, null: true, size: 10
      add :latitude, :float, default: 0, null: false
      add :longitude, :float, default: 0, null: false
      add :is_active, :boolean, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:restaurants, [:name])
  end
end
