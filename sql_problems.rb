require 'sqlite3'

db = SQLite3::Database.open "test.db"

# you can follow any tutorial you'd like for syntax, but here's a simple one: https://www.w3schools.com/sql/default.asp

# EX syntax for solutions:

# db.execute("SQL QUERY HERE"
# ) do |row|
#   p row
# end 

# 1) get all columns from olympicMedals table 
p "Solution for 1"

p db.execute("SELECT * FROM olympicMedals LIMIT 5"
 ) do |row|
    p row
 end
# 2) get year, season, discipline, athlete, country from olympicMedals table 
p "Solution for 2"

p db.execute("SELECT Year, season, Discipline, Athlete, Country FROM olympicMedals LIMIT 5"
    ) do |row|
    p row
end

# 3) get the distinct years that the olympic records show 
p "Solution for 3"

p db.execute("SELECT DISTINCT Year FROM olympicMedals LIMIT 5"
    ) do |row|
        p row
    end

# 4) get the records where the medal is gold 
p "Solution for 4"

p db.execute("SELECT * FROM olympicMedals WHERE Medal IS 'Gold' LIMIT 5"
    ) do |row|
        p row
    end

# 5) get the records for the summer olympics between 1950 - 2000
p "Solution for 5"

p db.execute("SELECT * FROM olympicMedals WHERE Season IS 'Summer' AND Year >= 1950 AND year <= 2000 LIMIT 5"
    ) do |row|
        p row
    end

# 6) get the records where a country won a silver or a gold
p "Solution for 6"

p db.execute("SELECT * FROM olympicMedals WHERE Medal IS 'Gold' OR 'Silver' LIMIT 5"
    ) do |row|
        p row
    end

# 7) get the records where a country won a gold and wasn't the united states 
p "Solution for 7"

p db.execute("SELECT * FROM olympicMedals WHERE Medal IS 'Gold' AND NOT Country is 'USA' LIMIT 5"
    ) do |row|
        p row
    end

# 8) get the countries who won medals after 2000 and sort them alphabetically by country name
p "Solution for 8"

p db.execute("SELECT * FROM olympicMedals WHERE Year >= 2000 ORDER BY Country DESC LIMIT 5"
    ) do |row|
        p row
    end

# 9) find the records where the country is null 
p "Solution for 9"

# NOTE: normally in datasets, we don't want null values. from now on, make sure that country is NOT null

p db.execute("SELECT * FROM olympicMedals WHERE Country IS NULL LIMIT 5"
    ) do |row|
        p row
    end

# 10) find the min and max year in the data 
# as you print this solution out, it may not have enough information. 
# look into aliases! https://www.w3schools.com/sql/sql_alias.asp
p "Solution for 10"

p db.execute("SELECT MIN(Year), MAX(Year) FROM olympicMedals WHERE Country IS NOT NULL LIMIT 5"
    ) do |row|
        p row
    end

# 11) find how many medals each country has won sorting most medals
p "Solution for 11"

p p db.execute("SELECT COUNT ( * ) AS medal, country FROM olympicMedals GROUP BY country ORDER BY medal DESC LIMIT 5"
) do |row|
    p row
end

# 12) get top 10 countries who have won the most gold medals in descending order
p "Solution for 12"

p p db.execute("SELECT COUNT ( * ) AS medal, country FROM olympicMedals WHERE medal IS 'Gold' GROUP BY country ORDER BY medal DESC LIMIT 10"
) do |row|
    p row
end

# 13) get top 10 countries who have won the least medals in ascending order
p "Solution for 13"

p p db.execute("SELECT COUNT ( * ) AS medal, country FROM olympicMedals GROUP BY country ORDER BY medal ASC LIMIT 10"
) do |row|
    p row
end

# 14) get top 10 countries by full country name who have won the most gold medals in descending order
p "Solution for 14"

p p db.execute("SELECT COUNT ( olympicMedals.medal ) AS medal, countryLookup.country_name
FROM olympicMedals 
INNER JOIN countryLookup 
ON olympicMedals.country = countryLookup.code
WHERE medal IS 'Gold'
GROUP BY country 
ORDER BY medal DESC LIMIT 10;"
) do |row|
    p row
end

# 15) get top 10 countries by full country name and population, where the name is not null, that have won the most gold medals in descending order
p "Solution for 15"
p p db.execute("SELECT COUNT ( olympicMedals.medal ) AS medal, countryLookup.country_name, countryLookup.population
FROM olympicMedals 
INNER JOIN countryLookup
ON olympicMedals.country = countryLookup.code
WHERE medal IS 'Gold' AND country IS NOT null 
GROUP BY country 
ORDER BY medal DESC LIMIT 10;"
) do |row|
    p row
end