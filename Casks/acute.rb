# acute at the command line.
#
# A cask rather than a formula: there is nothing to build. The package is
# TypeScript already compiled to plain ESM, with no dependencies of its own and
# the manual's markdown beside it, so installing it is unpacking it and pointing
# a name at it — and a formula would ask the machine for a compiler it has no
# use for. Node comes from the formula it depends on, and the shebang in
# main.js finds it on the path.
cask "acute" do
  version "0.1.0"
  sha256 "bdccdc691c8210b8bfbfcf00cef55943049f68572436989e80f67ac9692d253c"

  url "https://fl4sh.fly.dev/downloads/acute-cli-#{version}.tgz"
  name "acute"
  desc "Vocabulary decks in your terminal: you bring the word, acute writes the card"
  homepage "https://fl4sh.fly.dev"

  depends_on formula: "node"

  # npm tarballs unpack into package/
  binary "package/dist/main.js", target: "acute"

  caveats <<~EOS
    Sign in once, and the decks are the same ones the app and the website hold:

      acute signin
      acute

  EOS
end
