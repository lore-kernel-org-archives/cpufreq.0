From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Tue, 13 May 2008 17:53:51 -0700 (PDT)
Message-ID: <20080514005351.C9677108060@picon.linux-foundation.org>
References: <bug-10658-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10658-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10658





------- Comment #27 from mjg59-kernel@srcf.ucam.org  2008-05-13 17:53 -------
Created an attachment (id=16135)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=16135&action=view)
Add a passive cooling limit to zones which don't have one

If a thermal zone is provided with a critical temperature, then there is
obviously a concern on the part of the vendor that it may overheat. Currently
Linux will only attempt to do something about that if the vendor has explicitly
added a passive cooling trip point. However, it's clear that allowing the
system to hit the critical trip point is far from ideal - the system will
immediately shut down, and data will almost certainly be lost. This patch adds
a default passive cooling zone if the platform does not provide its own, with
the default being to have it be 5 degrees below the critical shutoff
temperature. This should avoid the kernel limiting performance unless it's
genuinely likely that the hardware is about to overheat and shut down. The
default temperature value can be overridden by passing the thermal.psv argument
at boot or module load time.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
