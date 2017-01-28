# require './app/models/user'

feature '6. sign up' do
  scenario 'a user would like to register to have their own bookmark manager' do
    visit '/links/signup'
    fill_in(:email, with: 'luis@makers.com')
    fill_in(:password, with: 'maker2017')
    click_button('Sign Up')
    user = User.first
    expect(page).to have_content("Welcome luis@makers.com")
    expect(User.count).to eq(1)

  end
end
