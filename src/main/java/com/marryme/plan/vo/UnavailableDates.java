package com.marryme.plan.vo;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

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
@Table(name = "Unavailable_Dates", catalog = "marryme")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UnavailableDates implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "unavailable_dates_id")
    private Integer unavailableDatesId;
    /** 方案場地ID */
    @Column(name = "place_id")
    private Integer placeId;
    /** 不可預定日期 */
    @Column(name = "unavailable_date")
    private String unavailableDate;
    /**
     * 不可預定時間，0中午、1晚上
     *  */
    @Column(name = "unavailable_time")
    private Integer unavailableTime;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UnavailableDates that = (UnavailableDates) o;
        return Objects.equals(placeId, that.placeId) && Objects.equals(unavailableDate, that.unavailableDate) && Objects.equals(unavailableTime, that.unavailableTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(placeId, unavailableDate, unavailableTime);
    }
}
