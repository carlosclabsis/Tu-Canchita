﻿using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CanchitaServices.Models.Repositories
{
    public class EFServicioRepository : IServicioRepository
    {
        public IQueryable<TServicio> Items => context.TServicio;
        private CanchitaDbContext context;
        public EFServicioRepository(CanchitaDbContext ctx)
        {
            context = ctx;
        }
        public async Task Save(TServicio servicio)
        {
            if (servicio.ServId == Guid.Empty)
            {
                servicio.ServId = Guid.NewGuid();
                context.TServicio.Add(servicio);
            }
            else
            {
                TServicio dbEntry = context.TServicio
                .FirstOrDefault(p => p.ServId == servicio.ServId);
                if (dbEntry != null)
                {
                    dbEntry.ServNombre = servicio.ServNombre;

                }
            }

            await context.SaveChangesAsync();
        }
        public async Task Delete(Guid ServicioID)
        {
            TServicio dbEntry = context.TServicio
            .FirstOrDefault(p => p.ServId == ServicioID);
            if (dbEntry != null)
            {
                context.TServicio.Remove(dbEntry);
                await context.SaveChangesAsync();
            }
        }

    }
}
