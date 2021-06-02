require 'rails_helper'

RSpec.describe Category, type: :model do
  context "test organization association on category model" do
    subject { Category.create }
  
    it { should belong_to :organization }
  end 
end
