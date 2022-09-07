-- * QUERY CON JOIN 

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT * FROM `students`
JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT * FROM `degrees`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT * FROM `courses`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id`= `course_teacher`.`teacher_id`

-- Ver 1
WHERE `teachers`.`name` = 'Fulvio' 
AND `teachers`.`surname` = 'Amato';
-- Ver 2
WHERE `teachers`.`id` = 44;


-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`name` AS `Nome`, `students`.`surname` AS `Cognome`, `students`.`registration_number` AS `num_registrazione`, `degrees`.`name` AS `Corso di Laurea`, `departments`.`name` AS `Dipartimento`
FROM `students`
JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `Nome`, `Cognome`;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS `Corso di Laurea`,  `courses`.`name` AS `Materie`, `teachers`.`name` AS `Nome Insegnante`,`teachers`.`surname` AS `Cognome Insegnante`
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
ORDER BY `Corso di Laurea`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.*
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `degrees`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
SELECT `students`.`name`,`students`.`surname`, COUNT(*)
FROM `exams`
JOIN `exam_student`
ON `exams`.`id` = `exam_student`.`exam_id`
JOIN `students`
ON `students`.`id` = `exam_student`.`student_id`  
GROUP BY `students`.`id`;

