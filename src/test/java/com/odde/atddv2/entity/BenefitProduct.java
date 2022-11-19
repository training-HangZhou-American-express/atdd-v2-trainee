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
@Table(name = "benefit_products")
public class BenefitProduct {

    @Id
    private long id;

    @OneToOne
    private Benefit benefit;

    private String name;

    private int amount;
}
