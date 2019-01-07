require 'rails_helper'

describe User, type: :model do

  describe 'Validations' do
    xit { should validate_presence_of(:email)}
    xit { should validate_uniqueness_of(:email)}
  end

  describe 'Relationships' do
   xit { should have_many(:favorites) }
 end


  it 'It can generate an API key' do
    user = User.create(email: "bob", password: "rob")
    user.generate_api_key
    length = user.api_key.length

    expect(length).to eq(22)
  end
end
