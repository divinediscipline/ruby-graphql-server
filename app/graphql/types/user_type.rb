module Types
  UserType = GraphQL::ObjectType.define do
    name "User"
    description "a user"

    # The fields below define what you can access on a user

    field :id, !types.Int
    field :email_address, !types.String, property: :email

    field :projects, !types[Types::ProjectType] do
      resolve -> (obj, args, ctx) {
        obj.projects
      }
    end

  end
end