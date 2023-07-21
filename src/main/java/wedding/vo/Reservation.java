package wedding.vo;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Reservation {

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "reservation_id")
	private Integer reservationId;
	@Column(name = "vendor_id")
	private String vendorId;
	@Column(name = "member_id")
	private String memberId;
	@Column(name = "contact_name")
	private String contactName;
	@Column(name = "contact_number")
	private String contactNumber;
	@Column(name = "event_date")
	private Timestamp eventDate;
	@Column(name = "reservation_date")
	private Timestamp reservationDate;
	@Column(name = "reservation_notes")
	private String reservationNotes;
	private String funcName;
}

