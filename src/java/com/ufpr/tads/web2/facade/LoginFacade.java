/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.facade;

import com.ufpr.tads.web2.beans.UsuarioBean;
import com.ufpr.tads.web2.dao.LoginDao;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

/**
 *
 * @author sa
 */
public class LoginFacade {

    public static UsuarioBean busca(String login, String senha) throws SQLException, NoSuchAlgorithmException, UnsupportedEncodingException {
        LoginDao uDao = new LoginDao();
        UsuarioBean retorno = null;
        try{
            retorno = uDao.BuscaUser(login, senha);
        }catch(NullPointerException e){
            System.err.println("LoginFacade-> retorno \'Null\'");
        }
        return retorno;
    }
}
