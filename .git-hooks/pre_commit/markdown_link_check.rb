module Overcommit::Hook::PreCommit
  class MarkdownLinkCheck < Base
    def run
      result = execute(command, args: applicable_files)
      output = result.stdout.chomp

      return :pass if result.success?
      return [:fail, result.stdout] unless result.stdout.empty?
    end
  end
end
