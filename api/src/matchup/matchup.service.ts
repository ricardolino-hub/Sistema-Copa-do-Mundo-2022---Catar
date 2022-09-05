import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from '../database/PrismaService';

@Injectable()
export class MatchupService {
    constructor(private prisma: PrismaService){}

    transformDate(dateString: string){
        const str = dateString;
        const [dateComponents, timeComponents] = str.split(' ');

        const [year,month,day] = dateComponents.split('-');
        const [hours,minutes,seconds] = timeComponents.split(':');

        return new Date(+year, +month - 1, +day, +hours, +minutes, +seconds);
    }

    async createMatchup(data: Prisma.MatchupCreateInput){
        return await this.prisma.matchup.create({
            data: {
                date_matchup:this.transformDate(data.date_matchup+'')
            }
        });
    }

    async findAllMatchup(){
        return await this.prisma.matchup.findMany();
    }

    async updateMatchup(id_matchup: number, data: Prisma.MatchupUpdateInput){
        const matchupRegistered = await this.prisma.matchup.findUnique({
            where: {id_matchup}
        });

        if(matchupRegistered){
            return await this.prisma.matchup.update({
                data: {
                    date_matchup: this.transformDate(data.date_matchup+'')
                },
                where: {id_matchup}
            })
        }else{
            throw new Error('Matchup not found');
        }
    }

    async deleteMatchup(id_matchup: number){
        const matchupRegistered = await this.prisma.matchup.findUnique({
            where: {id_matchup}
        });

        if(matchupRegistered){
            return await this.prisma.matchup.delete({
                where: {id_matchup}
            });
        }else{
            throw new Error('Matchup not found');
        }
    }
}
