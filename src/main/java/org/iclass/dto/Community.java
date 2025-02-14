package org.iclass.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Community {
	//필드,객체의 프로퍼티
	private long idx;
	private String writer;
	private String title;
	private String content;
	private int readCount;
	private Date createdAt;  // java.sql.Timestamp 타입도 가능하다.
	private String ip;
	private String commentCount;

}
