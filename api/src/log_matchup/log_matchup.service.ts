import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from '../database/PrismaService';

@Injectable()
export class LogMatchupService {
    constructor(private prisma: PrismaService){}

    async createLogMatchup(data: Prisma.Log_MatchupCreateInput){
        return await this.prisma.log_Matchup.create({data});
    }

    async findLogMatchup(){
        return await this.prisma.log_Matchup.findMany();
    }

    async updateLogMatchup(id_log_matchup: number, data: Prisma.Log_MatchupUpdateInput){
        const logMatchupRegistered = await this.prisma.log_Matchup.findUnique({
            where: {id_log_matchup}
        });

        if(logMatchupRegistered){
            return await this.prisma.log_Matchup.update({
                data,
                where: {id_log_matchup}
            });
        }else{
            throw new Error('Not found');
        }
    }

    async deleteLogMatchup(id_log_matchup: number){
        const logMatchupRegistered = await this.prisma.log_Matchup.findUnique({
            where: {id_log_matchup}
        });

        if(logMatchupRegistered){
            return await this.prisma.log_Matchup.delete({
                where: {id_log_matchup}
            })
        }else{
            throw new Error('Not found');
        }
    }
}
