require './app/models/user'

# As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag

feature '4. filtering by tag' do
  scenario 'a user would like to filter links by their tags' do
    user = User.create(email: 'luis@makers.com', password: 'makers2017')
    allow(user).to receive(:email) { 'luis@makers.com' }
    visit '/links'
    click_button('Add Link')
    fill_in(:title, with: 'Facebook')
    fill_in(:url, with: 'www.facebook.com')
    fill_in(:tags, with: 'Social media')
    click_button('Save')

    click_button('Add Link')
    fill_in(:title, with: 'Kids Party')
    fill_in(:url, with: 'www.bubbles.com')
    fill_in(:tags, with: 'Bubbles')
    click_button('Save')

    visit '/tags/bubbles'
    expect(page).to have_content("www.bubbles.com")
  end
end
