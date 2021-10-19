class Activity < ApplicationRecord
  enum activity_type: { billable: 0, personal: 1 }

  belongs_to :session
end
