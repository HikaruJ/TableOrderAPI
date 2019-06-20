defmodule RestuAPI.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table(:tables) do
      add :restaurant_id, references(:restaurants)
      add :assigned_number, :integer, null: false
      add :max_seats, :integer, default: 1, null: false
      add :min_seats, :integer, default: 1, null: false
      add :description, :string, null: true, size: 100

      timestamps()
    end
  end
end
