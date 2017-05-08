(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'package)

(setq package-archives '(
			 ("elpy" . "http://jorgenschaefer.github.io/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")                         
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ))

(package-initialize)

(require 'ido)

(ido-mode t)

(require 'multi-term)

(setq multi-term-program "/bin/bash")

(require 'xml-tools)

(require 'sr-speedbar)

(sr-speedbar-open)


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

(set-background-color "#fffaf0")

(defun toggle-fullscreen ()
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(toggle-fullscreen)

;;==============================================================================================================================================================
;;=============================================================Package initialization===========================================================================
;;==============================================================================================================================================================

(unless (package-installed-p 'json-mode)
  (package-refresh-contents)
  (package-install 'json-mode))

(unless (package-installed-p 'image+)
  (package-refresh-contents)
  (package-install 'image+))

;;==============================================================================================================================================================
;;====================================================================Custom set================================================================================
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
 '(package-selected-packages (quote (image+ magit json-mode)))
 '(speedbar-directory-unshown-regexp "\"^\\\\(\\\\..*\\\\)\\\\'\"")
 '(speedbar-show-unknown-files t)
l '(sr-speedbar-default-width 20)
 '(sr-speedbar-max-width 20)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
