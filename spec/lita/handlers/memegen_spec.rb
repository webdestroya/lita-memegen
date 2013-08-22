require "spec_helper"

describe Lita::Handlers::Memegen, lita_handler: true do
  it { routes_command("Y U NO BLAH").to(:y_u_no) }

  it "sets the username and password to nil by default" do
    expect(Lita.config.handlers.memegen.username).to be_nil
    expect(Lita.config.handlers.memegen.password).to be_nil
  end

end