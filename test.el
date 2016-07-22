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



