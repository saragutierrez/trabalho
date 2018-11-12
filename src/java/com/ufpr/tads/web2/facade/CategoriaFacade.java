/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.Categoria;
import com.ufpr.tads.web2.dao.CategoriaDao;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author sa
 */
public class CategoriaFacade {
    
    public static void inserir(Categoria c) throws SQLException {
        CategoriaDao cDao = new CategoriaDao();
        cDao.adiciona(c);
    }
    
    public static boolean updateCat(Categoria c) throws SQLException {
        CategoriaDao cDao = new CategoriaDao();
        boolean deuBoa;
        deuBoa = cDao.updateCat(c);
        return deuBoa;
    }
    
    public static void remove(int id) throws SQLException {
        CategoriaDao cDao = new CategoriaDao();
        cDao.removeCat(id);
    }
    
    public static List<Categoria> buscarCategorias() {
        CategoriaDao cDao = new CategoriaDao();
        List<Categoria> listaResultado = cDao.buscaCategorias();
        return listaResultado;
    }

    public static Categoria buscarCategoria(int id) throws SQLException {
        CategoriaDao cDao = new CategoriaDao();
        Categoria retorno = cDao.buscaCategoria(id);
        return retorno;
    }
}
