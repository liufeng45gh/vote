package com.lucifer.mapper.oauth2;


import com.lucifer.model.user.AccessToken;
import com.lucifer.model.user.User;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

/**
 * Created by Administrator on 2017/12/23.
 */
@MapperScan
public interface UserMapper {

    User getUserByAccount(String account);

    User getUserByPhone(final String phone);

    Integer insertUser(User user);

    /**
     * 修改密码
     * @param user
     * @return
     */
    Integer updatePassword(User user);

    /**
     * 绑定手机
     * @param user
     * @return
     */
    Integer userBindPhone(User user);

    User getUserById(Long id);

    Integer updateUserInfo(User user);

    Integer userCountByNickName(String nickName);

    Integer updateUserNick(User user);

    Integer allUserCount();

    Integer insertUserLoginToken(AccessToken accessToken);

    Integer removeToken(String token);

    AccessToken getAccessTokenByCode(String code);

    Integer setCodeInvalid(String code);

    AccessToken getAccessTokenByToken(String accessToken);

    Long getUserIdByToken(String token);

    List<User> userCmsSearch(String sql);

    Integer userCmsSearchCount(String sql);

    void setUserBlock(User user);


}
