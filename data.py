from attrdict import AttrDict


LoginPage = AttrDict({
    "page"     : "https://appsdev.iohub.pt/ATTheme_TH/Login",
    "username" : "id:Input_Email",
    "password" : "id:Input_Password2",
    "login"    : "id:Button_Login",
     })

HomePage = AttrDict({
    "element"  : "id:b1-Title",
     })

# LoginPage = AttrDict({
#     "username" : "id:OutSystemsUIWeb_wt14_block_wtLogin_OutSystemsUIWeb_wt15_block_wtLogin_OutSystemsUIWeb_wt26_block_wtInput_wtUserNameInput",
#     "password" : "id:OutSystemsUIWeb_wt14_block_wtLogin_OutSystemsUIWeb_wt15_block_wtLogin_OutSystemsUIWeb_wt6_block_wtInput_wtPasswordInput",
#     "login"    : "id:OutSystemsUIWeb_wt14_block_wtLogin_OutSystemsUIWeb_wt15_block_wtLogin_wt13",
#      })
#
# HomePage = AttrDict({
#     "title"  : "id:wt25_OutSystemsUIWeb_wt18_block_wtContent_wtTitle",
#     "logout" : "xpath://div[contains(@id,'block_wtHeader_wtRight')]//span[contains(@class,'fa-sign-out')]",
#      })

UrlPage = AttrDict({
    "table"   : "id:wt26_OutSystemsUIWeb_wt18_block_wtContent_wtMainContent_wtSolution_SolutionReferenceTable",
    "table_lines"       : "//table[@id='wt26_OutSystemsUIWeb_wt18_block_wtContent_wtMainContent_wtSolution_SolutionReferenceTable']//tr",
     })

