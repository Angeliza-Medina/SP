# SP1: Gridbased game

Ud fra det vi har lavet med double int arrays og double for loops, skal I lave et gridbaseret spil.
Der skal være en main klasse som styrer spillet.
Der skal være en player, mindst 4 enemies, mindst 4 food.
- Player er styret af keyboard inputs.
- Enemies løber hen imod spilleren og spilleren mister liv hvis den rammer ham.
- Food skal være levende og løbe væk fra spilleren. Hvis spilleren rammer food, får han +1 score og maden forsvinder.
- Når spilleren har mindre end 1 liv tilbage, skal spillet stoppe.
- Begræns movement for spiller, enemies og food, så de ikke forårsager ArrayIndexOutOfBoundsException.

Afleveres via. Github link på moodle

Hvis du har tid:
Tilføj sjove billeder som grafik-
Hver gang food forsvinder skal der dukke en ny op et tilfældigt sted.
Tilføj score som UI
Tilføj game over screen.
Lav endnu en spiller, så man kan spiller to mand på ét keyboard.

Main klasse:
// følgende metoder er alle kaldt fra draw();
- clearBoard() // sætter alle værdier til 0 via double for loop (grid[x][y] = 0;)
- updateEnemies() // kalder enemy.moveTowardsPlayer() på hver enemy.
- drawBoard() // tegner rect og bruger getColorFromType metoden til at bestemme fill værdi.
- keyPressed() // håndterer input og ændrer på player.x og player.y
- isGameOver() // returnerer true hvis spillerens health er under -1.
- resolveCollisions() // tjekker om enemy og player står på samme x og y koordinat. Hvis ja, så kald player.takeDamage();
// tjekker om food og player står på samme x og y koordinat. Hvis ja, så kald player.increaseScore();

Player klasse:
data:
- x værdi
- y værdi
- health værdi
- type (hvilken farve)
- score

metoder:
- Constructor() // sætter x, y og health
- takeDamage() // decrementer health variablen.
- increaseScore() // incrementer score variablen.

Enemy klasse:
data:
- x værdi
- y værdi
- type (hvilken farve)
- Player // en reference til player objektet, for at kunne måle afstand.


metoder:
- Constructor() // sætter x, y og player variablerne.
- MoveTowardsPlayer() // sætter ny x og y værdi. Der skal være 25% chance for at fjenden bevæger sig i en tilfældig retning.

Food klasse:
data:
- x værdi
- y værdi
- type (hvilken farve)
- Player // en reference til player objektet, for at kunne måle afstand.


metoder:
- Constructor() // sætter x, y og player variablerne.
- MoveAwayFromPlayer() // sætter ny x og y værdi. Der skal være 25% chance for at food bevæger sig i en tilfældig retning.

<b>Aflevering: upload jeres færdige projekt til github og aflevér linket på moodle inden mandag kl 08:55</b>