From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Thu, 15 May 2008 04:36:35 -0700 (PDT)
Message-ID: <20080515113635.EDB40108060@picon.linux-foundation.org>
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





------- Comment #30 from martin-kernel-bugzilla@earth.li  2008-05-15 04:36 -------
I have now tested the patches from comments #25-27 on 2.6.25.2, and they work
perfectly. Passive cooling kicks in above 96C and uses all the available
frequencies. I can deliberately block the fan and it still won't overheat, but
is still able to spend most of its time at 2GHz by short bursts of passive
cooling.

Presumably however this all depends on the temperature being polled due to the
patch in comment #25. If that patch is not acceptable, is there a better way to
do this?

If the trip point is programmable, perhaps in this case (critical trip point
only) we could reprogram the hardware trip point to a few C below that and
start polling only when we hit that lower limit, but still keep the shutdown
threshold at the BIOS-defined critical setting.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
