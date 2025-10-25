{config, pkgs, ...}:

{
  home.packages = with pkgs; [
    
    # Enhanced Git utilities
    gh                          # GitHub CLI
    git-extras                  # Additional git commands
    gitflow                    # Git flow extensions
    
    # Interactive tools
    lazygit                     # Terminal UI for git
    delta                       # Syntax-highlighting pager for git
    gitui                       # Another terminal UI
    
    # Code review & analysis
    tig                         # Text-mode interface for git
    git-interactive-rebase-tool # Better rebase interface
    
    # Security & signing
    gnupg                       # For commit signing
  ];

  programs.git.extraConfig = {
    # Use delta for diff if available
    core.pager = "${pkgs.delta}/bin/delta";
    interactive.diffFilter = "${pkgs.delta}/bin/delta --color-only";
  };
}
