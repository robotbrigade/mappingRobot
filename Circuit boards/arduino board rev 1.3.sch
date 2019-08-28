<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.4.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="yes" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="yes" active="yes"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="yes" active="yes"/>
<layer number="201" name="201bmp" color="2" fill="10" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="arduino board rev 1.3">
<description>Generated from &lt;b&gt;arduino board rev 1.3.sch&lt;/b&gt;&lt;p&gt;
by exp-lbrs.ulp</description>
<packages>
<package name="JACK_0805">
<wire x1="-0.25" y1="0.75" x2="0.25" y2="0.75" width="0.127" layer="21"/>
<wire x1="-0.25" y1="-0.75" x2="0.25" y2="-0.75" width="0.127" layer="21"/>
<smd name="P$2" x="-1" y="0" dx="1" dy="1.25" layer="1"/>
<smd name="P$3" x="1" y="0" dx="1" dy="1.25" layer="1"/>
</package>
<package name="JACK_1210">
<wire x1="-0.5" y1="1.5" x2="0.5" y2="1.5" width="0.127" layer="21"/>
<wire x1="-0.5" y1="-1.5" x2="0.5" y2="-1.5" width="0.127" layer="21"/>
<smd name="1" x="-1.5" y="0" dx="2.8" dy="1" layer="1" rot="R90"/>
<smd name="2" x="1.5" y="0" dx="2.8" dy="1" layer="1" rot="R90"/>
</package>
<package name="LED_SML1206">
<description>&lt;b&gt;SML10XXKH-TR (HIGH INTENSITY) LED&lt;/b&gt;&lt;p&gt;
&lt;table&gt;
&lt;tr&gt;&lt;td&gt;SML10R3KH-TR&lt;/td&gt;&lt;td&gt;ULTRA RED&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10E3KH-TR&lt;/td&gt;&lt;td&gt;SUPER REDSUPER BLUE&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10O3KH-TR&lt;/td&gt;&lt;td&gt;SUPER ORANGE&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10PY3KH-TR&lt;/td&gt;&lt;td&gt;PURE YELLOW&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10OY3KH-TR&lt;/td&gt;&lt;td&gt;ULTRA YELLOW&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10AG3KH-TR&lt;/td&gt;&lt;td&gt;AQUA GREEN&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10BG3KH-TR&lt;/td&gt;&lt;td&gt;BLUE GREEN&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10PB1KH-TR&lt;/td&gt;&lt;td&gt;SUPER BLUE&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10CW1KH-TR&lt;/td&gt;&lt;td&gt;WHITE&lt;/td&gt;&lt;/tr&gt;
&lt;/table&gt;

