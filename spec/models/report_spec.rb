require 'rails_helper'

RSpec.describe Report, type: :model do
  context "test grant and report_section associations on report model" do
    subject { Report.create }
    
    it { should belong_to :grant }
    it { should have_many :report_section }
  end 
end
