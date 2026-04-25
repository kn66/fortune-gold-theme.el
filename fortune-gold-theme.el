;;; fortune-gold-theme.el --- Warm fortune-inspired light theme -*- lexical-binding: t; -*-

;; Author: nobu43
;; Version: 0.1.0
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0") (ef-themes "2.0.0"))
;; Keywords: faces, theme

;;; Commentary:
;;
;; A warm light theme built on the `modus-themes' engine and the `ef-themes'
;; palette semantics.
;;
;; The palette follows a fortune-oriented direction: yellow/gold is the primary
;; accent, warm white and beige form the base, while water blue, lavender, pink,
;; red, orange, silver, and restrained green support syntax and status faces.
;; Syntax colors are intentionally kept close to WCAG AA contrast against the
;; main background so they remain vivid while readable.

;;; Code:

(require 'modus-themes)
(require 'ef-themes)

(defgroup fortune-gold-theme nil
  "Warm fortune-inspired light theme built on Modus and Ef."
  :group 'faces
  :group 'ef-themes
  :prefix "fortune-gold-")

(defconst fortune-gold-theme-description
  "Warm fortune-inspired light theme with gold accents."
  "Documentation string for the `fortune-gold' theme.")

(defconst fortune-gold-theme-name 'fortune-gold
  "Theme symbol for `fortune-gold'.")

(defconst fortune-gold-theme-family 'fortune-gold-theme
  "Theme family symbol for `fortune-gold'.")

(defconst fortune-gold-theme-background-mode 'light
  "Background mode for `fortune-gold'.")

(defconst fortune-gold-palette-partial
  '(;; Core backgrounds / foregrounds
    (cursor "#8A6500")
    (bg-main "#FBF7ED")
    (bg-dim "#F1E6CC")
    (bg-alt "#EAD9A7")
    (fg-main "#3C3529")
    (fg-dim "#756D61")
    (fg-alt "#68727C")
    (bg-active "#F6EDDA")
    (bg-inactive "#F1E6CC")
    (border "#D8CAA9")

    ;; Fortune-specific helper colors
    (bg-hl "#F6EDDA")
    (bg-prose-block "#F8F1E3")
    (gold-soft "#D4AA34")
    (gold-strong "#8A6500")
    (water-soft "#1B7888")
    (navy-soft "#416B9D")
    (lavender-soft "#7C59A7")
    (pink-soft "#95587B")
    (red-soft "#A84B44")
    (orange-soft "#9C5A2D")
    (green-soft "#5B744E")
    (silver-soft "#68727C")

    ;; Red family: warnings and removal
    (red "#A84B44")
    (red-warmer "#B05245")
    (red-cooler "#8F3C4D")
    (red-faint "#C98478")

    ;; Green family: success only; kept muted by design
    (green "#5B744E")
    (green-warmer "#687A3D")
    (green-cooler "#4F735F")
    (green-faint "#8FA482")

    ;; Yellow family: primary lucky color
    (yellow "#8A6500")
    (yellow-warmer "#8F6900")
    (yellow-cooler "#806027")
    (yellow-faint "#B98D1D")

    ;; Blue family: water blue and navy, not plain vivid blue
    (blue "#416B9D")
    (blue-warmer "#4C639A")
    (blue-cooler "#315F94")
    (blue-faint "#7897BB")

    ;; Magenta/purple family: lavender and pink support
    (magenta "#7C59A7")
    (magenta-warmer "#95587B")
    (magenta-cooler "#6E5395")
    (magenta-faint "#B28DC0")

    ;; Cyan family: water color for function names and info
    (cyan "#1B7888")
    (cyan-warmer "#2C7F89")
    (cyan-cooler "#0F6F80")
    (cyan-faint "#77AAB0")

    ;; Intense backgrounds
    (bg-red-intense "#ECC8BD")
    (bg-green-intense "#DCE7BF")
    (bg-yellow-intense "#E9D28A")
    (bg-blue-intense "#D6E3EF")
    (bg-magenta-intense "#E7D7EC")
    (bg-cyan-intense "#D4E8EA")

    ;; Subtle backgrounds
    (bg-red-subtle "#F5E2DB")
    (bg-green-subtle "#ECF1DC")
    (bg-yellow-subtle "#F1E6CC")
    (bg-blue-subtle "#E6EEF5")
    (bg-magenta-subtle "#F0E6F2")
    (bg-cyan-subtle "#E4F0F1")

    ;; Nuanced backgrounds for headings and lightly accented surfaces
    (bg-red-nuanced "#F3E9E2")
    (bg-green-nuanced "#EEF0E2")
    (bg-yellow-nuanced "#F6EDDA")
    (bg-blue-nuanced "#E9EEF2")
    (bg-magenta-nuanced "#F1E9F0")
    (bg-cyan-nuanced "#E7F0EF")

    ;; Graph colors for org-habit and chart-like faces
    (bg-graph-red-0 "#D58B7D")
    (bg-graph-red-1 "#E7B9AF")
    (bg-graph-green-0 "#90A576")
    (bg-graph-green-1 "#BACAA0")
    (bg-graph-yellow-0 "#D4AA34")
    (bg-graph-yellow-1 "#E2C467")
    (bg-graph-blue-0 "#7FA0C3")
    (bg-graph-blue-1 "#B3C8DB")
    (bg-graph-magenta-0 "#B48CC0")
    (bg-graph-magenta-1 "#D5BEDB")
    (bg-graph-cyan-0 "#80B0B8")
    (bg-graph-cyan-1 "#B4D0D3")

    ;; Diff
    (bg-added "#DCE7BF")
    (bg-added-faint "#ECF1DC")
    (bg-added-refine "#CADAA2")
    (bg-added-fringe "#90A576")
    (fg-added "#5B744E")
    (fg-added-intense "#49613D")

    (bg-changed "#E9D28A")
    (bg-changed-faint "#F1E6CC")
    (bg-changed-refine "#DDBD5F")
    (bg-changed-fringe "#D4AA34")
    (fg-changed "#806027")
    (fg-changed-intense "#6D500F")

    (bg-removed "#ECC8BD")
    (bg-removed-faint "#F5E2DB")
    (bg-removed-refine "#DDA99B")
    (bg-removed-fringe "#D58B7D")
    (fg-removed "#A84B44")
    (fg-removed-intense "#8F3C4D")

    (bg-diff-context "#F6EDDA")

    ;; UI chrome
    (bg-mode-line-active "#EADFC9")
    (fg-mode-line-active "#3C3529")
    (bg-mode-line-inactive "#F1E6CC")
    (fg-mode-line-inactive "#756D61")
    (border-mode-line-active "#8A6500")
    (border-mode-line-inactive "#D8CAA9")
    (bg-completion "#F1E6CC")
    (bg-hover "#F6EDDA")
    (bg-hover-secondary "#E6EEF5")
    (bg-hl-line "#F6EDDA")
    (bg-paren-match "#E9D28A")
    (bg-err "#ECC8BD")
    (bg-warning "#E9D28A")
    (bg-info "#D4E8EA")
    (bg-region "#E9D28A"))
  "Base palette entries for `fortune-gold'.")

(defconst fortune-gold-palette-mappings-partial
  '(;; Status
    (err red)
    (warning orange-soft)
    (info cyan)
    (underline-err red)
    (underline-warning orange-soft)
    (underline-note cyan)
    (modeline-err red)
    (modeline-warning yellow)
    (modeline-info cyan)
    (bg-prominent-warning bg-warning)
    (fg-prominent-warning fg-main)
    (bg-prominent-note bg-info)
    (fg-prominent-note fg-main)

    ;; Links
    (fg-link blue)
    (fg-link-visited magenta)
    (fg-link-symbolic cyan)
    (bg-link unspecified)
    (bg-link-symbolic unspecified)
    (bg-link-visited unspecified)
    (underline-link blue)
    (underline-link-visited magenta)
    (underline-link-symbolic cyan)

    ;; Identifiers & prompt
    (name cyan)
    (keybind yellow)
    (identifier fg-main)
    (fg-prompt yellow)
    (bg-prompt unspecified)

    ;; Code syntax
    (builtin magenta-warmer)
    (comment fg-dim)
    (constant yellow-cooler)
    (fnname cyan)
    (fnname-call cyan-warmer)
    (keyword yellow-warmer)
    (preprocessor yellow)
    (property fg-main)
    (docstring fg-dim)
    (docmarkup yellow-cooler)
    (string magenta)
    (type yellow-cooler)
    (variable blue)
    (variable-use blue)
    (rx-backslash orange-soft)
    (rx-construct magenta)

    ;; Accents
    (accent-0 yellow)
    (accent-1 cyan)
    (accent-2 magenta-warmer)
    (accent-3 orange-soft)

    ;; Buttons / selections
    (fg-button-active fg-main)
    (fg-button-inactive fg-dim)
    (bg-button-active bg-main)
    (bg-button-inactive bg-dim)
    (fg-region fg-main)
    (bg-mark-delete bg-red-subtle)
    (fg-mark-delete red)
    (bg-mark-select bg-yellow-subtle)
    (fg-mark-select yellow)
    (bg-mark-other bg-cyan-subtle)
    (fg-mark-other cyan)

    ;; Dates
    (date-common cyan)
    (date-deadline red)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday red-warmer)
    (date-holiday-other magenta-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday blue)
    (date-weekend red-faint)

    ;; Prose / markup
    (fg-prose-code yellow-cooler)
    (prose-done green)
    (fg-prose-macro yellow)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula cyan)
    (prose-tag yellow-faint)
    (prose-todo red)
    (fg-prose-verbatim magenta-warmer)

    ;; Mail
    (mail-cite-0 yellow)
    (mail-cite-1 cyan)
    (mail-cite-2 magenta-warmer)
    (mail-cite-3 red-warmer)
    (mail-part cyan)
    (mail-recipient blue)
    (mail-subject yellow)
    (mail-other fg-alt)

    ;; Search
    (bg-search-static bg-cyan-subtle)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-yellow-subtle)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-yellow-intense)
    (bg-search-rx-group-1 bg-magenta-intense)
    (bg-search-rx-group-2 bg-cyan-intense)
    (bg-search-rx-group-3 bg-red-intense)

    (bg-space-err bg-red-intense)
    (bg-space bg-main)
    (fg-space border)

    ;; Line numbers & fringe
    (fringe bg-main)
    (fg-line-number-active yellow)
    (fg-line-number-inactive silver-soft)
    (bg-line-number-active bg-hl-line)
    (bg-line-number-inactive bg-main)

    ;; Structural surfaces
    (bg-tab-bar bg-dim)
    (bg-tab-current bg-main)
    (bg-tab-other bg-dim)

    ;; Matching / prompts / emphasis
    (bg-prominent-err bg-err)
    (fg-prominent-err err)
    (fg-paren-match fg-main)
    (underline-paren-match unspecified)
    (bg-active-argument bg-active)
    (fg-active-argument yellow)
    (bg-active-value bg-yellow-subtle)
    (fg-active-value yellow)

    ;; Prose blocks
    (bg-prose-block-delimiter bg-prose-block)
    (fg-prose-block-delimiter fg-dim)
    (bg-prose-block-contents bg-prose-block)
    (bg-prose-code unspecified)
    (bg-prose-macro unspecified)
    (bg-prose-verbatim unspecified)

    ;; Completion / search
    (fg-completion-match-0 yellow)
    (fg-completion-match-1 cyan)
    (fg-completion-match-2 magenta-warmer)
    (fg-completion-match-3 orange-soft)
    (bg-completion-match-0 unspecified)
    (bg-completion-match-1 unspecified)
    (bg-completion-match-2 unspecified)
    (bg-completion-match-3 unspecified)
    (bg-completion bg-dim)
    (fg-search-current fg-main)

    ;; Terminal
    (bg-term-black fg-main)
    (fg-term-black fg-main)
    (bg-term-black-bright fg-dim)
    (fg-term-black-bright fg-dim)
    (bg-term-red red)
    (fg-term-red red)
    (bg-term-red-bright red-warmer)
    (fg-term-red-bright red-warmer)
    (bg-term-green green)
    (fg-term-green green)
    (bg-term-green-bright green-warmer)
    (fg-term-green-bright green-warmer)
    (bg-term-yellow yellow)
    (fg-term-yellow yellow)
    (bg-term-yellow-bright yellow-warmer)
    (fg-term-yellow-bright yellow-warmer)
    (bg-term-blue blue)
    (fg-term-blue blue)
    (bg-term-blue-bright blue-warmer)
    (fg-term-blue-bright blue-warmer)
    (bg-term-magenta magenta)
    (fg-term-magenta magenta)
    (bg-term-magenta-bright magenta-warmer)
    (fg-term-magenta-bright magenta-warmer)
    (bg-term-cyan cyan)
    (fg-term-cyan cyan)
    (bg-term-cyan-bright cyan-warmer)
    (fg-term-cyan-bright cyan-warmer)
    (bg-term-white border)
    (fg-term-white border)
    (bg-term-white-bright bg-main)
    (fg-term-white-bright bg-main)

    ;; Rainbow / heading order
    (rainbow-0 yellow)
    (rainbow-1 cyan)
    (rainbow-2 magenta)
    (rainbow-3 blue)
    (rainbow-4 orange-soft)
    (rainbow-5 red)
    (rainbow-6 green)
    (rainbow-7 fg-alt)
    (rainbow-8 fg-dim)

    ;; Headings
    (fg-heading-0 yellow)
    (fg-heading-1 yellow)
    (fg-heading-2 cyan)
    (fg-heading-3 magenta)
    (fg-heading-4 blue)
    (fg-heading-5 orange-soft)
    (fg-heading-6 red-soft)
    (fg-heading-7 fg-alt)
    (fg-heading-8 fg-dim)
    (bg-heading-0 unspecified)
    (bg-heading-1 bg-yellow-nuanced)
    (bg-heading-2 unspecified)
    (bg-heading-3 bg-magenta-nuanced)
    (bg-heading-4 bg-blue-nuanced)
    (bg-heading-5 unspecified)
    (bg-heading-6 bg-red-nuanced)
    (bg-heading-7 unspecified)
    (bg-heading-8 unspecified)
    (overline-heading-0 yellow)
    (overline-heading-1 yellow)
    (overline-heading-2 cyan)
    (overline-heading-3 magenta)
    (overline-heading-4 blue)
    (overline-heading-5 orange-soft)
    (overline-heading-6 red-soft)
    (overline-heading-7 unspecified)
    (overline-heading-8 unspecified))
  "Semantic color mappings for `fortune-gold'.")