Source: http://www.ledtronics.com/ds/smd-1206/dstr0094.PDF</description>
<circle x="-0.725" y="0.525" radius="0.125" width="0" layer="21"/>
<wire x1="-1.5" y1="0.5" x2="-1.5" y2="-0.5" width="0.2032" layer="51" curve="-180"/>
<wire x1="1.5" y1="-0.5" x2="1.5" y2="0.5" width="0.2032" layer="51" curve="-180"/>
<wire x1="-1.55" y1="0.75" x2="1.55" y2="0.75" width="0.1016" layer="51"/>
<wire x1="1.55" y1="-0.75" x2="-1.55" y2="-0.75" width="0.1016" layer="51"/>
<rectangle x1="-1.6" y1="0.4" x2="-1.15" y2="0.8" layer="51"/>
<rectangle x1="-1.6" y1="-0.8" x2="-1.15" y2="-0.4" layer="51"/>
<rectangle x1="-1.175" y1="-0.6" x2="-1" y2="-0.275" layer="51"/>
<rectangle x1="1.15" y1="-0.8" x2="1.6" y2="-0.4" layer="51" rot="R180"/>
<rectangle x1="1.15" y1="0.4" x2="1.6" y2="0.8" layer="51" rot="R180"/>
<rectangle x1="1" y1="0.275" x2="1.175" y2="0.6" layer="51" rot="R180"/>
<rectangle x1="-0.1" y1="-0.1" x2="0.1" y2="0.1" layer="21"/>
<smd name="A" x="1.75" y="0" dx="1.5" dy="1.5" layer="1"/>
<smd name="C" x="-1.75" y="0" dx="1.5" dy="1.5" layer="1"/>
<text x="-1.5" y="1" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.5" y="-2.5" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="JACK_BEEPER_433-1033-ND">
<circle x="0" y="0" radius="4.5" width="0.127" layer="21"/>
<pad name="+" x="0" y="-2" drill="0.7"/>
<pad name="-" x="0" y="2" drill="0.7"/>
<text x="1" y="-2.5" size="1.27" layer="21">+</text>
</package>
<package name="JACK_DC2DC_555-1172-1-ND">
<wire x1="0" y1="0" x2="20" y2="0" width="0.127" layer="21"/>
<wire x1="20" y1="0" x2="20" y2="11.5" width="0.127" layer="21"/>
<wire x1="20" y1="11.5" x2="0" y2="11.5" width="0.127" layer="21"/>
<wire x1="0" y1="11.5" x2="0" y2="0" width="0.127" layer="21"/>
<smd name="GND" x="14" y="10.2" dx="2.44" dy="1.73" layer="1"/>
<smd name="ON/OFF" x="1.3" y="1.5" dx="2.44" dy="1.73" layer="1" rot="R90"/>
<smd name="TRIM" x="9.9" y="10.2" dx="2.44" dy="1.73" layer="1"/>
<smd name="VIN" x="18.8" y="1.3" dx="2.44" dy="1.73" layer="1"/>
<smd name="VOUT" x="5.9" y="10.2" dx="2.44" dy="1.73" layer="1"/>
<smd name="VS+" x="1.5" y="10.2" dx="2.44" dy="1.73" layer="1"/>
</package>
<package name="JACK_SOD-323/SC-76">
<wire x1="-0.5" y1="0.5" x2="0.3" y2="0.5" width="0.127" layer="21"/>
<wire x1="0.3" y1="0.5" x2="0.4" y2="0.5" width="0.127" layer="21"/>
<wire x1="0.4" y1="0.5" x2="0.5" y2="0.5" width="0.127" layer="21"/>
<wire x1="0.5" y1="-0.5" x2="0.4" y2="-0.5" width="0.127" layer="21"/>
<wire x1="0.4" y1="-0.5" x2="0.3" y2="-0.5" width="0.127" layer="21"/>
<wire x1="0.3" y1="-0.5" x2="-0.5" y2="-0.5" width="0.127" layer="21"/>
<wire x1="0.5" y1="-0.5" x2="0.5" y2="0.5" width="0.127" layer="21"/>
<wire x1="0.4" y1="0.5" x2="0.4" y2="-0.5" width="0.127" layer="21"/>
<wire x1="0.3" y1="-0.5" x2="0.3" y2="0.5" width="0.127" layer="21"/>
<smd name="A" x="-1.11" y="0" dx="0.63" dy="0.83" layer="1"/>
<smd name="C" x="1.11" y="0" dx="0.63" dy="0.83" layer="1"/>
</package>
<package name="JACK_INFINEON_TO-252-5-11">
<smd name="1" x="-2.28" y="-8.86" dx="2.2" dy="0.8" layer="1" rot="R90"/>
<smd name="2" x="-1.14" y="-8.86" dx="2.2" dy="0.8" layer="1" rot="R90"/>
<smd name="4" x="1.14" y="-8.86" dx="2.2" dy="0.8" layer="1" rot="R90"/>
<smd name="5" x="2.28" y="-8.86" dx="2.2" dy="0.8" layer="1" rot="R90"/>
<smd name="TAB" x="0" y="-3.2" dx="5.8" dy="6.4" layer="1"/>
</package>
<package name="JUMPER_JP1">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<wire x1="-1.016" y1="0" x2="-1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="0" x2="-1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.016" y1="0" x2="1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="1.016" y1="0" x2="1.27" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.254" x2="1.27" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-2.54" x2="1.27" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="1.27" y1="2.286" x2="1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.27" y1="2.286" x2="1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="1.016" y1="2.54" x2="-1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.286" x2="-1.016" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.286" x2="-1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.254" x2="-1.27" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-2.54" x2="-1.27" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-2.54" x2="1.016" y2="-2.54" width="0.1524" layer="21"/>
<rectangle x1="-0.3048" y1="0.9652" x2="0.3048" y2="1.5748" layer="51"/>
<rectangle x1="-0.3048" y1="-1.5748" x2="0.3048" y2="-0.9652" layer="51"/>
<pad name="1" x="0" y="-1.27" drill="0.9144" shape="long"/>
<pad name="2" x="0" y="1.27" drill="0.9144" shape="long"/>
<text x="-1.651" y="-2.54" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="2.921" y="-2.54" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
</package>
<package name="JACK_SOT23">
<wire x1="-1.5" y1="-0.5" x2="-1.5" y2="0.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="-0.5" x2="1.5" y2="0.5" width="0.127" layer="21"/>
<wire x1="1.5" y1="0.5" x2="1" y2="0.5" width="0.127" layer="21"/>
<wire x1="-1.5" y1="0.5" x2="-1" y2="0.5" width="0.127" layer="21"/>
<smd name="1" x="-0.95" y="-1" dx="0.8" dy="0.9" layer="1"/>
<smd name="2" x="0.95" y="-1" dx="0.8" dy="0.9" layer="1"/>
<smd name="3" x="0" y="1" dx="0.8" dy="0.9" layer="1"/>
</package>
<package name="JACK_THREE_.1&quot;_HOLES">
<pad name="1" x="-2.54" y="0" drill="1"/>
<pad name="2" x="0" y="0" drill="1"/>
<pad name="3" x="2.54" y="0" drill="1"/>
<text x="-3.81" y="-1.27" size="0.6096" layer="21">1</text>
</package>
<package name="JACK_JST_3_PIN_.1&quot;">
<wire x1="-5.08" y1="-1.778" x2="5.08" y2="-1.778" width="0.127" layer="21"/>
<wire x1="5.08" y1="3.175" x2="-5.08" y2="3.175" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-1.778" x2="-5.08" y2="-1.397" width="0.127" layer="21"/>
<wire x1="5.08" y1="-1.778" x2="5.08" y2="-1.397" width="0.127" layer="21"/>
<wire x1="5.08" y1="-1.016" x2="5.08" y2="3.175" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-1.016" x2="-5.08" y2="3.175" width="0.127" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="1"/>
<pad name="2" x="0" y="0" drill="1"/>
<pad name="3" x="2.54" y="0" drill="1"/>
<text x="-5.715" y="-0.381" size="0.6096" layer="21">1</text>
</package>
<package name="JACK_AMP-282837-2">
<wire x1="-5.08" y1="4.1" x2="5.08" y2="4.1" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-4.1" x2="5.08" y2="-4.1" width="0.127" layer="21"/>
<wire x1="-5.1" y1="4.1" x2="-5.1" y2="-4.1" width="0.127" layer="21"/>
<wire x1="5.1" y1="-4.1" x2="5.1" y2="4.1" width="0.127" layer="21"/>
<pad name="P$1" x="-2.54" y="0" drill="1.1"/>
<pad name="P$2" x="2.54" y="0" drill="1.1"/>
</package>
<package name="JACK_JST_6_PIN_.1&quot;">
<wire x1="-8.89" y1="-1.778" x2="8.89" y2="-1.778" width="0.127" layer="21"/>
<wire x1="8.89" y1="3.175" x2="-8.89" y2="3.175" width="0.127" layer="21"/>
<wire x1="-8.89" y1="-1.778" x2="-8.89" y2="-1.397" width="0.127" layer="21"/>
<wire x1="8.89" y1="-1.778" x2="8.89" y2="-1.397" width="0.127" layer="21"/>
<wire x1="8.89" y1="-1.016" x2="8.89" y2="3.175" width="0.127" layer="21"/>
<wire x1="-8.89" y1="-1.016" x2="-8.89" y2="3.175" width="0.127" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="1"/>
<pad name="2" x="-3.81" y="0" drill="1"/>
<pad name="3" x="-1.27" y="0" drill="1"/>
<pad name="4" x="1.27" y="0" drill="1"/>
<pad name="5" x="3.81" y="0" drill="1"/>
<pad name="6" x="6.35" y="0" drill="1"/>
<text x="-9.525" y="-0.381" size="0.6096" layer="21">1</text>
</package>
<package name="JACK_JST_4_PIN_.1&quot;">
<wire x1="-6.35" y1="-1.778" x2="6.35" y2="-1.778" width="0.127" layer="21"/>
<wire x1="6.35" y1="3.175" x2="-6.35" y2="3.175" width="0.127" layer="21"/>
<wire x1="-6.35" y1="-1.778" x2="-6.35" y2="-1.397" width="0.127" layer="21"/>
<wire x1="6.35" y1="-1.778" x2="6.35" y2="-1.397" width="0.127" layer="21"/>
<wire x1="6.35" y1="-1.016" x2="6.35" y2="3.175" width="0.127" layer="21"/>
<wire x1="-6.35" y1="-1.016" x2="-6.35" y2="3.175" width="0.127" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="1"/>
<pad name="2" x="-1.27" y="0" drill="1"/>
<pad name="3" x="1.27" y="0" drill="1"/>
<pad name="4" x="3.81" y="0" drill="1"/>
<text x="-6.985" y="-0.381" size="0.6096" layer="21">1</text>
</package>
<package name="JACK_FUSE_HOLDER_F064-ND">
<wire x1="-8.636" y1="1.27" x2="8.636" y2="1.27" width="0.127" layer="21"/>
<wire x1="-8.636" y1="1.27" x2="-8.636" y2="-11.43" width="0.127" layer="21"/>
<wire x1="8.636" y1="-11.43" x2="8.636" y2="1.27" width="0.127" layer="21"/>
<wire x1="-8.636" y1="-11.43" x2="8.636" y2="-11.43" width="0.127" layer="21"/>
<wire x1="6.096" y1="-11.43" x2="6.096" y2="-17.272" width="0.127" layer="49"/>
<wire x1="6.096" y1="-17.272" x2="-6.096" y2="-17.272" width="0.127" layer="49"/>
<wire x1="-6.096" y1="-17.272" x2="-6.096" y2="-11.43" width="0.127" layer="49"/>
<pad name="NC" x="0" y="-7.62" drill="2.0828"/>
<pad name="P$1" x="-3.81" y="0" drill="1.27"/>
<pad name="P$2" x="3.81" y="0" drill="1.27"/>
<text x="-4.826" y="-16.256" size="1.27" layer="49">Fuse is here</text>
<text x="-5.08" y="-13.97" size="0.8128" layer="49">297 series mini fuse</text>
<text x="-5.08" y="-5.08" size="1.6764" layer="49">F064-ND</text>
</package>
<package name="JACK_ARDUINO_NANO">
<wire x1="-3.81" y1="0" x2="-1.016" y2="0" width="0.127" layer="21"/>
<wire x1="-3.81" y1="0" x2="-3.81" y2="-3.556" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-3.556" x2="-3.81" y2="-11.176" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-11.176" x2="-3.81" y2="-15.24" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-15.24" x2="-1.016" y2="-15.24" width="0.127" layer="21"/>
<wire x1="-5.588" y1="-3.556" x2="-5.588" y2="-11.176" width="0.127" layer="21"/>
<wire x1="-5.588" y1="-3.556" x2="-3.81" y2="-3.556" width="0.127" layer="21"/>
<wire x1="-5.588" y1="-11.176" x2="-3.81" y2="-11.176" width="0.127" layer="21"/>
<wire x1="36.576" y1="0" x2="39.37" y2="0" width="0.127" layer="21"/>
<wire x1="39.37" y1="0" x2="39.37" y2="-15.24" width="0.127" layer="21"/>
<wire x1="39.37" y1="-15.24" x2="36.576" y2="-15.24" width="0.127" layer="21"/>
<pad name="P$1" x="0" y="0" drill="1.016"/>
<pad name="P$2" x="2.54" y="0" drill="1.016"/>
<pad name="P$3" x="5.08" y="0" drill="1.016"/>
<pad name="P$4" x="7.62" y="0" drill="1.016"/>
<pad name="P$5" x="10.16" y="0" drill="1.016"/>
<pad name="P$6" x="12.7" y="0" drill="1.016"/>
<pad name="P$7" x="15.24" y="0" drill="1.016"/>
<pad name="P$8" x="17.78" y="0" drill="1.016"/>
<pad name="P$9" x="20.32" y="0" drill="1.016"/>
<pad name="P$10" x="22.86" y="0" drill="1.016"/>
<pad name="P$11" x="25.4" y="0" drill="1.016"/>
<pad name="P$12" x="27.94" y="0" drill="1.016"/>
<pad name="P$13" x="30.48" y="0" drill="1.016"/>
<pad name="P$14" x="33.02" y="0" drill="1.016"/>
<pad name="P$15" x="35.56" y="0" drill="1.016"/>
<pad name="P$16" x="35.56" y="-15.24" drill="1.016"/>
<pad name="P$17" x="33.02" y="-15.24" drill="1.016"/>
<pad name="P$18" x="30.48" y="-15.24" drill="1.016"/>
<pad name="P$19" x="27.94" y="-15.24" drill="1.016"/>
<pad name="P$20" x="25.4" y="-15.24" drill="1.016"/>
<pad name="P$21" x="22.86" y="-15.24" drill="1.016"/>
<pad name="P$22" x="20.32" y="-15.24" drill="1.016"/>
<pad name="P$23" x="17.78" y="-15.24" drill="1.016"/>
<pad name="P$24" x="15.24" y="-15.24" drill="1.016"/>
<pad name="P$25" x="12.7" y="-15.24" drill="1.016"/>
<pad name="P$26" x="10.16" y="-15.24" drill="1.016"/>
<pad name="P$27" x="7.62" y="-15.24" drill="1.016"/>
<pad name="P$28" x="5.08" y="-15.24" drill="1.016"/>
<pad name="P$29" x="2.54" y="-15.24" drill="1.016"/>
<pad name="P$30" x="0" y="-15.24" drill="1.016"/>
<text x="12.192" y="-8.636" size="1.27" layer="21">Arduino nano</text>
</package>
</packages>
<symbols>
<symbol name="JACK_CAPACITOR">
<wire x1="0" y1="2.54" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="-2.54" width="0.254" layer="94"/>
<pin name="1" x="-5.08" y="0" visible="off" length="middle"/>
<pin name="2" x="7.62" y="0" visible="off" length="middle" rot="R180"/>
</symbol>
<symbol name="LED_LED">
<wire x1="1.27" y1="0" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="-2.54" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-2.032" y1="-0.762" x2="-3.429" y2="-2.159" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="-3.302" y2="-3.302" width="0.1524" layer="94"/>
<pin name="A" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="C" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<text x="3.556" y="-4.572" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="5.715" y="-4.572" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<polygon width="0.1524" layer="94">
<vertex x="-3.429" y="-2.159"/>
<vertex x="-3.048" y="-1.27"/>
<vertex x="-2.54" y="-1.778"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.302" y="-3.302"/>
<vertex x="-2.921" y="-2.413"/>
<vertex x="-2.413" y="-2.921"/>
</polygon>
</symbol>
<symbol name="JACK_RESISTOR">
<wire x1="-7.62" y1="0" x2="-6.35" y2="1.27" width="0.254" layer="94"/>
<wire x1="-6.35" y1="1.27" x2="-5.08" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-1.27" x2="-3.81" y2="1.27" width="0.254" layer="94"/>
<wire x1="-3.81" y1="1.27" x2="-2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.27" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="2.54" y2="0" width="0.254" layer="94"/>
<pin name="P$2" x="-10.16" y="0" visible="off" length="short"/>
<pin name="P$3" x="5.08" y="0" visible="off" length="short" rot="R180"/>
</symbol>
<symbol name="JACK_SPEAKER">
<wire x1="0" y1="5.08" x2="0" y2="-5.08" width="0.254" layer="94"/>
<wire x1="0" y1="-5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="0" y1="5.08" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="5.08" x2="10.16" y2="10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="10.16" x2="10.16" y2="-10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<pin name="+" x="-5.08" y="2.54" visible="off" length="middle"/>
<pin name="-" x="-5.08" y="-2.54" visible="off" length="middle"/>
<text x="0.508" y="2.032" size="1.27" layer="94">+</text>
</symbol>
<symbol name="JACK_DC2DCCONVERTER_555-1172-1-ND">
<wire x1="0" y1="15.24" x2="15.24" y2="15.24" width="0.254" layer="94"/>
<wire x1="15.24" y1="15.24" x2="15.24" y2="-17.78" width="0.254" layer="94"/>
<wire x1="15.24" y1="-17.78" x2="0" y2="-17.78" width="0.254" layer="94"/>
<wire x1="0" y1="-17.78" x2="0" y2="15.24" width="0.254" layer="94"/>
<pin name="GND" x="7.62" y="-22.86" visible="pin" length="middle" rot="R90"/>
<pin name="ON/OFF" x="-5.08" y="-5.08" visible="pin" length="middle"/>
<pin name="TRIM" x="20.32" y="0" visible="pin" length="middle" rot="R180"/>
<pin name="VIN" x="-5.08" y="10.16" visible="pin" length="middle"/>
<pin name="VOUT" x="20.32" y="10.16" visible="pin" length="middle" rot="R180"/>
<pin name="VS+" x="20.32" y="5.08" visible="pin" length="middle" rot="R180"/>
</symbol>
<symbol name="SUPPLY1_GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="JACK_DIODE">
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="0" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<pin name="A" x="-2.54" y="0" visible="off" length="point"/>
<pin name="C" x="2.54" y="0" visible="off" length="point" rot="R180"/>
</symbol>
<symbol name="JACK_INFINEON_HIGH-SIDE_SWITCH">
<wire x1="-10.16" y1="10.16" x2="10.16" y2="10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="10.16" x2="10.16" y2="-10.16" width="0.254" layer="94"/>
<wire x1="10.16" y1="-10.16" x2="-10.16" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-10.16" x2="-10.16" y2="10.16" width="0.254" layer="94"/>
<pin name="GND" x="0" y="-15.24" visible="pin" length="middle" rot="R90"/>
<pin name="IN" x="-15.24" y="2.54" visible="pin" length="middle"/>
<pin name="OUT" x="15.24" y="0" visible="pin" length="middle" rot="R180"/>
<pin name="ST" x="-15.24" y="-2.54" visible="pin" length="middle"/>
<pin name="VBB" x="0" y="15.24" visible="pin" length="middle" rot="R270"/>
</symbol>
<symbol name="JUMPER_JP2E">
<wire x1="0" y1="0" x2="0" y2="1.27" width="0.1524" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="1.27" width="0.4064" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="1.27" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="1.27" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="0" x2="3.175" y2="0" width="0.4064" layer="94"/>
<wire x1="3.175" y1="0" x2="3.175" y2="0.635" width="0.4064" layer="94"/>
<wire x1="3.175" y1="0.635" x2="-0.635" y2="0.635" width="0.4064" layer="94"/>
<wire x1="-0.635" y1="0.635" x2="-0.635" y2="0" width="0.4064" layer="94"/>
<pin name="1" x="0" y="-2.54" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="2" x="2.54" y="-2.54" visible="pad" length="short" direction="pas" rot="R90"/>
<text x="-1.27" y="0" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="5.715" y="0" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
</symbol>
<symbol name="JACK_MOSFET_N_CHANNEL">
<circle x="0" y="0" radius="5.08" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="-1.905" y1="2.54" x2="-1.905" y2="1.905" width="0.254" layer="94"/>
<wire x1="-1.905" y1="1.905" x2="-1.905" y2="1.27" width="0.254" layer="94"/>
<wire x1="-1.905" y1="0.635" x2="-1.905" y2="0" width="0.254" layer="94"/>
<wire x1="-1.905" y1="0" x2="-1.905" y2="-0.635" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-1.27" x2="-1.905" y2="-1.905" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="-1.905" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-1.905" y1="1.905" x2="0" y2="1.905" width="0.254" layer="94"/>
<wire x1="0" y1="1.905" x2="0" y2="2.54" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="0" y2="-1.905" width="0.254" layer="94"/>
<wire x1="0" y1="-1.905" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-1.905" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-1.905" width="0.254" layer="94"/>
<wire x1="-1.905" y1="0" x2="-0.9525" y2="0.3175" width="0.254" layer="94"/>
<wire x1="-0.9525" y1="0.3175" x2="-0.9525" y2="-0.3175" width="0.254" layer="94"/>
<wire x1="-0.9525" y1="-0.3175" x2="-1.905" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="3.175" x2="1.905" y2="3.175" width="0.254" layer="94"/>
<wire x1="1.905" y1="3.175" x2="1.905" y2="0.635" width="0.254" layer="94"/>
<wire x1="1.905" y1="0.635" x2="1.905" y2="-3.175" width="0.254" layer="94"/>
<wire x1="1.905" y1="-3.175" x2="0" y2="-3.175" width="0.254" layer="94"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="0.635" width="0.254" layer="94"/>
<wire x1="1.905" y1="0.635" x2="2.54" y2="0.635" width="0.254" layer="94"/>
<wire x1="1.905" y1="0.635" x2="1.27" y2="-0.635" width="0.254" layer="94"/>
<wire x1="1.27" y1="-0.635" x2="2.54" y2="-0.635" width="0.254" layer="94"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="0.635" width="0.254" layer="94"/>
<pin name="D" x="0" y="7.62" visible="off" length="middle" rot="R270"/>
<pin name="G" x="-7.62" y="-2.54" visible="off" length="middle"/>
<pin name="S" x="0" y="-7.62" visible="off" length="middle" rot="R90"/>
</symbol>
<symbol name="SUPPLY1_+24V">
<wire x1="1.27" y1="-0.635" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-0.635" width="0.254" layer="94"/>
<wire x1="1.27" y1="-0.635" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="-1.27" y2="-0.635" width="0.254" layer="94"/>
<pin name="+24V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
</symbol>
<symbol name="JACK_CONNECTOR_3_PIN">
<pin name="1" x="-2.54" y="2.54" visible="off" length="short"/>
<pin name="2" x="-2.54" y="0" visible="off" length="short"/>
<pin name="3" x="-2.54" y="-2.54" visible="off" length="short"/>
</symbol>
<symbol name="SUPPLY2_+07V">
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="94"/>
<wire x1="0" y1="0.635" x2="0" y2="1.905" width="0.1524" layer="94"/>
<pin name="+7V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<text x="-1.905" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="SUPPLY2_+05V/1">
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="94"/>
<wire x1="0" y1="0.635" x2="0" y2="1.905" width="0.1524" layer="94"/>
<pin name="+5V/1" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<text x="-3.175" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="SUPPLY2_+21V">
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.905" x2="0" y2="0.635" width="0.1524" layer="94"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="94"/>
<pin name="+21V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<text x="-2.54" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="SUPPLY2_+05V/2">
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="94"/>
<wire x1="0" y1="0.635" x2="0" y2="1.905" width="0.1524" layer="94"/>
<pin name="+5V/2" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
<text x="-3.81" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="JACK_CONNECTOR_2_PIN">
<pin name="P$1" x="-2.54" y="2.54" visible="pad" length="middle"/>
<pin name="P$2" x="-2.54" y="-2.54" visible="pad" length="middle"/>
</symbol>
<symbol name="JACK_HEADER_6_PIN">
<pin name="1" x="-5.08" y="12.7" visible="pin" length="middle"/>
<pin name="2" x="-5.08" y="7.62" visible="pin" length="middle"/>
<pin name="3" x="-5.08" y="2.54" visible="pin" length="middle"/>
<pin name="4" x="-5.08" y="-2.54" visible="pin" length="middle"/>
<pin name="5" x="-5.08" y="-7.62" visible="pin" length="middle"/>
<pin name="6" x="-5.08" y="-12.7" visible="pin" length="middle"/>
</symbol>
<symbol name="JACK_HEADER_4_PIN">
<pin name="1" x="-5.08" y="3.81" visible="pin" length="middle"/>
<pin name="2" x="-5.08" y="1.27" visible="pin" length="middle"/>
<pin name="3" x="-5.08" y="-1.27" visible="pin" length="middle"/>
<pin name="4" x="-5.08" y="-3.81" visible="pin" length="middle"/>
</symbol>
<symbol name="JACK_FUSE">
<wire x1="-5.08" y1="0" x2="-2.54" y2="2.54" width="0.254" layer="94" curve="-90"/>
<wire x1="-2.54" y1="2.54" x2="0" y2="0" width="0.254" layer="94" curve="-90"/>
<wire x1="0" y1="0" x2="2.54" y2="-2.54" width="0.254" layer="94" curve="90"/>
<wire x1="2.54" y1="-2.54" x2="5.08" y2="0" width="0.254" layer="94" curve="90"/>
<pin name="P$1" x="-10.16" y="0" visible="off" length="middle"/>
<pin name="P$2" x="10.16" y="0" visible="off" length="middle" rot="R180"/>
</symbol>
<symbol name="JACK_ARDUINO_NANO">
<wire x1="10.16" y1="7.62" x2="10.16" y2="-91.44" width="0.254" layer="94"/>
<wire x1="10.16" y1="-91.44" x2="30.48" y2="-91.44" width="0.254" layer="94"/>
<wire x1="30.48" y1="-91.44" x2="30.48" y2="7.62" width="0.254" layer="94"/>
<wire x1="30.48" y1="7.62" x2="10.16" y2="7.62" width="0.254" layer="94"/>
<pin name="3V3" x="5.08" y="-83.82" visible="pin" length="middle"/>
<pin name="5V" x="5.08" y="-86.36" visible="pin" length="middle"/>
<pin name="A0" x="5.08" y="-30.48" visible="pin" length="middle"/>
<pin name="A1" x="5.08" y="-33.02" visible="pin" length="middle"/>
<pin name="A2" x="5.08" y="-35.56" visible="pin" length="middle"/>
<pin name="A3" x="5.08" y="-38.1" visible="pin" length="middle"/>
<pin name="A4" x="5.08" y="-40.64" visible="pin" length="middle"/>
<pin name="A5" x="5.08" y="-43.18" visible="pin" length="middle"/>
<pin name="A6" x="5.08" y="-45.72" visible="pin" length="middle"/>
<pin name="A7" x="5.08" y="-48.26" visible="pin" length="middle"/>
<pin name="D2" x="5.08" y="0" visible="pin" length="middle"/>
<pin name="D3" x="5.08" y="-2.54" visible="pin" length="middle"/>
<pin name="D4" x="5.08" y="-5.08" visible="pin" length="middle"/>
<pin name="D5" x="5.08" y="-7.62" visible="pin" length="middle"/>
<pin name="D6" x="5.08" y="-10.16" visible="pin" length="middle"/>
<pin name="D7" x="5.08" y="-12.7" visible="pin" length="middle"/>
<pin name="D8" x="5.08" y="-15.24" visible="pin" length="middle"/>
<pin name="D9" x="5.08" y="-17.78" visible="pin" length="middle"/>
<pin name="D10" x="5.08" y="-20.32" visible="pin" length="middle"/>
<pin name="D11" x="5.08" y="-22.86" visible="pin" length="middle"/>
<pin name="D12" x="5.08" y="-25.4" visible="pin" length="middle"/>
<pin name="D13" x="5.08" y="-27.94" visible="pin" length="middle"/>
<pin name="GND" x="5.08" y="-78.74" visible="pin" length="middle"/>
<pin name="GND2" x="5.08" y="-76.2" visible="pin" length="middle"/>
<pin name="REF" x="5.08" y="-55.88" visible="pin" length="middle"/>
<pin name="RST1" x="5.08" y="-58.42" visible="pin" length="middle"/>
<pin name="RST2" x="5.08" y="-60.96" visible="pin" length="middle"/>
<pin name="RXD" x="5.08" y="-66.04" visible="pin" length="middle"/>
<pin name="TXI" x="5.08" y="-63.5" visible="pin" length="middle"/>
<pin name="VIN" x="5.08" y="-81.28" visible="pin" length="middle"/>
<text x="22.86" y="-22.86" size="5.08" layer="94" rot="R270">Arduino Nano</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="JACK_CAPACITOR">
<gates>
<gate name="G$1" symbol="JACK_CAPACITOR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="JACK_1210">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805" package="JACK_0805">
<connects>
<connect gate="G$1" pin="1" pad="P$2"/>
<connect gate="G$1" pin="2" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LED_LED" prefix="LED" uservalue="yes">
<description>&lt;b&gt;LED&lt;/b&gt;&lt;p&gt;
&lt;u&gt;OSRAM&lt;/u&gt;:&lt;br&gt;

