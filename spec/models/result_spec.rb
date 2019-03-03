require 'rails_helper'

RSpec.describe Result, type: :model do
  describe '.success' do
    it 'creates a success result with empty params' do
      result = Result.success
      expect(result).to be_success
      expect(result.params).to eq({})
    end

    it 'creates a success result with params' do
      result = Result.success(foo: 'blah')
      expect(result).to be_success
      expect(result.params).to eq(foo: 'blah')
    end
  end

  describe '.failure' do
    it 'creates a failure result with error message and empty params' do
      result = Result.failure('error message')
      expect(result).not_to be_success
      expect(result.error_message).to eq('error message')
      expect(result.params).to eq({})
    end

    it 'creates a failure result with error message and params' do
      result = Result.failure('error message', foo: 'blah')
      expect(result).not_to be_success
      expect(result.error_message).to eq('error message')
      expect(result.params).to eq(foo: 'blah')
    end
  end
end
