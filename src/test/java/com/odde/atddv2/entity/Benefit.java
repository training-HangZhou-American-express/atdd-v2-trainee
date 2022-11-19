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
@Table(name = "benefits")
public class Benefit {

    @Id
    private long id;

    @OneToOne
    private Merchant merchant;
}
