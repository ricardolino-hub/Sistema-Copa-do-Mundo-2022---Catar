import { Module } from '@nestjs/common';
import { PrismaService } from './database/PrismaService';
import { TeamsController } from './teams/teams.controller';
import { TeamsService } from './teams/teams.service';
import { PlayerController } from './player/player.controller';
import { PlayerService } from './player/player.service';
import { TypeLogController } from './type_log/type_log.controller';
import { TypeLogService } from './type_log/type_log.service';
import { MatchupTeamController } from './matchup_team/matchup_team.controller';
import { MatchupTeamService } from './matchup_team/matchup_team.service';
import { MatchupController } from './matchup/matchup.controller';
import { MatchupService } from './matchup/matchup.service';
import { LogMatchupController } from './log_matchup/log_matchup.controller';
import { LogMatchupService } from './log_matchup/log_matchup.service';

@Module({
  imports: [],
  controllers: [TeamsController, PlayerController, TypeLogController, MatchupTeamController, MatchupController, LogMatchupController],
  providers: [TeamsService, PrismaService, PlayerService, TypeLogService, MatchupTeamService, MatchupService, LogMatchupService],
})
export class AppModule {}
