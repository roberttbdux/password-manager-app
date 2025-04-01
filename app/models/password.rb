class Password < ApplicationRecord
  belongs_to :user
end

class User < ApplicationRecord
  has_many :passwords
end