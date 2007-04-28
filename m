From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8384] New: Allow powersave as default governor
Date: Sat, 28 Apr 2007 01:30:23 -0700
Message-ID: <200704280830.l3S8UNrg004647@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8384

           Summary: Allow powersave as default governor
    Kernel Version: 2.6.17.1
            Status: NEW
          Severity: low
             Owner: cpufreq@www.linux.org.uk
         Submitter: Reimar.Doeffinger@gmx.de


I am using since over a year this patch (I'll attach it as soon as I find out
how) to allow selecting powersave as cpufreq governor. This means less annoying
fan noise during bootup, esp. when fsck runs.
Worked flawlessly for me (64 bit kernel on an Athlon64 3200+).
The patch was created against 2.6.16.16 but applies and works with 2.6.21.1.
Unfortunately this method for some reason does not work for making the other
governors available per default, they do not work and are stuck at max. frequency.
This patch was sent both to the supposed maintainer and cpufreq list, but
received no useful response, so I decided to put it hear to make it more easily
accessible (hope this is not considered misuse of this bugzilla).
Cpufreq list mail:
Date: Wed, 31 May 2006 19:05:30 +0200
Subject: [PATCH] allow powersave as default governor
Message-ID: <20060531170530.GA9967@rz.uni-karlsruhe.de>

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
