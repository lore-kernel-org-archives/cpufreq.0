From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Tue, 20 May 2008 00:55:02 -0700 (PDT)
Message-ID: <20080520075502.D1EBC108062@picon.linux-foundation.org>
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


trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |astarikovskiy@suse.de,
                   |                            |khali@linux-fr.org




------- Comment #41 from trenn@suse.de  2008-05-20 00:55 -------
We (until OpenSUSE 10.x) used to set tzp by default on older distris (via
userspace override) and got convinced by Len that the thermal management might
still work reliable on most/all machines.
There were (in the end rare) problems in the past with EC reads because of
thermal polling, but yes, really rare or even no problems at all in the end
(Alexey should know better about possible problems here).

Still having a non-polling system by default should be the goal, IMO.
Polling is a well known workaround in a lot parts, if everything is
workarounded in this way, you get a whole bunch of polling threads and the
whole asynchronous concept (not only in ACPI) is not worth much anymore. And
polling on slow IO HW is even worse...

Adding Alexey and Jean, they have a lot experience in reading/writing on such
HW.
Alexey,Jean: Matthew wants to enable temperature polling every 10 seconds if a
thermal zone does not export a polling variable. He also wants to introduce a
passive trip point (if none exists) which is set 5 degree below the critical
temperature trip point.

Disadvantage:
   - Some machines inform OS via thermal events. Those are doing it right and
     get punished by polling
   - EC problems on some machines?
   - IMO ACPI thermal.c is the wrong place. On long-term this should be
     integrated into arch independent hwmon structures where the trip points
     are stored now.
   - Normally the ACPI BIOS design should still be capable of avoiding a
     critical shutdown. If not this is a BIOS defect and such things (if not
     a general problem) should IMO be solved in a blacklist.

Advantage:
   - Theoretically no critical shutdowns any more -> this should work out on
     a lot machines, even on these with dusty fan slots.
   - On OpenSUSE 11.0 we enabled a 3D Desktop feature by default, causing a lot
     machines with not capable graphics cards running much hotter, some with
     critical temperature shut downs (Trying a bit with graphics card drivers
     on the Dell might also be worth to know more about the shutdowns...)

Summary (from my side):
I tend to like this workaround. We need something for short-term in thermal.c,
the question is whether it should get embedded into a dmi list or activated by
default. As I now remember that we had tzp set by default, I do not see a
stability problem, it's not perfect, but I cannot judge (Alexey, Jean?) how bad
the HW accesses are or could be on some worst case machines.
IMO, on longterm such an interface should exist for hwmon, tunable (polling,
lowering passive trip point) from userland.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
