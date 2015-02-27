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
      meme_khanify: ["khanify blah"]
    }

    ROUTES.each do |method, commands|
      commands.each do |command|
        it { is_expected.to route_command(command).to method }
      end
    end
  end

end
