require 'rails_helper'

RSpec.describe Grant, type: :model do
  context "test organization and funding org and reports and sections associations on grant model" do
    subject { Grant.create }
    
    it { should belong_to :organization }
    it { should belong_to :funding_org }
    it { should have_many :reports }
    it { should have_many :sections }

  end 
end
