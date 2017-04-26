(provide 'xml-tools)

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
