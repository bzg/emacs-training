;; Interactively ask for your name, display it in the echo area
(defun my-new-function (name)
  "Display my name."
  (interactive "sName: ")
  (message "Your name is %s" name))

;; Make a list of five strings "abc"
(setq my-list (make-list 5 "abc"))

;; Return the length of the list
(length my-list)

;; Ask for a buffer and switch to it
(defun my-find-buffer (buf)
  "Find a buffer."
  (interactive "BWhich buffer? ")
  (switch-to-buffer-other-window buf))

;; Test the numerical prefix
(defun my-numerical-prefix-test (arg)
  "Test the value of the numerical prefix."
  (interactive "p")
  (message "The value of the prefix argument is %s" arg))

;; First use of `let'
(defun my-display-strings ()
  (let ((a "Arnold")
	(b "Beatrice")
	c d e)         ; empty locally-bound variables
    (message "%s %s %s %s" a b c d)))

(defun my-raw-prefix-test (arg)
  "Test the raw prefix value."
  (interactive "P")
  (cond ((equal arg '(4))
	 (message "C-u n'a été tapé qu'une fois"))
	((equal arg '(16))
	 (message "C-u n'a été tapé que deux fois"))
	(t (message "La valeur de l'argument est %s" arg))))

(defun my-narrowing (start end)
  "Narrow and deactivate the mark."
  (interactive "r")
  (narrow-to-region start end)
  (deactivate-mark))

;; M-x goto-char RET
;; Use C-u C-M-x to run `edebug-defun'

(defun my-return ()
  "Custom RET behavior."
  (let ((number (save-excursion
		  (beginning-of-line)
		  (when (looking-at "^\\([0-9]\\)")
		    (match-string 1)))))
    (if number
	(progn
	  (end-of-line)
	  (insert "\n" (sns-inc-string number) "=\"\"")
	  (backward-char))
      (end-of-line)
      (insert "\n"))))

(defun inc-string (str)
  "Increment the first number in a string, return the string."
  (if (string-match "^\\(.*\\)\\([0-9]+\\)\\(.*$\\)" str)
      (format "%s%s%s"
	      (match-string 1 str) ; mandatory mention of `str'
	      (1+ (string-to-number (match-string 2 str))) ; integer
	      (match-string 3 str))
    str))

;; Test the function
(inc-string "1")
(inc-string "abc1def")

(defun buffer-with-my-region (beg end)
  "Create a new buffer containing the selected region."
  (interactive "r")
  (let ((bf (buffer-substring beg end)))
    (switch-to-buffer-other-window (get-buffer-create "*tmp buffer*"))
    (erase-buffer)
    (insert bf)))

(defun buffer-with-my-region-2 (beg end)
  "Create a new buffer with the region, perform a replacement."
  (interactive "r")
  (let ((bf (buffer-substring beg end)))
    (when (with-temp-buffer
	    (insert bf)
	    (goto-char (point-min))
	    (re-search-forward "insert" nil t))
      (narrow-to-region beg end)
      (goto-char (point-min))
      (when (re-search-forward "insert" nil t)
	(replace-match "INSERT"))
      (widen))))
