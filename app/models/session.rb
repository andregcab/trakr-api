class Session < ApplicationRecord
  belongs_to :user
  has_one :activity, foreign_key: :session_id, dependent: :destroy

  accepts_nested_attributes_for :activity, update_only: true
end
