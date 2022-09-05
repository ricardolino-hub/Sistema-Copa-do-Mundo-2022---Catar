import { Body, Controller, Delete, Get, Param, Patch, Post } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { MatchupService } from './matchup.service';

@Controller('matchup')
export class MatchupController {
    constructor(private readonly matchupService: MatchupService){}

    @Post('/post')
    async createMatchup(@Body() data: Prisma.MatchupCreateInput){
        return this.matchupService.createMatchup(data);
    }

    @Get()
    async findAllTeams(){
        return this.matchupService.findAllMatchup();
    }

    @Patch('/patch/:id_matchup')
    async updateMatchup(@Param('id_matchup') id_matchup: string, @Body() data: Prisma.MatchupUpdateInput){
        const id = parseInt(id_matchup);
        return this.matchupService.updateMatchup(id, data);
    }

    @Delete('/delete/:id_matchup')
    async deleteMatchup(@Param('id_matchup') id_matchup: string){
        const id = parseInt(id_matchup);
        return this.matchupService.deleteMatchup(id);
    }
}
