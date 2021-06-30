require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    5.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Can See all product and can add produst to the cart" do
    
    visit root_path
    expect(page).to have_css 'article.product', count: 5
    find_button("Add", match: :first).click
    visit '/cart'
    expect(page).to have_content 'My Cart (1)'
    save_screenshot
  end
end
