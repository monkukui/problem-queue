module Mutations
    class CreateProblem < Mutation::BaseMutation
        argument :user_id, Int, required: true
        argument :memo, String, required: true
        argument :priority, Int, required: true
        argument :problem_str, String, required: true

        field :problem, Type::ProblemType, null: false
        field :errors, [String], null: false
        
        def resolve(
            user_id: user_id,
            memo: memo,
            priority: priority,
            problem_str: problem_str
        )

        problem = Problem.new(
            user_id: user_id,
            memo: memo,
            priority: priority,
            problem_str: problem_str,
        )

        if problem.save {
            problem: problem,
            errors: [],
        } else {
            problem: nil,
            errors: problem.errors.full_messages
        }
    end
end