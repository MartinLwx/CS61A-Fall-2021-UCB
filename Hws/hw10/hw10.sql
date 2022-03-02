CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT d.name, s.size 
  FROM dogs AS d, sizes AS s
  WHERE d.height <= s.max and d.height > s.min;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT p.child
  FROM parents AS p, dogs as d
  WHERE p.parent = d.name
  ORDER BY d.height DESC;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT p1.child AS dogone, p2.child AS dogtwo, s1.size AS dogonesize, s2.size AS dogtwosize
  FROM parents AS p1, parents AS p2, size_of_dogs AS s1, size_of_dogs AS s2
  WHERE p1.parent = p2.parent AND p1.child < p2.child AND p1.child = s1.name AND p2.child = s2.name;
-- Use `<` to filter the result
-- `!=` is not enough, you will get `barack clinton` and `clinton barack` in the same time

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
    SELECT "The two siblings, " || dogone || " plus " || dogtwo || " have the same size: " || dogonesize
    FROM siblings
    WHERE dogonesize = dogtwosize AND dogone < dogtwo;

