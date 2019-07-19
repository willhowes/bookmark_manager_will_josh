feature 'Adding tags to a bookmark' do
  scenario 'User can add a tag to a bookmark' do

    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit('/')
    click_button 'Add Tag'

    expect(current_path).to eq "/bookmarks/#{bookmark.id}/tags/new"

    fill_in 'tag', with: 'This is a tag'
    click_button 'Submit'

    expect(current_path).to eq "/"
    expect(page).to have_content 'This is a tag'
  end
end
