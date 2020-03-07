;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(global-git-gutter-mode t)
(global-prettify-symbols-mode)


;; Some functionality uses this to identify you, e.g. GPG configuration, email

;; clients, file templates and snippets.
(setq user-full-name "Paulo Coelho Alves"
      user-mail-address "paulo@pcalv.es")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Iosevka" :size 14))
(set-frame-parameter nil 'undecorated t)

;; font ligatures
(mac-auto-operator-composition-mode t)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; enable true fuzzy search
(setq ivy-re-builders-alist
      '((t . ivy--regex-ignore-order)))

;; enable move-text default bindings (Meta-up/Meta-down)
(move-text-default-bindings)

;; define projects
(projectile-add-known-project "~/Sites/plex-web-client")
(projectile-add-known-project "~/Sites/lightning")
(projectile-add-known-project "~/Sites/konvergo-web-builder")
(projectile-add-known-project "~/Sites/plex-media-player")
(projectile-add-known-project "~/Sites/specs")

(setq initial-major-mode 'org-mode)

;; org configs
(after! org
  ;; prevent erroneous linting errors
  ;; See: https://github.com/flycheck/flycheck/issues/1488
  (add-hook! 'org-mode-hook (flycheck-mode -1))

  ;; set agenda files
  (setq org-agenda-files '("~/org"))

  (setq org-todo-keywords
        '((sequence
           "TODO(t)"
           "PROJECT(p)"
           "INPROGRESS(i)"
           "NEXT(n)"
           "WAITING(w)"

           "MEETING(m)"
           "|"
           "DONE(d)"
           "REASSIGNED(r)"
           "CANCELLED(c)")
          (sequence
           "[ ](T)"   ; A task that needs doing
           "[-](S)"   ; Task is in progress
           "[?](W)"   ; Task is being held up or paused
           "|"
           "[X](D)")) ; Task was completed

        ;; Custom colors for the keywords
        org-todo-keyword-faces
        '(("TODO" :foreground "#81A1C1" :weight bold)
          ("PROJECT" :foreground "#8FBCBB")
          ("NEXT"  . +org-todo-active)
          ("INPROGRESS" :foreground "#D08770" :weight bold)
          ("WAITING" . +org-todo-onhold)
          ("MEETING" :foreground "#A3BE8C" :weight bold)
          ("DONE" :foreground "#A3BE8C" :weight bold)
          ("CANCELLED" :foreground "#434C5E" :weight bold)
          ("REASSIGNED" :foreground "#434C5E" :weight bold)
          ("[-]"  . +org-todo-active)
          ("[?]"  . +org-todo-onhold))
        )

  ;; Changes to task states might get logged, especially for recurring routines.
  ;; If so, log them in a drawer, not the content of the note.
  (setq org-log-state-notes-into-drawer t)

  ;; Show italicized text in org
  (setq org-hide-emphasis-markers t)

  ;; Add a special face to #+begin_quote and #+begin_verse block.
  (setq org-fontify-quote-and-verse-blocks t)

  (setq org-ellipsis " …")
  (setq org-bullets-bullet-list '("•"))

  ;; Syntax highlightning in code blocks
  ;; (setq org-src-fontify-natively t)

  ;; Trying to fix indentation behaviour within code blocks.
  ;; (setq org-edit-src-content-indentation 0)
  ;; (setq org-src-tab-acts-natively t)
  ;; (setq org-src-preserve-indentation t)

  ;; Refile
  ;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-files :maxlevel . 9))))

  ;; Be sure to use the full path for refile setup
  (setq org-refile-use-outline-path t)
  (setq org-outline-path-complete-in-steps nil)

  ;; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes 'confirm)

  ;; Set default column view headings: Task Effort Clock_Summary
  (setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

  ;; global Effort estimate values
  (setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 8:00 0:00"))))
  )

(use-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-include-deadlines t
        org-agenda-block-separator nil
        org-agenda-compact-blocks t
        org-agenda-start-day nil ;; i.e. today
        org-agenda-span 1
        org-agenda-start-on-weekday nil)
  (setq org-agenda-custom-commands
        '(("c" "Super view" (
                             (agenda "" ((org-agenda-overriding-header "")
                                         (org-super-agenda-groups
                                          '((:name "Today"
                                                   :time-grid t
                                                   :date today
                                                   :order 1)
                                            (:discard (:anything t))))))
                             (todo ""  ((org-agenda-overriding-header "")
                                        (org-super-agenda-groups
                                         '((:log t)
                                           (:habit t)
                                           (:name "Waiting..."
                                                  :todo "WAITING")
                                           (:name "In Progress"
                                                  :todo "INPROGRESS")
                                           (:name "Overdue"
                                                  :deadline past)
                                           (:name "Earlier"
                                                  :scheduled past)
                                           (:name "Quick Picks"
                                                  :effort< "0:30")
                                           (:name "To Refile"
                                                  :category "Refile")
                                           (:name "Due Soon" :deadline future)
                                           (:name "Meetings" :todo "MEET")
                                           (:name "Soon" :scheduled future)
                                           (:discard (:anything t))))))))))
  :config
  (org-super-agenda-mode))

(after! deft
  (setq
   deft-extensions '("org" "text" "md")
   deft-recursive t
   deft-directory "~/deft/"
   deft-text-mode 'org-mode))

(after! undo-tree
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

(use-package! org-recur
  :hook ((org-mode . org-recur-mode)
         (org-agenda-mode . org-recur-agenda-mode))
  :init
  :demand t
  :config
  (define-key org-recur-mode-map (kbd "C-c d") 'org-recur-finish)

  ;; Rebind the 'd' key in org-agenda (default: `org-agenda-day-view').
  (define-key org-recur-agenda-mode-map (kbd "d") 'org-recur-finish)
  (define-key org-recur-agenda-mode-map (kbd "C-c d") 'org-recur-finish)

  (setq org-recur-finish-done t
        org-recur-finish-archive t)

  ;; Log time a task was set to Done.
  (setq org-log-done (quote time))

  ;; Don't log the time a task was rescheduled or redeadlined.
  (setq org-log-redeadline nil)
  (setq org-log-reschedule nil))
