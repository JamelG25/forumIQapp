# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :forum_threads
  has_many :forum_posts
  #hashing of password_digest?
  has_secure_password

  #goal? receive user data, validate it, POST to the db
  #it seems to still output true even if a 'presence: true' condition fails

  validates :email, presence: true, uniqueness: { case_sensitive: false },
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, length: { in: 8..15 },
            confirmation: true

  attr_reader :password #add this line right below our list of fields

  #we also need to create an @password instance variable and set it's value in our setter method
  def password=(unencrypted_password)
    unless unencrypted_password.empty?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end


end
