import { prisma } from '$lib/server/db.js'

export async function saveDraft(draft, name, opponent){
    console.log(draft)
    console.log(name)
    console.log(opponent)
    const newDraft = await prisma.draftplanning.create({
        data: {
          name: name,
          email: opponent,
          bb1: Draft[0][items][0],   
          bb2: Draft[1][items][0],       
          bb3: Draft[2][items][0],       
          bb4: Draft[3][items][0],      
          bb5: Draft[4][items][0],      
          rb1: Draft[5][items][0],       
          rb2: Draft[6][items][0],       
          rb3: Draft[7][items][0],       
          rb4: Draft[8][items][0],       
          rb5: Draft[9][items][0],       
          bp1: Draft[10][items][0],       
          bp2: Draft[11][items][0],       
          bp3: Draft[12][items][0],       
          bp4: Draft[13][items][0],     
          bp5: Draft[14][items][0],       
          rp1: Draft[15][items][0],       
          rp2: Draft[16][items][0],       
          rp3: Draft[17][items][0],       
          rp4: Draft[18][items][0],       
          rp5: Draft[19][items][0]       
        },
      })
}