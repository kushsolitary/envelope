backgroundLayer = new BackgroundLayer
	backgroundColor: '#f2f2f2'

Framer.Defaults.Animation = {
	curve: "spring(100,15,0)"
}

# Because rich people don't have the luxury of iPhone 5 </3
Framer.Device.deviceType = "iphone-6-spacegray"

# This imports all the layers for "Configuration" into configurationLayers2
s = Framer.Importer.load "imported/envelope"

# Preparing the scene for the show
s.content2.y += 40
s.content3.y += 40

s.flap.originY = 0.98

# Start animation on button click mothafucka
s.button1.on Events.Click, ->
	# Things to do on-click
	#
	# 1. Change the button to s.button2
	# 2. Scale out the top page and introduce more pages as in stack
	# 3. Bring the envelope (and flap) from bottom to mid and also move the page
	# 	 stack a little down
	# 4. After a pause, move everything up and make s.neecha_wala appear from bottom
	# 5. That's all mothafucka

	s.button1.visible = false

	s.content1.animate
		properties: { scale: 0.9, y: s.content1.y + 5 }

	s.content2.animate
		properties: { y: s.content2.y - 40 }

	s.content3.animate
		properties: { y: s.content3.y - 40 }

	# After a delay, bring envelope up
	Utils.delay 0.5, ->
		s.envelope.animate
			properties: {y: s.envelope.y - 900}
			curve: "spring(200,40,0)"

		s.flap.animate
			properties: {y: s.flap.y - 900}
			curve: "spring(200,40,0)"

		s.neeche_wala.animate
			properties: {y: s.neeche_wala.y - 900}

	Utils.delay 1, ->
		s.content1.animate
			properties: {y: s.content1.y + 230}
		s.content2.animate
			properties: {y: s.content2.y + 230}
		s.content3.animate
			properties: {y: s.content3.y + 230}

	Utils.delay 1.5, ->
		s.flap.index = s.envelope.index + 1
		s.flap.animate
			properties: {rotationX: -180}

	Utils.delay 2, ->
		s.envelope.animate
			properties: {y: s.envelope.y - 900}
			curve: "spring(200,40,0)"

		s.flap.animate
			properties: {y: s.flap.y - 900}
			curve: "spring(200,40,0)"

		s.content1.animate
			properties: {y: s.content1.y - 960}
		s.content2.animate
			properties: {y: s.content2.y - 960}
		s.content3.animate
			properties: {y: s.content3.y - 960}

		s.neeche_wala.animate
			properties: {y: s.neeche_wala.y - 940}
			curve: "spring(200,40,0)"


