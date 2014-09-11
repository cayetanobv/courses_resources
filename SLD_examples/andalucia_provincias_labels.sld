<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:se="http://www.opengis.net/se">
  <NamedLayer>
    <se:Name>da03_provincia</se:Name>
    <UserStyle>
      <se:Name>da03_provincia</se:Name>
      <se:FeatureTypeStyle>
        <se:Rule>
          <se:Name>Single symbol</se:Name>
          <se:PolygonSymbolizer>
            <se:Fill>
              <se:SvgParameter name="fill">#a8fabc</se:SvgParameter>
              <se:SvgParameter name="fill-opacity">0.5</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
              <se:SvgParameter name="stroke">#00aa00</se:SvgParameter>
              <se:SvgParameter name="stroke-width">0.26</se:SvgParameter>
              <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
          <se:TextSymbolizer>
	         <se:Label>
	           <ogc:PropertyName>PROVINCIA</ogc:PropertyName>
	         </se:Label>
	         <se:Font>
	           <se:SvgParameter name="font-family">Arial</se:SvgParameter>
	           <se:SvgParameter name="font-size">12</se:SvgParameter>
	           <se:SvgParameter name="font-style">normal</se:SvgParameter>
	           <se:SvgParameter name="font-weight">bold</se:SvgParameter>
	         </se:Font>
	         <se:LabelPlacement>
	           <se:PointPlacement>
	             <se:AnchorPoint>
	               <se:AnchorPointX>0.0</se:AnchorPointX>
	               <se:AnchorPointY>0.0</se:AnchorPointY>
	             </se:AnchorPoint>
	             <se:Displacement>
	               <se:DisplacementX>0</se:DisplacementX>
	               <se:DisplacementY>0</se:DisplacementY>
	             </se:Displacement>
	             <se:Rotation>0</se:Rotation>
	           </se:PointPlacement>
	         </se:LabelPlacement>
	         <se:Fill>
	           <se:SvgParameter name="fill">#990099</se:SvgParameter>
	         </se:Fill>
			</se:TextSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>


