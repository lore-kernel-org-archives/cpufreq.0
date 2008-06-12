From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Thu, 12 Jun 2008 13:42:19 -0700 (PDT)
Message-ID: <20080612204219.272FF10805F@picon.linux-foundation.org>
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


martin-kernel-bugzilla@earth.li changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|venkatesh.pallipadi@intel.co|
                   |m                           |




------- Comment #57 from martin-kernel-bugzilla@earth.li  2008-06-12 13:42 -------
I've just had a look at what Windows XP is up to as well.

I had a look through the drivers visible in Device Manager. All the ACPI and
other system devices are the standard Microsoft drivers, I don't see any Dell
magic.

To get a better idea what was going on I ran the I8KfanGUI software[1] with all
its control options turned off - i.e. just using it as a monitoring app. What
happened was extremely similar to the results of Matthew's patches - at around
96-98 degrees, the CPU speed would drop until the temperature recovered.

Now it's possible, based solely on those results, that my checking the
temperature sensors was causing the OS to notice the rising temperature when it
normally wouldn't. But there must still be some logic somewhere that caused it
to attempt passive cooling, without a _PSV trip point in the DSDT. Also, even
with I8KfanGUI shut down, I still can't get the system to shutdown with 100%
load and the fan outlet deliberately blocked.

[1] http://www.diefer.de/i8kfan/index.html


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
