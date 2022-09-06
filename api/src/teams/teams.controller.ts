import { Body, Controller, Delete, Get, Param, Patch, Post, Put } from '@nestjs/common';
import { TeamsService } from './teams.service';
import { Prisma } from '@prisma/client';
import { TeamsMultipleCreateInput } from '../dto/teamMultipleDTO';

@Controller('teams')
export class TeamsController {
    constructor(private readonly teamService: TeamsService){}

    @Post('/post')
    async createTeam(@Body() data: Prisma.TeamCreateInput){
        return this.teamService.createTeam(data);
    }

    @Post('/post/multiple')
    async createMultipleTeams(@Body() data: TeamsMultipleCreateInput){
        return this.teamService.createMultipleTeams(data);
    }

    @Get()
    async findAllTeams(){
        return this.teamService.findAllTeams();
    }

    @Patch('/patch/:name_team')
    async updateTeamName(@Param('name_team') name_team: string, @Body() data: Prisma.TeamUpdateInput){
        return this.teamService.updateTeamName(name_team, data);
    }

    @Delete('/delete/:name_team')
    async deleteTeam(@Param('name_team') name_team: string){
        return this.teamService.deleteTeam(name_team);
    }
}
