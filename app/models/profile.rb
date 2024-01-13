class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.country == "US" and record.state == " "
      record.errors[:base] << "State cannot be blank"
    end
    if record.country != "US" and record.state != " "
      record.errors[:base] << "Leave State empty for countries outside of United States..."
    end

  end
end

class Profile < ApplicationRecord
  has_many :indis, :dependent => :delete_all
  validates_with GoodnessValidator
end

