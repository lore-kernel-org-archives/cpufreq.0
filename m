From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 4379] Default sampling rates for ondemand governor are too
	high on a amd64
Date: Sun, 5 Feb 2006 02:46:01 -0800
Message-ID: <200602051046.k15Ak12r012481@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=4379





------- Additional Comments From piel@lifl.fr  2006-02-05 02:46 -------
Created an attachment (id=7248)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=7248&action=view)
Reduce the default sampling rate to check more often

Hello,

Could you try the attached patch against 2.6.15 or 2.6.16 and confirm it solves
your problem ? As there is now a check to avoid polling too fast, it should not
be dangerous to check more often.

Eric

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
