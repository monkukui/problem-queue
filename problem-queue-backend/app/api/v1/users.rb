module V1
  class Users < Grape::API
    resources :users do
      # FIXME これいらないかも
      desc 'returns all users'
      get '/' do
        @users = User.all
        present @users, with: V1::Entities::UserEntity # @users を V1::Entities::UserEntityを使用して返却する
      end

      desc 'returns an user'
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @user = User.find(params[:id])
        present @user, with: V1::Entities::UserEntity
      end

      desc 'signin'
      params do
        requires :email, type: String
        requires :password, type: String
      end
      post '/signin' do
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
          @user
        else
          error!('Unauthorized. Invalid email or password.', 401)
        end
      end

      desc 'signup'
      params do
        requires :email, type: String
        requires :password, type: String
        requires :name, type: String
      end
      post '/signup' do
        @user = User.new(declared(params))

        if @user.save
          @user
        else
          @user.errors.full_messages
        end
      end
    end
  end
end
