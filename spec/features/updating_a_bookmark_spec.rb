# As a user
# So I can change a bookmark in Bookmark Manager
# I want to update a bookmark

feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmark.create(url: 'www.makersacademy.com', title: 'Makers Academy')
    visit('/')
    expect(page).to have_link('Makers Academy', href: 'www.makersacademy.com')

    first('.bookmark').click_button("Edit") 
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('url', with: "www.snakersacademy.com")
    fill_in('title', with: "Snakers Academy")
    click_button("Submit")

    expect(current_path).to eq '/'
    expect(page).not_to have_link('Makers Academy', href: 'www.makersacademy.com')
    expect(page).to have_link('Snakers Academy', href: 'www.snakersacademy.com')
  end
end
