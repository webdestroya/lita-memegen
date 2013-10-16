require "spec_helper"

describe Lita::Handlers::Memegen, lita_handler: true do
  it { routes_command("Y U NO BLAH").to(:meme_y_u_no) }
  it { routes_command("i don't always fart but when i do, i do it loud").to(:meme_i_dont_always) }
  it { routes_command("blah o rly?").to(:meme_orly) }
  it { routes_command("khanify blah").to(:meme_khanify) }

  it "sets the username and password to nil by default" do
    expect(Lita.config.handlers.memegen.username).to be_nil
    expect(Lita.config.handlers.memegen.password).to be_nil
  end

end
