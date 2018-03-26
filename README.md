# dotfiles

```bash
$ sh setup.sh
```

## Erlang インストール

### for mac

```
mkdir ~/.otp
ln -snvf ~/dotfiles/.kerlrc ~/.kerlrc
brew install kerl
kerl update releases
keri build $VERSION $VERSION
kerl install $VERSION .otp/$VERSION
source .otp/$VERSION/activate.fish
```

