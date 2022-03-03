create table pizzas as
  select "Pizzahhh" as name, 12 as open, 15 as close union
  select "La Val's"        , 11        , 22          union
  select "Sliver"          , 11        , 20          union
  select "Cheeseboard"     , 16        , 23          union
  select "Emilia's"        , 13        , 18;

create table meals as
  select "breakfast" as meal, 11 as time union
  select "lunch"            , 13         union
  select "dinner"           , 19         union
  select "snack"            , 22;


-- Pizza places that open before 1pm in alphabetical order
CREATE TABLE opening AS
SELECT name FROM pizzas
WHERE open < 13
ORDER BY name DESC;


-- Two meals at the same place
create TABLE double AS
SELECT m1.meal, m2.meal, p.name
FROM meals AS m1, meals AS m2, pizzas AS p 
WHERE m2.time - m1.time > 6 AND m1.time >= p.open AND m2.time <= p.close;

