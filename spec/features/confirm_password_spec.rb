feature '7. confirm password' do
  scenario 'checks that there are no typos in the password during registration' do
    mismatch_sign_up
    expect { mismatch_sign_up }.to_not change(User, :count)
  end
end
