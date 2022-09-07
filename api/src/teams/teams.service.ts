import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { TeamsMultipleCreateInput } from '../dto/teamMultipleDTO';
import { PrismaService } from '../database/PrismaService';

@Injectable()
export class TeamsService {

    constructor(private prisma: PrismaService) {}
   
    async createTeam(data: Prisma.TeamCreateInput){
        
        const teamRegistered = await this.prisma.team.findFirst({
            where:{
                name_team: data.name_team
            }
        });

        if(!teamRegistered){
            const team = await this.prisma.team.create({
                data,
            })
            return team;
        }else{
            throw new Error('Team already registered');
        }
    }

    async createMultipleTeams(data: TeamsMultipleCreateInput){
        if(!data){
            throw new Error('Without data')
        }

        data.teams.forEach(async item => {
            await this.createTeam(item)
        })
    }

    async findAllTeams(){
        return await this.prisma.team.findMany();
    }

    async findAllTeamsWithPlayers(){
        return await this.prisma.team.findMany({
            include:{
                players:true
            }
        });
    }

    async updateTeamName(name_team: string, data: Prisma.TeamUpdateInput){
        const teamRegistered = await this.prisma.team.findUnique({
            where: {
                name_team,
            }
        });

        if (teamRegistered){
            const team = await this.prisma.team.update({
                data,
                where: {
                    name_team
                }
            });
            return team;
        }else{
            throw new Error('Team not found');
        }
    }

    async deleteTeam(name_team: string){
        const teamRegistered = await this.prisma.team.findUnique({
            where: {
                name_team
            }
        });

        if (teamRegistered){
            const team = await this.prisma.team.delete({
                where: {name_team}
            });
            return team;
        }else{
            throw new Error('Team not found');
        }
    }
}
