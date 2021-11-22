package bacit.web.bacit_models;

public class RentProductModel {
    String productName;
    String category;
    String description;
    Boolean beeingUsed;

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {return category;}

    public void setCategory(String category) {this.category = category;}

    public String getDescription() {return description;}

    public void setDescription(String description) {this.description = description;}

    public Boolean getBeeingUsed() {return beeingUsed;}

    public void setBeeingUsed(Boolean beeingUsed) {this.beeingUsed = beeingUsed;}
}
