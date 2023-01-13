
1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.*,
	`students`.`id`,
   `degrees`.`name` as `degree_name`
FROM `students`
INNER JOIN `degrees`
	ON `students`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT `degrees`.*,
	`departments`.`name`
FROM `degrees`
INNER JOIN `departments`
	ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees`.`level` = 'magistrale'
	AND `departments`.`name` = 'Dipartimento di Neuroscienze';

3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.*, `courses`.`name` as `course_name`
FROM `teachers`
INNER JOIN `course_teacher`
	ON `course_teacher`.`teacher_id` = `teachers`.`id`
INNER JOIN `courses`
	ON `course_teacher`.`course_id` = `courses`.`id`
WHERE `teachers`.`name` = 'Fulvio'
	AND `surname` = 'Amato';

4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`name` as `student_name`,
	`students`.`surname` as `student_surname`,
	`degrees`.*,
   `departments`.`name` as `dep_name`
FROM `students`
INNER JOIN `degrees`
	ON `students`.`degree_id` = `degrees`.`id`
INNER JOIN `departments`
	ON `degrees`.`department_id` = `departments`.`id`
ORDER BY `students`.`surname` ASC;

5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT *
FROM `degrees`
INNER JOIN `courses`
	ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `course_teacher`
	ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
	ON `teachers`.`id` = `course_teacher`.`teacher_id`;

6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT
   `course_teacher`.`teacher_id` as `teacher_id`,
   `teachers`.`name` as `teacher_name`,
   `teachers`.`surname` as `teacher_surname`
FROM `departments`
INNER JOIN `degrees`
	ON `degrees`.`department_id` = `departments`.`id`
INNER JOIN `courses`
	ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `course_teacher`
	ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers`
	ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `departments`.`name` = 'Dipartimento di Matematica'
GROUP BY `teacher_id`;

7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
superare ciascuno dei suoi esami