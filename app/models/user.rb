class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true,
                  uniqueness: true,
                      format: { with: /@/ }


  validates :password, presence: true,
                   confirmation: true,
                         length: { minimum: 8 }
end

