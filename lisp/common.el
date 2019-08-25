(provide 'common)

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

;;Move region or line up
(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (if (region-active-p) (move-region start end (if (null n) -1 (- n)))
    (move-line-up)))

;; Move region or line down
(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (if (region-active-p) (move-region start end (if (null n) 1 n))
    (move-line-down)))

;;Move region
(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

;;Move line up
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

;;Move line down
(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))
