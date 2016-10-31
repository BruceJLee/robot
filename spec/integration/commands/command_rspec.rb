require 'commands/command'

describe Commands::Command do
  
  let(:command) { Commands::Command.new(nil) }

  describe ".execute" do
    it { expect { command.execute }.to raise_error(Commands::Error.NotImplementedError) }
  end

end