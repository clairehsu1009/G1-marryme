package com.marryme.plan.vo;

import lombok.*;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

/**
 * ClassName: UnavaliableDate
 * Package: marryme.plan.vo
 * Description:
 *
 * @Author Claire
 * @Create 2023/7/12 下午 06:36
 * @Version 1.0
 */
@Entity
@Table(name = "UnavailableDates", catalog = "marryme")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UnavailableDate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "unavailable_dates_id")
    private Integer unavailableDatesId;
    /** 方案場地ID */
    @Column(name = "place_id")
    private Integer placeId;
    /** 不可預定日期 */
    @Column(name = "unavailable_date")
    private Date unavailableDate;
    /**
     * 不可預定時間，0中午、1晚上
     *  */
    @Column(name = "unavailable_time")
    private Integer unavailableTime;
}
