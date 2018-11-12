/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufpr.tads.web2.beans;

/**
 *
 * @author sa
 */
public class Funcionario {
    private int id;
    private String nome;
    private String login;
    private String senha;
    private String sexo;

    public Funcionario() {
    }

    public Funcionario(String nome, String login, String senha) {
        this.nome = nome; //ATRIBUTOS  não é visto no bean, ONDE É ARMAZENADO.
        this.login = login;//ATRIBUTOS não é visto no bean, ONDE É ARMAZENADO.
        this.senha = senha;//ATRIBUTOS não é visto no bean, ONDE É ARMAZENADO.
    }

    public int getId() { //PROPRIEDADE ELEMENTO PARA MANIPULAR O ATRIBUTO. PROPRIEDADE CHAMADA IDADE
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }    

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
    
    
}
