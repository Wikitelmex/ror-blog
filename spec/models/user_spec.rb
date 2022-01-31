require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'alex', postscounter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postscounter should be greater or equal to 0' do
    subject.postscounter = -1
    expect(subject).to_not be_valid
  end

  it 'postscounter should be integer' do
    subject.postscounter = 1.5
    expect(subject).to_not be_valid
  end
end
