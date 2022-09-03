import { Module } from '@nestjs/common';
import { PrismaService } from './database/PrismaService';
import { TeamsController } from './teams/teams.controller';
import { TeamsService } from './teams/teams.service';

@Module({
  imports: [],
  controllers: [TeamsController],
  providers: [TeamsService, PrismaService],
})
export class AppModule {}
