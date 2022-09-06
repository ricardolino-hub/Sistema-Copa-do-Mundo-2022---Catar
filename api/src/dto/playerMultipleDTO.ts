import { Prisma } from "@prisma/client";

export type PlayerMultipleCreateInput = {
    players:Prisma.PlayerCreateInput[]
}
