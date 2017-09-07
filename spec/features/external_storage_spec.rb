require 'rails_helper'

RSpec.feature "ExternalStorage", type: :feature do
  it 'has a version' do
    expect(ExternalStorage::VERSION).to be_a String
  end
end
