class Adoption < ApplicationRecord
  has_one :owner, through: :animal
end
