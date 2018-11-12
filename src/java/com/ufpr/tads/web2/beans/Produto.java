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
public class Produto {
    private int id_produto;
    private String nome_produto;
    private Categoria cat;
    private String dscricao_produto;
    private Double peso_produto;
    
    public int getId_produto() {
        return id_produto;
    }

    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public String getNome_produto() {
        return nome_produto;
    }

    public void setNome_produto(String nome_produto) {
        this.nome_produto = nome_produto;
    }

    public Categoria getCat() {
        return cat;
    }

    public void setCat(Categoria cat) {
        this.cat = cat;
    }

    public String getDscricao_produto() {
        return dscricao_produto;
    }

    public void setDscricao_produto(String dscricao_produto) {
        this.dscricao_produto = dscricao_produto;
    }

    public Double getPeso_produto() {
        return peso_produto;
    }

    public void setPeso_produto(Double peso_produto) {
        this.peso_produto = peso_produto;
    }
}
