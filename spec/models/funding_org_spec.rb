require 'rails_helper'

RSpec.describe FundingOrg, type: :model do
  context "test organization association on funding_org model" do
    subject { FundingOrg.create }
    
    it { should belong_to :organization }
  end 
end
