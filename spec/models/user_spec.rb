require 'rails_helper'

RSpec.describe User, type: :model do
  before { FactoryBot.build(:user) }
  context "Validations" do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:status)}
    it {should validate_presence_of(:id)}
    it {should validate_presence_of(:created_at)}
    it {should validate_uniqueness_of(:id)}
    it {should validate_uniqueness_of(:email)}
    it {should define_enum_for(:status).with_values([:Inactive, :Active]) }
  end
end
