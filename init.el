(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/custom/")

(require 'setup-applications)
(require 'setup-communication)
(require 'setup-convenience)
(require 'setup-data)
(require 'setup-development)
(require 'setup-editing)
(require 'setup-environment)
(require 'setup-external)
(require 'setup-faces)
(require 'setup-files)
(require 'setup-helm)
(require 'setup-help)
(require 'setup-programming)
(require 'setup-text)
(require 'setup-local)

(require 'workgroups2)
(workgroups-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (stickyfunc-enhance function-args helm-gtags rainbow-mode discover-my-major atom-one-dark-theme highlight-symbol highlight-numbers golden-ratio nyan-mode magit diff-hl vlf ztree recentf-ext helm-descbinds helm-projectile helm projectile ibuffer-vc expand-region company yasnippet undo-tree clean-aindent-mode smartparens volatile-highlights duplicate-thing workgroups2)))
 '(save-place nil)
 '(save-place-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
