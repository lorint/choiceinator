class User
  include Mongoid::Document
  field :email, type: String
  field :name, type: String
  field :hashed_password, type: String

  has_many :decisions
end
