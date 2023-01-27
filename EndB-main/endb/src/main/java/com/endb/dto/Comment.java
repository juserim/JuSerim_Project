package com.endb.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
public class Comment {
    private int board_no;
    private String id;
    private String content;
    private int room_id;

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public void setBoard_no(int board_no) {
        this.board_no = board_no;
    }


    public void setContent(String content) {
        this.content = content;
    }

    public int getBoard_no() {
        return board_no;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }
}
