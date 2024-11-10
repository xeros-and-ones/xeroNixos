{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    #-- c/c++
    cmake
    cmake-language-server
    gnumake
    checkmake
    # c/c++ compiler, required by nvim-treesitter!
    gcc
    # c/c++ tools with clang-tools, the unwrapped version won't
    # add alias like `cc` and `c++`, so that it won't conflict with gcc
    llvmPackages.clang-unwrapped
    lldb
    gdb

    # zig
    zig
    zls

    # rust
    cargo
    rustc
    rustfmt
    rust-analyzer

    #-- javascript/typescript --#
    nodePackages.nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    # HTML/CSS/JSON/ESLint language servers extracted from vscode
    nodePackages.vscode-langservers-extracted
    nodePackages."@tailwindcss/language-server"

    # go
    go
    gore
    gotests
    gotools
    gomodifytags
    iferr # generate error handling code for go
    impl # generate function implementation for go
    gopls # go language server
    delve # go debugger

    #-- lua
    stylua
    lua-language-server

    # other
    taplo # TOML language server / formatter / validator
    nodePackages.yaml-language-server
    tree-sitter # common language parser/highlighter
    nodePackages.prettier # common code formatter
    marksman # language server for markdown

    # nix tools
    nil
    alejandra
    nixfmt-classic

    #-- bash
    nodePackages.bash-language-server
    shellcheck
    shfmt

    #-- python
    pyright # python language server
    poetry
    (python311.withPackages (ps:
      with ps; [
        python-lsp-server
        python-lsp-ruff
        black # python formatter
        isort

        ## emacs's lsp-bridge dependenciesge
        epc
        orjson
        sexpdata
        six
        setuptools
        paramiko
        rapidfuzz
      ]))
  ];
}
