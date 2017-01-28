
feature '6. sign up' do
  scenario 'a user would like to register to have their own bookmark manager' do
    visit '/users/new'
    fill_in :email,    with: 'luis@gmail.com'
    fill_in :password, with: 'maker2017'
    fill_in :password_confirmation, with: 'maker2017'
    click_button('Sign Up')
    # sign_up
    expect(page).to have_content("Welcome luis@gmail.com")
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario 'a user forgets to enter the email' do
    visit '/users/new'
    fill_in :email,    with: ' '
    fill_in :password, with: 'maker2017'
    fill_in :password_confirmation, with: 'maker2017'
    click_button('Sign Up')
    expect(page.current_path).to eq '/users'
  end

  scenario 'a user enters an email address not in the correct format' do
    visit '/users/new'
    fill_in :email,    with: 'luis.makers.com'
    fill_in :password, with: 'maker2017'
    fill_in :password_confirmation, with: 'maker2017'
    click_button('Sign Up')
    expect(page.current_path).to eq '/users'
  end

  scenario 'a user shouldn\'t be able to sign up twice with the same email' do
    sign_up
    visit '/users/new'
    fill_in :email,    with: 'luis@makers.com'
    fill_in :password, with: 'maker2017'
    fill_in :password_confirmation, with: 'maker2017'
    click_button('Sign Up')
    expect(page.current_path).to eq '/users'
    expect(page).to have_content("Email is already taken")
  end
end
