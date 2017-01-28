
feature '6. sign up' do
  scenario 'a user would like to register to have their own bookmark manager' do
    visit '/users/new'
    fill_in :email,    with: 'luis@makers.com'
    fill_in :password, with: 'maker2017'
    fill_in :password_confirmation, with: 'maker2017'
    click_button('Sign Up')
    # sign_up
    expect(page).to have_content("Welcome luis@makers.com")
    expect { sign_up }.to change(User, :count).by(1)
  end
end
