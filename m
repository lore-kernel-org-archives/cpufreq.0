From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Fri, 30 Mar 2007 20:27:48 -0700
Message-ID: <200703310327.l2V3Rm7P021815@fire-2.osdl.org>
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

babassu@postmaster.co.uk changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #11001|dmesg showing possible      |please ignore this post.
        description|problem                     |driver is behaving properly



------- Additional Comments From babassu@postmaster.co.uk  2007-03-30 20:27 -------
(From update of attachment 11001)
please ignore this post. I was not reading the log properly. The first call is
to transition fid to 0a leaving vid the same 08 which is correct behaviour


------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
