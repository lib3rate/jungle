require 'rails_helper'

RSpec.feature "Users can navigate from the home page to the product detail page", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "by clicking on product details button" do
    visit root_path
    
    expect(page).to have_css 'article.product', count: 10

    first_product = find('article.product footer', match: :first)

    within (first_product) do
      click_on 'Details'
    end
    
    expect(page).to have_css '.main-img', count: 1

    save_and_open_screenshot('product_details.png')
  end
end