import { Body, Controller, Delete, Get, Param, Patch, Post } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { LogMatchupService } from './log_matchup.service';

@Controller('log-matchups')
export class LogMatchupController {
    constructor(private readonly logMatchupService: LogMatchupService){}

    @Post('/post')
    async createLogMatchup(@Body() data: Prisma.Log_MatchupCreateInput){
        return this.logMatchupService.createLogMatchup(data);
    }

    @Get()
    async findLogMatchup(){
        return this.logMatchupService.findLogMatchup();
    }
    
    @Patch('/patch/:id_log_matchup')
    async updateLogMatchup(@Param('id_log_matchup') id_log_matchup: string, @Body() data: Prisma.Log_MatchupUpdateInput){
        const id = parseInt(id_log_matchup);
        return this.logMatchupService.updateLogMatchup(id, data);
    }

    @Delete('/delete/:id_log_matchup')
    async deleteLogMatchup(@Param('id_log_matchup') id_log_matchup: string){
        const id = parseInt(id_log_matchup);
        return this.logMatchupService.deleteLogMatchup(id);
    }
}
