require 'rails_helper'

RSpec.feature "users can navigate from the home page to the product detail page by clicking on a product.", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    
      @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    
  end

  scenario "They see product" do
    # ACT
    visit root_path

    #click
    find('a.btn-default').click

    # DEBUG / VERIFY
    
    
    expect(page).to have_content("Description")

    save_screenshot
    

  end

end
