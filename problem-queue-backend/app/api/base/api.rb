module Base
  class API < Grape::API
    mount V1::Root # ←コメントアウト解除
  end
end
