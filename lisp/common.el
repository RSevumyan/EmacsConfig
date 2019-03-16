(provide 'common)

;;Function for emacs frame maximization
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'fullboth)
  )

;;Function for move 10 lines forward
(defun goto-tenlines-forward ()
  (interactive)
  (goto-line (+ (count-lines 1 (point)) 11))
  )

;;Function for move 10 lines backwardy
(defun goto-tenlines-backward ()
  (interactive)
  (goto-line (- (count-lines 1 (point)) 11))
  )

;;Function for moveing 20 columns forward
(defun goto-twentycolumns-forward ()
  (interactive)
  ;;Not implemented yet
  )


;;Function for moveing 20 columns backward
(defun goto-twentycolumns-backward ()
  (interactive)
  ;;Not implemented yet
  )
