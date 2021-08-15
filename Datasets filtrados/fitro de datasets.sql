
USE encanto4_ProyectoBedu;

SELECT * FROM Batting;

SELECT Player.playerID, CONCAT(Player.nameFirst, ' ', Player.nameLast), Player.birthCountry, Salaries.salary, Salaries.teamID
FROM Player
INNER JOIN Salaries
ON Player.playerID=Salaries.playerID;Salaries


SELECT *
FROM Batting
WHERE playerID='aardsda01';

SELECT *
FROM Batting_grouped_by_player
WHERE playerID='jeterde01';

#Batting agrupado por jugador (todas sus temporadas sumadas)
SELECT playerID, SUM(G) G, SUM(AB) AB, SUM(R) R, SUM(H) H, SUM(2B) 2B, SUM(3B) 3B, SUM(HR) HR, SUM(RBI) RBI, SUM(SB) SB, SUM(CS) CS, SUM(BB) BB, SUM(SO) SO, SUM(IBB) IBB, SUM(HBP) HBP, SUM(SH) SH, SUM(SF) SF, SUM(GIDP) GIDP 
FROM Batting
GROUP BY playerID
ORDER BY playerID;

#Creación de vista "Batting_grouped_by_player"
CREATE VIEW Batting_grouped_by_player as
SELECT playerID, SUM(G) G, SUM(AB) AB, SUM(R) R, SUM(H) H, SUM(2B) 2B, SUM(3B) 3B, SUM(HR) HR, SUM(RBI) RBI, SUM(SB) SB, SUM(CS) CS, SUM(BB) BB, SUM(SO) SO, SUM(IBB) IBB, SUM(HBP) HBP, SUM(SH) SH, SUM(SF) SF, SUM(GIDP) GIDP 
FROM Batting
GROUP BY playerID
ORDER BY playerID;

#Dataset salarios máximos
SELECT Player.playerID, CONCAT(Player.nameFirst, ' ', Player.nameLast), Player.birthCountry, MAX(Salaries.salary) max_salary, Salaries.teamID
FROM Player
INNER JOIN Salaries
ON Player.playerID=Salaries.playerID
GROUP BY Player.playerID;

#Creación de vista "Max_salary_per_player"
CREATE VIEW Max_salary_per_player as
SELECT Player.playerID, CONCAT(Player.nameFirst, ' ', Player.nameLast), Player.birthCountry, MAX(Salaries.salary) max_salary, Salaries.teamID
FROM Player
INNER JOIN Salaries
ON Player.playerID=Salaries.playerID
GROUP BY Player.playerID;

