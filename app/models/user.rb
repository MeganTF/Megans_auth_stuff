class User <ApplicationRecord
  validates :username, uniqueness: true
  validates :username, length: {maximum: 25}
  has_secure_password
end
