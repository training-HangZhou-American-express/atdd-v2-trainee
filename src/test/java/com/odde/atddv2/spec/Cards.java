package com.odde.atddv2.spec;

import com.github.leeonky.jfactory.Global;
import com.github.leeonky.jfactory.Spec;
import com.odde.atddv2.entity.*;

public class Cards {
    @Global
    public static class 银行卡 extends Spec<Card> {
        @Override
        public void main() {
            property("cardProduct").is(银行卡产品.class);
            property("name").value("AMEX");
        }
    }

    @Global
    public static class 银行卡产品 extends Spec<CardProduct> {
        @Override
        public void main() {
            property("bank").is(银行.class);
        }
    }

    @Global
    public static class 银行 extends Spec<Bank> {
    }

    @Global
    public static class 权益产品 extends Spec<BenefitProduct> {
        @Override
        public void main() {
            property("benefit").is(权益.class);
        }
    }

    @Global
    public static class 权益 extends Spec<Benefit> {

        @Override
        public void main() {
            property("merchant").is(商户.class);
        }
    }

    @Global
    public static class 商户 extends Spec<Merchant> {

        @Override
        public void main() {
            property("account").is(账户.class);
        }
    }

    @Global
    public static class 账户 extends Spec<Account> {
    }

    @Global
    public static class 用户权益 extends Spec<UserBenefitProduct> {

        @Override
        public void main() {
            property("user").is(Users.用户.class);
            property("benefitProduct").is(权益产品.class);
        }
    }
}
