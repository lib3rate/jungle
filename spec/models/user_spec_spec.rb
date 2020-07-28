require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.create( first_name: "Joe",
                            last_name: "Black",
                            email: "test@example.com",
                            password: "test_password",
                            password_confirmation: "test_password")
  }

  describe 'Validations' do
    it "creates a user when the required fields are filled" do
      expect(subject).to be_valid
    end

    it "validates that email, first name, last name, password, and password confirmation are present" do
      expect(subject.first_name).to be_present
      expect(subject.last_name).to be_present
      expect(subject.email).to be_present
      expect(subject.password).to be_present
      expect(subject.password_confirmation).to be_present
    end

    it "does not create a user if the password and password confirmation do not match" do
      subject.password_confirmation = "different_password"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    
    it "does not create a user if the email already exists in the database" do
      first_user = User.create( first_name: "Joe",
                                last_name: "Black",
                                email: "test@test.COM",
                                password: "test_password",
                                password_confirmation: "test_password")
      second_user = User.create(first_name: "Scruff",
                                last_name: "McGruff",
                                email: "TEST@TEST.com",
                                password: "test_password",
                                password_confirmation: "test_password")
      expect(second_user).to_not be_valid
      expect(second_user.save).to be false
      expect(second_user.errors.full_messages).to include "Email has already been taken"
    end
    
    it "does not create a user if the password is too short" do
      subject.password = "1"
      subject.password_confirmation = "1"
      expect(subject).to_not be_valid
      expect(subject.save).to be false
      # puts subject.errors.full_messages
      expect(subject.errors.full_messages).to include "Password is too short (minimum is 3 characters)"
    end

  #   it "does not create a product when the category is not provided" do
  #     subject.category = nil
  #     expect(subject).to_not be_valid
  #     expect(subject.errors.full_messages).to include "Category can't be blank"
  #   end
  end
end