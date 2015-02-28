require 'spec_helper'

describe MemeGenerator do
  describe '.generate_meme' do
    it 'calls generate_meme on a new instance of MemeGenerator' do
      expect_any_instance_of(MemeGenerator).to receive :generate_meme
      MemeGenerator.generate_meme double, 1, 1, line1:'', line2:''
    end
  end

  describe '#generate_meme' do
    subject(:generator) { MemeGenerator.new response, 1, 1, line1:'', line2:'' }
    let(:message) { double command?: true }
    let(:response) { double message: message, reply: nil }
    before do
      allow(Lita.config.handlers.memegen).to receive(:username) { 'user' }
      allow(Lita.config.handlers.memegen).to receive(:password) { 'pass' }
      allow(Lita.config.handlers.memegen).to receive(:command_only) { false }
    end

    context 'when missing username' do
      before { allow(Lita.config.handlers.memegen).to receive(:username) { nil } }

      it 'is nil' do
        expect(generator.generate_meme).to be_nil
      end
    end

    context 'when missing password' do
      before { allow(Lita.config.handlers.memegen).to receive(:password) { nil } }

      it 'is nil' do
        expect(generator.generate_meme).to be_nil
      end
    end

    context 'when configured to respond to command only' do
      before { allow(Lita.config.handlers.memegen).to receive(:command_only) { true } }

      context 'when message is not a command' do
        let(:message) { double command?: false }
        it 'is nil' do
          expect(generator.generate_meme).to be_nil
        end
      end
    end

    context 'when configured correctly' do
      let(:http_response) { double status: 200, body: http_body.to_json }
      before do
        allow_any_instance_of(Faraday::Connection).to receive(:get) { http_response }
        allow(Lita.logger).to receive(:error)
      end

      context 'when the response is successful' do
        let(:http_body) { { success: true, result: { instanceImageUrl: 'url' } } }

        it 'replies with the url' do
          expect(response).to receive(:reply).with 'url'
          generator.generate_meme
        end
      end

      context 'when the response is unsuccessful' do
        let(:http_body) { { success: false } }

        it 'logs an error' do
          expect(Lita.logger).to receive(:error).with 'MemeGenerator: Unable to generate a meme image: {"success"=>false}'
          generator.generate_meme
        end

        it 'replies with the url' do
          expect(response).to receive(:reply).with 'Error: Unable to generate a meme image'
          generator.generate_meme
        end
      end
    end
  end
end
