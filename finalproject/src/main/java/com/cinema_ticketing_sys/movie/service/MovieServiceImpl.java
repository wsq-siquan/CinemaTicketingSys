package com.cinema_ticketing_sys.movie.service;

import com.cinema_ticketing_sys.movie.dao.MovieDAO;
import com.cinema_ticketing_sys.movie.entity.Movie;
import com.cinema_ticketing_sys.support.interfaces.CreationCallback;
import com.cinema_ticketing_sys.support.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * Created by KC on 2017/5/17.
 */
@Service
@Transactional
public class MovieServiceImpl implements MovieService {

    @Autowired
    private MovieDAO movieDAO;

    @Override
    public Movie findMovieById(int movieId) { return movieDAO.findMovieById(movieId); }

    @Override
    public Movie findMovieByName(String Name) {
        return movieDAO.findMovieByName(Name);
    }

    @Override
    public boolean checkMoiveInfo(String movieName, String description, double price,  CreationCallback<Movie> callback) {
        if(StringUtils.isNullOrEmpty(movieName) || StringUtils.isNullOrEmpty(description) || price < 0) {
            callback.createFail("电影信息不完整或不合法");
            return false;
        } else if(movieDAO.findMovieByName(movieName) != null) {
            callback.createFail("该电影信息已存在");
            return false;
        }
        return true;
    }
}