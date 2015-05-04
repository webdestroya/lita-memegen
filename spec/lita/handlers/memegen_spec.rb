require "spec_helper"

describe Lita::Handlers::Memegen, lita_handler: true do

  describe 'default config' do
    it "sets the username to nil by default" do
      expect(Lita.config.handlers.memegen.username).to be_nil
    end
    it "sets the password to nil by default" do
      expect(Lita.config.handlers.memegen.password).to be_nil
    end
  end

  describe 'routes' do
    ROUTES = {
      meme_y_u_no: ["y u no blah"],
      meme_i_dont_always: ["i don't always blah but when i do, blah", "I dont always blah but when I do blah"],
      meme_orly: ["blah o rly?", "ORLY"],
      meme_success: ["blah SUCCESS", "blah NAILED IT"],
      meme_all_the: ["blah ALL the blah"],
      meme_too_damn: ["blah is too damn blah"],
      meme_good_news: ["good news everyone. blah", "good news everyone, blah", "good news everyone! blah", "good news everyone blah"], meme_not_sure_if: ["not sure if blah or blah"],
      meme_yo_dawg: ["yo dawg blah so blah"],
      meme_are_belong: ["all your blah are belong to us"],
      meme_fuck_you: ["blah fuck you"],
      meme_bad_time: ["blah you're gonna have a bad time", "blah youre gonna have a bad time"],
      meme_simply: ["one does not simply blah"],
      meme_grumpy_cat: ["grumpy cat blah, blah"],
      meme_looks_like: ["it looks like you're blah", "it looks like youre blah", "it looks like you blah"], meme_am_i_only: ["am i the only one around here who blah"],
      meme_not_impressed: ["blahnot impressedddd" "blah not impressed"],
      meme_prepare_yourself: ["prepare yourself blah"],
      meme_what_if_i: ["what if i told you blah"],
      meme_better_drink: ["blah better drink my own piss"],
      meme_khanify: ["khanify blah"],
      meme_doge: ["such blah wow"],
      meme_kanye: ["imma let you finish blah"]
    }

    ROUTES.each do |method, commands|
      commands.each do |command|
        it { is_expected.to route_command(command).to method }
      end
    end
  end

  describe '#khanify' do
    it 'produces strings that are upcased' do
      text = subject.khanify 'a'
      expect(text).to eq text.upcase
    end
    it 'adds 11 more of the last vowel' do
      expect(subject.khanify 'ae').to include 'E'*12
    end
    it 'adds 11 more of the last consonant if there are no vowels' do
      expect(subject.khanify 'tw').to include 'W'*12
    end
    it 'adds !!!! to the end' do
      expect(subject.khanify 'a').to end_with '!!!!'
    end
  end

  describe 'route methods' do
    let(:response) { double }
    describe '#meme_y_u_no' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 2, 166088
        subject.meme_y_u_no response
      end
    end

    describe '#meme_i_dont_always' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 74, 2485
        subject.meme_i_dont_always response
      end
    end

    describe '#meme_orly' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 920, 117049
        subject.meme_orly response
      end
    end

    describe '#meme_success' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 121, 1031
        subject.meme_success response
      end
    end

    describe '#meme_all_the' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 6013, 1121885
        subject.meme_all_the response
      end
    end

    describe '#meme_too_damn' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 998, 203665
        subject.meme_too_damn response
      end
    end

    describe '#meme_good_news' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 1591, 112464
        subject.meme_good_news response
      end
    end

    describe '#meme_not_sure_if' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 305, 84688
        subject.meme_not_sure_if response
      end
    end

    describe '#meme_yo_dawg' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 79, 108785
        subject.meme_yo_dawg response
      end
    end

    describe '#meme_are_belong' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 349058, 2079825
        subject.meme_are_belong response
      end
    end

    describe '#meme_fuck_you' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 1189472, 5044147
        subject.meme_fuck_you response
      end
    end

    describe '#meme_bad_time' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 825296, 3786537
        subject.meme_bad_time response
      end
    end

    describe '#meme_simply' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 274947, 1865027
        subject.meme_simply response
      end
    end

    describe '#meme_grumpy_cat' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 1590955, 6541210
        subject.meme_grumpy_cat response
      end
    end

    describe '#meme_looks_like' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 20469, 1159769
        subject.meme_looks_like response
      end
    end

    describe '#meme_am_i_only' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 953639, 4240352
        subject.meme_am_i_only response
      end
    end

    describe '#meme_not_impressed' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 1420809, 5883168
        subject.meme_not_impressed response
      end
    end

    describe '#meme_prepare_yourself' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 414926, 2295701
        subject.meme_prepare_yourself response
      end
    end

    describe '#meme_what_if_i' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 1118843, 4796874
        subject.meme_what_if_i response
      end
    end

    describe '#meme_better_drink' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 92, 89714
        subject.meme_better_drink response
      end
    end

    describe '#meme_khanify' do
      let(:response) { double matches: [['text']] }
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 6443, 1123022, line1: '', line2: subject.khanify('text')
        subject.meme_khanify response
      end
    end

    describe '#meme_doge' do
      let(:response) { double matches: [['such', 'text']] }
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 2452817, 9861901, line1: 'such text', line2: 'wow'
        subject.meme_doge response
      end
    end

    describe '#meme_kanye' do
      it 'calls #generate_meme with the correct arguments' do
        expect(MemeGenerator).to receive(:generate_meme).with response, 1988183, 8275549
        subject.meme_kanye response
      end
    end
  end

end
