# walker unified search setup

## summary
this configuration integrates plocate for blazing fast, spotlight-like file searching directly within the walker launcher. apps and files are interleaved based on relevance, providing a single entry point for all system interactions.

## what was done
1.  **unified search**: merged the `files` provider into the `default` search results in `config.toml`.
2.  **performance engine**: integrated `plocate` as the search backend for sub-millisecond file lookups.
3.  **privacy filtering**: implemented strict exclusion rules to hide sensitive files (.env, keys, credentials) and heavy directories (.git, node_modules, .cache).
4.  **mocha aesthetics**: updated `style.css` to include dimmed path subtexts and unified the layout with a 10px rounding to match hyprland.
5.  **portable storage**: moved `layout.xml` into the dotfiles repository to ensure the theme is fully self-contained.

## file structure
-   `~/dotfiles/walker/config.toml`: core logic, provider weighting, and plocate integration.
-   `~/dotfiles/walker/themes/mocha/style.css`: catppuccin mocha theme with custom subtext styling.
-   `~/dotfiles/walker/themes/mocha/layout.xml`: window dimensions and structural layout.

## how to replicate / future setup
if you move to a new workspace or machine, follow these steps:

1.  **install dependencies**:
    `sudo pacman -S plocate fd`
2.  **initialize database**:
    `sudo updatedb`
3.  **stow the configuration**:
    `cd ~/dotfiles && stow walker`
4.  **keep index fresh**:
    ensure the `plocate-updatedb.timer` is enabled:
    `sudo systemctl enable --now plocate-updatedb.timer`
5.  **restart walker**:
    `omarchy-restart-walker`

## search prefixes
-   `none`: search apps and files together.
-   `.` or `/`: force file-only search.
-   `?`: force web search.
-   `:`: search symbols/emojis.
