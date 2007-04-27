From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8255] Frequency Scaling not working properly using powernow-k7
Date: Fri, 27 Apr 2007 06:11:17 -0700
Message-ID: <200704271311.l3RDBH7V014035@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8255

dsd@gentoo.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #11279|0                           |1
        is obsolete|                            |



------- Additional Comments From dsd@gentoo.org  2007-04-27 06:11 -------
Created an attachment (id=11287)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=11287&action=view)
new patch

It does look like your BIOS is broken. Before we go further, please check if
updates are available.

If not, try applying this patch. It may get things back on their feet, by
ignoring the broken field in the BIOS.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
