module Types
  class MutationType < Types::BaseObject
    field :create_problem, mutation: Mutations::CreateProblem
  end
end
