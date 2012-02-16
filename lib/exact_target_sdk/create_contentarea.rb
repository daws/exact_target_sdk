module ExactTargetSDK

	class ContentArea < APIObject
		#Documentation here: http://docs.code.exacttarget.com/020_Web_Service_Guide/Objects/ContentArea
		#Layout options are HTMLWrapped, RawText, SMS
		property 'Layout', true
		property 'Content', true
		property 'Name', true
		#CategoryID is the folder to save contentarea in. 
		#Find this by hovering over the folder in ET's interface and noting the cid attribute...yeah...that's the best way
		property 'CategoryID', true
	end

end
