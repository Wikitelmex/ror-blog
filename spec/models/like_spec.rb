require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Like.new(author_id: 1, post_id: 1) }

  before { subject.save }

  it 'author_id should be present' do
    subject.author_id = nil
    expect(subject).to_not be_valid
  end

  it 'post_id should be present' do
    subject.post_id = nil
    expect(subject).to_not be_valid
  end
end
