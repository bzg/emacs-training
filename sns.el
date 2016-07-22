;;; sns.el --- sns major mode

;;; Commentary:

;;; Code:

(add-to-list 'auto-mode-alist '("\\.ini\\'" . sns-mode))

(defvar sns-mode-map
  (let ((map (make-sparse-keymap)))
    ;; (define-key map [foo] 'sample-do-foo)
    map)
  "Keymap for `sample-mode'.")

;; (defvar sample-mode-syntax-table
;;   (let ((st (make-syntax-table)))
;;     (modify-syntax-entry ?# "<" st)
;;     (modify-syntax-entry ?\n ">" st)
;;     st)
;;   "Syntax table for `sample-mode'.")

(defvar sns-font-lock-keywords
  '(("function \\(\\sw+\\)" (1 font-lock-function-name-face)))
  "Keyword highlighting specification for `sample-mode'.")

;; (defvar sample-imenu-generic-expression
;;   ...)

(defvar sns-outline-regexp
  "\\[http:.+\\.global\\]"
  ""
  )

(defvar sns-outline-regexp-bol
  "^\\[http:.+\\.global\\]"
  ""
  )

;;;###autoload
(define-derived-mode sns-mode conf-mode "sns"
  "A major mode for editing Sample files."
  ;; :syntax-table sample-mode-syntax-table
  ;; (setq-local comment-start "# ")
  ;; (setq-local comment-start-skip "#+\\s-*")
  ;; (setq-local font-lock-defaults
  ;; 	      '(conf-font-lock-keywords))
  ;; (setq-local indent-line-function 'sample-indent-line)
  ;; (setq-local imenu-generic-expression
  ;; 	      sample-imenu-generic-expression)
  ;; (setq-local outline-regexp sample-outline-regexp)
  ;; (setq-local comment-start "#")
  ;; (setq-local comment-start-skip "#.*$")
  (setq-local paragraph-start "\\|[ 	]\\|\\[*$")
  (setq-local paragraph-separate "[ 	]*$")
  (setq-local outline-regexp sns-outline-regexp)
  (setq-local org-outline-regexp sns-outline-regexp)
  (setq-local org-outline-regexp-bol sns-outline-regexp-bol)
  )

(font-lock-add-keywords
 'sns-mode
 '(("^\\[\\([^:]+\\):.+\\.global\\]" (1 font-lock-warning-face))
   ("^\\[.+:.+\\.global\\]" (0 font-lock-function-name-face))))

;;; Indentation

;; (defun sample-indent-line ()
;;   "Indent current line of Sample code."
;;   (interactive)
;;   (let ((savep (> (current-column) (current-indentation)))
;; 	(indent (condition-case nil (max (sample-calculate-indentation) 0)
;; 		  (error 0))))
;;     (if savep
;; 	(save-excursion (indent-line-to indent))
;;       (indent-line-to indent))))

;; (defun sample-calculate-indentation ()
;;   "Return the column to which the current line should be indented."
;;   ...)

(provide 'sns)

;; (featurep 'org)

;;; sample.el ends here
