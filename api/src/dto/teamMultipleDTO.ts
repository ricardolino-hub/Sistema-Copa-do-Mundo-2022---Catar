import { Prisma } from "@prisma/client"


export type TeamsMultipleCreateInput = {
    teams:Prisma.TeamCreateInput[]
}