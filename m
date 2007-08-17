From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8081] Conservative governor sets wrong and too high sampling
	rates
Date: Fri, 17 Aug 2007 15:41:01 -0700 (PDT)
Message-ID: <20070817224101.E473E10801D@picon.linux-foundation.org>
References: <bug-8081-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8081-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8081


cheetah-kbt@fastcat.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cheetah-kbt@fastcat.org




------- Comment #3 from cheetah-kbt@fastcat.org  2007-08-17 15:48 -------
I was trying to figure out why the conservative governor didn't seem to work on
my amd64 system, and ran across this bug and some other info.

I think that 10 * latency bit for the default sampling rate was deliberate,
since it was introduced as a standalone patch some time ago:
http://osdir.com/ml/kernel.cpufreq/2006-03/msg00048.html

However, that patch neglected to make a corresponding change to the rules for
the minimum sampling rate.

The result is that, on my amd64 system, the default sampling rate is 12.4
seconds, and the fastest rate is 6.2 seconds.

My CPU (athlon64 x2 4400) has speeds of 1000, 1800, 2000, and 2200 MHz
available to cpufreq.  With the defaults in the conservative governor then, it
will take it 99.2 seconds at full load to decide to notch it up from 1000 to
1800MHz (8 sampling rates each stepping the target speed by 100MHz).  This
calculation matches with some empirical observations I did.

I see two fixes that should be made from this:

1) The MIN_SAMPLING_RATE_RATIO define should be changed from 2 to 20, to match
the 10x change in the default sampling rate.  This would at least allow saner
configurations to be put in place by hand.

2) Instead of stepping the target frequency by a mythical 5% that probably
cannot be satisified by hardware, shouldn't it just step it up or down one
entry in the available frequencies table?


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
