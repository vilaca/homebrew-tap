class CursorChatCleaner < Formula
  include Language::Python::Virtualenv

  desc "Find, back up, and delete Cursor chats on macOS"
  homepage "https://github.com/vilaca/cursor-chat-cleaner"
  url "https://files.pythonhosted.org/packages/b4/e3/cd9a367852068db4c838c3be3c53d7c9c7d00dd8b9352557f0f1a59948ae/cursor_chat_cleaner-0.1.2.tar.gz"
  sha256 "c5f98a98b5a4ed3cd33e7061abc10b472e6e308c8029105b7d9b0ffd7a28b59c"
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
