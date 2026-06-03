
  final basicProfileStep2Response = {
		"screenTitle": "Basic profile",
    "continue_button": {
      "buttonText": "Next",
      "endpoint": "",
      "body": {}
    },
		"sections": [
      {
        "id": "__#1__",
				"type": "step_counter",
				"style": "basic",
				"content": [
					{
						"total": 2,
						"current": 2,
					}
				]
			},
			
			{
        "id": "__#2__",
				"type": "info_text",
				"style": "warning",
				"content": [
					{
						"type": "text",
						"item": "In order for us to guide you through the onboarding and investment process, we require you to complete a short suitability check questionnaire, which is mandated by FCA. We have designed the questionnaire to enable us to identify which investment product suits your objectives, needs, and risk tolerance."
					}
				]
			},
			{
        "id": "__#3__",
				"type": "section_title",
				"style": "basic",
				"content": [
					{
						"type": "image",
						"item": "sheild"
					},
					{
						"type": "text",
						"item": "Investment Profile Category"
					}
				]
			},
      {
        "id": "__#4__",
				"type": "app_text_field",
				"style": "basic",
        "required": false,
        "is_input": true,
				"content": [
					{
						"title": "Name of investor",
						"prefill": "Oliver James",
						"secure": false,
            "enable": false,
						"id": "first_name"
					}
				]
			},
      {
        "id": "__#5__",
				"type": "section_title",
				"style": "basic",
				"content": [
					{
						"type": "text",
						"item": "1. Income details"
					}
				]
			},
			{
        "id": "__#6__",
				"type": "grid_selection", //list_selection, grid_selection
				"style": "basic",
        "required": false,
        "is_input": true,
				"content": [
					{
						"id": "1",
						"type": "option",
						"title": "Less than £10,000",
						// "subtitle": "",
						"valid": true,
						"enable": true,
					},
					{
						"id": "2",
						"type": "option",
						"title": "£10,000 – £49,999",
						// "subtitle": "Subscriber is acting as nominee / trustee for another individual",
						"valid": true,
						"enable": true,
					},
          {
						"id": "3",
						"type": "option",
						"title": "£50,000 – £99,999",
						// "subtitle": "Subscriber is acting as nominee / trustee for another individual",
						"valid": true,
						"enable": true,
					},
          {
						"id": "4",
						"type": "option",
						"title": "Less than £10,000",
						// "subtitle": "Subscriber is acting as nominee / trustee for another individual",
						"valid": false,
						"enable": true,
					}
				]
			},
      {
        "id": "__#7__",
				"type": "section_title",
				"style": "basic",
				"content": [
					{
						"type": "text",
						"item": "2. Cash and liquid assets range"
					}
				]
			},
      {
        "id": "__#8__",
				"type": "grid_selection", //list_selection, grid_selection
				"style": "basic",
        "required": false,
        "is_input": true,
				"content": [
					{
						"id": "1",
						"type": "option",
						"title": "Less than £10,000",
						// "subtitle": "",
						"valid": true,
						"enable": true,
					},
					{
						"id": "2",
						"type": "option",
						"title": "£10,000 – £49,999",
						// "subtitle": "Subscriber is acting as nominee / trustee for another individual",
						"valid": true,
						"enable": true,
					},
          {
						"id": "3",
						"type": "option",
						"title": "£50,000 – £99,999",
						// "subtitle": "Subscriber is acting as nominee / trustee for another individual",
						"valid": true,
						"enable": true,
					},
          {
						"id": "4",
						"type": "option",
						"title": "Less than £10,000",
						// "subtitle": "Subscriber is acting as nominee / trustee for another individual",
						"valid": false,
						"enable": true,
					},
				]
			},
      {
        "id": "__#9__",
				"type": "app_checkbox",
				"style": "basic",
        "required": false,
        "is_input": true,
				"content": [
					{
						"id": "checkbox_1",
						"title": "I understand that I will need to review a Limited Partnership Agreement and sign a subscription agreement to become a part of the LP Fund at the time of investment",
						"value": true,
						"enable": false,
					}
				]
			},
			{
        "id": "__#10__",
				"type": "app_checkbox",
				"style": "basic",
        "required": false,
        "is_input": true,
				"content": [
					{
						"id": "checkbox_2",
						"title": "I hereby declare that I, The Subscriber, or any person on whose behalf the Subscriber is applying to acquire beneficial interest in the Partnership, am not a citizen or resident of the United States for tax purposes or otherwise",
						"value": true,
						"enable": true,
					}
				]
			},
      {
        "id": "__#11__",
				"type": "continue_button",
				"style": "basic",
				"content": [
					{
            "title": "Submit",
            "placeholder": "Next",
            "body":  {"a": "a"},
            "endpoint": "/submit-step-1",
            "route": "main_screen",
            "route_action": "replace_new", // replace_new, push_new, pop_current
          }
				]
			},
			
		]
	};