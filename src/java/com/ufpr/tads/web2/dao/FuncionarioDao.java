/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.dao;

//import com.ufpr.tads.web2.beans.Criptografia;
//import java.io.UnsupportedEncodingException;
//import java.security.MessageDigest;
//import java.security.NoSuchAlgorithmException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.logging.Level;
//import java.util.logging.Logger;

/**
 *
 * @author sa
 */
public class FuncionarioDao { //NAO EXISTE MAIS

//    public void adiciona(Funcionario pessoa) throws NoSuchAlgorithmException, UnsupportedEncodingException {
//        Connection con = new ConnectionFactory().getConnection();
//        String sql = ("insert into tb_usuario (nome,sexo,senha,login) values (?,?,?,?)");
//        try {
//            // prepared statement para inserção
//            PreparedStatement stmt = con.prepareStatement(sql);
//            // seta os valores
//            stmt.setString(1, pessoa.getNome());
//            stmt.setString(2, pessoa.getSexo());
//            String senha = pessoa.getSenha();
//            String s = Criptografia.criptografar(senha);
//            stmt.setString(3, s);
//            stmt.setString(4, pessoa.getLogin());
//            // executa
//            stmt.executeUpdate();
//            stmt.close();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    public Funcionario BuscaUser(String login, String senha) throws SQLException, NoSuchAlgorithmException, UnsupportedEncodingException {
//        Connection con = new ConnectionFactory().getConnection();
//        PreparedStatement st;
//        Funcionario user = new Funcionario();
//        String s = Criptografia.criptografar(senha);
//        st = con.prepareStatement("SELECT nome,id FROM tb_usuario WHERE login = ? and senha = ?");
//        st.setString(1, login);
//        st.setString(2, s);
//        ResultSet rs = st.executeQuery();
//        if (rs.next()) {
//            user.setNome(rs.getString(1));
//            user.setId(rs.getInt(2));
//        }
//        return user;
//    }
//
//    public List<Funcionario> buscarTodos() throws SQLException {
//        List<Funcionario> resultados = new ArrayList<Funcionario>();
//        Connection con = new ConnectionFactory().getConnection();
//        PreparedStatement st = null;
//        ResultSet rs = null;
//        try {
//            con = ConnectionFactory.getConnection();
//            st = con.prepareStatement("SELECT * FROM tb_usuario");
//            rs = st.executeQuery();
//            while (rs.next()) {
//                Funcionario p = new Funcionario();
//                p.setId(rs.getInt("Id"));
//                p.setNome(rs.getString("nome"));
//                p.setSenha(rs.getString("sexo"));
//                p.setSenha(rs.getString("senha"));
//                p.setLogin(rs.getString("login"));
//                resultados.add(p);
//            }
//            return resultados;
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        } finally {
//            if (rs != null) {
//                try {
//                    rs.close();
//                } catch (SQLException e) {
//                }
//            }
//            if (st != null) {
//                try {
//                    st.close();
//                } catch (SQLException e) {
//                }
//            }
//            if (con != null) {
//                try {
//                    con.close();
//                } catch (SQLException e) {
//                }
//            }
//        }
//    }
}
