;; (if (re-search-forward "defun \\(\\(?:\\w\\|\\s_\\)+\\)" nil t)

;; (if (re-search-forward "defun \\([:alpha:]+\\)" nil t)
;;     (match-string-no-properties 1))

;; (if (re-search-forward "[[:graph:]]+ \\([[:graph:]]+\\)" nil t)
;;     (match-string-no-properties 1))

;; (if (re-search-forward "[[:graph:]]+ \\<\\([[:graph:]]+\\)\\>" nil t)
;;     (match-string-no-properties 1))

;; (if (re-search-forward "[[:graph:]]+ \\_<\\([[:graph:]]+\\)\\_>" nil t)
;;     (match-string-no-properties 1))

(defun my-new-function (name) ;; lskdjflksjdf
  "Display my name."
  (interactive "sNom: ")
  (message "Votre nom est %s" name))

(setq mytest (make-list 5 "abc"))
(length mytest)

(defun my-find-buffer (buf)
  "Find a buffer."
  (interactive "BWhich buffer? ")
  (switch-to-buffer-other-window buf))

(defun my-numerical-prefix-test (arg)
  ""
  (interactive "p")
  (message "La valeur de l'argument est %s" arg))

;; (my-numerical-prefix-test)

(defun test ()
  (let ((a "arnold")
	(b "beatrice")
	c d e)
    (message "%s" c)))

(defun my-raw-prefix-test (arg)
  ""
  (interactive "P")
  (cond ((equal arg '(4))
	 (message "C-u n'a été tapé qu'une fois"))
	((equal arg '(16))
	 (message "C-u n'a été tapé que deux fois"))
	(t (message "La valeur de l'argument est %s" arg))))

(defun my-narrowing (start end)
  ""
  (interactive "r")
  (narrow-to-region start end)
  (deactivate-mark))

(when (re-search-forward
       "test" ;; le pattern
       ;; la position limite (d'habitude nil)
       (save-excursion
	 (save-match-data
;;	   (re-search-forward "raw" nil t)))
	   (re-search-forward "\\'" nil t)))
       ;;
       t)

;; goto-char 
;; C-u C-M-x : edebug-defun
;; (my-raw-prefix-test)

(defun sns-return ()
  ""
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

(defun sns-inc-string (str)
  "Increment the first number found in a string."
  (if (string-match "^\\(.*\\)\\([0-9]+\\)\\(.*$\\)" str)
      (format "%s%s%s"
	      (match-string 1 str)
	      (1+ (string-to-number (match-string 2 str))) ;; integer
	      (match-string 3 str))
    str))

(sns-inc-string "1")

(sns-inc-string "abc1def")

(defun buffer-with-my-region (beg end)
  ""
  (interactive "r")
  (let ((bf (buffer-substring beg end)))
    (switch-to-buffer-other-window (get-buffer-create "*je travaille*"))
    (erase-buffer)
    (insert bf)))

(defun buffer-with-my-region-2 (beg end)
  ""
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

  


  
  
  


