;; РГР, Варіант 3
;; Студент: Булавчук Данило, КВ-23

(defun calculate-sequence-part1 (i i-max f-prev)
  "Рекурсивно обчислює послідовність F(i) = F(i-1) * ln(i)"
  (if (> i i-max)
      nil
      (let ((f-current (* f-prev (log i))))
        (cons f-current (calculate-sequence-part1 (1+ i) i-max f-current)))))

(defun calculate-sequence-part2 (i i-max f-prev)
  "Рекурсивно обчислює послідовність F(i) = F(i-1) * sqrt(i)"
  (if (> i i-max)
      nil
      (let ((f-current (* f-prev (sqrt i))))
        (cons f-current (calculate-sequence-part2 (1+ i) i-max f-current)))))

(defun calculate-f-sequence ()
  "Головна функція"
  (let ((f1 1.0)
        (f11 1.0))
    (append
     ;; F1...F10
     (cons f1 (calculate-sequence-part1 2 10 f1))
     ;; F11...F20
     (cons f11 (calculate-sequence-part2 12 20 f11)))))

;; Тестування

(defun check-float-equal (val1 val2)
  "Допоміжна функція"
  (let ((tolerance 0.0001))
    (< (abs (- val1 val2)) tolerance)))

(defun run-rgr-tests ()
  "Запуск тестів"
  (let ((results (calculate-f-sequence)))
    
    (format t "--- Тестування ---~%")
    
    ;; Перевірка F1
    (format t "Тест F1 = 1.0: ~:[FAILED~;passed~]~%"
            (check-float-equal (nth 0 results) 1.0))
            
    ;; Перевірка F2 = F1 * ln(2)
    (format t "Тест F2 = ln(2): ~:[FAILED~;passed~]~%"
            (check-float-equal (nth 1 results) (log 2.0)))
            
    ;; Перевірка F3 = F2 * ln(3) = ln(2)*ln(3)
    (format t "Тест F3 = ln(2)*ln(3): ~:[FAILED~;passed~]~%"
            (check-float-equal (nth 2 results) (* (log 2.0) (log 3.0))))
            
    ;; Перевірка F11 = 1.0
    (format t "Тест F11 = 1.0: ~:[FAILED~;passed~]~%"
            (check-float-equal (nth 10 results) 1.0))
            
    ;; Перевірка F12 = F11 * sqrt(12)
    (format t "Тест F12 = sqrt(12): ~:[FAILED~;passed~]~%"
            (check-float-equal (nth 11 results) (sqrt 12.0)))
            
    (format t "~%--- Повні результати (F1...F20) ---~%")
    (print results)))

;; Запуск
(run-rgr-tests)