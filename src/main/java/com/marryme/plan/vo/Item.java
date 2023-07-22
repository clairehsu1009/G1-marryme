package com.marryme.plan.vo;

import lombok.*;

import javax.persistence.*;

/**
 * ClassName: Item
 * Package: marryme.plan.vo
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/11 下午 08:54
 * @Version 1.0
 */
@Entity
@Table(name = "plan_item", catalog = "marryme")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "plan_item_id")
    private Integer planItemId;
    /** 廠商ID */
    @Column(name = "vendor_id")
    private String vendorId;
    /**
     * 項目種類 0試菜,1菜價,2婚禮企劃團隊服務,3婚禮佈置,4婚禮主持人,5婚禮小物,6其他
     * */
    @Column(name = "item_type")
    private Integer itemType;
    /** 項目名稱 */
    @Column(name = "item_select")
    private String itemSelect;
    /** 項目說明 */
    @Column(name = "item_description")
    private String itemDescription;
    /** 訂金 */
    @Column(name = "item_deposit")
    private Integer itemDeposit;
    /** 金額 */
    @Column(name = "item_total")
    private Integer itemTotal;
    /**
     * 狀態 0下架 1上架 <br>
     * 預設1 上架 <br>
     * 改為0 下架，就不能再改上架，需要重新新增
     * */
    @Column(name = "status")
    private Integer status;
    /**
     * 可否編輯內容 <br>
     * 預設 0可修改 (若有已上架的方案商品，需提醒是否確認修改，仍可修改、方案帶出的資料會同步變更）<br>
     * 1不可修改 (已有已成立之訂單，不可更改加購項目內容，只能下架）
     * */
    @Column(name = "edit_status")
    private Integer editStatus;

    /** 取得項目種類的名稱 */
    public String getItemTypeName(){
        switch (this.itemType) {
            case 0:
                return "試菜";
            case 1:
                return "菜價";
            case 2:
                return "婚禮企劃團隊服務";
            case 3:
                return "婚禮佈置";
            case 4:
                return "婚禮主持人";
            case 5:
                return "婚禮小物";
            case 6:
                return "其他";
            default:
                return "";
        }
    }
}
