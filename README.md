# TableOrderAPI
Table Order API is a programming challange in building an API using Elixir and Phoenix,
that exposes the availability of tables in a specified restaurant during certain range of time.

## DB Schema
The database schema is comprised of the following tables
- **Restaurant** - Table that represents which restaurants were registered to the system.
While the current API is only built for querying restaurant availabilty, the table is
designed with the thought of exposing an Endpoint in the future, for showing the available restaurants
for the client on a map with dedicated information per map.

Currently the available restaurants in the system are:
- **1** - すき家 渋谷桜丘店.
- **2** - 松屋 浅草店.
- **3** - J.S. BURGERS CAFE 渋谷店.

- **Tables** - Table that represents which tables are available in each restaurant, how many seats
and what is the mininum required for seating people in a speicifc table.

- **Reservations** - Table that represents reservations that customers made for a specific table
in a specific restaurant.

Currently there are 3 reservations in the system for "すき家 渋谷桜丘店".
1. 12:00 - 13:30.
2. 15:00 - 17:30.
3. 17:00 - 18:00.

## Setup
- Clone the project into your local environment.
- Make sure you have Erlang, Elixir, Phoenix and PostgreSQL installed.

To start your Phoenix server:
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

## Querying the API
Once the server is running, the API will be avilable for querying on [`localhost:4000`](http://localhost:4000).
The endpoint for querying the availabily of restaurants is: [`localhost:4000/api/tables/OpenTable`](http://localhost:4000/api/tables/openTable).

The parameters exposed by the endpoint are:
- **restaurant_id** (integer) - The restaurant id representing the restaurant. 

- **from** (string) - On which date and from which time is the customer interested in beginning the reservation.
The format of the date should be in iso8601 (for example: "2020-10-05T17:00:00Z").

- **to** (string) - On which date and until which time is the customer interested in ending the reservation.
The format of the date should be in iso8601 (for example: "2020-10-05T20:00:00Z").