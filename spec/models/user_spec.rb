require "rails_helper"

describe User do
  describe "Validations" do
    context "on a new user" do
      it "will not be valid without a password" do
        user = build(:user, password: nil, password_confirmation: nil)
        expect(user).to_not be_valid
      end

      it "will be not be valid with a short password" do
        user = build(:user, password: "short", password_confirmation: "short")
        expect(user).to_not be_valid
      end

      it "will not be valid with a confirmation mismatch" do
        user = build(:user, password: "short", password_confirmation: "long")
        expect(user).to_not be_valid
      end

      it "will check an email address is email-like" do
        user = build(:user, email: "myfakeemail")
        expect(user).to_not be_valid
      end
    end

    context "on an existing user" do
      let(:user) { create(:user) }

      it "will be valid with no changes" do
        expect(user).to be_valid
      end

      it "will not be valid with an empty password" do
        user.password = user.password_confirmation = ""
        expect(user).to_not be_valid
      end

      it "will be valid with a new password" do
        user.password = user.password_confirmation = "new password"
        expect(user).to be_valid
      end

      it "will be valid with a valid email" do
        user = build(:user, email: "a@b.com")
        expect(user).to be_valid
      end
    end
  end
end

