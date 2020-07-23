/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dtos;

import java.io.Serializable;

/**
 *
 * @author HD
 */
public class CityDTO implements Serializable{

    String idCity;
    String nameCity;

    public CityDTO(String IdCity, String NameCity) {
        this.idCity = IdCity;
        this.nameCity = NameCity;
    }

    public String getIdCity() {
        return idCity;
    }

    public void setIdCity(String IdCity) {
        this.idCity = IdCity;
    }

    public String getNameCity() {
        return nameCity;
    }

    public void setNameCity(String NameCity) {
        this.nameCity = NameCity;
    }
    
    
}
