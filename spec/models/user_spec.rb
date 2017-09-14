require 'rails_helper'

RSpec.describe User, type: :model do

  context 'Validation' do

    let(:user) { FactoryGirl.build(:user)}

    it { should validate_presence_of(:email) }
    # TODO: Validation of uniqueness is a bug in shoulda matchers
    # it { should validate_uniqueness_of(:email) }
    it { should validate_confirmation_of(:password) }
    it { should allow_value('example@domain.com').for(:email) }

  end
end
