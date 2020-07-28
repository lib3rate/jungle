require 'rails_helper'

RSpec.describe Product, type: :model do
  category = Category.find_or_create_by! name: 'Toys'
  subject {
    described_class.new(name: "Luxury Lego",
                        price_cents: 3000,
                        quantity: 50,
                        category: category)
  }

  describe 'Validations' do
    it "should create a product" do
      expect(subject).to be_a Product
    end

    it "creates a product when the required fields are filled" do
      expect(subject).to be_valid
    end

    it "does not create a product when the name is not provided" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Name can't be blank"
    end

    it "does not create a product when the price is not provided" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Price can't be blank"
    end

    it "does not create a product when the quantity is not provided" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Quantity can't be blank"
    end

    it "does not create a product when the category is not provided" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Category can't be blank"
    end
  end
end