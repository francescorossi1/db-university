-- * QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT * FROM `students` WHERE YEAR(`date_of_birth`) = 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * FROM `courses` WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT * FROM `students`
WHERE TIMESTAMPDIFF(YEAR,`date_of_birth`,CURRENT_DATE()) > 30
ORDER BY `date_of_birth` DESC;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT * FROM `courses`
WHERE `period` = 'I semestre'
AND `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * FROM `exams`
WHERE `date` = '2020-06-20'
AND `hour` > '14:00:00'
ORDER BY `hour` ASC;

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT * FROM `degrees`
WHERE `name` LIKE 'Corso di Laurea Magistrale%';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) AS `numero_dipartimenti` FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(*) AS `insegnanti_senza_numero` FROM `teachers`
WHERE `phone` IS NULL;


-- * QUERY CON GROUP BY

-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(`enrolment_date`) AS `anno`, COUNT(*) AS `numero_studenti` FROM `students`
GROUP BY `anno`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `office_address` AS `indirizzo`, COUNT(*) AS `numero_insegnanti` FROM `teachers`
GROUP BY `indirizzo`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id` AS `appello`, ROUND(AVG(`vote`)) AS `media`
FROM `exam_student`
GROUP BY `appello`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `department_id` AS `dipartimento`, COUNT(*) AS `numero_corsi` 
FROM `degrees`
GROUP BY `dipartimento`;