(defcustom fortune-gold-palette-overrides nil
  "Overrides for `fortune-gold-palette'.

Each element should have the form (NAME VALUE), where NAME is a palette
entry from `fortune-gold-palette' and VALUE is either another palette symbol
or a color string."
  :group 'fortune-gold-theme
  :package-version '(fortune-gold-theme . "0.1.0")
  :type '(repeat (list symbol (choice symbol string))))

(defconst fortune-gold-palette
  (modus-themes-generate-palette
   fortune-gold-palette-partial
   'warm
   nil
   (append fortune-gold-palette-mappings-partial ef-themes-palette-common))
  "Full palette for `fortune-gold'.")

(defconst fortune-gold-custom-faces
  '(`(corfu-default ((,c :inherit modus-themes-fixed-pitch
                         :background ,bg-dim
                         :foreground ,fg-main)))
    `(corfu-current ((,c :background ,bg-yellow-intense
                         :foreground ,fg-main
                         :extend t
                         :box (:line-width -1 :color ,yellow)
                         :weight semi-bold)))
    `(corfu-border ((,c :background ,border
                        :foreground ,border)))
    `(corfu-bar ((,c :background ,yellow)))
    `(corfu-popupinfo ((,c :background ,bg-dim
                           :foreground ,fg-main))))
  "Additional face overrides for `fortune-gold'.

Prefer palette entries and semantic mappings first.
Use direct face overrides only for targeted package cases where the
inherited mapping does not provide enough contrast.")

(defun fortune-gold--ensure-modus-theme-metadata ()
  "Declare `fortune-gold' as a Modus-derived theme when reloading in-session.

If a `fortune-gold' theme object already exists in the session, ensure it still
has the theme properties that `modus-themes-theme' expects."
  (unless (plist-get (get fortune-gold-theme-name 'theme-properties) :modus-core-palette)
    (modus-themes-declare
     fortune-gold-theme-name
     fortune-gold-theme-family
     fortune-gold-theme-description
     fortune-gold-theme-background-mode
     'fortune-gold-palette
     nil
     'fortune-gold-palette-overrides)
    (modus-themes-register fortune-gold-theme-name)))

(fortune-gold--ensure-modus-theme-metadata)

(modus-themes-theme
 fortune-gold-theme-name
 fortune-gold-theme-family
 fortune-gold-theme-description
 fortune-gold-theme-background-mode
 'fortune-gold-palette
 nil
 'fortune-gold-palette-overrides
 'fortune-gold-custom-faces)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory
                (file-name-directory load-file-name))))

(provide 'fortune-gold-theme)

;;; fortune-gold-theme.el ends here
