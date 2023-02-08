-- 1. Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
    SELECT
        *
    FROM
        CITY
    WHERE
        population > 100000
        AND countrycode = "USA";

-- 2. Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA
    SELECT
        NAME
    FROM
        CITY
    WHERE
        population > 120000
        AND countrycode = "USA";

-- 3. Query all columns (attributes) for every row in the CITY table.
    SELECT
        *
    FROM
        CITY;

-- 4. Query all columns for a city in CITY with the ID 1661.
    SELECT
        *
    FROM
        CITY
    WHERE
        id = 1661;

-- 5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
    SELECT
        *
    FROM
        CITY
    WHERE
        countrycode = "JPN";

-- 6. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
    SELECT
        name
    from
        CITY
    WHERE
        countrycode = "JPN";

-- 7. Query a list of CITY and STATE from the STATION table.
    SELECT
        city,
        state
    FROM
        STATION 

-- 8. Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
    SELECT
        DISTINCT(city) unique_city
    FROM
        STATION
    WHERE
        id % 2 = 0
    ORDER BY
        city;

-- 9. Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
    SELECT
        (COUNT(city) - COUNT(DISTINCT(city)))
    FROM
        STATION;

-- 10. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
-- If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
    SELECT
        city,
        LENGTH(city)
    FROM
        STATION
    WHERE
        LENGTH(city) = (
            SELECT
                MAX(LENGTH(city))
            FROM
                STATION
        )
    ORDER BY
        city DESC;

    SELECT
        city,
        LENGTH(city)
    FROM
        STATION
    WHERE
        LENGTH(city) = (
            SELECT
                MIN(LENGTH(city))
            FROM
                STATION
        )
    ORDER BY
        city
    LIMIT
        1;

-- 11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
    SELECT
        DISTINCT(city)
    FROM
        STATION
    WHERE
        (
            city LIKE "a%"
            OR city LIKE "e%"
            OR city LIKE "i%"
            OR city LIKE "o%"
            OR city LIKE "u%"
        )
    ORDER BY
        city;

-- 12. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
    SELECT
        DISTINCT(city)
    FROM
        STATION
    WHERE
        (
            city LIKE "%a"
            OR city LIKE "%e"
            OR city LIKE "%i"
            OR city LIKE "%o"
            OR city LIKE "%u"
        )
    ORDER BY
        city;

-- 13. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
    SELECT
        DISTINCT(city)
    FROM
        STATION
    WHERE
        (
            LEFT(city, 1) IN ("a", "e", "i", "o", "u")
            AND RIGHT(city, 1) IN ("a", "e", "i", "o", "u")
        )
    ORDER BY
        city;

-- 14. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
    SELECT
        DISTINCT(city)
    FROM
        STATION
    WHERE
        LEFT(city, 1) NOT IN ("a", "e", "i", "o", "u");

-- 15. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
    SELECT
        DISTINCT(city)
    FROM
        STATION
    WHERE
        RIGHT(city, 1) NOT IN ("a", "e", "i", "o", "u");

-- 16. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
    SELECT
        DISTINCT(city)
    FROM
        STATION
    WHERE
        (
            LEFT(city, 1) NOT IN ("a", "e", "i", "o", "u")
            OR RIGHT(city, 1) NOT IN ("a", "e", "i", "o", "u")
        )
    ORDER BY
        city;

-- 17. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
    SELECT
        DISTINCT(city)
    FROM
        STATION
    WHERE
        (LEFT(city, 1) NOT IN ("a", "e", "i", "o", "u"))
        AND (RIGHT(city, 1) NOT IN ("a", "e", "i", "o", "u"))
    ORDER BY
        city;

/* 18. Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name.
 If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID. */
    SELECT
        name
    FROM
        STUDENTS
    WHERE
        marks > 75
    ORDER BY
        RIGHT(name, 3),
        id;

-- 19. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
    SELECT
        name
    FROM
        Employee
    ORDER BY
        name;
        
/* -- 20. Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  
per month who have been employees for less than  months. Sort your result by ascending employee_id. */
    SELECT
        name
    FROM
        Employee
    WHERE
        salary > 2000
        AND months < 10
    ORDER BY
        employee_id;