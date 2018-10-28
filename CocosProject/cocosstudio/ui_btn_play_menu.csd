<GameProjectFile>
  <PropertyGroup Type="Node" Name="ui_btn_play_menu" ID="f54a2106-ac8c-4278-8c55-28bea29cedd4" Version="2.2.1.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="3" Speed="1.0000" ActivedAnimationName="an0">
        <Timeline ActionTag="-770117144" Property="Position">
          <PointFrame FrameIndex="0" X="0.0000" Y="0.0000" />
          <PointFrame FrameIndex="1" X="0.0000" Y="0.0000" />
          <PointFrame FrameIndex="3" X="0.0000" Y="0.0000" />
        </Timeline>
        <Timeline ActionTag="-770117144" Property="Scale">
          <ScaleFrame FrameIndex="0" X="1.0000" Y="1.0000" />
          <ScaleFrame FrameIndex="1" X="1.0000" Y="1.0000" />
          <ScaleFrame FrameIndex="3" X="1.0000" Y="1.0000" />
        </Timeline>
        <Timeline ActionTag="-770117144" Property="RotationSkew">
          <ScaleFrame FrameIndex="0" X="0.0000" Y="0.0000" />
          <ScaleFrame FrameIndex="1" X="0.0000" Y="0.0000" />
          <ScaleFrame FrameIndex="3" X="0.0000" Y="0.0000" />
        </Timeline>
        <Timeline ActionTag="-770117144" Property="VisibleForFrame">
          <BoolFrame FrameIndex="1" Tween="False" Value="True" />
          <BoolFrame FrameIndex="3" Tween="False" Value="False" />
        </Timeline>
        <Timeline ActionTag="1331233301" Property="Position">
          <PointFrame FrameIndex="0" X="0.0000" Y="0.0000" />
          <PointFrame FrameIndex="1" X="0.0000" Y="0.0000" />
          <PointFrame FrameIndex="3" X="0.0000" Y="0.0000" />
        </Timeline>
        <Timeline ActionTag="1331233301" Property="Scale">
          <ScaleFrame FrameIndex="0" X="1.0000" Y="1.0000" />
          <ScaleFrame FrameIndex="1" X="1.0000" Y="1.0000" />
          <ScaleFrame FrameIndex="3" X="1.0000" Y="1.0000" />
        </Timeline>
        <Timeline ActionTag="1331233301" Property="RotationSkew">
          <ScaleFrame FrameIndex="0" X="0.0000" Y="0.0000" />
          <ScaleFrame FrameIndex="1" X="0.0000" Y="0.0000" />
          <ScaleFrame FrameIndex="3" X="0.0000" Y="0.0000" />
        </Timeline>
        <Timeline ActionTag="1331233301" Property="VisibleForFrame">
          <BoolFrame FrameIndex="0" Tween="False" Value="False" />
          <BoolFrame FrameIndex="1" Tween="False" Value="False" />
          <BoolFrame FrameIndex="3" Tween="False" Value="True" />
        </Timeline>
        <Timeline ActionTag="1961571838" Property="Position">
          <PointFrame FrameIndex="0" X="0.0000" Y="0.0000" />
        </Timeline>
        <Timeline ActionTag="523452984" Property="Position">
          <PointFrame FrameIndex="0" X="0.0000" Y="0.0000" />
        </Timeline>
        <Timeline ActionTag="523452984" Property="AnchorPoint">
          <ScaleFrame FrameIndex="0" X="0.5000" Y="0.5000" />
        </Timeline>
        <Timeline ActionTag="523452984" Property="VisibleForFrame">
          <BoolFrame FrameIndex="0" Tween="False" Value="False" />
        </Timeline>
      </Animation>
      <AnimationList>
        <AnimationInfo Name="an0" StartIndex="1" EndIndex="2">
          <RenderColor A="255" R="0" G="206" B="209" />
        </AnimationInfo>
        <AnimationInfo Name="an1" StartIndex="3" EndIndex="4">
          <RenderColor A="255" R="255" G="255" B="0" />
        </AnimationInfo>
      </AnimationList>
      <ObjectData Name="Node" FrameEvent="" Tag="372" ctype="SingleNodeObjectData">
        <Position X="0.0000" Y="0.0000" />
        <Scale ScaleX="1.0000" ScaleY="1.0000" />
        <AnchorPoint />
        <CColor A="255" R="255" G="255" B="255" />
        <Size X="0.0000" Y="0.0000" />
        <PrePosition X="0.0000" Y="0.0000" />
        <PreSize X="0.0000" Y="0.0000" />
        <Children>
          <NodeObjectData Name="ui_play_menu_bg_3_1" ActionTag="-770117144" FrameEvent="" Tag="373" LeftMargin="-85.0000" RightMargin="-85.0000" TopMargin="-30.5000" BottomMargin="-30.5000" ctype="SpriteObjectData">
            <Position X="0.0000" Y="0.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <CColor A="255" R="255" G="255" B="255" />
            <Size X="170.0000" Y="61.0000" />
            <PrePosition X="0.0000" Y="0.0000" />
            <PreSize X="0.0000" Y="0.0000" />
            <FileData Type="Normal" Path="ui_play_menu_bg_3.png" />
          </NodeObjectData>
          <NodeObjectData Name="ui_play_menu_bg_4_2" ActionTag="1331233301" VisibleForFrame="False" FrameEvent="" Tag="374" LeftMargin="-85.0000" RightMargin="-85.0000" TopMargin="-30.5000" BottomMargin="-30.5000" ctype="SpriteObjectData">
            <Position X="0.0000" Y="0.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <CColor A="255" R="255" G="255" B="255" />
            <Size X="170.0000" Y="61.0000" />
            <PrePosition X="0.0000" Y="0.0000" />
            <PreSize X="0.0000" Y="0.0000" />
            <FileData Type="Normal" Path="ui_play_menu_bg_4.png" />
          </NodeObjectData>
          <NodeObjectData Name="TextField_1" ActionTag="1961571838" FrameEvent="" Tag="375" LeftMargin="-37.0000" RightMargin="-37.0000" TopMargin="-15.0000" BottomMargin="-15.0000" FontSize="36" IsCustomSize="True" LabelText="菜单" PlaceHolderText="Text Field" MaxLengthText="10" ctype="TextFieldObjectData">
            <Position X="0.0000" Y="0.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <CColor A="255" R="255" G="255" B="255" />
            <Size X="74.0000" Y="30.0000" />
            <PrePosition X="0.0000" Y="0.0000" />
            <PreSize X="0.0000" Y="0.0000" />
          </NodeObjectData>
          <NodeObjectData Name="size" ActionTag="523452984" VisibleForFrame="False" FrameEvent="" Tag="376" LeftMargin="-83.0000" RightMargin="-83.0000" TopMargin="-30.0000" BottomMargin="-30.0000" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90.0000" ctype="PanelObjectData">
            <Position X="0.0000" Y="0.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <CColor A="255" R="255" G="255" B="255" />
            <Size X="166.0000" Y="60.0000" />
            <PrePosition X="0.0000" Y="0.0000" />
            <PreSize X="0.0000" Y="0.0000" />
            <SingleColor A="255" R="150" G="200" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1.0000" />
          </NodeObjectData>
        </Children>
      </ObjectData>
    </Content>
    <CameraPosition ValueX="0.0000" ValueY="5.0000" ValueZ="-1.0000" />
    <CameraRotation ValueX="0.0000" ValueY="0.0000" ValueZ="0.0000" />
  </Content>
</GameProjectFile>