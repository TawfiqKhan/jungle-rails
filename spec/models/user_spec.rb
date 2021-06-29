require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User Authentication" do

  it "Saves a valid user" do
    @user = User.new(first_name: "A", last_name: "B", email: "test@gmail.com", password: "abc123", password_confirmation: "abc123")
    expect(@user).to be_valid
  end

  it "Returns errors if password confirmation doesnt match a" do
    @user = User.create(first_name: "A", last_name: "B", email: "test@gmail.com", password: "abc123", password_confirmation: "abc12")
    expect(@user.errors.full_messages[0]).to eq ("Password confirmation doesn't match Password")
  end

  it "Returns errors if email already exists" do
    @user = User.create(first_name: "A", last_name: "B", email: "test@gmail.com", password: "abc123", password_confirmation: "abc123")
    @user2 = User.create(first_name: "A", last_name: "B", email: "test@gmail.com", password: "abc123", password_confirmation: "abc123")
    expect(@user2.errors.full_messages[0]).to eq ("Email has already been taken")
  end
end
end
