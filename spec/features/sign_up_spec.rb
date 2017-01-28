# require './app/models/user'

feature '6. sign up' do
  scenario 'a user would like to register to have their own bookmark manager' do
    sign_up
    expect(page).to have_content("Welcome luis@makers.com")
    expect { sign_up }.to change(User, :count).by(1)

  end
end
