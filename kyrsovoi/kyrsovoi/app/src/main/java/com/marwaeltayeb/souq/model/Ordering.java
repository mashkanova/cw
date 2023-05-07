package com.marwaeltayeb.souq.model;

import com.google.gson.annotations.SerializedName;

public class Ordering {


    @SerializedName("expiration_date")
    private String fullDate;
    @SerializedName("userId")
    private int userId;
    @SerializedName("productId")
    private int productId;

    public Ordering(String nameOnCard, int userId, int productId) {

        this.fullDate = fullDate;
        this.userId = userId;
        this.productId = productId;
    }
}



