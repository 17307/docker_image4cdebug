FROM nixery.dev/shell/ps/vim/tshark/netcat/git/curl/cacert/zsh/gnused/toybox/util-linux:latest

RUN zsh -c ' echo "root:x:0:0:root:/root:/bin/bash" > /etc/passwd && echo Y | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && cp /.zshrc /nix/.zshrc && cp -r /.oh-my-zsh /nix/.oh-my-zsh && cp /etc/ssl/certs/ca-bundle.crt /nix/ca-bundle.crt'

ENV HOME=/nix
ENV SSL_CERT_FILE=/nix/ca-bundle.crt

CMD ["zsh"]