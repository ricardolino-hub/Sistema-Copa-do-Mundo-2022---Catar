import { Body, Controller, Delete, Get, Param, Patch, Post } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { MatchupTeamService } from './matchup_team.service';

@Controller('matchups-teams')
export class MatchupTeamController {
    constructor(private readonly matchupTeamService: MatchupTeamService){}

    @Post('/post')
    async createMatchupTeam(@Body() data: Prisma.Matchup_TeamUncheckedCreateInput){
        return this.matchupTeamService.createMatchupTeam(data);
    }

    @Get()
    async findAllMatchupTeam(){
        return this.matchupTeamService.findAllMatchupTeam();
    }

    @Patch('/patch/:id_matchup_team')
    async updateMatchupTeam(@Param('id_matchup_team') id_matchup_team: string, @Body() data: Prisma.Matchup_TeamUpdateInput){
        const id = parseInt(id_matchup_team);
        return this.matchupTeamService.updateMatchupTeam(id, data);
    }

    @Delete('/delete/:id_matchup_team')
    async deleteMatchupTeam(@Param('id_matchup_team') id_matchup_team: string){
        const id = parseInt(id_matchup_team);
        return this.matchupTeamService.deleteMatchupTeam(id);
    }
}
