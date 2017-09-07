require 'rails_helper'

RSpec.describe Answer, type: :model do
  context 'Validation' do
    let(:answer) { FactoryGirl.build(:answer) }

    it { should validate_presence_of :content }
  end

  context 'Association' do
    it { should belong_to(:question) }
  end
end
