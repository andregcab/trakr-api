class Session < ApplicationRecord
  belongs_to :user
  has_one :activity, foreign_key: :session_id

  accepts_nested_attributes_for :activity
end
