(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (stickyfunc-enhance vlf tree-diff recentf-ext highlight-numbers highlight-symbol golden-ratio clean-aindent-mode yasnippet helm-ag helm-descbinds helm-projectile helm vkill exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree smartrep smartparens smart-mode-line operate-on-number move-text magit projectile ov imenu-anywhere guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major dash crux browse-kill-ring beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;
;;; Customize
;;

(prelude-require-packages '(yasnippet clean-aindent-mode golden-ratio highlight-symbol highlight-numbers recentf-ext vlf stickyfunc-enhance))

;; backup files
;; (defvar backup-directory "~/.backups")
;; (if (not (file-exists-p backup-directory))
;;     (make-directory backup-directory t))
;; (setq
;;  make-backup-files t        ; backup a file the first time it is saved
;;  backup-directory-alist `((".*" . ,backup-directory)) ; save backup files in ~/.backups
;;  backup-by-copying t     ; copy the current file into backup directory
;;  version-control t   ; version numbers for backup files
;;  delete-old-versions t   ; delete unnecessary versions
;;  kept-old-versions 6     ; oldest versions to keep when a new numbered backup is made (default: 2)
;;  kept-new-versions 9 ; newest versions to keep when a new numbered backup is made (default: 2)
;;  auto-save-default t ; auto-save every buffer that visits a file
;;  auto-save-timeout 20 ; number of seconds idle time before auto-save (default: 30)
;;  auto-save-interval 200 ; number of keystrokes between auto-saves (default: 300)
;;  )

;; disable whitespace-mode
(setq prelude-whitespace nil)

;; disable flyspell-mode
(setq prelude-flyspell nil)

;; disable flycheck
(global-flycheck-mode -1)

;; enable linum only in programming modes
(add-hook 'prog-mode-hook 'linum-mode)

;; enable company mode
(add-hook 'after-init-hook 'global-company-mode)

;; expand-region short key
(global-set-key (kbd "M-m") 'er/expand-region)

;; mark ring max size
(setq global-mark-ring-max 5000)
(setq mark-ring-max 5000)

;; kill ring max size
(setq kill-ring-max 5000)
(setq kill-whole-line t)
;; tab width
(setq-default tab-width 4)

;; coding system
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)

;; show important whitespace in diff-mode
(add-hook 'diff-mode-hook (lambda()
			    (setq-local whitespace-style
					'(face
					  tabs
					  tab-mark
					  spaces
					  space-mark
					  trailing
					  indentation::space
					  indentation::tab
					  newline
					  newline-mark))
			    (whitespace-mode 1)))

;; smartparens overlay
(setq sp-highlight-pair-overlay nil)
(setq sp-highlight-wrap-overlay nil)
(setq sp-highlight-wrap-tag-overlay nil)

;; smartparens for {} block
(require 'smartparens-config)
(defun my-open-block-mode (id action context)
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))
(sp-local-pair 'prog-mode "{" nil :post-handlers '((my-open-block-mode "RET")))

(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

(require 'yasnippet)
(yas-global-mode 1)

;; (require 'golden-ratio)
;; (add-to-list 'golden-ratio-exclude-modes "ediff-mode")
;; (add-to-list 'golden-ratio-exclude-modes "helm-mode")
;; (add-to-list 'golden-ratio-exclude-modes "dired-mode")
;; (add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)
;; (defun pl/helm-alive-p ()
;;   (if (boundp 'helm-alive-p)
;;       (symbol-value 'helm-alive-p)))
;; ;; do not enable golden-raio in thses modes
;; (setq golden-ratio-exclude-modes '("ediff-mode"
;;                                    "gud-mode"
;;                                    "gdb-locals-mode"
;;                                    "gdb-registers-mode"
;;                                    "gdb-breakpoints-mode"
;;                                    "gdb-threads-mode"
;;                                    "gdb-frames-mode"
;;                                    "gdb-inferior-io-mode"
;;                                    "gud-mode"
;;                                    "gdb-inferior-io-mode"
;;                                    "gdb-disassembly-mode"
;;                                    "gdb-memory-mode"
;;                                    "magit-log-mode"
;;                                    "magit-reflog-mode"
;;                                    "magit-status-mode"
;;                                    "IELM"
;;                                    "eshell-mode" "dired-mode"))
;; (golden-ratio-mode)

(require 'semantic)
(semantic-mode 1)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-idle-summary-mode 1)
;;(global-semantic-stickyfunc-mode 1)

;; you won't need any of the bar thingies
;; turn it off to save screen estate
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(add-hook 'prog-mode-hook 'highlight-numbers-mode)

(require 'highlight-symbol)

(highlight-symbol-nav-mode)

(add-hook 'prog-mode-hook (lambda () (highlight-symbol-mode)))
(add-hook 'org-mode-hook (lambda () (highlight-symbol-mode)))

(setq highlight-symbol-idle-delay 0.2
      highlight-symbol-on-navigation-p t)

(global-set-key [(control shift mouse-1)]
                (lambda (event)
                  (interactive "e")
                  (goto-char (posn-point (event-start event)))
                  (highlight-symbol-at-point)))

(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)

(require 'recentf-ext)

(require 'vlf)
