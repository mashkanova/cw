package com.marwaeltayeb.souq.model;

import com.google.gson.annotations.SerializedName;

public class Shipping {


    @SerializedName("phone")
    private String phone;
    @SerializedName("userId")
    private int userId;
    @SerializedName("productId")
    private int productId;

    public Shipping( String phone, int userId, int productId) {

        this.phone = phone;
        this.userId = userId;
        this.productId = productId;
    }
}
