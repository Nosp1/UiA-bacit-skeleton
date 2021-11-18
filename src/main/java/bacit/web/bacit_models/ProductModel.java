package bacit.web.bacit_models;

import bacit.web.bacit_web.DBUtils;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.LinkedList;

public class ProductModel {

    private int productID;
    private String productName;
    private String category;
    private String description;
    private String picture;
    private boolean beeingUsed;
    private int courseID;
    private int price;

    public ProductModel(int id, String name, String category, String description, String picture, boolean beeingUsed, int courseID, int price) {
        this.productID = id;
        this.productName = name;
        this.category = category;
        this.description = description;
        this.picture = picture;
        this.beeingUsed = beeingUsed;
        this.courseID = courseID;
        this.price = price;
    }

    public static ProductModel getToolModel(String productID, PrintWriter out) throws SQLException, ClassNotFoundException {
        Connection con = DBUtils.getINSTANCE().getConnection(out);
        String query ="select * from Tool where Produkt_ID = ?;";
        PreparedStatement statement= con.prepareStatement(query);
        statement.setString(1, productID);

        ResultSet rs = statement.executeQuery();
        ProductModel tool = null;

        if(!rs.next()) throw new IllegalArgumentException("No tool with this ID");
        tool = new ProductModel(
                rs.getInt("Produkt_ID"),
                rs.getString("toolName"),
                rs.getString("toolCategory"),
                rs.getString("maintenance"),
                rs.getInt("priceFirst"),
                rs.getInt("priceAfter"),
                rs.getInt("certificateID"),
                rs.getString("toolDescription"),
                rs.getString("picturePath"));
        con.close();
        return tool;
    }

    public int getProductID() { return productID; }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setMaintenance(boolean maintenance) {
        this.maintenance = maintenance;
    }

    public int getPriceFirst() {
        return priceFirst;
    }

    public void setPriceFirst(int priceFirst) {
        this.priceFirst = priceFirst;
    }

    public int getPriceAfter() {
        return priceAfter;
    }

    public void setPriceAfter(int priceAfter) {
        this.priceAfter = priceAfter;
    }

    public int getCertificateID() {
        return certificateID;
    }

    public void setCertificateID(int certificateID) {
        this.certificateID = certificateID;
    }

    public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description = description;
    }

    public String getPicturePath(){
        return picturePath;
    }

    public void setPicturePath(String picturePath){
        this.picturePath = picturePath;
    }

    public LinkedList<LocalDate> getUsedDates(PrintWriter out) throws SQLException {
        Connection db = DBUtils.getNoErrorConnection();
        String query = "SELECT startDate, endDate FROM Booking WHERE toolID = ?;";
        PreparedStatement statement = db.prepareStatement(query);
        statement.setInt(1, toolID);
        LinkedList<LocalDate> dayDates = new LinkedList<>();
        ResultSet rs = statement.executeQuery();
        while(rs.next()){
            LocalDate start = rs.getTimestamp("startDate").toLocalDateTime().toLocalDate();
            LocalDate end = rs.getTimestamp("endDate").toLocalDateTime().toLocalDate();
            addDatesToLinkedList(dayDates, start, end);
        }

        rs.close();
        statement.close();
        db.close();
        return dayDates;
    }

    private void addDatesToLinkedList(LinkedList<LocalDate> dates, LocalDate start, LocalDate end){
        while(start.isBefore(end)){
            start = start.plusDays(1);
            dates.add(start);
        }
    }
}

