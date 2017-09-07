require 'rails_helper'

RSpec.describe Question, type: :model do

  context 'Validations' do
    let(:question) { FactoryGirl.build(:question) }
    it { should validate_length_of :tile }
    it { should validate_length_of :body }
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end

  context 'Association' do
    it { should have_many(:answers) }
  end
end
