From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8255] Frequency Scaling not working properly using powernow-k7
Date: Wed, 2 May 2007 08:26:40 -0700
Message-ID: <200705021526.l42FQeK1022394@fire-2.osdl.org>
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
  Attachment #11367|0                           |1
        is obsolete|                            |



------- Additional Comments From dsd@gentoo.org  2007-05-02 08:26 -------
Created an attachment (id=11373)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=11373&action=view)
hopefully final patch

This should fix the rounding problem (but not the 1333mhz one). It replaces all
previous patches/DSDTs. Please post dmesg output from using this patch.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
