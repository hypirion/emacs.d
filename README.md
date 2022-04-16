# Emacs setup for hyPiRion

## Go mode

Go mode needs the following tools: `go1.18` and `gopls`.

Install Go manually by setting it up to `~.go.18.1` and add GOPATH/GOROOT to
`.profile` as follows:

```shell
export GOROOT="$HOME/.go1.18.1"
export GOPATH="$HOME/.gopath"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
```

Obviously prefer a later Go version if you can find it.

gopls is installed by invoking `go install golang.org/x/tools/gopls@latest`


## License

Copyright © 2012-2021 Jean Niklas L'orange. Distributed under the GPL 3.0, see
the file LICENSE.
