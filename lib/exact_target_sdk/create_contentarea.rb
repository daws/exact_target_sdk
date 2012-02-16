module ExactTargetSDK

	class ContentArea < APIObject
		#Layout options are HTMLWrapped, RawText, SMS
		property 'Layout', true
		property 'Content', true
		property 'Name', true
		#CategoryID is the folder to save contentarea in. 
		#Find this by hovering over the folder in ET's interface and noting the cid attribute...yeah...that's the best way
		property 'CategoryID', true
	end

end
