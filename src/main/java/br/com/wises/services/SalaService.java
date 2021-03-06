package br.com.wises.services;

import br.com.wises.database.EManager;
import br.com.wises.database.pojo.Sala;
import java.util.List;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;

@Path("sala")
public class SalaService {

    @GET
    @Path("salas")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    public List<Sala> getSalas(
            @HeaderParam("idOrganizacao") int idOrganizacao,
            @HeaderParam("authorization") String authorization) {
        if (authorization != null && authorization.equals("secret")) {
            List<Sala> lista = EManager.getInstance().getSalaAccessor().getSalasByOrganizacaoId(idOrganizacao);
            for (int i = 0; i < lista.size(); i++) {
                lista.get(i).getIdOrganizacao().setSalaCollection(null);
                lista.get(i).getIdOrganizacao().setUsuarioCollection(null);
                lista.get(i).setAlocacaoSalaCollection(null);
             }
            return lista;
        } else {
            return null;
        }
    }
    @GET
    @Path("getsalas")
    @Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
    public List<Sala> getSalasOrg(
            @HeaderParam("idOrganizacao") int idOrganizacao,
            @HeaderParam("authorization") String authorization) {
        if (authorization != null && authorization.equals("secret")) {
            List<Sala> lista = EManager.getInstance().getSalaAccessor().getSalasByOrganizacaoId(idOrganizacao);
            for (int i = 0; i < lista.size(); i++) {
                lista.get(i).getIdOrganizacao().setSalaCollection(null);
                lista.get(i).getIdOrganizacao().setUsuarioCollection(null);
                lista.get(i).getIdOrganizacao().setDominio(null);
                lista.get(i).setAlocacaoSalaCollection(null);
             }
            return lista;
        } else {
            return null;
        }
    }
    
}
