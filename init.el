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

(require 'multi-term)

(setq multi-term-program "/bin/bash")

(ido-mode t)

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
 (eval `(define-key key-translation-map (kbd ,(concat "M-" (string from))) (kbd ,(concat     "M-" (string to))))))

(global-linum-mode)

(add-to-list 'auto-mode-alist
	     (cons (concat "\\." (regexp-opt '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss") t) "\\'")
		   'nxml-mode))

(setq auto-mode-alist (cons '("\\.xml$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.xsl$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.xhtml$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.page$" . nxml-mode) auto-mode-alist))

(autoload 'xml-mode "nxml" "XML editing mode" t)

(eval-after-load 'rng-loc
  '(add-to-list 'rng-schema-locating-files "~/.schema/schemas.xml"))

(global-set-key [C-return] 'completion-at-point)

(defun remove-newlines-in-region ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (or (search-forward "\n" nil t)) (replace-match "" nil t))))

(global-set-key (kbd "C-x C-l") 'remove-newlines-in-region)

(global-set-key (kbd "C-c C-r") 'revert-buffer)
