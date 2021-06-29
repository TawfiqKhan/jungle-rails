# require 'rails_helper'

# RSpec.feature "ProductDetails", type: :feature, js: true do
#     # SETUP
#   before :each do
#     @category = Category.create! name: 'Apparel'

#     5.times do |n|
#       @category.products.create!(
#         name:  Faker::Hipster.sentence(3),
#         description: Faker::Hipster.paragraph(4),
#         image: open_asset('apparel1.jpg'),
#         quantity: 10,
#         price: 64.99
#       )
#     end
#   end

#   scenario "Can See all product and clicking on a product takes to the product page" do
#     visit root_path
#     expect(page).to have_css 'article.product', count: 5
#     find_link("Details »", match: :first).click
#     expect(page).to have_css '.product-detail'
#     save_screenshot
#     puts page.html
#   end
# end
