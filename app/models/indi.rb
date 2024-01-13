class Indi < ApplicationRecord
  belongs_to :profile, foreign_key: :profile_id
  has_many_attached :files
end
