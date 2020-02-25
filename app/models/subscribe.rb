class Subscribe < ApplicationRecord
  belongs_to :user
  belongs_to :program
  validates :user_id, uniqueness: { scope: %i[user_id program_id] }
end
