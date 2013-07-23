require 'spec_helper'

describe "EmoticonPages" do
  
  subject {page}

  let(:user){FactoryGirl.create(:user)}
  before{sign_in user}

  describe "emoticon creation" do
    before{visit root_path}

    describe "with valid information" do
      before{fill_in 'emoticon_content', with: "Lorem ipsum"}
      it "should create a emoticon" do
	expect {click_button "Post"}.to change(Emoticon, :count).by(1)
      end
    end
  end
end
