module Types
  ProjectType = GraphQL::ObjectType.define do
    name "Project"
    description "a project"

    field :id, !types.Int
    field :title, !types.String do
      resolve -> (obj, args, ctx ) {
        # binding.pry
        # obj here is Project
        obj.user.email + '-' + obj.title
      }
    end

    # this is possible because of the active record relationship btw projects and users
    field :user, !UserType
  end
end
