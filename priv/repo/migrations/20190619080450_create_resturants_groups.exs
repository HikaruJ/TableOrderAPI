defmodule RestuAPI.Repo.Migrations.CreateResturantsGroups do
  use Ecto.Migration

  def change do
    create table(:resturants_groups) do
      add :name, :string
      add :is_active, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:resturants_groups, [:name])
  end
end
