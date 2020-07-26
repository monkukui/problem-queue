module V1
  module Entities
    class ProblemEntity < Grape::Entity
      expose :id
      expose :memo
      expose :priority
      expose :problem_str
      expose :user, using: V1::Entities::UserEntity
    end
  end
end
