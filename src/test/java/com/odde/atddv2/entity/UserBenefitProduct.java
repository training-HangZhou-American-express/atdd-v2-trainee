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
@Table(name = "user_benefit_products")
public class UserBenefitProduct {
    @Id
    private long id;

    @OneToOne
    private User user;
   
    @OneToOne
    private BenefitProduct benefitProduct;
}
