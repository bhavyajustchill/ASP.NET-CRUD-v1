<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .table1
        {
            border: 3px solid #333333;
            border-collapse: collapse;
        }
        .style1
        {
            height: 47px;
        }
    </style>
</head>
<body bgcolor="#333333">
<br /><br />
    <form id="form1" runat="server">
    <div>
    
        <table class="table1"align="center" cellpadding="14" 
            style="width: 27%; height: 460px;">
            <tr>
                <td align="center" bgcolor="#333333" colspan="2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                        Font-Underline="False" Text="Patient Details" BorderColor="#5D7B9D" 
                        BorderStyle="Dashed" ForeColor="#5D7B9D" Width="367px" 
                        EnableTheming="True" Height="40px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#5D7B9D">
                    <asp:Label ID="Label2" runat="server" Text="Patient Name:" ForeColor="White" 
                        Font-Bold="True"></asp:Label>
                </td>
                <td align="left" bgcolor="#5D7B9D">
                    <asp:TextBox ID="TextBox1" runat="server" Width="131px" 
                        ValidationGroup="insertDetails"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Patient Name Required!" 
                        ForeColor="#CC0000" Display="Dynamic" Font-Bold="True" 
                        ValidationGroup="insertDetails">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#5D7B9D">
                    <asp:Label ID="Label3" runat="server" Text="Patient Gender:" ForeColor="White" 
                        Font-Bold="True"></asp:Label>
                </td>
                <td align="left" bgcolor="#5D7B9D">
                    <asp:RadioButton ID="RadioButton1" runat="server" Text="Male" 
                        GroupName="gender" Checked="True" ForeColor="White" Font-Bold="True" 
                        ValidationGroup="insertDetails" />
                    <asp:RadioButton ID="RadioButton2" runat="server" Text="Female" 
                        GroupName="gender" ForeColor="White" Font-Bold="True" 
                        ValidationGroup="insertDetails" />
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#5D7B9D">
                    <asp:Label ID="Label4" runat="server" Text="Patient Covid Status:" 
                        ForeColor="White" Font-Bold="True"></asp:Label>
                </td>
                <td align="left" bgcolor="#5D7B9D">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged" Height="30px" 
                        Width="131px" ValidationGroup="insertDetails">
                        <asp:ListItem Value="-1">Select Status</asp:ListItem>
                        <asp:ListItem>Covid +ve</asp:ListItem>
                        <asp:ListItem>Covid -ve</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="DropDownList1" 
                        ErrorMessage="Covid Status Selection Required!" ForeColor="#CC0000" 
                        InitialValue="-1" Display="Dynamic" Font-Bold="True" 
                        ValidationGroup="insertDetails">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#5D7B9D">
                    <asp:Label ID="Label5" runat="server" Font-Size="Medium" ForeColor="White" 
                        Text="Covid Vaccine Availability:" Font-Bold="True"></asp:Label>
                </td>
                <td align="left" bgcolor="#5D7B9D">
                    <asp:CheckBox ID="CheckBox1" Enabled="false" runat="server" Text="Available" 
                        ForeColor="White" Font-Bold="True" ValidationGroup="insertDetails" />
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#5D7B9D" class="style1" colspan="2">
                    <asp:Button ID="Button1" OnMouseOver="this.style.cursor='pointer'" 
                        runat="server" Text="Add Patient" BackColor="#00CC00" 
                        Font-Bold="True" Font-Names="Georgia" ForeColor="White" 
                        Font-Size="Large" Font-Italic="False" Font-Overline="False" 
                        Font-Strikeout="False" Font-Underline="False" onclick="Button1_Click" 
                        Height="33px" Width="322px" ValidationGroup="insertDetails" />
                    <asp:Button ID="Button5" OnMouseOver="this.style.cursor='pointer'" 
                        runat="server" BackColor="Black" Enabled="False" 
                        Font-Bold="True" Font-Names="Georgia" Font-Size="Large" ForeColor="Silver" 
                        Height="33px" Text="Update Details" Width="322px" 
                        onclick="Button5_Click" ValidationGroup="insertDetails" />
                    <asp:Button ID="Button4" OnMouseOver="this.style.cursor='pointer'" 
                        runat="server" BackColor="#CC0000" Font-Bold="True" 
                        Font-Names="Georgia" Font-Size="Large" ForeColor="White" Height="33px" 
                        onclick="Button4_Click" Text="Reset Form" Width="322px" />
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#333333" class="style1" colspan="2">
                   <font color="white"><b> <asp:Literal ID="Literal1" runat="server"></asp:Literal> </b></font>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="#CC0000" 
                        DisplayMode="List" Font-Bold="True" ForeColor="White" 
                        ValidationGroup="insertDetails" />
                </td>
            </tr>
            </table>
    
    </div>
    <table style="padding: 5px; width:50%; height: 186px;" align="center">
        <tr>
            <td align="center" bgcolor="#5D7B9D" style="padding: inherit; margin: auto">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                    Font-Underline="True" ForeColor="White" Text="Patient List"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" style="padding: inherit; margin: auto">
                <asp:GridView ID="GridView1" runat="server" CellPadding="0" ForeColor="#333333" 
                    GridLines="None" Height="128px" Width="100%" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" 
                        HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button ID="Button2" OnMouseOver="this.style.cursor='pointer'" runat="server" BackColor="#CC0000" 
                                    CommandArgument='<%# Eval("id") %>' Font-Bold="True" Font-Names="Georgia" 
                                    Font-Size="Medium" ForeColor="White" onclick="Button2_Click" 
                                    OnClientClick="confirm('Are you sure you want to Delete this Record?')" 
                                    Text="Delete" ValidationGroup="deleteRecord" Width="93px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Update">
                            <ItemTemplate>
                                <asp:Button ID="Button3" OnMouseOver="this.style.cursor='pointer'" runat="server" BackColor="#00CC00" 
                                    CommandArgument='<%# Eval("id") %>' Font-Bold="True" 
                                    Font-Names="Georgia" Font-Size="Medium" ForeColor="White" 
                                    onclick="Button3_Click" Text="Update" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" Font-Bold="False" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
        </table>

    </form>

    </body>
</html>
