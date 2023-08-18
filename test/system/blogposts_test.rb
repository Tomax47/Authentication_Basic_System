require "application_system_test_case"

class BlogpostsTest < ApplicationSystemTestCase
  setup do
    @blogpost = blogposts(:one)
  end

  test "visiting the index" do
    visit blogposts_url
    assert_selector "h1", text: "Blogposts"
  end

  test "should create blogpost" do
    visit blogposts_url
    click_on "New blogpost"

    fill_in "Aouther", with: @blogpost.aouther
    fill_in "Content", with: @blogpost.content
    fill_in "Publish date", with: @blogpost.publish_date
    fill_in "Title", with: @blogpost.title
    click_on "Create Blogpost"

    assert_text "Blogpost was successfully created"
    click_on "Back"
  end

  test "should update Blogpost" do
    visit blogpost_url(@blogpost)
    click_on "Edit this blogpost", match: :first

    fill_in "Aouther", with: @blogpost.aouther
    fill_in "Content", with: @blogpost.content
    fill_in "Publish date", with: @blogpost.publish_date
    fill_in "Title", with: @blogpost.title
    click_on "Update Blogpost"

    assert_text "Blogpost was successfully updated"
    click_on "Back"
  end

  test "should destroy Blogpost" do
    visit blogpost_url(@blogpost)
    click_on "Destroy this blogpost", match: :first

    assert_text "Blogpost was successfully destroyed"
  end
end
