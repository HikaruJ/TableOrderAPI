defmodule RestuAPI.Repo.Migrations.CreateReservations do
  use Ecto.Migration

  def change do
    create table(:reservations) do
      add :table_id, references(:tables)
      add :name, :string, null: false
      add :email, :string, null: false
      add :phone, :string, null: true
      add :seats, :integer, default: 0, null: false
      add :order_start_time, :utc_datetime , null: false
      add :order_end_time, :utc_datetime , null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:reservations, [:name])
    create unique_index(:reservations, [:email])
  end
end
