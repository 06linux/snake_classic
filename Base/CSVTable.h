/*
 *  CSVTable.h
 *  CCGame
 *
 *  Created by linux_wuliqiang@163.com on 2012-08-10.
 *  Copyright 2012 Beijing. All rights reserved.
 *
 *	CSV 文件格式解析模块封装
 */


#ifndef __CsvTable_H__
#define __CsvTable_H__

// npc 表
typedef enum
{
    TB_Npc_ID,
    TB_Npc_Name,          // 名称
    TB_Npc_Type,          // icon 图片
    TB_Npc_CsbName,       // csb文件名字 （动画显示用）
    TB_Npc_AnName,        // 默认播放的动画
    TB_Npc_Desc,          // 描述信息
    
    TB_Npc_End
    
}TB_Npc;


// 关卡表
typedef enum
{
    TB_MapLevel_Id = 0,                 // 从 0 开始
    TB_MapLevel_Name,
    TB_MapLevel_GameTime,               // 游戏时间（秒）
    TB_MapLevel_MapName,                // 地图文件
    TB_MapLevel_Desc,                   // 描述
    
    
    TB_MapLevel_End
    
}TB_MapLevel;

















#endif //__CsvTable_H__