(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
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

(require 'ibuffer-settings)

;;(require 'lilypond-mode)

(put 'upcase-region 'disabled nil)

(loop
 for from across "йцукенгшщзхъфывапролджэячсмитьбЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖ\ЭЯЧСМИТЬБЮ№"
 for to   across "qwertyuiop[]asdfghjkl;'zxcvbnm,.QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>#"
 do
 (eval `(define-key key-translation-map (kbd ,(concat "C-" (string from))) (kbd ,(concat     "C-" (string to)))))
 (eval `(define-key key-translation-map (kbd ,(concat "M-" (string from))) (kbd ,(concat     "M-" (string to)))))
 (eval `(define-key key-translation-map (kbd ,(concat "С-M-" (string from))) (kbd ,(concat    "C-M-" (string to)))))
 )


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
(global-set-key (kbd "C-c C-s") 'multi-scratch-new)
(global-set-key (kbd "C-c C-t") 'multi-term)
(global-set-key (kbd "M-<left>") 'backward-sexp)
(global-set-key (kbd "M-<right>") 'forward-sexp)
(global-set-key (kbd "C-c h") 'hs-toggle-hiding)
;;Window size
(global-set-key (kbd "S-C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
;;Move region/line
(global-set-key (kbd "S-C-s-<up>") 'move-region-up)
(global-set-key (kbd "S-C-s-<down>") 'move-region-down)

;;Frame init
(setq default-frame-alist
      '((background-color . "#fffaf0") (fullscreen . fullboth)))

(set-face-attribute 'region nil :background "#FFB72F")
(set-face-attribute 'default nil :height 110)

(tool-bar-mode -1)
(menu-bar-mode -1) 

(add-hook 'prog-mode-hook 'linum-mode)

(add-hook 'json-mode-hook 'flycheck-mode)

(add-hook 'term-mode-hook (lambda ()
			       (local-set-key (kbd "C-c C-k") 'term-char-mode)
			       (define-key term-raw-map (kbd "C-c C-j") 'term-line-mode)))

;;(setq auto-mode-alist    (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))

(setq visible1-bell t)

(setq ring-bell-function 'ignore)

;;Dired mode customization
(put 'dired-find-alternate-file 'disabled nil)
(eval-after-load 'dired '(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(eval-after-load 'dired '(define-key dired-mode-map (kbd "a") 'dired-find-file))
(setq dired-listing-switches  "-ahlv  --group-directories-first")

;;==============================================================================================================================================================
;;=============================================================Package initialization===========================================================================
;;==============================================================================================================================================================

(unless (package-installed-p 'json-mode)
  (package-refresh-contents)
  (package-install 'json-mode))

(unless (package-installed-p 'multi-term)
  (package-refresh-contents)
  (package-install 'multi-term))

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
 '(ansi-color-facesector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(inhibit-startup-screen t)
 '(logview-additional-submodes
   (quote
    (("TOMCAT"
      (format . "[TIMESTAMP] NAME THREAD LEVEL MESSAGE")
      (levels . "SLF4J")
      (timestamp "ISO 8601 datetime + millis")
      (aliases))
     ("PEGA"
      (format . "TIMESTAMP [NAME] [THREAD] [ ] [ ] (NAME) LEVEL - MESSAGE")
      (levels . "SLF4J")
      (timestamp "PEGA")
      (aliases)))))
 '(logview-additional-timestamp-formats
   (quote
    (("PEGA"
      (java-pattern . "yyyy-MM-dd hh:mm:ss,SSS")))))
 '(package-selected-packages
   (quote
    (hideshow-org web datetime csharp-mode multi-term logview markdown-preview-mode markdown-mode vlf image+ magit json-mode)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.rambler.ru")
 '(smtpmail-smtp-service 25)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
