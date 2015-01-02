package com.chenxin.authority.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 主页面
 *
 * @author Maty Chen
 * @date 2011-11-2 下午2:03:20
 */
@Controller
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    /**
     * 主页
     */
    @RequestMapping("/")
    public String home() {
        logger.debug("you are here");
        // 转到登录页面
        return "login";
    }

    /**
     * 主页面
     */
    @RequestMapping("/main")
    public String main() {
        logger.debug("you are here=====");
        return "main";
    }

    /**
     * 头部
     */
    @RequestMapping("/header")
    public String header() {
        return "header";
    }

    /**
     * 欢迎界面
     */
    @RequestMapping("/welcome")
    public String welcome() {
        return "welcome";
    }
}
