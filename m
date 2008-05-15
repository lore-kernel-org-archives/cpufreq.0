From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Thu, 15 May 2008 11:35:06 -0700 (PDT)
Message-ID: <20080515183506.4590B108061@picon.linux-foundation.org>
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





------- Comment #34 from martin-kernel-bugzilla@earth.li  2008-05-15 11:35 -------
> BTW: Has someone an idea why these are overheating now?
> Did you make sure the fan slots are clean (I fixed up a bug like that
> recently).

The fan and heatsink are clean, as I've said already. The only other thing I
could do is to apply new heatsink paste, but I'm trying to retain a consistent
test case for this bug. If the paste is a problem it will apply to many laptops
as they age. Windows seems to cope with that, so Linux should too.

The same issue could arise just as easily in other ways, e.g. using a system in
a hot climate, when the BIOS engineers tested it in an air-conditioned office.
It seems to me that this applies to any system with a critical trip point but
without a passive cooling point defined, so I'd rather see something like the
patch in comment #27 applied, than a hack for the D610.

As to the remaining issue of how to find out we're approaching the limit, could
anyone tell me if my suggestion in comment #30 is feasible?


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
