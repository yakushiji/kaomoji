require 'spec_helper'

describe "Homes" do
  describe "index page" do

    it "should have the h1 'Home'" do
      visit '/home/index'
      page.should have_selector('h1', :text => 'Kaomoji')
    end

    it "should have the title 'Home'" do
      visit '/home/index'
      page.should have_selector('title',
                        :text => "Kaomoji | Home")
    end
  end

end