- &lt;u&gt;CHIPLED&lt;/u&gt;&lt;br&gt;
LG R971, LG N971, LY N971, LG Q971, LY Q971, LO R971, LY R971
LH N974, LH R974&lt;br&gt;
LS Q976, LO Q976, LY Q976&lt;br&gt;
LO Q996&lt;br&gt;

- &lt;u&gt;Hyper CHIPLED&lt;/u&gt;&lt;br&gt;
LW Q18S&lt;br&gt;
LB Q993, LB Q99A, LB R99A&lt;br&gt;

- &lt;u&gt;SideLED&lt;/u&gt;&lt;br&gt;
LS A670, LO A670, LY A670, LG A670, LP A670&lt;br&gt;
LB A673, LV A673, LT A673, LW A673&lt;br&gt;
LH A674&lt;br&gt;
LY A675&lt;br&gt;
LS A676, LA A676, LO A676, LY A676, LW A676&lt;br&gt;
LS A679, LY A679, LG A679&lt;br&gt;

-  &lt;u&gt;Hyper Micro SIDELED®&lt;/u&gt;&lt;br&gt;
LS Y876, LA Y876, LO Y876, LY Y876&lt;br&gt;
LT Y87S&lt;br&gt;

- &lt;u&gt;SmartLED&lt;/u&gt;&lt;br&gt;
LW L88C, LW L88S&lt;br&gt;
LB L89C, LB L89S, LG L890&lt;br&gt;
LS L89K, LO L89K, LY L89K&lt;br&gt;
LS L896, LA L896, LO L896, LY L896&lt;br&gt;

- &lt;u&gt;TOPLED&lt;/u&gt;&lt;br&gt;
LS T670, LO T670, LY T670, LG T670, LP T670&lt;br&gt;
LSG T670, LSP T670, LSY T670, LOP T670, LYG T670&lt;br&gt;
LG T671, LOG T671, LSG T671&lt;br&gt;
LB T673, LV T673, LT T673, LW T673&lt;br&gt;
LH T674&lt;br&gt;
LS T676, LA T676, LO T676, LY T676, LB T676, LH T676, LSB T676, LW T676&lt;br&gt;
LB T67C, LV T67C, LT T67C, LS T67K, LO T67K, LY T67K, LW E67C&lt;br&gt;
LS E67B, LA E67B, LO E67B, LY E67B, LB E67C, LV E67C, LT E67C&lt;br&gt;
LW T67C&lt;br&gt;
LS T679, LY T679, LG T679&lt;br&gt;
LS T770, LO T770, LY T770, LG T770, LP T770&lt;br&gt;
LB T773, LV T773, LT T773, LW T773&lt;br&gt;
LH T774&lt;br&gt;
LS E675, LA E675, LY E675, LS T675&lt;br&gt;
LS T776, LA T776, LO T776, LY T776, LB T776&lt;br&gt;
LHGB T686&lt;br&gt;
LT T68C, LB T68C&lt;br&gt;

- &lt;u&gt;Hyper Mini TOPLED®&lt;/u&gt;&lt;br&gt;
LB M676&lt;br&gt;

- &lt;u&gt;Mini TOPLED Santana®&lt;/u&gt;&lt;br&gt;
LG M470&lt;br&gt;
LS M47K, LO M47K, LY M47K
&lt;p&gt;
Source: http://www.osram.convergy.de&lt;p&gt;

&lt;u&gt;LUXEON:&lt;/u&gt;&lt;br&gt;
- &lt;u&gt;LUMILED®&lt;/u&gt;&lt;br&gt;
LXK2-PW12-R00, LXK2-PW12-S00, LXK2-PW14-U00, LXK2-PW14-V00&lt;br&gt;
LXK2-PM12-R00, LXK2-PM12-S00, LXK2-PM14-U00&lt;br&gt;
LXK2-PE12-Q00, LXK2-PE12-R00, LXK2-PE12-S00, LXK2-PE14-T00, LXK2-PE14-U00&lt;br&gt;
LXK2-PB12-K00, LXK2-PB12-L00, LXK2-PB12-M00, LXK2-PB14-N00, LXK2-PB14-P00, LXK2-PB14-Q00&lt;br&gt;
LXK2-PR12-L00, LXK2-PR12-M00, LXK2-PR14-Q00, LXK2-PR14-R00&lt;br&gt;
LXK2-PD12-Q00, LXK2-PD12-R00, LXK2-PD12-S00&lt;br&gt;
LXK2-PH12-R00, LXK2-PH12-S00&lt;br&gt;
LXK2-PL12-P00, LXK2-PL12-Q00, LXK2-PL12-R00
&lt;p&gt;
Source: www.luxeon.com&lt;p&gt;

