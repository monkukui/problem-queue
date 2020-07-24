module V1
  module Entities
    class UserEntity < Grape::Entity
      expose :id # レスポンスに含めたい属性を expose
      expose :name
    end
  end
end
