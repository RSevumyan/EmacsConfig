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

(require 'common)

(setq multi-term-program "/bin/bash")

(require 'xml-tools)

(require 'sr-speedbar)

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

(global-key (kbd "C-c C-r") 'revert-buffer)
(global-set-key (kbd "C-c C-r") 'revert-buffer)
(global-set-key (kbd "M-<down>") 'forward-paragraph)
(global-set-key (kbd "M-<up>") 'backward-paragraph)
(global-set-key (kbd "C-<down>") 'goto-tenlines-forward)
(global-set-key (kbd "C-<up>") 'goto-tenlines-backward)
(global-set-key (kbd "M-<left>") 'goto-twentycolumns-backward)
(global-set-key (kbd "M-<right>") 'goto-twentycolumns-forward)
(global-set-key (kbd "M-a") 'beginning-of-buffer)
(global-set-key (kbd "M-e") 'end-of-buffer)

(set-background-color "#fffaf0")
(set-face-attribute 'region nil :background "#FFB72F")

(toggle-fullscreen)

(tool-bar-mode -1)

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
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

;;Dired mode cusomization
(put 'dired-find-alternate-file 'disabled nil)
(eval-after-load 'dired '(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(eval-after-load 'dired '(define-key dired-mode-map (kbd "a") 'dired-find-file))
