/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author sa
 */
public class ProdutoDao {

    public List<Produto> buscaProdutos() {
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement st = null;
        ResultSet rs = null;
        List<Produto> produtos = new ArrayList<>();
        try {
            st = con.prepareStatement("SELECT * FROM trabalho.produto");
            rs = st.executeQuery();
            while (rs.next()) {
                Produto p = new Produto();
                p.setId_produto(rs.getInt("id_produto"));
                p.setNome_produto(rs.getString("nome_produto"));
                
                produtos.add(p);
            }
            return produtos;
        } catch (SQLException e) {
            return null;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                }
            }
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException ex) {
                }
            }
        }
    }
    
    public Produto buscaProduto(int id) throws SQLException{
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement st;
        Produto p = new Produto();
        st = con.prepareStatement("SELECT * FROM trabalho.produto where id_produto = ?");
        st.setInt(1, id);
         ResultSet rs = st.executeQuery();
        if (rs.next()) {
            p.setId_produto(rs.getInt("id_produto"));
            p.setNome_produto(rs.getString("nome_produto"));
        }
        return p;
    }
}
