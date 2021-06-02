require 'rails_helper'

RSpec.describe Organization, type: :model do
  context "test boilerplates bios grants categories and funding_orgs and organization_users associations on organizations model" do
    subject { Organization.create }
    
    it { should have_many :boilerplates }
    it { should have_many :categories }
    it { should have_many :funding_orgs }
    it { should have_many :grants }
    it { should have_many :organization_users }

  end 
end
