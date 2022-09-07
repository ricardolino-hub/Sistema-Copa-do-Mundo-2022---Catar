import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from '../database/PrismaService';

@Injectable()
export class MatchupTeamService {

    constructor(private prisma: PrismaService){}

    async createMatchupTeam(data: Prisma.Matchup_TeamCreateInput){
        return await this.prisma.matchup_Team.create({data});
    }

    async findAllMatchupTeam(){
        return await this.prisma.matchup_Team.findMany();
    }

    async updateMatchupTeam(id_matchup_team: number, data: Prisma.Matchup_TeamUpdateInput){
        const matchup_TeamRegistered = await this.prisma.matchup_Team.findUnique({
            where: {id_matchup_team}
        });

        if(matchup_TeamRegistered){
            return await this.prisma.matchup_Team.update({
                data,
                where: {id_matchup_team}
            })
        }else{
            throw new Error('Not found');
        }
    }

    async deleteMatchupTeam(id_matchup_team: number){
        const matchup_TeamRegistered = await this.prisma.matchup_Team.findUnique({
            where: {id_matchup_team}
        });

        if(matchup_TeamRegistered){
            return await this.prisma.matchup_Team.delete({
                where: {id_matchup_team}
            });
        }else{
            throw new Error('Not found');
        }
    }
}

