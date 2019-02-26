require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do
    it { should validate_presence_of :email    }
    it { should validate_presence_of :username }
    it { should validate_presence_of :password }
    it { should validate_presence_of :token    }
  end

  describe 'Creation' do

    let(:data) { { email:                 "email",
                   password:              "pw",
                   password_confirmation: "pw",
                   username:              "name"
               } }



    it 'Can create a user' do
      expect(User.count).to eq(0)
      user = User.make_user(data)
      expect(User.count).to eq(1)
    end

    it 'Will fail to create if username is not unique' do
      skip("Move this method to session Controller")
    end

    it 'Will fail to create if password confimation fails' do
      info = data.dup
      info.delete(:password_confirmation)
      user = User.make_user(info)
      expect(User.count).to eq(0)
    end

    it 'can confirm password' do
      user = User.make_user(data)
      bool = user.send(:confirm_password, "pw")
      expect(bool).to be(true)
    end

    it 'generate an api key for user' do
      user = User.make_user(data)
      expect(user.token.class).to be(String)
      expect(user.token.length).to be > 10
    end

  end

end
