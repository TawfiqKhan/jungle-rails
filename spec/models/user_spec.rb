require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User Validation" do
  # .new creates but doesnt save in DB, .creates creates and saves
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

  it "Returns errors if email already exists" do
    @user = User.create(first_name: "A", last_name: "B", email: "test@gmail.com", password: "abc123", password_confirmation: "abc123")
    @user2 = User.create(first_name: "A", last_name: "B", email: "test@gmail.com", password: "abc123", password_confirmation: "abc123")
    expect(@user2.errors.full_messages[0]).to eq ("Email has already been taken")
  end

  it "Validates first name" do
    @user = User.create(first_name: nil, last_name: "B", email: "test@gmail.com", password: "abc123", password_confirmation: "abc123")
    expect(@user.errors.full_messages[0]).to eq ("First name can't be blank")
  end

  it "validates last name" do
    @user = User.create(first_name: "A", last_name: nil, email: "test@gmail.com", password: "abc123", password_confirmation: "abc123")
    expect(@user.errors.full_messages[0]).to eq ("Last name can't be blank")
  end

  it "validates email" do
    @user = User.create(first_name: "A", last_name: "B", email: nil, password: "abc123", password_confirmation: "abc123")
    expect(@user.errors.full_messages[0]).to eq ("Email can't be blank")
  end

  it "Returns error if provided password length less than minimum" do
    @user = User.create(first_name: "A", last_name: "B", email: "test@gmail.com", password: "abc", password_confirmation: "abc")
    expect(@user.errors.full_messages[0]).to eq ("Password is too short (minimum is 5 characters)")
  end

end

describe "User Authentication" do
  it "Allows Login if password is correct" do
  @user = User.create(first_name: "A", last_name: "B", email: "test2@gmail.com", password: "abcde", password_confirmation: "abcde")
  expect(User.authenticate_with_credentials("test2@gmail.com","abcde")).to eq(@user)
  end
  
  it "Retruns error if password mismatch" do
  @user = User.create(first_name: "A", last_name: "B", email: "test2@gmail.com", password: "abcde", password_confirmation: "abcdef")
  expect(User.authenticate_with_credentials("test2@gmail.com","abcde")).to eq(nil)
  end
  
  it "Allows login if email has whitespaces" do
  @user = User.create(first_name: "A", last_name: "B", email: "test2@gmail.com", password: "abcde", password_confirmation: "abcde")
  expect(User.authenticate_with_credentials("  test2@gmail.com  ","abcde")).to eq(@user)
  end
  
  it "Allows login if email has uppercase letters" do
  @user = User.create(first_name: "A", last_name: "B", email: "test2@gmail.com", password: "abcde", password_confirmation: "abcde")
  expect(User.authenticate_with_credentials("TesT2@gMail.com","abcde")).to eq(@user)
  end

end

end
