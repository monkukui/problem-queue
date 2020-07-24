module V1
  class Problems < Grape::API
    resources :problems do
      desc 'returns all problems'
      get '/' do
        @problems = Problem.all
        present @problems, with: V1::Entities::ProblemEntity
      end

      desc 'returns a problem'
      params do
        requires :id, type: Integer
      end
      get '/:id' do
        @problem = Problem.find(params[:id])
        present @problem, with: V1::Entities::ProblemEntity
      end

      desc 'Create a problem'
      params do
        requires :memo, type: String
        requires :priority, type: Integer
        requires :contest_str, type: String
        requires :problem_str, type: String
        requires :user_id, type: Integer
      end
      post '/' do
        @problem = Problem.new(
          memo: params[:memo],
          priority: params[:priority],
          contest_str: params[:contest_str],
          problem_str: params[:problem_str],
          user_id: params[:user_id]
        )

        if @problem.save
          status 201
          present @problem, with: V1::Entities::ProblemEntity
        else
          status 400
          present @problem.errors
        end
      end
    end
  end
end
