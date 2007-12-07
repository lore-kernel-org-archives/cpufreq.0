From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9475] jiffies counter leaps on CPU frequency changes
Date: Thu,  6 Dec 2007 20:32:14 -0800 (PST)
Message-ID: <20071207043214.C3F1F10806A@picon.linux-foundation.org>
References: <bug-9475-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9475-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9475


len.brown@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |acpi-
                   |                            |bugzilla@lists.sourceforge.n
                   |                            |et




------- Comment #12 from len.brown@intel.com  2007-12-06 20:32 -------
Some Intel TSC facts, for the record:

if (family == 6 && model < 14) || (family == 15 && model < 3)
   TSC rate = Core MHz rate (ie. it changes with core/bus ratio shifts)
   WRMSR on the TSC writes bottom 32-bits, clears upper 32 bits.

For these families with models later than above
   TSC rate = constant (does not change with core/bus ratio shifts)
   WRMSR TSC writes all 64 bits.

The system here is a family 6, model 13, so it it will
indeed see variable speed.

But note that the bigger problem may be that on all Intel processors
with C3 that have shipped to date, the TSC COMPLETELY STOPS
for the duration of C3.

I believe that tsc_unstable is set upon either of these situations.

I don't follow all the twisty turny paths in the code here --
and it is wonderful that you bisected and found the cause;
but it isn't immediately obvious that this is due to variable
speed TSC, but it may be due to TSC stoppage.

if you disable cpufreq and it goes away, you know it was variable TSC.
if you boot with "idle=poll" and keep cpufreq enabled and it goes
away, then you know it was TSC stoppage.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
