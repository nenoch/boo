feature '7. confirm password' do
  scenario 'checks that there are no typos in the password during registration' do
    mismatch_sign_up
    expect { mismatch_sign_up }.to_not change(User, :count)
  end

  scenario 'gives back an error message giving the user the possibility to sign up again' do
    mismatch_sign_up
    expect(page.current_path).to eq '/users'
    expect(page).to have_content("Password does not match the confirmation")
  end
end
