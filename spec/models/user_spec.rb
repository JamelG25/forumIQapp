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

require 'rails_helper'

RSpec.describe User, :type => :model do


  context "email" do


    it "must be present" do
      expect(FactoryGirl.build(:null_email).save).to be false
    end

    it "email must have a limit" do
      expect(FactoryGirl.build(:long_email).save).to be false
    end

    it " must have a valid email and password" do
      expect(FactoryGirl.build(:valid_user).save).to be true

    end

    it "must have a unique email" do

      user1= FactoryGirl.create(:valid_user)
      user2 = FactoryGirl.build(:valid_user)

      expect(user2.save).to be false
    end


  end



    context "password" do

      it "must have a password limit" do
        expect(FactoryGirl.build(:long_password).save).to be false

      end

      it "must match password and password confirmation" do
        expect(FactoryGirl.build(:dif_password).valid?).to be false

      end



    end

end
