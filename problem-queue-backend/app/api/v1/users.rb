module V1
  class Users < Grape::API
    resources :users do
      desc 'returns all users'
      get '/' do
        @user= User.all # 最後に評価された値がレスポンスとして返される
      end

      desc 'returns an user'
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @user= User.find(params[:id])
      end

      desc 'Create an user'
      params do
        requires :name, type: String
      end
      post '/' do
        @user= User.create(name: params[:name])
      end

      desc 'Delete an user'
      params do
        requires :id, type: Integer
      end
      delete '/:id' do
        @user= User.find(params[:id])
        @user.destroy
      end
    end
  end
end
