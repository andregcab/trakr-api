module Enums
  module ActivityEnums
    class ActivityTypesEnum < Types::BaseEnum
      graphql_name "ActivityType"

      value "BILLABLE", "billable activity", value: "billable"
      value "PERSONAL", "personal activity", value: "personal"
    end
  end
end