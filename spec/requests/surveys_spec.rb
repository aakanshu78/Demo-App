require 'spec_helper'

describe "Surveys pages" do

  subject { page }  

  describe "Index page" do

    let(:user) { FactoryGirl.create(user) }

    before do
      sign_in user
      visit survey_path 
    end

    it { should have_content('Survey List') }
    it { should have_title(full_title('Survey')) }
  end

  describe "New Survey page" do
    let(:user) { FactoryGirl.create(user) }

    before do
      sign_in user
      visit survey_path 
    end

    it { should have_content('New Survey') }
    it { should have_title(full_title('New Survey')) }
  end
end
