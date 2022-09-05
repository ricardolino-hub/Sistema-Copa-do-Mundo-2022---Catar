import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from '../database/PrismaService';

@Injectable()
export class PlayerService {
    constructor(private prisma: PrismaService){}

    async createPlayer(data: Prisma.PlayerCreateInput){
        return await this.prisma.player.create({data});
    }

    async findPlayers(){
        return await this.prisma.player.findMany();
    }

    async updatePlayer(id_player: number, data: Prisma.PlayerUpdateInput){
        const playerRegistered = await this.prisma.player.findUnique({
            where: {id_player}
        });

        if(playerRegistered){
            return await this.prisma.player.update({
                data,
                where: {id_player}
            });
        }else{
            throw new Error('Player not found');
        }
    }

    async deletePlayer(id_player: number){
        const playerRegistered = await this.prisma.player.findUnique({
            where: {id_player}
        });

        if(playerRegistered){
            return await this.prisma.player.delete({
                where: {id_player}
            })
        }else{
            throw new Error('Player not found');
        }
    }
}
