defmodule BooksApi.Store.Book do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "books" do
    field :title, :string
    field :authors, {:array, :string}
    field :description, :string
    field :isbn, :string
    field :price, :float

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :isbn, :description, :price, :authors])
    |> validate_required([:title, :isbn, :description, :price, :authors])
    |> unique_constraint(:isbn, message: "Already Exists")
    |> unique_constraint(:title, message: "Already Exists")
  end
end
