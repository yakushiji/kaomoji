require 'spec_helper'

describe "UserPages" do
  subject {page}
  
  describe "profile page" do
    let(:user){FactoryGirl.create(:user)}
    let!(:m1){FactoryGirl.create(:emoticon, user: user, content: "Foo")}
    let!(:m2){FactoryGirl.create(:emoticon, user: user, content: "Bar")}

    before{visit user_path(user)}

    it {should have_selector('h1', text: user.name)}
    it {should have_selector('title', text: user.name)}

    describe "emoticons" do
      it {should have_content(m1.content)}
      it {should have_content(m2.content)}
      it {should have_content(user.emoticons.count)}
    end
  end

  describe "signup" do
    before {visit signup_path}

    let(:submit){"Create my account"}

    describe "with invalid information" do
      it "should not create a user" do
	expect{click_button submit}.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
	fill_in "Name", with: "Example User"
	fill_in "Email", with: "user@example.com"
	fill_in "Password", with: "foobar"
	fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect {click_button submit}.to change(User, :count).by(1)
      end
      
      describe "after saving the user" do
	before{click_button submit}
	let(:user){User.find_by_email('user@example.com')}

	it {should have_selector('title', text: user.name)}
	it {should have_selector('div.alert-success', text: 'Welcome!')}

	it {should have_link('Sign out')}
      end
    end
  end


  describe "signup page" do
    before {visit signup_path}


    it {should have_selector('h1',text: 'Sign up')}
    it {should have_selector('title', text: 'Kaomoji | Sign up')}
  end
end
