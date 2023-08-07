require 'spec_helper'

describe DataParser do
  subject { DataParser.parse(path:) }

  let(:path) { data_path('clients.json') }

  it 'does have a VERSION constant' do
    expect(DataParser.const_defined?('VERSION')).to be(true)
  end

  describe '.parse' do
    it 'returns an instance of DataParser::Json' do
      expect(DataParser.parse(path: data_path('clients.json')).class).to eq(DataParser::Json)
    end
  end

  describe '.process' do
    context 'when searching for partially matching name' do
      let(:full_name) { 'Mich' }

      it 'returns an array of matching names' do
        expect(subject.process(params: { full_name: }).names).to eq(
          [
            {
              'email' => 'michael.williams@outlook.com',
              'full_name' => 'Michael Williams',
              'id' => 4
            },
            {
              'email' => 'michael.brown@inbox.com',
              'full_name' => 'Michael Brown',
              'id' => 10
            }
          ]
        )
      end
    end

    context 'with duplicate emails' do
      it 'returns an array of emails having duplicate' do
        expect(subject.process.emails).to eq(%w(jane.smith@yahoo.com))
      end
    end
  end
end
