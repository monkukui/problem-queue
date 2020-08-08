module Types
  class ProblemType < Types::BaseObject
    field :id, Int, null: false
    field :user, Types::UserType, null: false
    field :memo, String, null: false
    field :problem_str, String, null: false
    field :priority, Int, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end