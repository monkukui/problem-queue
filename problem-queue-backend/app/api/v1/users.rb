module V1
  class Users < Grape::API
    resources :users do
      desc 'returns all users'
      get '/' do
        @users = User.all # 最後に評価された値がレスポンスとして返される
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

      desc 'Create an user'
      params do
        requires :name, type: String
      end
      post '/' do
        @user = User.new(name: params[:name])
        # 作成の成否によってレスポンスを分ける
        if @author.save
          status 201
          present @user, with: V1::Entities::UserEntity
        else
          status 400
          present @user.errors.full_messages
        end
      end

      desc 'Delete an user'
      params do
        requires :id, type: Integer
      end
      delete '/:id' do
        @user = User.find(params[:id])

        # 削除の成否によってレスポンスを分ける
        if @user.destroy
          status 204
          present nil
        else
          status 400
          present @user.errors.full_messages
        end
      end
    end
  end
end
