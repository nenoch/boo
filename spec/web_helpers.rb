def sign_up
  visit '/users/new'
  fill_in :email,    with: 'luis@makers.com'
  fill_in :password, with: 'maker2017'
  click_button('Sign Up')
end
