;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; フォント
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 12))
;; 可変幅（Org 見出しなど）も日本語対応したい場合
(setq doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 12))
;; シンボルフォント
(set-fontset-font t 'unicode
                    (font-spec :family "Noto Sans Symbols2") nil 'append)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
;; コメントを明るくする
(setq doom-one-brighter-comments t   ; 前景色を濃く
      doom-one-comment-bg    nil)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "/inbox.org"))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; タブ文字や全角空白の可視化
(setq whitespace-style '(face ; face による可視化を有効化（これがないと *-mark 以外が有効にならない）
                         trailing ; 行末の空白
                         tabs ; タブ
                         spaces ; スペース
                         empty ; バッファの前後の空行
                         space-mark ; 空白文字を置き換え
                         tab-mark ; タブ文字を置き換え
                         ))
;; (setq whitespace-display-mappings
;;       '((space-mark ?\x3000 [?\u25a1]) ; 全角空白を「□」で表示
;;         (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t]))) ; タブを「»」で表示
(setq whitespace-action '(auto-cleanup)) ; 自動クリーンアップを有効化
(global-whitespace-mode 1)  ; 全バッファで有効化

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word))
  :config
  (add-to-list 'copilot-indentation-alist '(prog-mode 2))
  (add-to-list 'copilot-indentation-alist '(org-mode 2))
  (add-to-list 'copilot-indentation-alist '(text-mode 2))
  (add-to-list 'copilot-indentation-alist '(closure-mode 2))
  (add-to-list 'copilot-indentation-alist '(emacs-lisp-mode 2)))

;; 10 行まとめて上下に移動する
(defun +cursor/next-10-line ()
  "Move cursor **down** 10 lines."
  (interactive)
  (evil-next-line 10))

(defun +cursor/prev-10-line ()
  "Move cursor **up** 10 lines."
  (interactive)
  (evil-previous-line 10))

;; Normal & Visual モードで C-j / C-k を再マップ
(map! :nv "C-j" #'+cursor/next-10-line
      :nv "C-k" #'+cursor/prev-10-line)
