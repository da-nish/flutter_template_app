final whatsNextSteps = {
  "progress": 20.0,
  "table": {
    "title": "What’s Next?",
    "subtitle": "Step 1/9",
    "rows": [
      {
        "key": "Opportunity Name",
        "value": [
          {
            "type": "text",
            "text": "Prestige Tech Platina, Bangalore"
          }
        ]
      },
      {
        "key": "Investment Amount",
        "value": [
          {
            "type": "text",
            "text": "₹80,00,000"
          }
        ]
      },
      {
        "key": "Investor Profile",
        "value": [
          {
            "type": "text",
            "text": "Praveen Kumar (self)"
          }
        ]
      },
    ]
  },
  "steps": [
    {
      "id": "step_1",
      "title": "Call Scheduled",
      "expanded": false,
      "status": "completed", 

      "description": [
        {
          "type": "text",
          "text": "A call with your representative is currently scheduled on Mon, Jul 28, 2020 at 10:30 AM (BST)."
        }
      ],

      "buttons": [
        {
          "text": "Complete Suitability Check",
          "style": "primary",
          "enabled": true,
          "action": {
            "type": "navigate",
            "route": "/schedule-call"
          }
        }
      ],
      "note": [
        {
          "type": "hyperlink",
          "text": "View details",
          "action": {
            "type": "modal",
            "id": "mobile_info"
          }
        }
      ]
    },
    {
      "id": "step_2",
      "title": "Complete Suitability Check",
      "expanded": true,
      "status": "active", 

      "description": [
        {
          "type": "text",
          "text": "Your mobile number has been verified."
        }
      ],

      "buttons": [
        {
          "text": "continue",
          "style": "primary",
          "enabled": true,
          "action": {
            "type": "navigate",
            "route": "/basic-profile"
          }
        }
      ],
      "note": [
        {
          "type": "hyperlink",
          "text": "View details",
          "action": {
            "type": "modal",
            "id": "mobile_info"
          }
        }
      ]
    },
    {
      "id": "step_3",
      "title": "Complete AML Check",
      "expanded": false,
      "status": "inactive", 

      "description": [
        {
          "type": "text",
          "text": "Your mobile number has been verified."
        }
      ],

      "buttons": [
        {
          "text": "continue",
          "style": "primary",//primary, hyperlink
          "enabled": true,
          "action": {
            "type": "navigate",
            "route": "/aml-check"
          }
        }
      ],
      "note": [
        {
          "type": "hyperlink",
          "text": "View details",
          "action": {
            "type": "modal",
            "id": "mobile_info"
          }
        }
      ]
    },
  ]
};