&lt;u&gt;KINGBRIGHT:&lt;/U&gt;&lt;p&gt;
KA-3528ASYC&lt;br&gt;
Source: www.kingbright.com</description>
<gates>
<gate name="G$1" symbol="LED_LED" x="0" y="0"/>
</gates>
<devices>
<device name="SML1206" package="LED_SML1206">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JACK_RESISTOR">
<gates>
<gate name="G$1" symbol="JACK_RESISTOR" x="-2.54" y="0"/>
</gates>
<devices>
<device name="0805" package="JACK_0805">
<connects>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JACK_BEEPER">
<gates>
<gate name="G$1" symbol="JACK_SPEAKER" x="-2.54" y="0"/>
</gates>
<devices>
<device name="" package="JACK_BEEPER_433-1033-ND">
<connects>
<connect gate="G$1" pin="+" pad="+"/>
<connect gate="G$1" pin="-" pad="-"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JACK_DC_TO_DC_VARIABLE_555-1172-1-ND">
<gates>
<gate name="G$1" symbol="JACK_DC2DCCONVERTER_555-1172-1-ND" x="-7.62" y="2.54"/>
</gates>
<devices>
<device name="" package="JACK_DC2DC_555-1172-1-ND">
<connects>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="ON/OFF" pad="ON/OFF"/>
<connect gate="G$1" pin="TRIM" pad="TRIM"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
<connect gate="G$1" pin="VOUT" pad="VOUT"/>
<connect gate="G$1" pin="VS+" pad="VS+"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SUPPLY1_GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="SUPPLY1_GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JACK_DIODE">
<gates>
<gate name="G$1" symbol="JACK_DIODE" x="0" y="0"/>
</gates>
<devices>
<device name="SOD-23/SC-76" package="JACK_SOD-323/SC-76">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JACK_HIGH-SIDE_SWITCH_INFINEON_ITS428L2">
<gates>
<gate name="G$1" symbol="JACK_INFINEON_HIGH-SIDE_SWITCH" x="0" y="0"/>
</gates>
<devices>
<device name="" package="JACK_INFINEON_TO-252-5-11">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="IN" pad="2"/>
<connect gate="G$1" pin="OUT" pad="5"/>
<connect gate="G$1" pin="ST" pad="4"/>
<connect gate="G$1" pin="VBB" pad="TAB"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JUMPER_JP1E" prefix="JP" uservalue="yes">
<description>&lt;b&gt;JUMPER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="JUMPER_JP2E" x="2.54" y="0"/>
</gates>
<devices>
<device name="" package="JUMPER_JP1">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JACK_MOSFET_N_CHANNEL">
<gates>
<gate name="G$1" symbol="JACK_MOSFET_N_CHANNEL" x="0" y="0"/>
</gates>
<devices>
<device name="BSS138LCT-ND" package="JACK_SOT23">
<connects>
<connect gate="G$1" pin="D" pad="3"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SUPPLY1_+24V" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="SUPPLY1_+24V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JACK_CONNECTOR_3_PIN">
<gates>
<gate name="G$1" symbol="JACK_CONNECTOR_3_PIN" x="2.54" y="0"/>
</gates>
<devices>
<device name="" package="JACK_THREE_.1&quot;_HOLES">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MAYBE_JST" package="JACK_JST_3_PIN_.1&quot;">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SUPPLY2_+7V" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="SUPPLY2_+07V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SUPPLY2_+5V/1" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="SUPPLY2_+05V/1" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SUPPLY2_+21V" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="SUPPLY2_+21V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="SUPPLY2_+5V/2" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="SUPPLY2_+05V/2" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JACK_SCREW_TERMINAL_2_CONDUCTOR">
<gates>
<gate name="G$1" symbol="JACK_CONNECTOR_2_PIN" x="2.54" y="0"/>
</gates>
<devices>
<device name="AMP-282837-2" package="JACK_AMP-282837-2">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JACK_CONNECTOR_6_PIN">
<gates>
<gate name="G$1" symbol="JACK_HEADER_6_PIN" x="2.54" y="0"/>
</gates>
<devices>
<device name="JST_MAYBE" package="JACK_JST_6_PIN_.1&quot;">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JACK_CONNECTOR_4_PIN">
<gates>
<gate name="G$1" symbol="JACK_HEADER_4_PIN" x="2.54" y="0"/>
</gates>
<devices>
<device name="" package="JACK_JST_4_PIN_.1&quot;">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JACK_FUSE_HOLDER_F065-ND">
<gates>
<gate name="G$1" symbol="JACK_FUSE" x="0" y="0"/>
</gates>
<devices>
<device name="" package="JACK_FUSE_HOLDER_F064-ND">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="JACK_ARDUINO_NANO">
<gates>
<gate name="G$1" symbol="JACK_ARDUINO_NANO" x="-2.54" y="35.56"/>
</gates>
<devices>
<device name="" package="JACK_ARDUINO_NANO">
<connects>
<connect gate="G$1" pin="3V3" pad="P$29"/>
<connect gate="G$1" pin="5V" pad="P$19"/>
<connect gate="G$1" pin="A0" pad="P$27"/>
<connect gate="G$1" pin="A1" pad="P$26"/>
<connect gate="G$1" pin="A2" pad="P$25"/>
<connect gate="G$1" pin="A3" pad="P$24"/>
<connect gate="G$1" pin="A4" pad="P$23"/>
<connect gate="G$1" pin="A5" pad="P$22"/>
<connect gate="G$1" pin="A6" pad="P$21"/>
<connect gate="G$1" pin="A7" pad="P$20"/>
<connect gate="G$1" pin="D10" pad="P$3"/>
<connect gate="G$1" pin="D11" pad="P$2"/>
<connect gate="G$1" pin="D12" pad="P$1"/>
<connect gate="G$1" pin="D13" pad="P$30"/>
<connect gate="G$1" pin="D2" pad="P$11"/>
<connect gate="G$1" pin="D3" pad="P$10"/>
<connect gate="G$1" pin="D4" pad="P$9"/>
<connect gate="G$1" pin="D5" pad="P$8"/>
<connect gate="G$1" pin="D6" pad="P$7"/>
<connect gate="G$1" pin="D7" pad="P$6"/>
<connect gate="G$1" pin="D8" pad="P$5"/>
<connect gate="G$1" pin="D9" pad="P$4"/>
<connect gate="G$1" pin="GND" pad="P$12"/>
<connect gate="G$1" pin="GND2" pad="P$17"/>
<connect gate="G$1" pin="REF" pad="P$28"/>
<connect gate="G$1" pin="RST1" pad="P$13"/>
<connect gate="G$1" pin="RST2" pad="P$18"/>
<connect gate="G$1" pin="RXD" pad="P$14"/>
<connect gate="G$1" pin="TXI" pad="P$15"/>
<connect gate="G$1" pin="VIN" pad="P$16"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
<clearance class="0" value="0.254"/>
</class>
</classes>
<parts>
<part name="GND2" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="BATTERY_VOLTAGE_DIVIDER_HIGH" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="BATTERY_VOLTAGE_DIVIDER_LOW" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="GND4" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="SUPPLY1" library="arduino board rev 1.3" deviceset="SUPPLY2_+7V" device=""/>
<part name="GND3" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="GND10" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="GND11" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="U$17" library="arduino board rev 1.3" deviceset="JACK_DC_TO_DC_VARIABLE_555-1172-1-ND" device=""/>
<part name="DC2DC_PROCESSOR_" library="arduino board rev 1.3" deviceset="JACK_DC_TO_DC_VARIABLE_555-1172-1-ND" device=""/>
<part name="GND7" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="GND14" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="RTRIM_PROCESSOR" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="MOTOR_TRIM" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="PROCESSOR_LED_R" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="GND15" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="MOTOR_LED_R" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="GND16" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="GND1" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="GND9" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="P+7" library="arduino board rev 1.3" deviceset="SUPPLY1_+24V" device=""/>
<part name="PROCESSOR_LED" library="arduino board rev 1.3" deviceset="LED_LED" device="SML1206"/>
<part name="MOTOR_LED" library="arduino board rev 1.3" deviceset="LED_LED" device="SML1206"/>
<part name="MOTOR.1UF" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="MOTOTR10UF" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="PROC.1UF" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="PROC10UF" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="PROC_IN10UF" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="PROC_IN_.1UF" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="MOTOR_IN10UF" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="MOTOR_IN.1UF" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="GND17" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="GND18" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="GND19" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="GND20" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="U$11" library="arduino board rev 1.3" deviceset="JACK_FUSE_HOLDER_F065-ND" device="" value="JACK_FUSE_HOLDER_F065-ND"/>
<part name="SUPPLY2" library="arduino board rev 1.3" deviceset="SUPPLY2_+7V" device=""/>
<part name="JP1" library="arduino board rev 1.3" deviceset="JUMPER_JP1E" device=""/>
<part name="GND22" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="GND23" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="BEEPER" library="arduino board rev 1.3" deviceset="JACK_BEEPER" device=""/>
<part name="GND24" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="PROC10UF1" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="GND25" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="MOTOTR10UF1" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="GND26" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="PROC_IN_.1UF1" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="MOTOR_IN.1UF1" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="PROC10UF2" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="GND27" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="MOTOTR10UF2" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="GND28" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="SUPPLY4" library="arduino board rev 1.3" deviceset="SUPPLY2_+5V/1" device=""/>
<part name="PROCESSOR_PULLUP" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="MOTOR_PULLUP" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="PROCESSOR_ENABLE_MOSFET" library="arduino board rev 1.3" deviceset="JACK_MOSFET_N_CHANNEL" device="BSS138LCT-ND"/>
<part name="MOTOR_ENABLE_MOSFET" library="arduino board rev 1.3" deviceset="JACK_MOSFET_N_CHANNEL" device="BSS138LCT-ND"/>
<part name="PROCESSOR_MOSFET_PULLDOWN" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="MOTOR_MOSFET_PULLDOWN" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="SUPPLY8" library="arduino board rev 1.3" deviceset="SUPPLY2_+5V/2" device=""/>
<part name="SUPPLY9" library="arduino board rev 1.3" deviceset="SUPPLY2_+5V/1" device=""/>
<part name="SUPPLY10" library="arduino board rev 1.3" deviceset="SUPPLY2_+5V/1" device=""/>
<part name="GND13" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="PROC10UF3" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="GND21" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="MOTOTR10UF3" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="GND33" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="SERVO_HEADER" library="arduino board rev 1.3" deviceset="JACK_CONNECTOR_3_PIN" device=""/>
<part name="GND34" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="SUPPLY11" library="arduino board rev 1.3" deviceset="SUPPLY2_+7V" device=""/>
<part name="U$9" library="arduino board rev 1.3" deviceset="JACK_CONNECTOR_6_PIN" device="JST_MAYBE"/>
<part name="U$10" library="arduino board rev 1.3" deviceset="JACK_CONNECTOR_4_PIN" device=""/>
<part name="U$12" library="arduino board rev 1.3" deviceset="JACK_CONNECTOR_4_PIN" device=""/>
<part name="U$13" library="arduino board rev 1.3" deviceset="JACK_CONNECTOR_3_PIN" device="MAYBE_JST"/>
<part name="PROC_IN_.1UF2" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="SUPPLY13" library="arduino board rev 1.3" deviceset="SUPPLY2_+21V" device=""/>
<part name="SUPPLY14" library="arduino board rev 1.3" deviceset="SUPPLY2_+5V/1" device=""/>
<part name="GND29" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="U$4" library="arduino board rev 1.3" deviceset="JACK_DC_TO_DC_VARIABLE_555-1172-1-ND" device=""/>
<part name="GND5" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="RTRIM_5V" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="5V_LED_R1" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="GND6" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="5V_LED" library="arduino board rev 1.3" deviceset="LED_LED" device="SML1206"/>
<part name="5V_OUT_CAP_5" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="5V_OUT_CAP_4" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="5V_IN_CAP_4" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="5V_IN_CAP_2" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="GND35" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="GND36" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="5V_OUT_CAP_3" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="GND37" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="5V_IN_CAP_3" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="5V_OUT_CAP_1" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="GND38" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="5V_REGULATOR_PULLDOWN" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="5V_OUT_CAP_2" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="GND39" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="SUPPLY5" library="arduino board rev 1.3" deviceset="SUPPLY2_+21V" device=""/>
<part name="HIGH-SIDE_SWITCH" library="arduino board rev 1.3" deviceset="JACK_HIGH-SIDE_SWITCH_INFINEON_ITS428L2" device=""/>
<part name="HIGH-SIDE_BUTTON_DIVIDER_HIGH" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="HIGH-SIDE_SWITCH_BUTTON_DIVIDER_LOW" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="HIGH-SIDE_BLOCKING_DIODE" library="arduino board rev 1.3" deviceset="JACK_DIODE" device="SOD-23/SC-76"/>
<part name="P+2" library="arduino board rev 1.3" deviceset="SUPPLY1_+24V" device=""/>
<part name="GND8" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="P+4" library="arduino board rev 1.3" deviceset="SUPPLY1_+24V" device=""/>
<part name="SUPPLY6" library="arduino board rev 1.3" deviceset="SUPPLY2_+21V" device=""/>
<part name="SUPPLY7" library="arduino board rev 1.3" deviceset="SUPPLY2_+21V" device=""/>
<part name="SUPPLY12" library="arduino board rev 1.3" deviceset="SUPPLY2_+21V" device=""/>
<part name="GND12" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="MOTOR_IN.1UF4" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="5V_IN_CAP_1" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="" value="JACK_CAPACITOR"/>
<part name="SUPPLY3" library="arduino board rev 1.3" deviceset="SUPPLY2_+5V/1" device=""/>
<part name="GND30" library="arduino board rev 1.3" deviceset="SUPPLY1_GND" device=""/>
<part name="U$2" library="arduino board rev 1.3" deviceset="JACK_SCREW_TERMINAL_2_CONDUCTOR" device="AMP-282837-2"/>
<part name="U$5" library="arduino board rev 1.3" deviceset="JACK_SCREW_TERMINAL_2_CONDUCTOR" device="AMP-282837-2"/>
<part name="U$6" library="arduino board rev 1.3" deviceset="JACK_SCREW_TERMINAL_2_CONDUCTOR" device="AMP-282837-2"/>
<part name="5V_R_220" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="PROCESSOR_R_220" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="MOTOR_R_220" library="arduino board rev 1.3" deviceset="JACK_RESISTOR" device="0805"/>
<part name="5V_C_680PF" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="0805" value="JACK_CAPACITOR0805"/>
<part name="PROCESSOR_C_680PF" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="0805" value="JACK_CAPACITOR0805"/>
<part name="MOTOR_C_680PF" library="arduino board rev 1.3" deviceset="JACK_CAPACITOR" device="0805" value="JACK_CAPACITOR0805"/>
<part name="U$1" library="arduino board rev 1.3" deviceset="JACK_SCREW_TERMINAL_2_CONDUCTOR" device="AMP-282837-2"/>
<part name="U$3" library="arduino board rev 1.3" deviceset="JACK_CONNECTOR_6_PIN" device="JST_MAYBE"/>
<part name="U$14" library="arduino board rev 1.3" deviceset="JACK_ARDUINO_NANO" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="-182.88" y="73.66" size="1.778" layer="91">to battery</text>
<text x="167.64" y="177.8" size="1.778" layer="91" rot="R90">Left encoder</text>
<text x="195.58" y="175.26" size="1.778" layer="91" rot="R90">Right encoder</text>
<text x="106.68" y="175.26" size="1.778" layer="91" rot="R90">motor controller</text>
<text x="160.02" y="172.72" size="1.778" layer="91" rot="R90">pwr</text>
<text x="165.1" y="172.72" size="1.778" layer="91" rot="R90">gnd</text>
<text x="170.18" y="172.72" size="1.778" layer="91" rot="R90">B</text>
<text x="175.26" y="172.72" size="1.778" layer="91" rot="R90">A</text>
<text x="187.96" y="172.72" size="1.778" layer="91" rot="R90">pwr</text>
<text x="193.04" y="172.72" size="1.778" layer="91" rot="R90">gnd</text>
<text x="198.12" y="172.72" size="1.778" layer="91" rot="R90">B</text>
<text x="203.2" y="172.72" size="1.778" layer="91" rot="R90">A</text>
<text x="157.48" y="48.26" size="1.778" layer="91">For monitoring battery voltage</text>
<text x="185.42" y="96.52" size="1.778" layer="91">extra IO for ???</text>
<text x="-20.32" y="88.9" size="1.778" layer="91">r trim</text>
<text x="-20.32" y="35.56" size="1.778" layer="91">r trim</text>
<text x="-17.78" y="106.68" size="2.54" layer="91">Processor</text>
<text x="-15.24" y="53.34" size="2.54" layer="91">Motors</text>
<text x="-106.68" y="223.52" size="5.08" layer="91">Power section</text>
<text x="121.92" y="223.52" size="5.08" layer="91">Motor control and power monitoring</text>
<text x="20.32" y="27.94" size="1.4224" layer="91" rot="R90">754-1156-1-ND
</text>
<text x="22.86" y="81.28" size="1.4224" layer="91" rot="R90">754-1444-1-ND
</text>
<text x="228.6" y="190.5" size="1.778" layer="91">Ground test point</text>
<text x="185.42" y="55.88" size="1.778" layer="97">200K</text>
<text x="185.42" y="40.64" size="1.778" layer="97">47K</text>
<text x="198.12" y="48.26" size="1.778" layer="97">0.1 mA</text>
<wire x1="200.66" y1="45.72" x2="200.66" y2="35.56" width="0.1524" layer="97"/>
<wire x1="200.66" y1="35.56" x2="201.422" y2="37.338" width="0.1524" layer="97"/>
<wire x1="201.422" y1="37.338" x2="199.898" y2="37.338" width="0.1524" layer="97"/>
<wire x1="199.898" y1="37.338" x2="200.66" y2="35.56" width="0.1524" layer="97"/>
<text x="205.74" y="55.88" size="1.778" layer="91">Serial header</text>
<text x="-175.26" y="-48.26" size="5.08" layer="91">Power designations:

