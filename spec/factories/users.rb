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

FactoryGirl.define do
  factory :user do


  ##GENERAL

    factory :valid_user, class: User do

      email "brodievegas@gmail.com"
      password "vegas123"
      password_confirmation "vegas123"

    end


    factory :null_email, class: User do

      email nil
      password "password"
      password_confirmation "password"


    end

    factory :long_email, class: User do

      email " getyourgameupbrodie@gmail.com"
      password "password"
      password_confirmation "password"

    end

    factory :long_password, class: User do

      email " getyourgameupbrodie@gmail.com"
      password "password fjklassdfjlk"
      password_confirmation "password fjkladjkls"

    end

    factory :dif_password, class: User do

      email " getyourgameupbrodie@gmail.com"
      password "password"
      password_confirmation "passwordlkjlkji"

    end

  end
end

