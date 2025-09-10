enum DemoAppConfig {
  staging(
    apiKey: 'pd67s34fzpgw',
    tokenForUser: _stagingTokenForUser,
  ),
  localhost(
    apiKey: '892s22ypvt6m',
    tokenForUser: _localhostTokenForUser,
  ),
  production(
    apiKey: 'mka5cua4vrjt',
    tokenForUser: _productionTokenForUser,
  );

  const DemoAppConfig({
    required this.apiKey,
    required this.tokenForUser,
  });

  final String apiKey;
  final String Function(String) tokenForUser;

  static const current = production;

  static String _stagingTokenForUser(String userId) {
    switch (userId) {
      case 'sahil':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic2FoaWwifQ.JflZ12wPiluwji_BlVhQRN4_Z72zXs0plopWmKl49DE';
      case 'rene':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoicmVuZSJ9.NGuadPFKoAW_EAfZu_9chah3hxc2sgBuzaw2Ej6WKkY';
      case 'maciej':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWFjaWVqIn0.cmHSUCT0JD3s439uLRsJOmwbBNM1N5miIgE1zfHo59Y';
      case 'martin':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWFydGluIn0.ZDox0RWqhKhhK2lrbUVJvf8Zd9PVA_NX5dGMVC6mcSg';
      case 'tommaso':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidG9tbWFzbyJ9.DNR3Gnkj1nrwIbLkfgWLzf9Rgx23Hj4qt5jItHKH8hU';
      case 'thierry':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidGhpZXJyeSJ9.XJEWIVxe_-2E9XEFQo01nW7UgYijx5LzyAkbY34o0Pw';
      case 'marcelo':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWFyY2VsbyJ9.ee6WC94jyfQbafJr9FLEc_ZgKDjYNxvz6e_z-phP8UY';
      case 'kanat':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoia2FuYXQifQ.ma7L8U6an92ECUHaD6mxesZvKX4TjfZndJ8uKGR2ic4';
      case 'toomas':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidG9vbWFzIn0.PBdUgu0w73UBa29ckt5AMMfmCK0VsOf0f0_aCgum3lc';
      default:
        return '';
    }
  }

  static String _localhostTokenForUser(String userId) {
    switch (userId) {
      case 'sahil':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic2FoaWwifQ.xE7RTWiwafZhLuY3XeOLgvz1D4hPV3pvsgKP7vI1fak';
      case 'rene':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoicmVuZSJ9.mUH3XG8wOYnnyHAaykIZT6B7ShH9kAJ8uHwZZw_TwAw';
      case 'maciej':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWFjaWVqIn0.FK85ui3RWAmap_Mm1i8-qnQUnfQ5AQmnY303zkzT7O4';
      case 'martin':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWFydGluIn0.-8mL49OqMdlvzXR_1IgYboVXXuXFc04r0EvYgko-X8I';
      case 'tommaso':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidG9tbWFzbyJ9.XYEEVyW_j_K9Nzh4yaRmlV8Dd2APrGi_KieLcmNhQgs';
      case 'thierry':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidGhpZXJyeSJ9.RKhJvQYxpu0jk-6ijt4Pkp4wDexLhTUdBDB56qodQ6Q';
      case 'marcelo':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWFyY2VsbyJ9.lM_lJBxac1KHaEaDWYLP7Sr4r1u3xsry3CclTeihrYE';
      case 'kanat':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoia2FuYXQifQ.P7rVVPHX4d21HpP6nvEQXiTKlJdFh7_YYZUP3rZB_oA';
      case 'toomas':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidG9vbWFzIn0.c0YPLh9Q8l_mvgaTVEh9_w_qJW3m_C_dXL2DonlH6n0';
      default:
        return '';
    }
  }

  static String _productionTokenForUser(String userId) {
    switch (userId) {
      case 'sahil':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic2FoaWwifQ.UtwB0-iOGeLvibIRyAhRJ3gQU3_H7DzymqVuNU9Ihik';
      case 'rene':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoicmVuZSJ9.x_Oj7FSgu-S46lxBbqrN4vBw-K3UV6b2sh7_Rw2eDVc';
      case 'maciej':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWFjaWVqIn0.pLzlhE10_BaiEB_Mc-Bky-Sa74rGIcjppQ2TUOhrvik';
      case 'martin':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWFydGluIn0.NPmmE-noa4FXDasTCY4GE0Sh6OiyR8rkci5gzlZZMzA';
      case 'tommaso':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidG9tbWFzbyJ9.1vLULalxFvM2BDVtHXzz9xkBz8uMI4pxxb79XOMi7fE';
      case 'thierry':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidGhpZXJyeSJ9.WT_Ov6cl6qS_JniW9iexZOQmfG4R3PDG9aHUMTAIwOY';
      case 'marcelo':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibWFyY2VsbyJ9.lyOWBAamtPNPbroA46XeA2F9pOAMauGxCZ0UxI1UbBk';
      case 'kanat':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoia2FuYXQifQ.AB7zclWiWKui6sMy7us2Scnw96ket2mizlIVtwKfx8M';
      case 'toomas':
        return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoidG9vbWFzIn0.FIU8F4420qK8tqRQ9XnFoN-Zg8_JNr-SyWpxY12-A-U';
      default:
        return '';
    }
  }
}