24V:   The battery
21V:   The battery after the button/high-side switch
7V:     Motor/servo power
5V/1:  Arduino and encoder power
5V/2:  Processor power - Not necessarily 5V.  It is adjustable</text>
<text x="-134.62" y="116.84" size="1.778" layer="91">This works out to a
battery voltage of
14.97V to 23.85V
TODO:  Verify this </text>
<text x="144.78" y="55.88" size="1.4224" layer="91">These values are pretty large to minimize
battery usage but may need to be lowered 
Change code if I do...</text>
<text x="-81.28" y="114.3" size="1.4224" layer="91">These modules put out 5A max.</text>
<text x="-76.2" y="111.76" size="1.4224" layer="91">555-1172-1-ND</text>
<text x="-78.74" y="116.84" size="1.4224" layer="91">APXW005A0X3-SRZ </text>
<text x="-17.78" y="180.34" size="2.54" layer="91">5V</text>
<text x="17.78" y="154.94" size="1.4224" layer="91" rot="R90">754-1156-1-ND
</text>
<text x="-203.2" y="182.88" size="1.4224" layer="91">ITS428L2ATMA1CT-ND</text>
<text x="-200.66" y="160.02" size="1.4224" layer="91">Can switch 5.8A</text>
<text x="-236.22" y="182.88" size="1.778" layer="91">Power button</text>
<text x="-83.82" y="147.32" size="1.778" layer="91">10K</text>
<text x="-104.14" y="73.66" size="1.778" layer="91">10K</text>
<text x="-96.52" y="99.06" size="1.778" layer="91">10K</text>
<text x="-96.52" y="45.72" size="1.778" layer="91">10K</text>
<text x="-104.14" y="17.78" size="1.778" layer="91">10K</text>
<text x="5.08" y="109.22" size="1.778" layer="91">This is 12V output</text>
<text x="5.08" y="55.88" size="1.778" layer="91">This is 6V output</text>
<text x="2.54" y="182.88" size="1.778" layer="91">This is 5V output</text>
<text x="-60.96" y="86.36" size="1.778" layer="91" rot="R90">6.19K</text>
<text x="-60.96" y="33.02" size="1.778" layer="91" rot="R90">13.2K</text>
<text x="-63.5" y="160.02" size="1.778" layer="91" rot="R90">16.2K</text>
<text x="-55.88" y="177.8" size="1.778" layer="91">220</text>
<text x="-53.34" y="104.14" size="1.778" layer="91">220</text>
<text x="-53.34" y="50.8" size="1.778" layer="91">220</text>
<text x="-55.88" y="165.1" size="1.778" layer="91">680pF</text>
<text x="-53.34" y="91.44" size="1.778" layer="91">680pF</text>
<text x="-53.34" y="38.1" size="1.778" layer="91">680pF</text>
<text x="-101.6" y="170.18" size="1.778" layer="91">10uF</text>
<text x="-93.98" y="170.18" size="1.778" layer="91">10uF</text>
<text x="-132.08" y="93.98" size="1.778" layer="91">10uF</text>
<text x="-124.46" y="93.98" size="1.778" layer="91">10uF</text>
<text x="-132.08" y="43.18" size="1.778" layer="91">10uF</text>
<text x="-124.46" y="43.18" size="1.778" layer="91">10uF</text>
<text x="-17.78" y="170.18" size="1.778" layer="91">10uF</text>
<text x="-12.7" y="167.64" size="1.778" layer="91">10uF</text>
<text x="-15.24" y="96.52" size="1.778" layer="91">10uF</text>
<text x="-10.16" y="93.98" size="1.778" layer="91">10uF</text>
<text x="-5.08" y="96.52" size="1.778" layer="91">10uF</text>
<text x="0" y="93.98" size="1.778" layer="91">10uF</text>
<text x="-7.62" y="170.18" size="1.778" layer="91">10uF</text>
<text x="-2.54" y="167.64" size="1.778" layer="91">10uF</text>
<text x="-15.24" y="43.18" size="1.778" layer="91">10uF</text>
<text x="-10.16" y="40.64" size="1.778" layer="91">10uF</text>
<text x="-5.08" y="43.18" size="1.778" layer="91">10uF</text>
<text x="0" y="40.64" size="1.778" layer="91">10uF</text>
<text x="-116.84" y="170.18" size="1.778" layer="91">.1uF</text>
<text x="-109.22" y="170.18" size="1.778" layer="91">.1uF</text>
<text x="-147.32" y="93.98" size="1.778" layer="91">.1uF</text>
<text x="-139.7" y="93.98" size="1.778" layer="91">.1uF</text>
<text x="-147.32" y="43.18" size="1.778" layer="91">.1uF</text>
<text x="-139.7" y="43.18" size="1.778" layer="91">.1uF</text>
<text x="17.78" y="170.18" size="1.778" layer="91" rot="R90">470</text>
<text x="22.86" y="96.52" size="1.778" layer="91" rot="R90">1.2K</text>
<text x="20.32" y="43.18" size="1.778" layer="91" rot="R90">600</text>
<text x="-246.38" y="154.94" size="1.778" layer="91" rot="R90">1K</text>
<wire x1="-254" y1="195.58" x2="-254" y2="154.94" width="0.1524" layer="97"/>
<wire x1="-254" y1="154.94" x2="-256.54" y2="157.48" width="0.1524" layer="97"/>
<wire x1="-256.54" y1="157.48" x2="-251.46" y2="157.48" width="0.1524" layer="97"/>
<wire x1="-251.46" y1="157.48" x2="-254" y2="154.94" width="0.1524" layer="97"/>
<text x="-254" y="167.64" size="1.778" layer="97" rot="R90">5mA when pressed</text>
<text x="-246.38" y="190.5" size="1.778" layer="97" rot="R90">3.8K</text>
</plain>
<instances>
<instance part="GND2" gate="1" x="220.98" y="43.18" smashed="yes">
<attribute name="VALUE" x="218.44" y="40.64" size="1.778" layer="96"/>
</instance>
<instance part="BATTERY_VOLTAGE_DIVIDER_HIGH" gate="G$1" x="193.04" y="55.88" smashed="yes" rot="R270"/>
<instance part="BATTERY_VOLTAGE_DIVIDER_LOW" gate="G$1" x="193.04" y="40.64" smashed="yes" rot="R270"/>
<instance part="GND4" gate="1" x="193.04" y="27.94" smashed="yes">
<attribute name="VALUE" x="190.5" y="25.4" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY1" gate="G$1" x="86.36" y="170.18" smashed="yes">
<attribute name="VALUE" x="84.455" y="173.355" size="1.778" layer="96"/>
</instance>
<instance part="GND3" gate="1" x="193.04" y="165.1" smashed="yes">
<attribute name="VALUE" x="190.5" y="162.56" size="1.778" layer="96"/>
</instance>
<instance part="GND10" gate="1" x="165.1" y="165.1" smashed="yes">
<attribute name="VALUE" x="162.56" y="162.56" size="1.778" layer="96"/>
</instance>
<instance part="GND11" gate="1" x="93.98" y="160.02" smashed="yes">
<attribute name="VALUE" x="91.44" y="157.48" size="1.778" layer="96"/>
</instance>
<instance part="U$17" gate="G$1" x="-78.74" y="43.18" smashed="yes"/>
<instance part="DC2DC_PROCESSOR_" gate="G$1" x="-78.74" y="96.52" smashed="yes"/>
<instance part="GND7" gate="1" x="-71.12" y="63.5" smashed="yes">
<attribute name="VALUE" x="-73.66" y="60.96" size="1.778" layer="96"/>
</instance>
<instance part="GND14" gate="1" x="-71.12" y="10.16" smashed="yes">
<attribute name="VALUE" x="-73.66" y="7.62" size="1.778" layer="96"/>
</instance>
<instance part="RTRIM_PROCESSOR" gate="G$1" x="-58.42" y="91.44" smashed="yes" rot="R90"/>
<instance part="MOTOR_TRIM" gate="G$1" x="-58.42" y="38.1" smashed="yes" rot="R90"/>
<instance part="PROCESSOR_LED_R" gate="G$1" x="25.4" y="101.6" smashed="yes" rot="R90"/>
<instance part="GND15" gate="1" x="25.4" y="81.28" smashed="yes">
<attribute name="VALUE" x="22.86" y="78.74" size="1.778" layer="96"/>
</instance>
<instance part="MOTOR_LED_R" gate="G$1" x="22.86" y="48.26" smashed="yes" rot="R90"/>
<instance part="GND16" gate="1" x="22.86" y="27.94" smashed="yes">
<attribute name="VALUE" x="20.32" y="25.4" size="1.778" layer="96"/>
</instance>
<instance part="GND1" gate="1" x="35.56" y="99.06" smashed="yes">
<attribute name="VALUE" x="33.02" y="96.52" size="1.778" layer="96"/>
</instance>
<instance part="GND9" gate="1" x="-167.64" y="68.58" smashed="yes">
<attribute name="VALUE" x="-170.18" y="66.04" size="1.778" layer="96"/>
</instance>
<instance part="P+7" gate="1" x="-139.7" y="78.74" smashed="yes">
<attribute name="VALUE" x="-142.24" y="73.66" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="PROCESSOR_LED" gate="G$1" x="25.4" y="88.9" smashed="yes">
<attribute name="NAME" x="28.956" y="84.328" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="31.115" y="84.328" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="MOTOR_LED" gate="G$1" x="22.86" y="35.56" smashed="yes">
<attribute name="NAME" x="26.416" y="30.988" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="28.575" y="30.988" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="MOTOR.1UF" gate="G$1" x="-12.7" y="45.72" smashed="yes" rot="R90"/>
<instance part="MOTOTR10UF" gate="G$1" x="-2.54" y="45.72" smashed="yes" rot="R90"/>
<instance part="PROC.1UF" gate="G$1" x="-12.7" y="99.06" smashed="yes" rot="R90"/>
<instance part="PROC10UF" gate="G$1" x="-2.54" y="99.06" smashed="yes" rot="R90"/>
<instance part="PROC_IN10UF" gate="G$1" x="-121.92" y="96.52" smashed="yes" rot="R90"/>
<instance part="PROC_IN_.1UF" gate="G$1" x="-129.54" y="96.52" smashed="yes" rot="R90"/>
<instance part="MOTOR_IN10UF" gate="G$1" x="-121.92" y="45.72" smashed="yes" rot="R90"/>
<instance part="MOTOR_IN.1UF" gate="G$1" x="-129.54" y="45.72" smashed="yes" rot="R90"/>
<instance part="GND17" gate="1" x="-2.54" y="91.44" smashed="yes">
<attribute name="VALUE" x="-5.08" y="88.9" size="1.778" layer="96"/>
</instance>
<instance part="GND18" gate="1" x="-12.7" y="91.44" smashed="yes">
<attribute name="VALUE" x="-15.24" y="88.9" size="1.778" layer="96"/>
</instance>
<instance part="GND19" gate="1" x="-12.7" y="38.1" smashed="yes">
<attribute name="VALUE" x="-15.24" y="35.56" size="1.778" layer="96"/>
</instance>
<instance part="GND20" gate="1" x="-2.54" y="38.1" smashed="yes">
<attribute name="VALUE" x="-5.08" y="35.56" size="1.778" layer="96"/>
</instance>
<instance part="U$11" gate="G$1" x="-157.48" y="76.2" smashed="yes" rot="R180"/>
<instance part="SUPPLY2" gate="G$1" x="43.18" y="55.88" smashed="yes">
<attribute name="VALUE" x="41.275" y="59.055" size="1.778" layer="96"/>
</instance>
<instance part="JP1" gate="A" x="236.22" y="185.42" smashed="yes">
<attribute name="NAME" x="234.95" y="185.42" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="241.935" y="185.42" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="GND22" gate="1" x="238.76" y="180.34" smashed="yes">
<attribute name="VALUE" x="236.22" y="177.8" size="1.778" layer="96"/>
</instance>
<instance part="GND23" gate="1" x="236.22" y="180.34" smashed="yes">
<attribute name="VALUE" x="233.68" y="177.8" size="1.778" layer="96"/>
</instance>
<instance part="BEEPER" gate="G$1" x="96.52" y="129.54" smashed="yes" rot="R180"/>
<instance part="GND24" gate="1" x="101.6" y="129.54" smashed="yes">
<attribute name="VALUE" x="99.06" y="127" size="1.778" layer="96"/>
</instance>
<instance part="PROC10UF1" gate="G$1" x="2.54" y="99.06" smashed="yes" rot="R90"/>
<instance part="GND25" gate="1" x="2.54" y="91.44" smashed="yes">
<attribute name="VALUE" x="0" y="88.9" size="1.778" layer="96"/>
</instance>
<instance part="MOTOTR10UF1" gate="G$1" x="2.54" y="45.72" smashed="yes" rot="R90"/>
<instance part="GND26" gate="1" x="2.54" y="38.1" smashed="yes">
<attribute name="VALUE" x="0" y="35.56" size="1.778" layer="96"/>
</instance>
<instance part="PROC_IN_.1UF1" gate="G$1" x="-137.16" y="96.52" smashed="yes" rot="R90"/>
<instance part="MOTOR_IN.1UF1" gate="G$1" x="-137.16" y="45.72" smashed="yes" rot="R90"/>
<instance part="PROC10UF2" gate="G$1" x="-7.62" y="99.06" smashed="yes" rot="R90"/>
<instance part="GND27" gate="1" x="-7.62" y="91.44" smashed="yes">
<attribute name="VALUE" x="-10.16" y="88.9" size="1.778" layer="96"/>
</instance>
<instance part="MOTOTR10UF2" gate="G$1" x="-7.62" y="45.72" smashed="yes" rot="R90"/>
<instance part="GND28" gate="1" x="-7.62" y="38.1" smashed="yes">
<attribute name="VALUE" x="-10.16" y="35.56" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY4" gate="G$1" x="213.36" y="38.1" smashed="yes">
<attribute name="VALUE" x="210.185" y="41.275" size="1.778" layer="96"/>
</instance>
<instance part="PROCESSOR_PULLUP" gate="G$1" x="-88.9" y="101.6" smashed="yes" rot="R90"/>
<instance part="MOTOR_PULLUP" gate="G$1" x="-88.9" y="48.26" smashed="yes" rot="R90"/>
<instance part="PROCESSOR_ENABLE_MOSFET" gate="G$1" x="-88.9" y="83.82" smashed="yes"/>
<instance part="MOTOR_ENABLE_MOSFET" gate="G$1" x="-88.9" y="30.48" smashed="yes"/>
<instance part="PROCESSOR_MOSFET_PULLDOWN" gate="G$1" x="-96.52" y="76.2" smashed="yes" rot="R90"/>
<instance part="MOTOR_MOSFET_PULLDOWN" gate="G$1" x="-96.52" y="22.86" smashed="yes" rot="R90"/>
<instance part="SUPPLY8" gate="G$1" x="35.56" y="109.22" smashed="yes">
<attribute name="VALUE" x="31.75" y="112.395" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY9" gate="G$1" x="157.48" y="170.18" smashed="yes">
<attribute name="VALUE" x="154.305" y="173.355" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY10" gate="G$1" x="185.42" y="170.18" smashed="yes">
<attribute name="VALUE" x="182.245" y="173.355" size="1.778" layer="96"/>
</instance>
<instance part="GND13" gate="1" x="223.52" y="50.8" smashed="yes">
<attribute name="VALUE" x="220.98" y="48.26" size="1.778" layer="96"/>
</instance>
<instance part="PROC10UF3" gate="G$1" x="7.62" y="99.06" smashed="yes" rot="R90"/>
<instance part="GND21" gate="1" x="7.62" y="91.44" smashed="yes">
<attribute name="VALUE" x="5.08" y="88.9" size="1.778" layer="96"/>
</instance>
<instance part="MOTOTR10UF3" gate="G$1" x="7.62" y="45.72" smashed="yes" rot="R90"/>
<instance part="GND33" gate="1" x="7.62" y="38.1" smashed="yes">
<attribute name="VALUE" x="5.08" y="35.56" size="1.778" layer="96"/>
</instance>
<instance part="SERVO_HEADER" gate="G$1" x="162.56" y="83.82" smashed="yes" rot="R180"/>
<instance part="GND34" gate="1" x="165.1" y="78.74" smashed="yes">
<attribute name="VALUE" x="162.56" y="76.2" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY11" gate="G$1" x="170.18" y="86.36" smashed="yes">
<attribute name="VALUE" x="168.275" y="89.535" size="1.778" layer="96"/>
</instance>
<instance part="U$9" gate="G$1" x="101.6" y="172.72" smashed="yes" rot="R90"/>
<instance part="U$10" gate="G$1" x="167.64" y="172.72" smashed="yes" rot="R90"/>
<instance part="U$12" gate="G$1" x="195.58" y="172.72" smashed="yes" rot="R90"/>
<instance part="U$13" gate="G$1" x="220.98" y="55.88" smashed="yes" rot="R180"/>
<instance part="PROC_IN_.1UF2" gate="G$1" x="-144.78" y="96.52" smashed="yes" rot="R90"/>
<instance part="SUPPLY13" gate="G$1" x="193.04" y="68.58" smashed="yes">
<attribute name="VALUE" x="190.5" y="71.755" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY14" gate="G$1" x="121.92" y="116.84" smashed="yes">
<attribute name="VALUE" x="118.745" y="120.015" size="1.778" layer="96"/>
</instance>
<instance part="GND29" gate="1" x="121.92" y="86.36" smashed="yes">
<attribute name="VALUE" x="119.38" y="83.82" size="1.778" layer="96"/>
</instance>
<instance part="U$4" gate="G$1" x="-81.28" y="170.18" smashed="yes"/>
<instance part="GND5" gate="1" x="-73.66" y="137.16" smashed="yes">
<attribute name="VALUE" x="-76.2" y="134.62" size="1.778" layer="96"/>
</instance>
<instance part="RTRIM_5V" gate="G$1" x="-60.96" y="165.1" smashed="yes" rot="R90"/>
<instance part="5V_LED_R1" gate="G$1" x="20.32" y="175.26" smashed="yes" rot="R90"/>
<instance part="GND6" gate="1" x="20.32" y="154.94" smashed="yes">
<attribute name="VALUE" x="17.78" y="152.4" size="1.778" layer="96"/>
</instance>
<instance part="5V_LED" gate="G$1" x="20.32" y="162.56" smashed="yes">
<attribute name="NAME" x="23.876" y="157.988" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="26.035" y="157.988" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="5V_OUT_CAP_5" gate="G$1" x="-15.24" y="172.72" smashed="yes" rot="R90"/>
<instance part="5V_OUT_CAP_4" gate="G$1" x="-5.08" y="172.72" smashed="yes" rot="R90"/>
<instance part="5V_IN_CAP_4" gate="G$1" x="-91.44" y="172.72" smashed="yes" rot="R90"/>
<instance part="5V_IN_CAP_2" gate="G$1" x="-99.06" y="172.72" smashed="yes" rot="R90"/>
<instance part="GND35" gate="1" x="-15.24" y="165.1" smashed="yes">
<attribute name="VALUE" x="-17.78" y="162.56" size="1.778" layer="96"/>
</instance>
<instance part="GND36" gate="1" x="-5.08" y="165.1" smashed="yes">
<attribute name="VALUE" x="-7.62" y="162.56" size="1.778" layer="96"/>
</instance>
<instance part="5V_OUT_CAP_3" gate="G$1" x="0" y="172.72" smashed="yes" rot="R90"/>
<instance part="GND37" gate="1" x="0" y="165.1" smashed="yes">
<attribute name="VALUE" x="-2.54" y="162.56" size="1.778" layer="96"/>
</instance>
<instance part="5V_IN_CAP_3" gate="G$1" x="-106.68" y="172.72" smashed="yes" rot="R90"/>
<instance part="5V_OUT_CAP_1" gate="G$1" x="-10.16" y="172.72" smashed="yes" rot="R90"/>
<instance part="GND38" gate="1" x="-10.16" y="165.1" smashed="yes">
<attribute name="VALUE" x="-12.7" y="162.56" size="1.778" layer="96"/>
</instance>
<instance part="5V_REGULATOR_PULLDOWN" gate="G$1" x="-86.36" y="149.86" smashed="yes" rot="R90"/>
<instance part="5V_OUT_CAP_2" gate="G$1" x="5.08" y="172.72" smashed="yes" rot="R90"/>
<instance part="GND39" gate="1" x="5.08" y="165.1" smashed="yes">
<attribute name="VALUE" x="2.54" y="162.56" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY5" gate="G$1" x="-177.8" y="175.26" smashed="yes">
<attribute name="VALUE" x="-180.34" y="178.435" size="1.778" layer="96"/>
</instance>
<instance part="HIGH-SIDE_SWITCH" gate="G$1" x="-193.04" y="172.72" smashed="yes"/>
<instance part="HIGH-SIDE_BUTTON_DIVIDER_HIGH" gate="G$1" x="-243.84" y="195.58" smashed="yes" rot="R90"/>
<instance part="HIGH-SIDE_SWITCH_BUTTON_DIVIDER_LOW" gate="G$1" x="-243.84" y="160.02" smashed="yes" rot="R90"/>
<instance part="HIGH-SIDE_BLOCKING_DIODE" gate="G$1" x="-226.06" y="175.26" smashed="yes"/>
<instance part="P+2" gate="1" x="-193.04" y="190.5" smashed="yes">
<attribute name="VALUE" x="-195.58" y="193.04" size="1.778" layer="96"/>
</instance>
<instance part="GND8" gate="1" x="-193.04" y="154.94" smashed="yes">
<attribute name="VALUE" x="-195.58" y="152.4" size="1.778" layer="96"/>
</instance>
<instance part="P+4" gate="1" x="-243.84" y="203.2" smashed="yes">
<attribute name="VALUE" x="-246.38" y="205.74" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY6" gate="G$1" x="-91.44" y="182.88" smashed="yes">
<attribute name="VALUE" x="-93.98" y="186.055" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY7" gate="G$1" x="-88.9" y="114.3" smashed="yes">
<attribute name="VALUE" x="-91.44" y="117.475" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY12" gate="G$1" x="-88.9" y="55.88" smashed="yes">
<attribute name="VALUE" x="-91.44" y="59.055" size="1.778" layer="96"/>
</instance>
<instance part="GND12" gate="1" x="35.56" y="170.18" smashed="yes">
<attribute name="VALUE" x="33.02" y="167.64" size="1.778" layer="96"/>
</instance>
<instance part="MOTOR_IN.1UF4" gate="G$1" x="-114.3" y="172.72" smashed="yes" rot="R90"/>
<instance part="5V_IN_CAP_1" gate="G$1" x="-144.78" y="45.72" smashed="yes" rot="R90"/>
<instance part="SUPPLY3" gate="G$1" x="35.56" y="182.88" smashed="yes">
<attribute name="VALUE" x="32.385" y="186.055" size="1.778" layer="96"/>
</instance>
<instance part="GND30" gate="1" x="-243.84" y="147.32" smashed="yes">
<attribute name="VALUE" x="-246.38" y="144.78" size="1.778" layer="96"/>
</instance>
<instance part="U$2" gate="G$1" x="43.18" y="175.26" smashed="yes"/>
<instance part="U$5" gate="G$1" x="45.72" y="104.14" smashed="yes"/>
<instance part="U$6" gate="G$1" x="-177.8" y="73.66" smashed="yes" rot="R180"/>
<instance part="5V_R_220" gate="G$1" x="-55.88" y="175.26" smashed="yes" rot="R180"/>
<instance part="PROCESSOR_R_220" gate="G$1" x="-53.34" y="101.6" smashed="yes" rot="R180"/>
<instance part="MOTOR_R_220" gate="G$1" x="-53.34" y="48.26" smashed="yes" rot="R180"/>
<instance part="5V_C_680PF" gate="G$1" x="-53.34" y="170.18" smashed="yes" rot="R180"/>
<instance part="PROCESSOR_C_680PF" gate="G$1" x="-50.8" y="96.52" smashed="yes" rot="R180"/>
<instance part="MOTOR_C_680PF" gate="G$1" x="-50.8" y="43.18" smashed="yes" rot="R180"/>
<instance part="U$1" gate="G$1" x="-238.76" y="182.88" smashed="yes"/>
<instance part="U$3" gate="G$1" x="116.84" y="101.6" smashed="yes" rot="R180"/>
<instance part="U$14" gate="G$1" x="228.6" y="121.92" smashed="yes"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$11" class="0">
<segment>
<wire x1="199.39" y1="167.64" x2="199.39" y2="156.718" width="0.1524" layer="91"/>
<wire x1="199.39" y1="156.718" x2="233.68" y2="121.92" width="0.1524" layer="91"/>
<pinref part="U$12" gate="G$1" pin="4"/>
<junction x="199.39" y="167.64"/>
<pinref part="U$14" gate="G$1" pin="D2"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<wire x1="171.45" y1="167.64" x2="175.26" y2="167.64" width="0.1524" layer="91"/>
<wire x1="175.26" y1="167.64" x2="223.52" y2="119.38" width="0.1524" layer="91"/>
<wire x1="223.52" y1="119.38" x2="233.68" y2="119.38" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="4"/>
<junction x="171.45" y="167.64"/>
<pinref part="U$14" gate="G$1" pin="D3"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<wire x1="233.68" y1="45.72" x2="220.98" y2="45.72" width="0.1524" layer="91"/>
<wire x1="220.98" y1="45.72" x2="233.68" y2="43.18" width="0.1524" layer="91"/>
<pinref part="GND2" gate="1" pin="GND"/>
<junction x="220.98" y="45.72"/>
<pinref part="U$14" gate="G$1" pin="GND"/>
<pinref part="U$14" gate="G$1" pin="GND2"/>
</segment>
<segment>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="193.04" y1="167.64" x2="194.31" y2="167.64" width="0.1524" layer="91"/>
<pinref part="U$12" gate="G$1" pin="2"/>
<junction x="194.31" y="167.64"/>
</segment>
<segment>
<pinref part="GND10" gate="1" pin="GND"/>
<wire x1="165.1" y1="167.64" x2="166.37" y2="167.64" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="2"/>
<junction x="166.37" y="167.64"/>
</segment>
<segment>
<wire x1="93.98" y1="162.56" x2="93.98" y2="167.64" width="0.1524" layer="91"/>
<pinref part="GND11" gate="1" pin="GND"/>
<pinref part="U$9" gate="G$1" pin="2"/>
<junction x="93.98" y="167.64"/>
</segment>
<segment>
<pinref part="DC2DC_PROCESSOR_" gate="G$1" pin="GND"/>
<pinref part="GND7" gate="1" pin="GND"/>
<pinref part="RTRIM_PROCESSOR" gate="G$1" pin="P$2"/>
<wire x1="-58.42" y1="81.28" x2="-58.42" y2="66.04" width="0.1524" layer="91"/>
<wire x1="-58.42" y1="66.04" x2="-71.12" y2="66.04" width="0.1524" layer="91"/>
<pinref part="PROC_IN_.1UF" gate="G$1" pin="1"/>
<pinref part="PROC_IN10UF" gate="G$1" pin="1"/>
<wire x1="-129.54" y1="91.44" x2="-121.92" y2="91.44" width="0.1524" layer="91"/>
<wire x1="-121.92" y1="91.44" x2="-121.92" y2="66.04" width="0.1524" layer="91"/>
<wire x1="-121.92" y1="66.04" x2="-96.52" y2="66.04" width="0.1524" layer="91"/>
<pinref part="PROC_IN_.1UF1" gate="G$1" pin="1"/>
<wire x1="-96.52" y1="66.04" x2="-88.9" y2="66.04" width="0.1524" layer="91"/>
<wire x1="-88.9" y1="66.04" x2="-71.12" y2="66.04" width="0.1524" layer="91"/>
<wire x1="-137.16" y1="91.44" x2="-129.54" y2="91.44" width="0.1524" layer="91"/>
<pinref part="PROCESSOR_ENABLE_MOSFET" gate="G$1" pin="S"/>
<wire x1="-88.9" y1="76.2" x2="-88.9" y2="66.04" width="0.1524" layer="91"/>
<junction x="-88.9" y="66.04"/>
<junction x="-71.12" y="66.04"/>
<wire x1="-71.12" y1="66.04" x2="-71.12" y2="73.66" width="0.1524" layer="91"/>
<pinref part="PROCESSOR_MOSFET_PULLDOWN" gate="G$1" pin="P$2"/>
<junction x="-96.52" y="66.04"/>
<pinref part="PROC_IN_.1UF2" gate="G$1" pin="1"/>
<wire x1="-144.78" y1="91.44" x2="-137.16" y2="91.44" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$17" gate="G$1" pin="GND"/>
<pinref part="GND14" gate="1" pin="GND"/>
<pinref part="MOTOR_TRIM" gate="G$1" pin="P$2"/>
<wire x1="-58.42" y1="27.94" x2="-58.42" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-58.42" y1="12.7" x2="-71.12" y2="12.7" width="0.1524" layer="91"/>
<pinref part="MOTOR_IN.1UF" gate="G$1" pin="1"/>
<pinref part="MOTOR_IN10UF" gate="G$1" pin="1"/>
<wire x1="-129.54" y1="40.64" x2="-121.92" y2="40.64" width="0.1524" layer="91"/>
<wire x1="-121.92" y1="40.64" x2="-121.92" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-121.92" y1="12.7" x2="-96.52" y2="12.7" width="0.1524" layer="91"/>
<pinref part="MOTOR_IN.1UF1" gate="G$1" pin="1"/>
<wire x1="-96.52" y1="12.7" x2="-88.9" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-88.9" y1="12.7" x2="-71.12" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-129.54" y1="40.64" x2="-144.78" y2="40.64" width="0.1524" layer="91"/>
<pinref part="MOTOR_ENABLE_MOSFET" gate="G$1" pin="S"/>
<wire x1="-88.9" y1="22.86" x2="-88.9" y2="12.7" width="0.1524" layer="91"/>
<wire x1="-71.12" y1="12.7" x2="-71.12" y2="20.32" width="0.1524" layer="91"/>
<junction x="-71.12" y="12.7"/>
<pinref part="MOTOR_MOSFET_PULLDOWN" gate="G$1" pin="P$2"/>
<junction x="-96.52" y="12.7"/>
<pinref part="5V_IN_CAP_1" gate="G$1" pin="1"/>
<junction x="-144.78" y="40.64"/>
<wire x1="-144.78" y1="40.64" x2="-137.16" y2="40.64" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="PROCESSOR_LED" gate="G$1" pin="C"/>
<pinref part="GND15" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND16" gate="1" pin="GND"/>
<pinref part="MOTOR_LED" gate="G$1" pin="C"/>
</segment>
<segment>
<pinref part="PROC10UF" gate="G$1" pin="1"/>
<pinref part="GND17" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PROC.1UF" gate="G$1" pin="1"/>
<pinref part="GND18" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="MOTOR.1UF" gate="G$1" pin="1"/>
<pinref part="GND19" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="MOTOTR10UF" gate="G$1" pin="1"/>
<pinref part="GND20" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="JP1" gate="A" pin="2"/>
<pinref part="GND22" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="JP1" gate="A" pin="1"/>
<pinref part="GND23" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="BEEPER" gate="G$1" pin="-"/>
<pinref part="GND24" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PROC10UF1" gate="G$1" pin="1"/>
<pinref part="GND25" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="MOTOTR10UF1" gate="G$1" pin="1"/>
<pinref part="GND26" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="PROC10UF2" gate="G$1" pin="1"/>
<pinref part="GND27" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="MOTOTR10UF2" gate="G$1" pin="1"/>
<pinref part="GND28" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND13" gate="1" pin="GND"/>
<pinref part="U$13" gate="G$1" pin="1"/>
<junction x="223.52" y="53.34"/>
</segment>
<segment>
<pinref part="PROC10UF3" gate="G$1" pin="1"/>
<pinref part="GND21" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="MOTOTR10UF3" gate="G$1" pin="1"/>
<pinref part="GND33" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="SERVO_HEADER" gate="G$1" pin="1"/>
<pinref part="GND34" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND9" gate="1" pin="GND"/>
<wire x1="-175.26" y1="71.12" x2="-167.64" y2="71.12" width="0.1524" layer="91"/>
<pinref part="U$6" gate="G$1" pin="P$1"/>
</segment>
<segment>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="35.56" y1="101.6" x2="43.18" y2="106.68" width="0.1524" layer="91"/>
<pinref part="U$5" gate="G$1" pin="P$1"/>
</segment>
<segment>
<pinref part="BATTERY_VOLTAGE_DIVIDER_LOW" gate="G$1" pin="P$3"/>
<pinref part="GND4" gate="1" pin="GND"/>
<wire x1="193.04" y1="35.56" x2="193.04" y2="30.48" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$4" gate="G$1" pin="GND"/>
<pinref part="GND5" gate="1" pin="GND"/>
<pinref part="RTRIM_5V" gate="G$1" pin="P$2"/>
<wire x1="-60.96" y1="154.94" x2="-60.96" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-60.96" y1="139.7" x2="-73.66" y2="139.7" width="0.1524" layer="91"/>
<pinref part="5V_IN_CAP_2" gate="G$1" pin="1"/>
<pinref part="5V_IN_CAP_4" gate="G$1" pin="1"/>
<wire x1="-99.06" y1="167.64" x2="-91.44" y2="167.64" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="167.64" x2="-91.44" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="139.7" x2="-86.36" y2="139.7" width="0.1524" layer="91"/>
<pinref part="5V_IN_CAP_3" gate="G$1" pin="1"/>
<wire x1="-86.36" y1="139.7" x2="-73.66" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-99.06" y1="167.64" x2="-106.68" y2="167.64" width="0.1524" layer="91"/>
<wire x1="-73.66" y1="139.7" x2="-73.66" y2="147.32" width="0.1524" layer="91"/>
<junction x="-73.66" y="139.7"/>
<pinref part="5V_REGULATOR_PULLDOWN" gate="G$1" pin="P$2"/>
<junction x="-86.36" y="139.7"/>
<pinref part="MOTOR_IN.1UF4" gate="G$1" pin="1"/>
<wire x1="-114.3" y1="167.64" x2="-106.68" y2="167.64" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND6" gate="1" pin="GND"/>
<pinref part="5V_LED" gate="G$1" pin="C"/>
</segment>
<segment>
<pinref part="5V_OUT_CAP_5" gate="G$1" pin="1"/>
<pinref part="GND35" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="5V_OUT_CAP_4" gate="G$1" pin="1"/>
<pinref part="GND36" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="5V_OUT_CAP_3" gate="G$1" pin="1"/>
<pinref part="GND37" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="5V_OUT_CAP_1" gate="G$1" pin="1"/>
<pinref part="GND38" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="5V_OUT_CAP_2" gate="G$1" pin="1"/>
<pinref part="GND39" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="HIGH-SIDE_SWITCH" gate="G$1" pin="GND"/>
<pinref part="GND8" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND12" gate="1" pin="GND"/>
<wire x1="35.56" y1="172.72" x2="40.64" y2="177.8" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="P$1"/>
</segment>
<segment>
<pinref part="HIGH-SIDE_SWITCH_BUTTON_DIVIDER_LOW" gate="G$1" pin="P$2"/>
<pinref part="GND30" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND29" gate="1" pin="GND"/>
<pinref part="U$3" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<wire x1="114.3" y1="167.64" x2="170.18" y2="111.76" width="0.1524" layer="91"/>
<wire x1="170.18" y1="111.76" x2="233.68" y2="111.76" width="0.1524" layer="91"/>
<pinref part="U$9" gate="G$1" pin="6"/>
<junction x="114.3" y="167.64"/>
<pinref part="U$14" gate="G$1" pin="D6"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<wire x1="109.22" y1="167.64" x2="167.64" y2="109.22" width="0.1524" layer="91"/>
<wire x1="167.64" y1="109.22" x2="233.68" y2="109.22" width="0.1524" layer="91"/>
<pinref part="U$9" gate="G$1" pin="5"/>
<junction x="109.22" y="167.64"/>
<pinref part="U$14" gate="G$1" pin="D7"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<wire x1="104.14" y1="167.64" x2="165.1" y2="106.68" width="0.1524" layer="91"/>
<wire x1="165.1" y1="106.68" x2="233.68" y2="106.68" width="0.1524" layer="91"/>
<pinref part="U$9" gate="G$1" pin="4"/>
<junction x="104.14" y="167.64"/>
<pinref part="U$14" gate="G$1" pin="D8"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<wire x1="99.06" y1="167.64" x2="162.56" y2="104.14" width="0.1524" layer="91"/>
<wire x1="162.56" y1="104.14" x2="233.68" y2="104.14" width="0.1524" layer="91"/>
<pinref part="U$9" gate="G$1" pin="3"/>
<junction x="99.06" y="167.64"/>
<pinref part="U$14" gate="G$1" pin="D9"/>
</segment>
</net>
<net name="N$30" class="0">
<segment>
<pinref part="BATTERY_VOLTAGE_DIVIDER_HIGH" gate="G$1" pin="P$3"/>
<pinref part="BATTERY_VOLTAGE_DIVIDER_LOW" gate="G$1" pin="P$2"/>
<wire x1="233.68" y1="91.44" x2="193.04" y2="50.8" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="A0"/>
</segment>
</net>
<net name="+24V" class="0">
<segment>
<pinref part="HIGH-SIDE_SWITCH" gate="G$1" pin="VBB"/>
<pinref part="P+2" gate="1" pin="+24V"/>
</segment>
<segment>
<pinref part="HIGH-SIDE_BUTTON_DIVIDER_HIGH" gate="G$1" pin="P$3"/>
<pinref part="P+4" gate="1" pin="+24V"/>
</segment>
<segment>
<pinref part="P+7" gate="1" pin="+24V"/>
<pinref part="U$11" gate="G$1" pin="P$1"/>
<wire x1="-147.32" y1="76.2" x2="-139.7" y2="76.2" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+7V" class="0">
<segment>
<wire x1="86.36" y1="167.64" x2="88.9" y2="167.64" width="0.1524" layer="91"/>
<pinref part="SUPPLY1" gate="G$1" pin="+7V"/>
<pinref part="U$9" gate="G$1" pin="1"/>
<junction x="88.9" y="167.64"/>
</segment>
<segment>
<pinref part="U$17" gate="G$1" pin="VOUT"/>
<pinref part="U$17" gate="G$1" pin="VS+"/>
<wire x1="-58.42" y1="53.34" x2="-58.42" y2="48.26" width="0.1524" layer="91"/>
<wire x1="-58.42" y1="53.34" x2="-12.7" y2="53.34" width="0.1524" layer="91"/>
<pinref part="MOTOR_LED_R" gate="G$1" pin="P$3"/>
<wire x1="-12.7" y1="53.34" x2="-7.62" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="53.34" x2="-2.54" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="53.34" x2="2.54" y2="53.34" width="0.1524" layer="91"/>
<wire x1="2.54" y1="53.34" x2="7.62" y2="53.34" width="0.1524" layer="91"/>
<wire x1="7.62" y1="53.34" x2="22.86" y2="53.34" width="0.1524" layer="91"/>
<wire x1="22.86" y1="53.34" x2="43.18" y2="53.34" width="0.1524" layer="91"/>
<junction x="22.86" y="53.34"/>
<pinref part="MOTOR.1UF" gate="G$1" pin="2"/>
<junction x="-12.7" y="53.34"/>
<pinref part="MOTOTR10UF" gate="G$1" pin="2"/>
<junction x="-2.54" y="53.34"/>
<pinref part="SUPPLY2" gate="G$1" pin="+7V"/>
<pinref part="MOTOTR10UF1" gate="G$1" pin="2"/>
<junction x="2.54" y="53.34"/>
<pinref part="MOTOTR10UF2" gate="G$1" pin="2"/>
<junction x="-7.62" y="53.34"/>
<pinref part="MOTOTR10UF3" gate="G$1" pin="2"/>
<junction x="7.62" y="53.34"/>
<pinref part="MOTOR_R_220" gate="G$1" pin="P$3"/>
<junction x="-58.42" y="48.26"/>
</segment>
<segment>
<pinref part="SERVO_HEADER" gate="G$1" pin="2"/>
<pinref part="SUPPLY11" gate="G$1" pin="+7V"/>
<wire x1="170.18" y1="83.82" x2="165.1" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<wire x1="233.68" y1="101.6" x2="137.16" y2="101.6" width="0.1524" layer="91"/>
<wire x1="137.16" y1="101.6" x2="137.16" y2="109.22" width="0.1524" layer="91"/>
<wire x1="137.16" y1="109.22" x2="121.92" y2="109.22" width="0.1524" layer="91"/>
<pinref part="U$3" gate="G$1" pin="5"/>
<pinref part="U$14" gate="G$1" pin="D10"/>
</segment>
</net>
<net name="N$28" class="0">
<segment>
<wire x1="233.68" y1="99.06" x2="134.62" y2="99.06" width="0.1524" layer="91"/>
<wire x1="134.62" y1="99.06" x2="134.62" y2="104.14" width="0.1524" layer="91"/>
<wire x1="134.62" y1="104.14" x2="121.92" y2="104.14" width="0.1524" layer="91"/>
<pinref part="U$3" gate="G$1" pin="4"/>
<pinref part="U$14" gate="G$1" pin="D11"/>
</segment>
</net>
<net name="N$31" class="0">
<segment>
<wire x1="233.68" y1="96.52" x2="132.08" y2="96.52" width="0.1524" layer="91"/>
<wire x1="132.08" y1="96.52" x2="132.08" y2="99.06" width="0.1524" layer="91"/>
<wire x1="132.08" y1="99.06" x2="121.92" y2="99.06" width="0.1524" layer="91"/>
<pinref part="U$3" gate="G$1" pin="3"/>
<pinref part="U$14" gate="G$1" pin="D12"/>
</segment>
</net>
<net name="N$34" class="0">
<segment>
<pinref part="DC2DC_PROCESSOR_" gate="G$1" pin="TRIM"/>
<pinref part="RTRIM_PROCESSOR" gate="G$1" pin="P$3"/>
<pinref part="PROCESSOR_C_680PF" gate="G$1" pin="2"/>
<junction x="-58.42" y="96.52"/>
</segment>
</net>
<net name="N$35" class="0">
<segment>
<pinref part="U$17" gate="G$1" pin="TRIM"/>
<pinref part="MOTOR_TRIM" gate="G$1" pin="P$3"/>
<pinref part="MOTOR_C_680PF" gate="G$1" pin="2"/>
<junction x="-58.42" y="43.18"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<wire x1="-264.16" y1="220.98" x2="53.34" y2="220.98" width="0.1524" layer="91" style="longdash"/>
<wire x1="53.34" y1="220.98" x2="53.34" y2="5.08" width="0.1524" layer="91" style="longdash"/>
<wire x1="53.34" y1="5.08" x2="-264.16" y2="5.08" width="0.1524" layer="91" style="longdash"/>
<wire x1="-264.16" y1="5.08" x2="-264.16" y2="220.98" width="0.1524" layer="91" style="longdash"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<wire x1="81.28" y1="220.98" x2="271.78" y2="220.98" width="0.1524" layer="91" style="longdash"/>
<wire x1="271.78" y1="220.98" x2="271.78" y2="5.08" width="0.1524" layer="91" style="longdash"/>
<wire x1="271.78" y1="5.08" x2="81.28" y2="5.08" width="0.1524" layer="91" style="longdash"/>
<wire x1="81.28" y1="5.08" x2="81.28" y2="220.98" width="0.1524" layer="91" style="longdash"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="PROCESSOR_LED_R" gate="G$1" pin="P$2"/>
<pinref part="PROCESSOR_LED" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="MOTOR_LED_R" gate="G$1" pin="P$2"/>
<pinref part="MOTOR_LED" gate="G$1" pin="A"/>
</segment>
</net>
<net name="5V_ENABLE" class="0">
<segment>
<pinref part="HIGH-SIDE_BLOCKING_DIODE" gate="G$1" pin="C"/>
<pinref part="HIGH-SIDE_SWITCH" gate="G$1" pin="IN"/>
<wire x1="-223.52" y1="175.26" x2="-215.9" y2="175.26" width="0.1524" layer="91"/>
<wire x1="-215.9" y1="175.26" x2="-208.28" y2="175.26" width="0.1524" layer="91"/>
<wire x1="-215.9" y1="175.26" x2="-215.9" y2="142.24" width="0.1524" layer="91"/>
<wire x1="-215.9" y1="142.24" x2="-203.2" y2="142.24" width="0.1524" layer="91"/>
<label x="-213.36" y="142.24" size="1.4224" layer="95"/>
</segment>
<segment>
<wire x1="233.68" y1="114.3" x2="208.28" y2="114.3" width="0.1524" layer="91"/>
<label x="208.28" y="114.3" size="1.778" layer="95"/>
<pinref part="U$14" gate="G$1" pin="D5"/>
</segment>
</net>
<net name="+5V/1" class="0">
<segment>
<pinref part="SUPPLY4" gate="G$1" pin="+5V/1"/>
<wire x1="213.36" y1="35.56" x2="233.68" y2="35.56" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="5V"/>
</segment>
<segment>
<wire x1="163.83" y1="167.64" x2="157.48" y2="167.64" width="0.1524" layer="91"/>
<pinref part="SUPPLY9" gate="G$1" pin="+5V/1"/>
<pinref part="U$10" gate="G$1" pin="1"/>
<junction x="163.83" y="167.64"/>
</segment>
<segment>
<wire x1="191.77" y1="167.64" x2="185.42" y2="167.64" width="0.1524" layer="91"/>
<pinref part="SUPPLY10" gate="G$1" pin="+5V/1"/>
<pinref part="U$12" gate="G$1" pin="1"/>
<junction x="191.77" y="167.64"/>
</segment>
<segment>
<pinref part="U$4" gate="G$1" pin="VOUT"/>
<pinref part="U$4" gate="G$1" pin="VS+"/>
<wire x1="-60.96" y1="180.34" x2="-60.96" y2="175.26" width="0.1524" layer="91"/>
<wire x1="-60.96" y1="180.34" x2="-15.24" y2="180.34" width="0.1524" layer="91"/>
<pinref part="5V_LED_R1" gate="G$1" pin="P$3"/>
<wire x1="-15.24" y1="180.34" x2="-10.16" y2="180.34" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="180.34" x2="-5.08" y2="180.34" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="180.34" x2="0" y2="180.34" width="0.1524" layer="91"/>
<wire x1="0" y1="180.34" x2="5.08" y2="180.34" width="0.1524" layer="91"/>
<wire x1="5.08" y1="180.34" x2="20.32" y2="180.34" width="0.1524" layer="91"/>
<wire x1="20.32" y1="180.34" x2="35.56" y2="180.34" width="0.1524" layer="91"/>
<junction x="20.32" y="180.34"/>
<pinref part="5V_OUT_CAP_5" gate="G$1" pin="2"/>
<junction x="-15.24" y="180.34"/>
<pinref part="5V_OUT_CAP_4" gate="G$1" pin="2"/>
<junction x="-5.08" y="180.34"/>
<pinref part="5V_OUT_CAP_3" gate="G$1" pin="2"/>
<junction x="0" y="180.34"/>
<pinref part="5V_OUT_CAP_1" gate="G$1" pin="2"/>
<junction x="-10.16" y="180.34"/>
<pinref part="5V_OUT_CAP_2" gate="G$1" pin="2"/>
<junction x="5.08" y="180.34"/>
<wire x1="40.64" y1="172.72" x2="35.56" y2="180.34" width="0.1524" layer="91"/>
<pinref part="SUPPLY3" gate="G$1" pin="+5V/1"/>
<junction x="35.56" y="180.34"/>
<pinref part="U$2" gate="G$1" pin="P$2"/>
<pinref part="5V_R_220" gate="G$1" pin="P$3"/>
<junction x="-60.96" y="175.26"/>
</segment>
<segment>
<pinref part="SUPPLY14" gate="G$1" pin="+5V/1"/>
<pinref part="U$3" gate="G$1" pin="6"/>
</segment>
</net>
<net name="BUTTON_DETECT" class="0">
<segment>
<wire x1="233.68" y1="78.74" x2="180.34" y2="78.74" width="0.1524" layer="91"/>
<label x="180.34" y="78.74" size="1.778" layer="95"/>
<pinref part="U$14" gate="G$1" pin="A5"/>
</segment>
<segment>
<pinref part="HIGH-SIDE_SWITCH_BUTTON_DIVIDER_LOW" gate="G$1" pin="P$3"/>
<pinref part="HIGH-SIDE_BLOCKING_DIODE" gate="G$1" pin="A"/>
<wire x1="-228.6" y1="175.26" x2="-243.84" y2="175.26" width="0.1524" layer="91"/>
<wire x1="-243.84" y1="175.26" x2="-243.84" y2="165.1" width="0.1524" layer="91"/>
<wire x1="-241.3" y1="180.34" x2="-243.84" y2="180.34" width="0.1524" layer="91"/>
<wire x1="-243.84" y1="180.34" x2="-243.84" y2="175.26" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="P$2"/>
<wire x1="-243.84" y1="165.1" x2="-223.52" y2="165.1" width="0.1524" layer="91"/>
<label x="-238.76" y="165.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="PROCESSOR_ENABLE" class="0">
<segment>
<pinref part="PROCESSOR_ENABLE_MOSFET" gate="G$1" pin="G"/>
<pinref part="PROCESSOR_MOSFET_PULLDOWN" gate="G$1" pin="P$3"/>
<wire x1="-96.52" y1="81.28" x2="-116.84" y2="81.28" width="0.1524" layer="91"/>
<label x="-119.38" y="81.28" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="233.68" y1="83.82" x2="180.34" y2="83.82" width="0.1524" layer="91"/>
<label x="180.34" y="83.82" size="1.778" layer="95"/>
<pinref part="U$14" gate="G$1" pin="A3"/>
</segment>
</net>
<net name="MOTORS_ENABLE" class="0">
<segment>
<pinref part="MOTOR_ENABLE_MOSFET" gate="G$1" pin="G"/>
<pinref part="MOTOR_MOSFET_PULLDOWN" gate="G$1" pin="P$3"/>
<wire x1="-96.52" y1="27.94" x2="-119.38" y2="27.94" width="0.1524" layer="91"/>
<label x="-119.38" y="27.94" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="233.68" y1="81.28" x2="180.34" y2="81.28" width="0.1524" layer="91"/>
<label x="180.34" y="81.28" size="1.778" layer="95"/>
<pinref part="U$14" gate="G$1" pin="A4"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="DC2DC_PROCESSOR_" gate="G$1" pin="ON/OFF"/>
<pinref part="PROCESSOR_PULLUP" gate="G$1" pin="P$2"/>
<pinref part="PROCESSOR_ENABLE_MOSFET" gate="G$1" pin="D"/>
<junction x="-88.9" y="91.44"/>
<wire x1="-88.9" y1="91.44" x2="-83.82" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U$17" gate="G$1" pin="ON/OFF"/>
<pinref part="MOTOR_PULLUP" gate="G$1" pin="P$2"/>
<pinref part="MOTOR_ENABLE_MOSFET" gate="G$1" pin="D"/>
<junction x="-88.9" y="38.1"/>
<wire x1="-88.9" y1="38.1" x2="-83.82" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+5V/2" class="0">
<segment>
<pinref part="DC2DC_PROCESSOR_" gate="G$1" pin="VOUT"/>
<pinref part="DC2DC_PROCESSOR_" gate="G$1" pin="VS+"/>
<wire x1="-58.42" y1="106.68" x2="-58.42" y2="101.6" width="0.1524" layer="91"/>
<wire x1="-58.42" y1="106.68" x2="-12.7" y2="106.68" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="106.68" x2="-7.62" y2="106.68" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="106.68" x2="-2.54" y2="106.68" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="106.68" x2="2.54" y2="106.68" width="0.1524" layer="91"/>
<wire x1="2.54" y1="106.68" x2="7.62" y2="106.68" width="0.1524" layer="91"/>
<pinref part="PROCESSOR_LED_R" gate="G$1" pin="P$3"/>
<pinref part="PROC.1UF" gate="G$1" pin="2"/>
<junction x="-12.7" y="106.68"/>
<pinref part="PROC10UF" gate="G$1" pin="2"/>
<junction x="-2.54" y="106.68"/>
<pinref part="PROC10UF1" gate="G$1" pin="2"/>
<junction x="2.54" y="106.68"/>
<pinref part="PROC10UF2" gate="G$1" pin="2"/>
<junction x="-7.62" y="106.68"/>
<wire x1="7.62" y1="106.68" x2="35.56" y2="106.68" width="0.1524" layer="91"/>
<pinref part="SUPPLY8" gate="G$1" pin="+5V/2"/>
<wire x1="35.56" y1="106.68" x2="25.4" y2="106.68" width="0.1524" layer="91"/>
<junction x="35.56" y="106.68"/>
<pinref part="PROC10UF3" gate="G$1" pin="2"/>
<junction x="7.62" y="106.68"/>
<wire x1="43.18" y1="101.6" x2="35.56" y2="106.68" width="0.1524" layer="91"/>
<pinref part="U$5" gate="G$1" pin="P$2"/>
<pinref part="PROCESSOR_R_220" gate="G$1" pin="P$3"/>
<junction x="-58.42" y="101.6"/>
</segment>
</net>
<net name="SERVO_PWM" class="0">
<segment>
<pinref part="SERVO_HEADER" gate="G$1" pin="3"/>
<wire x1="233.68" y1="86.36" x2="165.1" y2="86.36" width="0.1524" layer="91"/>
<label x="180.34" y="86.36" size="1.778" layer="95"/>
<pinref part="U$14" gate="G$1" pin="A2"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="U$13" gate="G$1" pin="3"/>
<wire x1="223.52" y1="58.42" x2="233.68" y2="58.42" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="TXI"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="U$13" gate="G$1" pin="2"/>
<wire x1="223.52" y1="55.88" x2="233.68" y2="55.88" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="RXD"/>
</segment>
</net>
<net name="+21V" class="0">
<segment>
<pinref part="BATTERY_VOLTAGE_DIVIDER_HIGH" gate="G$1" pin="P$2"/>
<pinref part="SUPPLY13" gate="G$1" pin="+21V"/>
</segment>
<segment>
<pinref part="HIGH-SIDE_SWITCH" gate="G$1" pin="OUT"/>
<pinref part="SUPPLY5" gate="G$1" pin="+21V"/>
</segment>
<segment>
<pinref part="U$4" gate="G$1" pin="VIN"/>
<junction x="-91.44" y="180.34"/>
<pinref part="5V_IN_CAP_2" gate="G$1" pin="2"/>
<pinref part="5V_IN_CAP_4" gate="G$1" pin="2"/>
<wire x1="-99.06" y1="180.34" x2="-91.44" y2="180.34" width="0.1524" layer="91"/>
<pinref part="5V_IN_CAP_3" gate="G$1" pin="2"/>
<wire x1="-99.06" y1="180.34" x2="-106.68" y2="180.34" width="0.1524" layer="91"/>
<wire x1="-91.44" y1="180.34" x2="-86.36" y2="180.34" width="0.1524" layer="91"/>
<pinref part="SUPPLY6" gate="G$1" pin="+21V"/>
<pinref part="MOTOR_IN.1UF4" gate="G$1" pin="2"/>
<wire x1="-114.3" y1="180.34" x2="-106.68" y2="180.34" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="DC2DC_PROCESSOR_" gate="G$1" pin="VIN"/>
<junction x="-88.9" y="106.68"/>
<wire x1="-88.9" y1="111.76" x2="-88.9" y2="106.68" width="0.1524" layer="91"/>
<pinref part="PROC_IN_.1UF" gate="G$1" pin="2"/>
<wire x1="-88.9" y1="106.68" x2="-121.92" y2="106.68" width="0.1524" layer="91"/>
<wire x1="-121.92" y1="106.68" x2="-129.54" y2="106.68" width="0.1524" layer="91"/>
<wire x1="-129.54" y1="106.68" x2="-129.54" y2="104.14" width="0.1524" layer="91"/>
<pinref part="PROC_IN10UF" gate="G$1" pin="2"/>
<wire x1="-121.92" y1="104.14" x2="-121.92" y2="106.68" width="0.1524" layer="91"/>
<wire x1="-129.54" y1="106.68" x2="-137.16" y2="106.68" width="0.1524" layer="91"/>
<pinref part="PROC_IN_.1UF1" gate="G$1" pin="2"/>
<wire x1="-137.16" y1="106.68" x2="-137.16" y2="104.14" width="0.1524" layer="91"/>
<pinref part="PROCESSOR_PULLUP" gate="G$1" pin="P$3"/>
<wire x1="-88.9" y1="106.68" x2="-83.82" y2="106.68" width="0.1524" layer="91"/>
<pinref part="PROC_IN_.1UF2" gate="G$1" pin="2"/>
<wire x1="-144.78" y1="106.68" x2="-137.16" y2="106.68" width="0.1524" layer="91"/>
<wire x1="-144.78" y1="104.14" x2="-144.78" y2="106.68" width="0.1524" layer="91"/>
<pinref part="SUPPLY7" gate="G$1" pin="+21V"/>
</segment>
<segment>
<pinref part="U$17" gate="G$1" pin="VIN"/>
<junction x="-88.9" y="53.34"/>
<pinref part="MOTOR_IN.1UF" gate="G$1" pin="2"/>
<pinref part="MOTOR_IN10UF" gate="G$1" pin="2"/>
<wire x1="-129.54" y1="53.34" x2="-121.92" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-121.92" y1="53.34" x2="-88.9" y2="53.34" width="0.1524" layer="91"/>
<pinref part="MOTOR_IN.1UF1" gate="G$1" pin="2"/>
<wire x1="-129.54" y1="53.34" x2="-144.78" y2="53.34" width="0.1524" layer="91"/>
<pinref part="MOTOR_PULLUP" gate="G$1" pin="P$3"/>
<wire x1="-88.9" y1="53.34" x2="-83.82" y2="53.34" width="0.1524" layer="91"/>
<pinref part="SUPPLY12" gate="G$1" pin="+21V"/>
<pinref part="5V_IN_CAP_1" gate="G$1" pin="2"/>
<junction x="-144.78" y="53.34"/>
<wire x1="-144.78" y1="53.34" x2="-137.16" y2="53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$27" class="0">
<segment>
<wire x1="233.68" y1="88.9" x2="210.82" y2="88.9" width="0.1524" layer="91"/>
<wire x1="210.82" y1="88.9" x2="210.82" y2="93.98" width="0.1524" layer="91"/>
<wire x1="210.82" y1="93.98" x2="121.92" y2="93.98" width="0.1524" layer="91"/>
<pinref part="U$3" gate="G$1" pin="2"/>
<pinref part="U$14" gate="G$1" pin="A1"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="U$4" gate="G$1" pin="TRIM"/>
<pinref part="RTRIM_5V" gate="G$1" pin="P$3"/>
<pinref part="5V_C_680PF" gate="G$1" pin="2"/>
<junction x="-60.96" y="170.18"/>
</segment>
</net>
<net name="N$29" class="0">
<segment>
<pinref part="5V_LED_R1" gate="G$1" pin="P$2"/>
<pinref part="5V_LED" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$32" class="0">
<segment>
<pinref part="U$4" gate="G$1" pin="ON/OFF"/>
<wire x1="-86.36" y1="154.94" x2="-86.36" y2="165.1" width="0.1524" layer="91"/>
<pinref part="5V_REGULATOR_PULLDOWN" gate="G$1" pin="P$3"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="HIGH-SIDE_BUTTON_DIVIDER_HIGH" gate="G$1" pin="P$2"/>
<wire x1="-241.3" y1="185.42" x2="-243.84" y2="185.42" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="U$11" gate="G$1" pin="P$2"/>
<wire x1="-167.64" y1="76.2" x2="-175.26" y2="76.2" width="0.1524" layer="91"/>
<pinref part="U$6" gate="G$1" pin="P$2"/>
</segment>
</net>
<net name="N$33" class="0">
<segment>
<pinref part="5V_R_220" gate="G$1" pin="P$2"/>
<wire x1="-45.72" y1="175.26" x2="-45.72" y2="170.18" width="0.1524" layer="91"/>
<pinref part="5V_C_680PF" gate="G$1" pin="1"/>
<wire x1="-45.72" y1="170.18" x2="-48.26" y2="170.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$36" class="0">
<segment>
<pinref part="PROCESSOR_R_220" gate="G$1" pin="P$2"/>
<wire x1="-43.18" y1="101.6" x2="-43.18" y2="96.52" width="0.1524" layer="91"/>
<pinref part="PROCESSOR_C_680PF" gate="G$1" pin="1"/>
<wire x1="-43.18" y1="96.52" x2="-45.72" y2="96.52" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$37" class="0">
<segment>
<pinref part="MOTOR_R_220" gate="G$1" pin="P$2"/>
<wire x1="-43.18" y1="48.26" x2="-43.18" y2="43.18" width="0.1524" layer="91"/>
<pinref part="MOTOR_C_680PF" gate="G$1" pin="1"/>
<wire x1="-43.18" y1="43.18" x2="-45.72" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U$12" gate="G$1" pin="3"/>
<wire x1="196.85" y1="110.49" x2="196.85" y2="167.64" width="0.1524" layer="91"/>
<wire x1="233.68" y1="73.66" x2="196.85" y2="110.49" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="A7"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="U$10" gate="G$1" pin="3"/>
<wire x1="168.91" y1="140.97" x2="168.91" y2="167.64" width="0.1524" layer="91"/>
<wire x1="233.68" y1="76.2" x2="168.91" y2="140.97" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="A6"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<wire x1="233.68" y1="116.84" x2="142.24" y2="116.84" width="0.1524" layer="91"/>
<wire x1="142.24" y1="116.84" x2="132.08" y2="127" width="0.1524" layer="91"/>
<pinref part="BEEPER" gate="G$1" pin="+"/>
<wire x1="132.08" y1="127" x2="101.6" y2="127" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="D4"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>
