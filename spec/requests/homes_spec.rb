# coding: utf-8
require 'spec_helper'
 
describe "Homes" do
  subject {page}
 
  describe "Home page" do
    before {visit root_path}
 
    it {should have_selector('h1', :text => 'かおもじ')}
    it {page.should have_selector('title',:text => "Kaomoji | Home")}
  end
end
