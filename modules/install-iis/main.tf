resource "azurerm_virtual_machine_extension" "install-iis" {
    name                    = "install-iis"
    virtual_machine_id      = var.virtual_machine_id
    publisher               = "Microsoft.Compute"
    type                    = "CustomScriptExtension"
    type_handler_version    = "1.9"
    
    settings = <<SETTINGS
    {   
        "commandToExecute": "powershell.exe -Command \"Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature; Get-Content C:\\AzureData\\CustomData.bin -TotalCount 20 > C:\\inetpub\\wwwroot\\iisstart.htm; New-Item -Path 'C:\\scripts' -ItemType Directory; get-Content C:\\AzureData\\CustomData.bin -tail 23 > C:\\scripts\\cpuramlogger.ps1\""
    }
    SETTINGS
}