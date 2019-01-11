require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valied with a name, email and password" do
    user = User.new(name: "one", email: "one@test.jp", password: "123456")
    expect(user).to be_valid
  end

  it "is invalied without a name" do
    user = User.new(name: nil, email: "one@test.jp", password: "123456")
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalied without an email" do
    user = User.new(name: "one", email: nil, password: "123456")
    user.valid?
    #expect(user).to have(1).errors_on("email")
    expect(user.errors[:email].size).to eq 1
  end

  it "is invalied without a password" do
    user = User.new(name: "one", email: "one@test.jp", password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  #検索メソッドのテスト
  describe "fillter user search method" do
    before :each do
      @one = User.create(name: "one", email: "one@test.jp", password: "123456")
      @two = User.create(name: "two", email: "two@test.jp", password: "123456")
    end

    context "with matching letters" do
      it "returns an array of results that match" do
        expect(User.search("one")).to eq [@one]
      end
    end

    context "with non-matching letters" do
      it "omits results that do not match" do
        expect(User.search("one")).not_to include @two
      end
    end
  end
end