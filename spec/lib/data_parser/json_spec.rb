require 'spec_helper'

RSpec.describe DataParser::Json do
  subject { described_class.new(path:) }

  let(:path) { data_path('clients.json') }

  describe '#initialize' do
    context 'with arguments' do
      it 'initializes arguments and responds to a method' do
        expect(subject).to respond_to(:process)
      end
    end

    context 'with no arguments' do
      it 'raises ArgumentError' do
        expect { described_class.new({}) }.to raise_error(ArgumentError)
      end
    end

    context 'when path is empty' do
      it 'raises DataParser::PathMissing' do
        expect { described_class.new(path: nil) }.to raise_error(DataParser::PathMissing)
      end
    end

    context 'when file does not exists' do
      let(:path) { data_path('client.json') }

      it 'raises DataParser::FileNotFound' do
        expect { described_class.new(path:) }.to raise_error(DataParser::FileNotFound)
      end
    end
  end

  describe '.process' do
    context 'when param is an emptry string' do
      it 'raises DataParser::EmptyString' do
        expect { subject.process(params: '') }.to raise_error(DataParser::EmptyString)
      end
    end

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
