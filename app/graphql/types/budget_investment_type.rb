module Types
  class BudgetInvestmentType < Types::BaseObject
    field :id, ID, null: false
    field :public_author, Types::UserType, null: true
    field :price, Integer, null: true
    field :feasibility, String, null: true
    field :title, String, null: true
    field :description, String, null: true
    field :location, String, null: true
    field :comments, Types::CommentType.connection_type, null: true
    field :comments_count, Integer, null: true
  end
end
