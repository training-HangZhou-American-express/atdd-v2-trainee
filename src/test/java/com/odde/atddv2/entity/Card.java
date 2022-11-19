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
@Table(name = "cards")
public class Card {
    @Id
    private long id;

    @OneToOne
    private CardProduct cardProduct;

    private String name, number;
}
