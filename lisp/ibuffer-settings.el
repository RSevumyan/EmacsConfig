(provide 'ibuffer-settings)

(require 'ibuffer)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq ibuffer-saved-filter-groups
      (quote (("Def"
	       ("Terminal" (mode . term-mode))
	       ("Dired" (mode . dired-mode))
	       ("Scratch" (name . ".*scratch.*") )
	       ("Help" (or (name . "\*Help\*")
			   (name . "\*Apropos\*")
			   (name . "\*info\*")
			   (name . "\*Directory\*")
			   (name . "\*Completions\*")))
	       ("Emacs" (or (name . "^\\*Messages\\*$") (name . "^\\*GNU Emacs\\*$") (name . "^\\*Backtrace\\*$")))
	       ))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
	    (ibuffer-auto-mode 1)
            (ibuffer-switch-to-saved-filter-groups "Def")
	    (local-set-key  (kbd "C-x C-f") 'ido-find-file)))

(defun human-readable-file-sizes-to-bytes (string)
  "Convert a human-readable file size into bytes."
  (interactive)
  (cond
   ((string-suffix-p "G" string t)
    (* 1000000000 (string-to-number (substring string 0 (- (length string) 1)))))
   ((string-suffix-p "M" string t)
    (* 1000000 (string-to-number (substring string 0 (- (length string) 1)))))
   ((string-suffix-p "K" string t)
    (* 1000 (string-to-number (substring string 0 (- (length string) 1)))))
   (t
    (string-to-number (substring string 0 (- (length string) 1))))
   )
  )

(defun bytes-to-human-readable-file-sizes (bytes)
  "Convert number of bytes to human-readable file size."
  (interactive)
  (cond
   ((> bytes 1000000000) (format "%10.1fG" (/ bytes 1000000000.0)))
   ((> bytes 100000000) (format "%10.0fM" (/ bytes 1000000.0)))
   ((> bytes 1000000) (format "%10.1fM" (/ bytes 1000000.0)))
   ((> bytes 100000) (format "%10.0fk" (/ bytes 1000.0)))
   ((> bytes 1000) (format "%10.1fk" (/ bytes 1000.0)))
   (t (format "%10d" bytes)))
  )

;; Use human readable Size column instead of original one
(define-ibuffer-column size-h
  (:name "Size"
	 :inline t
	 :summarizer
	 (lambda (column-strings)
	   (let ((total 0))
	     (dolist (string column-strings)
	       (setq total
		     ;; like, ewww ...
		     (+ (float (human-readable-file-sizes-to-bytes string))
			total)))
	     (bytes-to-human-readable-file-sizes total)))	 ;; :summarizer nil
	 )
  (bytes-to-human-readable-file-sizes (buffer-size)))

;; Modify the default ibuffer-formats
(setq ibuffer-formats
      '((mark modified read-only locked " "
	      (name 20 20 :left :elide)
	      " "
	      (size-h 11 -1 :right)
	      " "
	      (mode 16 16 :left :elide)
	      " "
	      filename-and-process)
	(mark " "
	      (name 16 -1)
	      " " filename)))
