require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'title', text: 'text') }

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be minimun lenght of 5' do
    subject.title = '123'
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'text should be minimun lenght of 10' do
    subject.text = '123'
    expect(subject).to_not be_valid
  end
end