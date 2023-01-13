-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(`id`) as `enrolled`,
	YEAR(`enrolment_date`) as `enrolment_year`
FROM `students`
GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(`id`), `office_address`
FROM `teachers`
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`) as `vote_average`, `exam_id`
FROM `exam_student`
GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(`id`) as `degrees_number`, `department_id`
FROM `degrees`
GROUP BY `department_id`;