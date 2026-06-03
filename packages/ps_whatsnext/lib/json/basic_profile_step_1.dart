final basicProfileStep1Response = {
		"screenTitle": "Suitability Check",
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
						"current": 1,
					}
				]
			},
			{
        "id": "__#2__",
				"type": "info_text",
				"style": "success",
				"content": [
					{
						"type": "image",
						"item": "sheild"
					},
					{
						"type": "text",
						"item": "Your data is protected with advanced security and privacy measures"
					}
				]
			},
			{
        "id": "__#3__",
				"type": "info_text",
				"style": "warning",
				"content": [
					{
						"type": "text",
						"item": "The information you provide will be securely used to complete your Anti-Money Laundering (AML) verification, in accordance with regulatory requirements and compliance standards."
					}
				]
			},
      {
        "id": "__#4__",
				"type": "section_title",
				"style": "basic",
				"content": [
					{
						"type": "image",
						"item": "info"
					},
					{
						"type": "text",
						"item": "Investment Profile Category"
					}
				]
			},
			{
        "id": "__#5__",
				"type": "grid_selection", //list_selection, grid_selection
				"style": "basic",
        "required": true,
        "is_input": true,
				"content": [
					{
						"id": "1",
						"type": "option",
						"title": "info",
						"subtitle": "Individual",
						"valid": false,
						"enable": true,
            "prefill": false,
					},
					{
						"id": "2",
						"type": "option",
						"title": "info",
						"subtitle": "Subscriber is acting as nominee / trustee for another individual",
						"valid": false,
						"enable": true,
					},
          {
						"id": "3",
						"type": "option",
						"title": "info",
						"subtitle": "Subscriber is acting as nominee / trustee for another individual",
						"valid": true,
						"enable": true,
					},
          {
						"id": "4",
						"type": "option",
						"title": "info",
						"subtitle": "Subscriber is acting as nominee / trustee for another individual",
						"valid": true,
						"enable": true,
					}
				]
			},
			{
        "id": "__#6__",
				"type": "section_title",
				"style": "basic",
				"content": [
					{
						"type": "image",
						"item": "person"
					},
					{
						"type": "text",
						"item": "Personal details"
					}
				]
			},
      {
        "id": "__#7__",
        "type": "inbuild_sheet_selection",
        "style": "basic",
        "required": true,
        "is_input": true,
        "content": [
          {
            "title": "Gender",
            "id": "gender_sheet_selection"
          }
        ]
      },
      {
        "id": "__#8__",
        "type": "inbuild_sheet_selection",
        "style": "basic",
        "required": true,
        "is_input": true,
        "content": [
          {
            "title": "Title",
            "id": "name_title_sheet_selection"
          }
        ]
      },
      {
        "id": "__#9__",
				"type": "app_text_field",
				"style": "basic",
        "required": true,
        "is_input": true,
				"content": [
					{
						"title": "First Name",
						"prefill": "",
						"secure": false,
						"id": "first_name",
            "error": "Please enter a valid name",
					}
				]
			},
      {
        "id": "__#10__",
				"type": "app_text_field",
				"style": "basic",
        "required": false,
        "is_input": true,
				"content": [
					{
						"title": "Middle Name",
						"prefill": "",
						"secure": false,
						"id": "middle_name",
            "validation": "",
            "error": "",
					}
				]
			},
      {
        "id": "__#11__",
				"type": "app_text_field",
				"style": "basic",
        "required": true,
        "is_input": true,
				"content": [
					{
						"title": "Last Name",
						"prefill": "",
						"secure": false,
						"id": "last_name"
					}
				]
			},
      {
        "id": "__#12__",
				"type": "app_text_field",
				"style": "basic",
        "required": true,
        "is_input": true,
				"content": [
					{
						"title": "Email",
						"prefill": "",
						"secure": false,
						"id": "email"
					}
				]
			},
      {
        "id": "__#13__",
        "type": "inbuild_sheet_selection",
        "style": "basic",
        "required": true,
        "is_input": true,
        "content": [
          {
            "title": "Country",
            "id": "country_sheet_selection"
          }
        ]
      },
      {
        "id": "__#14__",
				"type": "section_title",
				"style": "basic",
				"content": [
					{
						"type": "image",
						"item": "person"
					},
					{
						"type": "text",
						"item": "Address details"
					}
				]
			},
			{
        "id": "__#15__",
				"type": "section_info",
				"style": "basic",
				"content": [
					{
						"type": "text",
						"item": "Please ensure all details are correct"
					}
				]
			},
      {
        "id": "__#16__",
        "type": "dynamic_select_screen",
        "style": "basic",
        "required": true,
        "is_input": true,
        "content": [
          {
            "title": "Address",
            "placeholder": "Address Search",
            "body":  {"a": "a"},
            "endpoint": "/search-item"
          }
        ]
      },
      {
        "id": "__#17__",
				"type": "app_text_field",
				"style": "basic",
        "required": true,
        "is_input": true,
				"content": [
					{
						"title": "Address Line 1",
						"prefill": "",
						"secure": false,
						"id": "first_name"
					}
				]
			},
      {
        "id": "__#18__",
				"type": "app_text_field",
				"style": "basic",
        "required": true,
        "is_input": true,
				"content": [
					{
						"title": "Address Line 2",
						"prefill": "",
						"secure": false,
						"id": "first_name"
					}
				]
			},
      {
        "id": "__#19__",
				"type": "app_text_field",
				"style": "basic",
        "required": true,
        "is_input": true,
				"content": [
					{
						"title": "ZIP Code",
						"prefill": "",
						"secure": false,
						"id": "first_name"
					}
				]
			},
      {
        "id": "__#20__",
        "type": "inbuild_sheet_selection",
        "style": "basic",
        "required": false,
        "is_input": true,
        "content": [
          {
            "title": "Country",
            "id": "country_sheet_selection"
          }
        ]
      },
      {
        "id": "__#20.1__",
				"type": "app_checkbox",
				"style": "basic",
        "required": false,
        "is_input": true,
				"content": [
					{
						"id": "checkbox_2",
						"title": "I hereby declare that I, The Subscriber, or any person on whose behalf the Subscriber is applying to acquire beneficial interest in the Partnership, am not a citizen or resident of the United States for tax purposes or otherwise",
						"value": false,
						"enable": true,
					}
				]
			},
      {
        "id": "__#21__",
				"type": "continue_button",
				"style": "basic",
				"content": [
					{
            "title": "Next",
            "placeholder": "Next",
            "body": {"a": "a"},
            "endpoint": "/submit-step-1",
            "route_action": "replace_new", // replace_new, push_new, pop_current
          }
				]
			},
		]
	};