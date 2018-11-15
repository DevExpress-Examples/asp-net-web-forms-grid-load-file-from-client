<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
<!-- default file list end -->
# How to load a file on the callback of the ASPxGridView


<p>By default, it is impossible to load files on callbacks:<br><a href="http://www.devexpress.com/scid=K18387">The Concept of Callbacks</a><br>However, there's a solution that allows you to overcome this problem.<br>This sample shows how to load a file by clicking the custom ASPxGridView button using two approaches: <br>1.  Load a file on the client side only (using the <em>window.location.href</em> property).<br>2.  Load a file on the client side using ASPxCallback control.<br>The first solution doesn't perform a callback to the server and all actions occur on the client-side. Another way is using ASPxCallback control to send a callback to the server and then handle CallbackComplete event. </p>
<p><strong>See also:<br> </strong><a href="https://www.devexpress.com/Support/Center/p/E3919">ASPxTreeList - How to download a file by clicking a custom command button</a><u><br> </u><a href="https://www.devexpress.com/Support/Center/p/E4940">ASPxGridViewExporter - How to show content document in a new tab</a></p>

<br/>


