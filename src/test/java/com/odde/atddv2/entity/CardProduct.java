package com.odde.atddv2.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Getter
@Setter
@Entity
@Table(name = "card_products")
public class CardProduct {

    @Id
    private long id;

    @OneToOne
    private Bank bank;
}
