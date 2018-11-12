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
public class Categoria {
    private int id_cat;
    private String nome_cat;

    public int getId_cat() {
        return id_cat;
    }

    public void setId_cat(int id_cat) {
        this.id_cat = id_cat;
    }

    public String getNome_cat() {
        return nome_cat;
    }

    public void setNome_cat(String nome_cat) {
        this.nome_cat = nome_cat;
    }
}
