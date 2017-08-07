require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    describe "#new" do

      it "should be valid with all fields present" do
        @good_user = User.create first_name: "User",
                                 last_name: "Bob",
                                 email: "bob@example.com",
                                 password: "test",
                                 password_confirmation: "test"
        expect(@good_user).to be_valid
      end

      it "should have a first_name" do
        @user = User.create first_name: nil,
                            last_name: "Bob",
                            email: "bob@example.com",
                            password: "test",
                            password_confirmation: "test"
        expect(@user.errors.messages[:first_name]).to include("can't be blank")
      end

      it "should have a last_name" do
        @user = User.create first_name: "User",
                            last_name: nil,
                            email: "bob@example.com",
                            password: "test",
                            password_confirmation: "test"
        expect(@user.errors.messages[:last_name]).to include("can't be blank")
      end

      it "should have an email" do
        @user = User.create first_name: "User",
                            last_name: "Bob",
                            email: nil,
                            password: "test",
                            password_confirmation: "test"
        expect(@user.errors.messages[:email]).to include("can't be blank")
      end

      it "should have a unique email" do
        @first_user = User.create first_name: "John",
                            last_name: "Doe",
                            email: "johndoe@gmail.com",
                            password: "test",
                            password_confirmation: "test"
        @second_user = User.create first_name: "User",
                            last_name: "Bob",
                            email: "JohnDoe@gmail.com",
                            password: "test",
                            password_confirmation: "test"
        expect(@second_user.errors.messages[:email]).to include("has already been taken")
      end

      it "should have a password" do
        @user = User.create first_name: "User",
                            last_name: "Bob",
                            email: "bob@example.com",
                            password: nil,
                            password_confirmation: "test"
        expect(@user.errors.messages[:password]).to include("can't be blank")
      end

      it "should have a password of at least 4 characters" do
        @user = User.create first_name: "User",
                            last_name: "Bob",
                            email: "bob@example.com",
                            password: "car",
                            password_confirmation: "car"
        expect(@user.errors.messages[:password]).to include("is too short (minimum is 4 characters)")
      end

      it "should have a password_confirmation" do
        @user = User.create first_name: "User",
                            last_name: "Bob",
                            email: "bob@example.com",
                            password: "test",
                            password_confirmation: nil
        expect(@user.errors.messages[:password_confirmation]).to include("can't be blank")
      end

      it "should have matching password and password_confirmation" do
        @user = User.create first_name: "User",
                            last_name: "Bob",
                            email: "bob@example.com",
                            password: "test",
                            password_confirmation: "banana"
        expect(@user.errors.messages[:password_confirmation]).to include("doesn't match Password")
      end
    end
  end
end