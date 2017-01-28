feature '9. User sign out' do

  # let(:user) do
  #   User.create(email: 'user@example.com',
  #               password: 'secret1234',
  #               password_confirmation: 'secret1234')
  # end

  scenario 'sign out while being signed in' do
    sign_in(email: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end
