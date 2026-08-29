class CursorChatCleaner < Formula
  include Language::Python::Virtualenv

  desc "Find, back up, and delete Cursor chats on macOS"
  homepage "https://github.com/vilaca/cursor-chat-cleaner"
  url "https://files.pythonhosted.org/packages/30/1d/b38b385ef1982d00072bdc75a2f03bd1fcd41c515b96392daa092228082e/cursor_chat_cleaner-0.1.0.tar.gz"
  sha256 "1ce89ab0bbb462449d20d74327c6e39e6963cb3370a0d00b53152ad161c0305f"
  license "MIT"

  depends_on :macos
  depends_on "python@3.14"

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/6d/44/f5da03a8ef95d369145c5bb53050e7877c9f3d312e128605fd9504829143/setuptools-84.0.0.tar.gz"
    sha256 "f4695c21257f0d9b537ec2692c941d02ee143b7cc1276941349a546573b2ef73"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "cursor-chat-cleaner #{version}",
                 shell_output("#{bin}/cursor-chat-cleaner --version")
  end
end
