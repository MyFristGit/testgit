package com.udata.osp.dao.enumpack;

public enum ResearchProjectType {
	 MANAGE("主持", 1), PARTICIPATE("参与", 2);
    
    public String name ;
    public int index ;
     
    private ResearchProjectType( String name , int index ){
        this.name = name ;
        this.index = index ;
    }
     
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public int getIndex() {
        return index;
    }
    public void setIndex(int index) {
        this.index = index;
    }
    public static void main(String[] args) {
    	 
        //输出某一枚举的值
        System.out.println( ResearchProjectType.MANAGE.getName() );
        System.out.println( ResearchProjectType.PARTICIPATE.getIndex() );
 
        //遍历所有的枚举
        for( ResearchProjectType type : ResearchProjectType.values()){
            System.out.println( type + "  name: " + type.getName() + "  index: " + type.getIndex() );
        }
        
        System.out.println( isManage( ResearchProjectType.MANAGE ) ) ;  //结果： false
        showType( ResearchProjectType.PARTICIPATE );
    
    }
    static boolean isManage( ResearchProjectType type ){
        if ( ResearchProjectType.MANAGE.equals( type )) {
            return true ;
        }
        return false ;
    }
    
    static void showType(ResearchProjectType type){
        switch ( type ) {
        case PARTICIPATE:
            System.out.println( type );
            break;
        case MANAGE :
            System.out.println( type );
            break;
        default:
            System.out.println( type );
            break;
        }
         
    }
    static  int  changeIndex(String s){
    	if(s.equals("主持"))
    		return 1;
    	if(s.equals("参与"))
    		return 2;
    	return 0;
    }

}
