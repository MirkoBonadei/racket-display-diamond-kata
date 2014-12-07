#lang racket

;;; This function displays a diamond with the row of the character 'max-char'
;;; on the x-axis and without removing the borders of the plane.
;;; E.G.
;;; (  A  )
;;; (B   B)
;;; (  A  )
(define (display-diamond max-char)
  (for-each (λ (line) (printf "~a\n" line))
            (project-on-x-axis (project-on-y-axis (seed max-char)))))

;;; This function displays a diamond with the row of the character 'max-char'
;;; on the x-axis removing the borders of the plane.
;;; E.G.
;;;   A
;;; B   B
;;;   A
(define (display-diamond-without-borders max-char)
  (for-each (λ (line) (pretty-print-line line))
            (project-on-x-axis (project-on-y-axis (seed max-char)))))

;;; This function generates the seed of the algorithm.
;;; The seed is the II quadrant of the projection of the diamond over the
;;; euclidean plane.
(define (seed character)
  (let* ([int-value (char->integer character)]
         [relative-value (- int-value (char->integer #\A))]
         [line-length (+ relative-value 1)])
    (build-list
     (+ relative-value 1)
     (λ(x)
       (make-line (- relative-value x) x line-length)))))

;;; This function generates a line which starts with `spaces-before' elements
;;; of " ", followed by the character obtained from #\A + char-delta and then
;;; followed by the right number of " " to normalize the line.
(define (make-line spaces-before char-delta line-length)
  (let ([A-int-value (char->integer #\A)])
    (complete-line-with-spaces
     (reverse (cons
               (integer->char (+ A-int-value char-delta))
               (make-list spaces-before " ")))
     line-length)))

;;; This function completes a line with " ".
(define (complete-line-with-spaces line line-length)
  (if (= line-length (length line))
      line
      (complete-line-with-spaces (append line '(" ")) line-length)))

;;; This function projects a set of lines over the Y axis of the euclidean
;;; plane.
(define (project-on-y-axis lines)
  (map (λ (line) (append line (cdr (reverse line)))) lines))

;;; This function projects a set of lines over the X axis of the euclidean
;;; plane.
(define (project-on-x-axis lines)
  (append lines (cdr (reverse lines))))

;;; This function prints a line removing the parens of the list.
(define (pretty-print-line line)
  (begin
    (for-each (λ (c) (printf "~a" c)) line)
    (newline)))
