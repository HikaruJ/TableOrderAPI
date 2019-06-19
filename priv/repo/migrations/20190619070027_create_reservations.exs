defmodule RestuAPI.Repo.Migrations.CreateReservations do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add :table_id, references(:tables)
      add :name, :string, null: false
      add :email, :string, null: false
      add :phone, :string, null: true
      add :seats, :integer, default: 0, null: false
      add :reserve_date, :naive_datetime, null: false
      add :reserve_start_time, :time, null: false
      add :reserve_end_time, :time, null: false

      timestamps()
    end

    create unique_index(:reservations, [:name])
    create unique_index(:reservations, [:email])
  end
end
