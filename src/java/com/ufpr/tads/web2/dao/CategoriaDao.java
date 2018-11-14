/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

import com.ufpr.tads.web2.beans.Categoria;
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
public class CategoriaDao {

    public List<Categoria> buscaCategorias() {
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement st = null;
        ResultSet rs = null;
        List<Categoria> categorias = new ArrayList<>();
        try {
            st = con.prepareStatement("SELECT * FROM trabalho.categoria");
            rs = st.executeQuery();
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setId_categoria(rs.getInt("id_categoria"));
                c.setNome_categoria(rs.getString("nome_categoria"));
                categorias.add(c);
            }
            return categorias;
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

    public Categoria buscaCategoria(int id) throws SQLException {
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement st;
        Categoria c = new Categoria();
        st = con.prepareStatement("SELECT * FROM trabalho.categoria where id_categoria = ?");
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            c.setId_categoria(rs.getInt("id_categoria"));
            c.setNome_categoria(rs.getString("nome_categoria"));
        }
        return c;
    }

    public boolean updateCat(Categoria c) {
        Connection con = ConnectionFactory.getConnection();
        String sql = ("update trabalho.categoria SET nome_categoria=? WHERE id_categoria = ?");
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st = con.prepareStatement(sql);
            st.setString(1, c.getNome_categoria());
            st.setInt(2, c.getId_categoria());
            st.executeUpdate();
            st.getResultSet();
            return true;
        } catch (SQLException ex) {
            System.err.println("Erro" + ex);
            return false;
        } finally {
        }

    }
    
    public void removeCat(int id) throws SQLException {
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement st;
        Categoria c = new Categoria();
        st = con.prepareStatement("delete FROM trabalho.categoria WHERE id_categoria = ?");
        st.setInt(1, id);
        st.executeUpdate();
    }
    
    public void adiciona(Categoria cat) {
        Connection con = ConnectionFactory.getConnection();
        String sql = ("insert into trabalho.categoria (nome_categoria) values (?)");
        try {
            // prepared statement para inserção
            PreparedStatement stmt = con.prepareStatement(sql);
            // seta os valores
            stmt.setString(1, cat.getNome_categoria());
           
            // executa
            stmt.executeUpdate();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
