class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email, :username

  has_many :posts

  def as_json(opts = {})
    super(opts.merge(only: [ :id, :first_name, :last_name, :username ]))
  end
end
