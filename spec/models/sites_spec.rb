require 'spec_helper'

describe "Sites Model" do
  let(:sites) { Sites.new }
  it 'can be created' do
    sites.should_not be_nil
  end
end
