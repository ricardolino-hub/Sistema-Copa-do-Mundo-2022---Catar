-- CreateTable
CREATE TABLE "Team" (
    "id_team" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name_team" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Player" (
    "id_player" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name_player" TEXT NOT NULL,
    "number_player" INTEGER NOT NULL,
    CONSTRAINT "Player_id_player_fkey" FOREIGN KEY ("id_player") REFERENCES "Team" ("id_team") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Matchup" (
    "id_matchup" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "date_matchup" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Matchup_Team" (
    "id_matchp_team" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "qtd_gols" INTEGER,
    CONSTRAINT "Matchup_Team_id_matchp_team_fkey" FOREIGN KEY ("id_matchp_team") REFERENCES "Team" ("id_team") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Matchup_Team_id_matchp_team_fkey" FOREIGN KEY ("id_matchp_team") REFERENCES "Matchup" ("id_matchup") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Type_Log" (
    "id_type_log" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "description" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Log_Matchup" (
    "id_log_matchup" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    CONSTRAINT "Log_Matchup_id_log_matchup_fkey" FOREIGN KEY ("id_log_matchup") REFERENCES "Matchup" ("id_matchup") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Log_Matchup_id_log_matchup_fkey" FOREIGN KEY ("id_log_matchup") REFERENCES "Player" ("id_player") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Team_name_team_key" ON "Team"("name_team");

-- CreateIndex
CREATE UNIQUE INDEX "Type_Log_description_key" ON "Type_Log"("description");
