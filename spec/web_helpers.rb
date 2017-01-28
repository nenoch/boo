def sign_up
  visit '/users/new'
  fill_in :email,    with: 'luis@makers.com'
  fill_in :password, with: 'maker2017'
  fill_in :password_confirmation, with: 'maker2017'
  click_button('Sign Up')
end

def mismatch_sign_up
  visit '/users/new'
  fill_in :email,    with: 'luis@makers.com'
  fill_in :password, with: 'maker2017'
  fill_in :password_confirmation, with: 'marker2017'
  click_button('Sign Up')

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
  
end
