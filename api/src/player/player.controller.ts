import { Body, Controller, Delete, Get, Param, Patch, Post } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PlayerMultipleCreateInput } from '../dto/playerMultipleDTO';
import { PlayerService } from './player.service';

@Controller('players')
export class PlayerController {
    constructor(private readonly playerService: PlayerService){}

    @Post('/post')
    async createPlayer(@Body() data: Prisma.PlayerCreateInput){
        return this.playerService.createPlayer(data);
    }

    @Post('/post/multiple')
    async createMultiplePlayers(@Body() data: PlayerMultipleCreateInput){
        return this.playerService.createMultiplePlayers(data);
    }

    @Get()
    async findPlayer(){
        return this.playerService.findPlayers();
    }
    
    @Patch('/patch/:id_player')
    async updatePlayer(@Param('id_player') id_player: string, @Body() data: Prisma.PlayerUpdateInput){
        const id = parseInt(id_player);
        return this.playerService.updatePlayer(id, data);
    }

    @Delete('/delete/:id_player')
    async deletePlayer(@Param('id_player') id_player: string){
        const id = parseInt(id_player);
        return this.playerService.deletePlayer(id);
    }
}
