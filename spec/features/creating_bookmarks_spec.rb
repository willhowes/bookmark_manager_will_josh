# As a user,
# So that I can refer back to my favourite websites
# I'd like to add bookmarks to my bookmark manager.

feature 'Adding a new bookmark' do
  scenario 'the user can add a bookmark to the Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://www.bbc.co.uk')
    fill_in('title', with: 'BBC')
    click_button 'Submit'
    expect(page).to have_link('BBC', href: 'http://www.bbc.co.uk')
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'not a real bookmark')
    click_button('Submit')

    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end
