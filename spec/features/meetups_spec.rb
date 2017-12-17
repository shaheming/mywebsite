require "rails_helper"

feature "Meetups",:type => :feature do

  before do
    user = User.create!( :email => "foobar@example.com", :password => "12345678",:is_admin=>true)
    sign_in(user) # 这样就可以登入了
  end

  scenario "meetups/index" do
    visit "/meetups"
    expect(page).to have_content("Meetups List")

  end

  scenario "meetups/new" do
    visit "/meetups/new"
    expect(page).to have_content("Create a Meetup")
    title = "Jingan 10th Meetup"
    date = "2017-04-15" #notice
    description = "This will be an exciting meetting"

    within("#new_meetup") do
      fill_in "Title", with: title
      fill_in "Meetup time", with: date
      fill_in "Description", with: description
    end
    click_button "Submit"

    meetup =  Meetup.last

    expect(meetup.title).to eq(title)
    expect(meetup.meetup_time.strftime('%Y-%m-%d')).to eq(date)
    expect(meetup.description).to eq(description)
  end

  scenario "meetups/edit " do
    visit "/meetups/new"
    expect(page).to have_content("Create a Meetup")
    title = "Jingan 10th Meetup"
    date = "2017-04-15" #notice
    description = "This will be an exciting meetting"


    within("#new_meetup") do
      fill_in "Title", with: title
      fill_in "Meetup time", with: date
      fill_in "Description", with: description
    end

    click_button "Submit"

    meetup =  Meetup.last
    visit "/meetups"
    # find(:linkhref,edit_meetup_path(meetup)).click
    find("a[@href='#{edit_meetup_path(meetup)}']").click
    # byebug

    description = "This will be an exciting meetting" + "edit"
    within("#edit_meetup_#{meetup.id}") do
      fill_in "Title", with: title
      fill_in "Meetup time", with: date
      fill_in "Description", with: description
    end

    click_button "Submit"
    meetup =  Meetup.last
    expect(meetup.title).to eq(title)
    expect(meetup.meetup_time.strftime('%Y-%m-%d')).to eq(date)
    expect(meetup.description).to eq(description)
  end
  scenario "delete" do
    visit "/meetups/new"
    expect(page).to have_content("Create a Meetup")
    title = "Jingan 10th Meetup"
    date = "2017-04-15" #notice
    description = "This will be an exciting meetting"


    within("#new_meetup") do
      fill_in "Title", with: title
      fill_in "Meetup time", with: date
      fill_in "Description", with: description
    end

    click_button "Submit"

    meetup =  Meetup.last
    visit "/meetups"

    expect { click_link('Delete') }.to change(Meetup, :count).by(-1) #测试删除

  end
end
