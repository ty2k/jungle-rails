require 'rails_helper'

RSpec.feature "Visitor navigates to product from home", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can go from home to product page by clicking a product" do
    # ACT
    visit root_path
    click_on "Details"
    sleep(5)

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'
  end
end