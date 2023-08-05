require 'spec_helper'

describe Jparzer do
  it 'does have a VERSION constant' do
    expect(Jparzer.const_defined?('VERSION')).to be(true)
  end
end
