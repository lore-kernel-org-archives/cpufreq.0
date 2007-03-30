From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Fri, 30 Mar 2007 06:05:45 -0700
Message-ID: <200703301305.l2UD5jSC027459@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8264





------- Additional Comments From mark.langsdorf@amd.com  2007-03-30 06:05 -------
Thanks for the testing.  I like the msleep approach and would appreciate a patch.
 
I will not accept a patch that removes the resend.  I know that certain ATI chipsets
will break without that patch.
 
 
<HTML dir=ltr><HEAD><TITLE>[Bug 8264] powernow-k8 module gets stuck switching powerlevels on dualcore AMD64</TITLE>
<META http-equiv=Content-Type content="text/html; charset=unicode">
<META content="MSHTML 6.00.2900.3059" name=GENERATOR>

</HEAD>
<BODY>
<DIV id=idOWAReplyText21071 dir=ltr>
<DIV dir=ltr><FONT size=2>Thanks for the testing.&nbsp; I like the msleep approach and would appreciate a patch.</FONT></DIV>
<DIV dir=ltr><FONT size=2></FONT>&nbsp;</DIV>
<DIV dir=ltr><FONT size=2>I will not accept a patch that removes the resend.&nbsp; I know that certain ATI chipsets</FONT></DIV>
<DIV dir=ltr><FONT size=2>will break without that patch.</FONT></DIV>
<DIV dir=ltr><FONT size=2></FONT>&nbsp;</DIV>
<DIV dir=ltr><FONT size=2>&nbsp;</DIV></FONT></DIV></BODY></HTML>

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
