require 'rails_helper'

describe User, type: :model do

  describe 'Relationships' do
    xit { should belong_to(:user) }
 end
end
