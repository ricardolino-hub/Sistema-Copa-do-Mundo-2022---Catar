import { Body, Controller, Delete, Get, Param, Patch, Post } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { TypeLogMultipleCreateInput } from '../dto/typeLogMultipleDTO';
import { TypeLogService } from './type_log.service';

@Controller('type-logs')
export class TypeLogController {
    constructor(private readonly typeLogService: TypeLogService){}

    @Post('/post')
    async createTypeLog(@Body() data: Prisma.Type_LogCreateInput){
        return this.typeLogService.createTypeLog(data);
    }

    @Post('/post/multiple')
    async createMultipleTypeLog(@Body() data: TypeLogMultipleCreateInput){
        return this.typeLogService.createMultipleTypeLog(data);
    }

    @Get()
    async findAllTeams(){
        return this.typeLogService.findAllTypeLog();
    }

    @Patch('/patch/:description')
    async updateTeamName(@Param('description') description: string, @Body() data: Prisma.Type_LogUpdateInput){
        return this.typeLogService.updateTypeLog(description, data);
    }

    @Delete('/delete/:description')
    async deleteTeam(@Param('description') description: string){
        return this.typeLogService.deleteTypeLog(description);
    }
}
