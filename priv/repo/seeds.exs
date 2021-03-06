# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TableOrderAPI.Repo.insert!(%TableOrderAPI.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.

alias TableOrderAPI.Repo
alias TableOrderAPI.Reservations.Reservation
alias TableOrderAPI.Restaurants.Restaurant
alias TableOrderAPI.Tables.Table
alias TableOrderAPI.Tables

# Restaurants #
Repo.insert!(
  %Restaurant{
    address: "東京都渋谷区桜丘町１５−１９", city: "東京",
    is_active: true, latitude: 35.6561664, longitude: 139.6994246,
    name: "すき家 渋谷桜丘店", neighborhood: "渋谷",
    zipCode: "150-0031"
  }
)

Repo.insert!(
  %Restaurant{
    address: "東京都台東区浅草１丁目１２−８ 大山ビル 1F", city: "東京",
    is_active: true, latitude: 35.7121067, longitude: 139.7946557,
    name: "松屋 浅草店", neighborhood: "浅草",
    zipCode: "111-0032"
  }
)

Repo.insert!(
  %Restaurant{
    address: "東京都渋谷区神南１丁目２０−１３ 012F Gビル渋谷", city: "東京",
    is_active: true, latitude: 35.7121067, longitude: 139.6945419,
    name: "J.S. BURGERS CAFE 渋谷店", neighborhood: "渋谷",
    zipCode: "150-0041"
  }
)

# # Tables #
Repo.insert!(%Table{ restaurant_id: 1, assigned_number: 1, max_seats: 4, min_seats: 2 })
Repo.insert!(%Table{ restaurant_id: 1, assigned_number: 2, max_seats: 4, min_seats: 3 })
Repo.insert!(%Table{ restaurant_id: 1, assigned_number: 3, max_seats: 2, min_seats: 1 })
Repo.insert!(%Table{ restaurant_id: 1, assigned_number: 4, max_seats: 2, min_seats: 1 })
Repo.insert!(%Table{ restaurant_id: 1, assigned_number: 5, max_seats: 1, min_seats: 1 })
Repo.insert!(%Table{ restaurant_id: 1, assigned_number: 6, max_seats: 1, min_seats: 1 })
Repo.insert!(%Table{ restaurant_id: 1, assigned_number: 7, max_seats: 1, min_seats: 1 })

Repo.insert!(%Table{ restaurant_id: 2, assigned_number: 1, max_seats: 4, min_seats: 2 })
Repo.insert!(%Table{ restaurant_id: 2, assigned_number: 2, max_seats: 2, min_seats: 1 })
Repo.insert!(%Table{ restaurant_id: 2, assigned_number: 3, max_seats: 1, min_seats: 1 })
Repo.insert!(%Table{ restaurant_id: 2, assigned_number: 4, max_seats: 1, min_seats: 1 })
Repo.insert!(%Table{ restaurant_id: 2, assigned_number: 5, max_seats: 1, min_seats: 1 })

Repo.insert!(%Table{ restaurant_id: 3, assigned_number: 1, max_seats: 4, min_seats: 2 })
Repo.insert!(%Table{ restaurant_id: 3, assigned_number: 2, max_seats: 2, min_seats: 2 })
Repo.insert!(%Table{ restaurant_id: 3, assigned_number: 3, max_seats: 2, min_seats: 2 })
Repo.insert!(%Table{ restaurant_id: 3, assigned_number: 4, max_seats: 2, min_seats: 1 })

# Reservations #
Repo.insert!(%Reservation{ table_id: 1, name: "John Wales", email: "john.wales@gml.com",
                           seats: 3, order_start_time: DateTime.from_iso8601("2019-06-19T17:00:00Z") |> elem(1),
                           order_end_time: DateTime.from_iso8601("2019-06-19T18:00:00Z") |>elem(1) })

Repo.insert!(%Reservation{ table_id: 3, name: "Sato Kazuma", email: "sato.kazuma@gml.com",
              seats: 2, order_start_time: DateTime.from_iso8601("2019-06-19T12:00:00Z") |> elem(1),
              order_end_time: DateTime.from_iso8601("2019-06-19T13:30:00Z") |>elem(1) })

Repo.insert!(%Reservation{ table_id: 7, name: "Akari Ayane", email: "akari.ayane@gml.com",
              seats: 1, order_start_time: DateTime.from_iso8601("2019-06-19T15:00:00Z") |> elem(1),
              order_end_time: DateTime.from_iso8601("2019-06-19T17:30:00Z") |>elem(1) })
