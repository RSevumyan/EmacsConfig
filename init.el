(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(require 'package)

(setq package-archives '(
			 ("elpy" . "http://jorgenschaefer.github.io/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")                         
			 ("melpa-stable" . "https://stableи.melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ))

(package-initialize)

(require 'ido)
 
(ido-mode t)

(require 'multi-term)

(setq multi-term-program "/bin/bash")

(require 'common)

(require 'xml-tools)

(require 'sr-speedbar)

(require 'multi-scratch)

(add-hook 'json-mode-hook #'flycheck-mode)

(put 'upcase-region 'disabled nil)

(loop
 for from across "йцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖ\ЭЯЧСМИТЬБЮ№"
 for to   across "qwertyuiop[]asdfghjkl;'zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"
 do
 (eval `(define-key key-translation-map (kbd ,(concat "C-" (string from))) (kbd ,(concat     "C-" (string to)))))
 (eval `(define-key key-translation-map (kbd ,(concat "M-" (string from))) (kbd ,(concat     "M-" (string to)))))
 (eval `(define-key key-translation-map (kbd ,(concat "С-M-" (string from))) (kbd ,(concat    "C-M-" (string to)))))
 )

(global-linum-mode)

(global-set-key (kbd "C-c C-r") 'revert-buffer)
(global-set-key (kbd "C-c C-r") 'revert-buffer)
(global-set-key (kbd "M-<down>") 'forward-paragraph)
(global-set-key (kbd "M-<up>") 'backward-paragraph)
(global-set-key (kbd "C-<down>") 'goto-tenlines-forward)
(global-set-key (kbd "C-<up>") 'goto-tenlines-backward)
(global-set-key (kbd "M-<left>") 'goto-twentycolumns-backward)
(global-set-key (kbd "M-<right>") 'goto-twentycolumns-forward)
(global-set-key (kbd "M-a") 'beginning-of-buffer)
(global-set-key (kbd "M-e") 'end-of-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c C-s") 'multi-scratch-new)

(set-background-color "#fffaf0")
(set-face-attribute 'region nil :background "#FFB72F")

(toggle-fullscreen)

(tool-bar-mode -1)
(menu-bar-mode -1) 

(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))
(add-hook 'term-mode-hook (lambda () (linum-mode -1)))

;;ibuffer
(setq ibuffer-saved-filter-groups
      (quote (("Def"
	       ("Terminal" (mode . term-mode))
	       ("Dired" (mode . dired-mode))
	       ("Scratch" (or (name . "^\\*multi-scratch<[0-9]+>\\*$") (name . "^\\*scratch\\*$")))
	       ("Help" (or (name . "\*Help\*")
			   (name . "\*Apropos\*")
			   (name . "\*info\*")
			   (name . "\*Directory\*")
			   (name . "\*Completions\*")))
	       ("Emacs" (or (name . "^\\*Messages\\*$") (name . "^\\*GNU Emacs\\*$")))
	       ))))

  (add-hook 'ibuffer-mode-hook
              (lambda ()
                (ibuffer-switch-to-saved-filter-groups "Def")))

;;==============================================================================================================================================================
;;=============================================================Package initialization===========================================================================
;;==============================================================================================================================================================

(unless (package-installed-p 'json-mode)
  (package-refresh-contents)
  (package-install 'json-mode))

(unless (package-installed-p 'image+)
  (package-refresh-contents)
  (package-install 'image+))

(unless (package-installed-p 'vlf)
  (package-refresh-contents)
  (package-install 'vlf))

;;==============================================================================================================================================================
;;====================================================================Custom settings===========================================================================
;;==============================================================================================================================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(package-selected-packages
   (quote
    (markdown-preview-mode markdown-mode vlf image+ magit json-mode)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.rambler.ru")
 '(smtpmail-smtp-service 25)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Dired mode customization
(put 'dired-find-alternate-file 'disabled nil)
(eval-after-load 'dired '(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(eval-after-load 'dired '(define-key dired-mode-map (kbd "a") 'dired-find-file))
