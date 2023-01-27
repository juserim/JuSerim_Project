package com.endb.controller;


import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.endb.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.endb.common.Util;
import com.endb.service.BoardService;
import com.endb.ui.ThePager;
import com.endb.view.DownloadView;

@Controller
@RequestMapping(path = {"/board"})
public class BoardController {

    @Autowired
    @Qualifier("boardService")
    private BoardService boardService;


    @GetMapping(path = {"/list"})
    public String list(@RequestParam(defaultValue = "1") int pageNo, Model model) {
        int pageSize = 3; // 한 페이지에 표시할 데이터 개수
        int pagerSize = 3; // 표시되는 페이지 번호 개수 ( 보이지 않은 페이지 번호는 다음, 이전 등으로 표시 )
        int count = 0; // 전체 데이터 개수

        // List<Board> boardList = boardService.findAll();
        List<Room> boardList = boardService.findByPage(pageNo, pageSize);
        count = boardService.findBoardCount(); // 데이터베이스에 전체 개시물 개수 조회

        ThePager pager = new ThePager(count, pageNo, pageSize, pagerSize, "list");

        // Model 타입의 전달인자에 데이터를 저장하면 View(JSP)로 데이터가 전달됩니다. ( request에 저장 )
        model.addAttribute("boardList", boardList);
        model.addAttribute("pager", pager);
        model.addAttribute("pageNo", pageNo);

        return "board/list";  // --> /WEB-INF/views/ + board/list + .jsp
    }

    @GetMapping(path = {"/write"})
    public String showWriteForm() {

        return "board/write"; // --> /WEB-INF/views/ + board/write + .jsp
    }

    @PostMapping("comment-write")
    @ResponseBody
    public String commentWrite(BoardComment comment, HttpSession session) {
        User loginuser = (User) session.getAttribute("loginuser");
        loginuser.getUserNo();
        comment.setWriter(loginuser.getUserNo());
        System.out.println("comment = " + comment);
        try {
            boardService.writeBoardComment(comment);
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
        return "success";
    }


    @PostMapping("comment-edit")
    @ResponseBody
    public String commentEdit(BoardComment comment, HttpSession session) {
        User loginuser = (User) session.getAttribute("loginuser");
        loginuser.getUserNo();
        comment.setWriter(loginuser.getUserNo());
        System.out.println("comment = " + comment);
        try {
            boardService.updateBoardComment(comment);
        } catch (Exception e) {
            e.printStackTrace();
            return "fail";
        }
        return "success";
    }



    @PostMapping(path = {"/write"})
    public String write(Room room, MultipartFile attach, HttpServletRequest req) {

        // getRealPath : 웹경로 -> 컴퓨터 경로
        //               http:// ..... /a/b/c ---> C:\......\a\b\c
        String uploadDir = req.getServletContext().getRealPath("/resources/upload-files/");
        Path uploadPath = Paths.get(uploadDir);
        ArrayList<BoardAttach> files = new ArrayList<>();
        String userFileName = attach.getOriginalFilename();
        
        if (userFileName != null && userFileName.length() > 0) {
            BoardAttach f = new BoardAttach();
            String savedFileName = Util.makeUniqueFileName(userFileName);
            f.setUserFileName(userFileName);
            f.setSavedFileName(savedFileName);
            try {
                File path = null;
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }
                    path = new File(uploadDir + savedFileName);
                attach.transferTo(path); // 파일 저장
                files.add(f);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }


        room.setFiles(files);
        boardService.writeBoard(room);

        // return "redirect:/board/list";
        return "redirect:/home"; //
    }

    @GetMapping(path = {"/detail"})
    public String detail(@RequestParam(name = "boardno", defaultValue = "-1") int boardNo, @RequestParam(name = "pageNo", defaultValue = "-1") int pageNo, Model model) {

        if (boardNo == -1 || pageNo == -1) {
            return "redirect:/endb/home";	
        }

        Room board = boardService.findByBoardNo(boardNo);
        if (board == null) { // 해당 번호의 게시글이 없는 경우
            return "redirect:/endb/home";
        }
        List<Comment> commentsByBoardNo = boardService.findCommentsByBoardNo(boardNo);
        model.addAttribute("board", board);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("comment", commentsByBoardNo);

        return "board/detail";
    }

    // download?attachno=1
    @GetMapping(path = {"/download"})
    public View download(@RequestParam(name = "attachno", defaultValue = "-1") int attachNo, Model model) {

        if (attachNo < 1) {
            // return "redirect:list";
            return new RedirectView("list");
        }

        BoardAttach boardAttach = boardService.findBoardAttachByAttachNo(attachNo);

        model.addAttribute("uploadDir", "/resources/upload-files/");
        model.addAttribute("boardAttach", boardAttach);

        DownloadView downloadView = new DownloadView();
        return downloadView;
    }

    // download2/1
    @GetMapping(path = {"/download2/{attachNo}"})
    public View download2(@PathVariable int attachNo, Model model) {

        if (attachNo < 1) {
            // return "redirect:list";
            return new RedirectView("list");
        }

        BoardAttach boardAttach = boardService.findBoardAttachByAttachNo(attachNo);

        model.addAttribute("uploadDir", "/resources/upload-files/");
        model.addAttribute("boardAttach", boardAttach);

        DownloadView downloadView = new DownloadView();
        return downloadView;
    }

    @GetMapping(path = {"/delete"})
        public String delete(@RequestParam(name = "boardno", defaultValue = "-1") int boardNo, @RequestParam(defaultValue = "-1") int pageNo) {

        if (boardNo >= 0 && pageNo >= 0) {
            boardService.delete(boardNo);
        }

        return "redirect:/home";
    }
    @GetMapping(path = {"/deleteComment"})
    public String deleteComment(@RequestParam(name = "commentNo", defaultValue = "-1") int commentNo,@RequestParam(name = "boardNo", defaultValue = "-1")int boardNo) {

        if (commentNo >= 1 && boardNo >= 0 ) {
            boardService.deleteComment(commentNo);
        }

        return "redirect:/board/detail?&pageNo=1&boardno="+boardNo;
    }

    @GetMapping(path = {"/edit"})
    public String showEditForm(@RequestParam(name = "boardno", defaultValue = "-1") int boardNo, @RequestParam(defaultValue = "-1") int pageNo, Model model) {
        System.out.println("boardNo = " + boardNo);
        if (boardNo < 1 && pageNo < 1) {
            return "redirect:/home";
        }

        Room room = boardService.findByBoardNo(boardNo);
        if (room == null) { // 해당 번호의 게시글이 없는 경우
            return "redirect:/home";
        }

        model.addAttribute("room", room);
        model.addAttribute("pageNo", pageNo);

        return "board/edit";
    }

    @PostMapping(path = {"/edit"})
    public String edit(Room room) {

        boardService.update(room);
        return  "redirect:/board/detail?&pageNo=1&boardno="+room.getRoom_id();
    }

}
