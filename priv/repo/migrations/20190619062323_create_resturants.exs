defmodule RestuAPI.Repo.Migrations.CreateResturants do
  use Ecto.Migration

  def change do
    create table(:resturants) do
      add :name, :string, null: false
      add :address, :string, null: false
      add :city, :string, null: false, size: 100
      add :neighberhood, :string, null: false
      add :zipCode, :string, null: true, size: 10
      add :latitude, :float, default: 0, null: false
      add :longitude, :float, default: 0, null: false
      add :is_active, :boolean, null: false

      timestamps()
    end

    create unique_index(:resturants, [:name])
  end
end
