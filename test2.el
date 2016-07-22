(progn
  (+ 2 10)
  (message "wat?!"))

(let ((data2 (quote 2))
      (data1 (quote 1)))
  (message "data1:%S, data2:%S" data1 data2))
