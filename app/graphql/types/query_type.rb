Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :me, Types::UserType do
    description " this is just me"
    resolve -> (obj, args, ctx) {
      User.first
    }
  end

  field :projects, types[Types::ProjectType] do
    description "get users projects"

    resolve -> (obj, args, ctx) {
      Project.all
    }
  end
end

