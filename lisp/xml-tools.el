(provide 'xml-tools)

(require 'hideshow)

(require 'sgml-mode)

(require 'nxml-mode)

(add-to-list 'auto-mode-alist
	     (cons
	      (concat "\\."
		      (regexp-opt
		       '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss" "xhtml")
		       t)
		      "\\'")
	      'nxml-mode)
	     )
 
(autoload 'xml-mode "nxml" "XML editing mode" t)

(eval-after-load 'rng-loc
  '(add-to-list 'rng-schema-locating-files "~/.schema/schemas.xml"))

(global-set-key [C-return] 'completion-at-point)

(defun linarize-xml(begin end)
  (interactive "r")  
  (goto-char begin)
  (while (re-search-forward ">[[:space:]]+<" end t)
    (replace-match "\>\<"))
  (goto-char begin)
  (while (re-search-forward "[\n]+" end t)
    (replace-match " "))
  )

(global-set-key (kbd "C-M-l") 'linarize-xml)

(defun format-xml (begin end)
  (interactive "r")
  (nxml-mode)
  (goto-char begin)
  (while (search-forward-regexp "\>[[:blank:]]*\<" end t) 
    (backward-char)
    (insert "\n")
    (setq end (+ 1 end)))
  (indent-region begin end)
  )

(global-set-key (kbd "C-M-b") 'format-xml)

(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"

               "<!--"
               sgml-skip-tag-forward
               nil))

(add-hook 'nxml-mode-hook 'hs-minor-mode)

(add-hook 'sgml-mode-hook (lambda ()
			       (local-set-key (kbd "M-<left>") 'sgml-skip-tag-backward)
			       (local-set-key (kbd "M-<right>") 'sgml-skip-tag-forward)))

