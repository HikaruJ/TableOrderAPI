# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RestuAPI.Repo.insert!(%RestuAPI.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.

alias RestuAPI.Repo
alias RestuAPI.Reservations.Reservation
alias RestuAPI.Resturants
alias RestuAPI.Resturants.Resturant
alias RestuAPI.ResturantsGroups.ResturantGroup
alias RestuAPI.Tables.Table
alias RestuAPI.Tables

# Resturants Groups #
# Repo.insert!(
#   %ResturantGroup{is_active: true, name: "すき家"}
# )

# Repo.insert!(
#   %ResturantGroup{is_active: true, name: "松屋"}
# )

# Resturants #
Repo.insert!(
  %Resturant{
    address: "東京都渋谷区桜丘町１５−１９", city: "東京",
    is_active: true, latitude: 35.6561664, longitude: 139.6994246,
    name: "すき家 渋谷桜丘店", neighberhood: "渋谷",
    zipCode: "150-0031"
  }
)

Repo.insert!(
  %Resturant{
    address: "東京都台東区浅草１丁目１２−８ 大山ビル 1F", city: "東京",
    is_active: true, latitude: 35.7121067, longitude: 139.7946557,
    name: "松屋 浅草店", neighberhood: "浅草",
    zipCode: "111-0032"
  }
)

Repo.insert!(
  %Resturant{
    address: "東京都渋谷区神南１丁目２０−１３ 012F Gビル渋谷", city: "東京",
    is_active: true, latitude: 35.7121067, longitude: 139.6945419,
    name: "J.S. BURGERS CAFE 渋谷店", neighberhood: "渋谷",
    zipCode: "150-0041"
  }
)

# # Tables #
Repo.insert!(%Table{ resturant_id: 1, assigned_number: 1, max_seats: 4, min_seats: 2 })
Repo.insert!(%Table{ resturant_id: 1, assigned_number: 2, max_seats: 4, min_seats: 3 })
Repo.insert!(%Table{ resturant_id: 1, assigned_number: 3, max_seats: 2, min_seats: 1 })
Repo.insert!(%Table{ resturant_id: 1, assigned_number: 4, max_seats: 2, min_seats: 1 })
Repo.insert!(%Table{ resturant_id: 1, assigned_number: 5, max_seats: 1, min_seats: 1 })
Repo.insert!(%Table{ resturant_id: 1, assigned_number: 6, max_seats: 1, min_seats: 1 })
Repo.insert!(%Table{ resturant_id: 1, assigned_number: 7, max_seats: 1, min_seats: 1 })

Repo.insert!(%Table{ resturant_id: 2, assigned_number: 1, max_seats: 4, min_seats: 2 })
Repo.insert!(%Table{ resturant_id: 2, assigned_number: 2, max_seats: 2, min_seats: 1 })
Repo.insert!(%Table{ resturant_id: 2, assigned_number: 3, max_seats: 1, min_seats: 1 })
Repo.insert!(%Table{ resturant_id: 2, assigned_number: 4, max_seats: 1, min_seats: 1 })
Repo.insert!(%Table{ resturant_id: 2, assigned_number: 5, max_seats: 1, min_seats: 1 })

Repo.insert!(%Table{ resturant_id: 3, assigned_number: 1, max_seats: 4, min_seats: 2 })
Repo.insert!(%Table{ resturant_id: 3, assigned_number: 2, max_seats: 2, min_seats: 2 })
Repo.insert!(%Table{ resturant_id: 3, assigned_number: 3, max_seats: 2, min_seats: 2 })
Repo.insert!(%Table{ resturant_id: 3, assigned_number: 4, max_seats: 2, min_seats: 1 })

# Reservations #
Repo.insert!(%Reservation{ table_id: 1, name: "John Wales", email: "john.wales@gml.com",
                           seats: 3, reserve_date: DateTime.utc_now, reserve_start_time: Time.new(17,00,00) |> elem(1),
                           reserve_end_time: Time.new(18,00,00) |>elem(1) })

Repo.insert!(%Reservation{ table_id: 3, name: "Sato Kazuma", email: "sato.kazuma@gml.com",
              seats: 2, reserve_date: DateTime.utc_now, reserve_start_time: Time.new(12,00,00) |> elem(1),
              reserve_end_time: Time.new(13,30,00) |>elem(1) })

Repo.insert!(%Reservation{ table_id: 7, name: "Akari Ayane", email: "akari.ayane@gml.com",
              seats: 1, reserve_date: DateTime.utc_now, reserve_start_time: Time.new(15,00,00) |> elem(1),
              reserve_end_time: Time.new(17,30,00) |>elem(1) })
