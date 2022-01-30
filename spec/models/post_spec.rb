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

  it 'title should be maximun lenght of 250' do
    subject.title = 'a' * 251
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

  it 'comments_counter should be greater or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be integer' do
    subject.comments_counter = 1.5
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be integer' do
    subject.likes_counter = 1.5
    expect(subject).to_not be_valid
  end
end
