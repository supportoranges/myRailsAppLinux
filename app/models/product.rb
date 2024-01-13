class Product < ApplicationRecord
  belongs_to :profile, foreign_key: :profile_id
end
