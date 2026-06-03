final amlCheckResponse = {
  "screenTitle": "Complete AML Check",
  "sections": [
    {
      "id": "__#5__",
      "type": "vertical_stepper",
      "style": "basic",

      "content": [
        {
          "title": "Step 1",
          "status": "complete", //active, pending
          "step_data": [
            {
              "title": "AML Check",
              "description":
                  "To complete your AML verification, we need a bit more information from you. Please complete a biometric check to continue.",
            },
            {
              "title": "Biometric Check",
              "description":
                  "You’ll receive an email (from support@veriphy.co.uk) with a secure link to complete your biometric check through Veriphy, our trusted AML/KYC partner. Please follow the instructions in the email to proceed.",
            },
          ],
        },
        {
          "title": "Step 2",
          "status": "complete", //active, pending
          "step_data": [
            {
              "title": "Source of Funds Check",
              "description":
                  "As part of the AML process, you are also required to complete a Source of Funds check for your investment.",
            }
          ],
        },
      ],
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
						"item": "Transfer Drawdown Advance"
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
						"item": "Please transfer your drawdown advance of £ 2,500 (5%) to the LP’s bank account (to be reduced from your final investment amount)."
					}
				]
			},


  ],
};
