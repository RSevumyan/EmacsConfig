(package-initialize)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(load "package")

(require 'package)

(setq package-archives '(
			 ("elpy" . "http://jorgenschaefer.github.io/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")                         
			 ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ))

(require 'ido)

(ido-mode t)

(require 'multi-term)

(setq multi-term-program "/bin/bash")

(require 'xml-tools)

(add-hook 'json-mode-hook #'flycheck-mode)

(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(package-selected-packages (quote (json-mode)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces)

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

(require 'sr-speedbar)
