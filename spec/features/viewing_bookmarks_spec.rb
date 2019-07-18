# in spec/features/viewing_bookmarks_spec.rb
require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    Bookmark.create(url: "http://www.google.com", title: "Google")
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
    Bookmark.create(url: "http://www.twitter.com", title: "Twitter")

    visit('/')

    expect(page).to have_link('Google', href: "http://www.google.com")
    expect(page).to have_link('Makers', href: "http://www.makersacademy.com")
    expect(page).to have_link('Twitter', href: "http://www.twitter.com")
  end
end
