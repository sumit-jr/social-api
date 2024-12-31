class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email

  def as_json(opts = {})
    super(opts.merge(only: [ :id, :email, :first_name, :last_name ]))
  end
end
