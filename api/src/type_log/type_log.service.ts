import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from '../database/PrismaService';

@Injectable()
export class TypeLogService {
    constructor(private prisma: PrismaService){}

    async createTypeLog(data: Prisma.Type_LogCreateInput){
        const typeLogRegistered = await this.prisma.type_Log.findUnique({
            where: {
                description: data.description
            }
        });

        if(!typeLogRegistered){
            return await this.prisma.type_Log.create({data});
        }else{
            throw new Error('Log Type alredy registered')
        }
    }

    async findAllTypeLog(){
        return this.prisma.type_Log.findMany();
    }

    async updateTypeLog(description: string, data: Prisma.Type_LogUpdateInput){
        const typeLogRegistered = await this.prisma.type_Log.findUnique({
            where: {
                description
            }
        });

        if (typeLogRegistered){
            return await this.prisma.type_Log.update({
                data,
                where: {description}
            });
        }else{
            throw new Error('Log type not found');
        }
    }

    async deleteTypeLog(description: string){
        const typeLogRegistered = await this.prisma.type_Log.findUnique({
            where: {
                description
            }
        });

        if (typeLogRegistered){
            return await this.prisma.type_Log.delete({
                where: {description}
            });
        }else{
            throw new Error('Log type not found');
        }
    }
}
